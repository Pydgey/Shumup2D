extends Node2D

const PRE_LAZER = preload("res://scenes/Lazer.tscn")
const PRE_BUSTERTIMER = preload("res://scenes/BusterTimer.tscn")

export var vel = 100.0
var vida = 0
export(NodePath) var lazeres
var TIROS_UPGRADE = false
var delay = 10

func _ready():
	if lazeres:
		lazeres = get_node(lazeres)
	else:
		lazeres = get_parent()
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var dirX =0
	var dirY =0
	
	if Input.is_action_pressed("ui_left"):
		dirX += -1
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	if Input.is_action_pressed("ui_up"):
		dirY += -1
	if Input.is_action_pressed("ui_down"):
		dirY += 1
	
	#tiros()		
	translate(Vector2(dirX, dirY) * vel * delta)
	
	global_position.x = clamp(global_position.x, 23, 137)
	global_position.y = clamp(global_position.y, 24, 264)
	
	if vida > 18 :
		queue_free()
	
	if(Input.is_action_just_pressed("troca_test")):
		if (TIROS_UPGRADE == false):
			TIROS_UPGRADE = true
		else:
			TIROS_UPGRADE = false	
			
	delay -= 1
	if delay == 0 :
		TirosTouch()
		delay = 10
	pass


func _on_Area_area_entered(area):
	get_tree().call_group("camera", "treme", 1)
	if vida <= 18 :
		vida += 1
		get_tree().call_group("Life", "dano")
	print(vida)
	pass # Replace with function body.

#func tiros ():
#	if Input.is_action_just_pressed("ui_accept"):
#		if get_tree().get_nodes_in_group("lazeres").size() < 8:
#			if (TIROS_UPGRADE == false):
#				var lazer = PRE_LAZER.instance()
#				lazeres.add_child(lazer)
#				lazer.global_position = $Blaster.global_position
#			else:
#				var lazer1 = PRE_LAZER.instance()
#				var lazer2 = PRE_LAZER.instance()
#				lazeres.add_child(lazer1)
#				lazeres.add_child(lazer2)
#				lazer1.global_position = $Blaster1.global_position
#				lazer2.global_position = $Blaster2.global_position
				
func FullLife():
	vida = 0
	get_tree().call_group("Life", "recuperar", vida)
	
func Recover():
	print("vida recuperada")
	if vida <= 18 :
		vida -= 5
	if vida < 0 :
		vida = 0
	get_tree().call_group("Life", "recuperar", vida)
		
func Upgrade():
	TIROS_UPGRADE = true
	var buster = PRE_BUSTERTIMER.instance()
	$Ship.add_child(buster)
	buster.global_position = $busterTimer.global_position

func Degrade():
	TIROS_UPGRADE = false
	
func TirosTouch():
	if (TIROS_UPGRADE == false):
		var lazer = PRE_LAZER.instance()
		lazeres.add_child(lazer)
		lazer.global_position = $Blaster.global_position
	else:
		var lazer1 = PRE_LAZER.instance()
		var lazer2 = PRE_LAZER.instance()
		lazeres.add_child(lazer1)
		lazeres.add_child(lazer2)
		lazer1.global_position = $Blaster1.global_position
		lazer2.global_position = $Blaster2.global_position
	pass
