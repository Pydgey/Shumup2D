extends Node2D

const PRE_CURA = preload("res://scenes/Recover.tscn")
const PRE_UP = preload("res://scenes/Buster.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	restartTimerCura()
	restartTimerUpgrade()
	pass # Replace with function body.

func restartTimerCura():
	$SpawCura.wait_time = rand_range(50,130)
	$SpawCura.start()
	
func restartTimerUpgrade():
	$SpawUpgrade.wait_time = rand_range(45,80)
	$SpawUpgrade.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpawCura_timeout():
	var cura = PRE_CURA.instance()
	add_child(cura)
	cura.global_position = Vector2(rand_range(50, 120), -60)
	restartTimerCura()
	pass # Replace with function body.


func _on_SpawUpgrade_timeout():
	var up = PRE_UP.instance()
	add_child(up)
	up.global_position = Vector2(rand_range(50, 120), -60)
	restartTimerUpgrade()
	pass # Replace with function body.
