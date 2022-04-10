extends Node2D

export(NodePath) var nave


func _ready():
	if nave:
		nave = get_node(nave)
	else:
		print("Nave não encontrada em NodePath")
		set_process(false)
	pass 

func _process(delta):
	global_position.x = (nave.global_position.x - 80) * 0.002 * -160
	pass
