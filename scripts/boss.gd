extends Node2D

const PRE_LAZER = preload("res://scenes/boss_Lazer.tscn")
export(NodePath) var tiros

var velX = 50
var vida = 20

signal destroid(node)

func _ready():
	tiros = get_node("tiros")
	restartTimer()
	pass 

func _process(delta):

	translate(Vector2(velX,0) * delta)
	
	if global_position.x > 200:
		velX = -50
	if global_position.x < -40:
		velX = 50
		

	pass
	
func restartTimer():
	$gun_timer.wait_time = rand_range(.3,1)
	$gun_timer.start()
	pass

func _on_area_area_entered(area):
	vida -= 1
	$life.value -= 1
	if vida == 0:
		destroid_boss()
	$Life/hp.text = str(vida)
	get_tree().call_group("camera", "treme", 1)
	pass # Replace with function body.


func _on_gun_timer_timeout():
	var lazer = PRE_LAZER.instance()
	tiros.add_child(lazer)
	lazer.global_position = $blaster.global_position
	pass # Replace with function body.


func _on_move_timer_timeout():
	pass # Replace with function body.
func destroid_boss():
	emit_signal("destroid", self)
	get_tree().call_group("score", "boss_points")
	queue_free()	
	pass
