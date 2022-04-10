extends Sprite

# Called when the node enters the scene tree for the first time.
export(NodePath) var nave

var time = 0.0

func _ready():
	if nave:
		nave = get_node(nave)
	else:
		print("Nave não encontrada em NodePath")
		set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	material.set_shader_param("des", (nave.global_position.x - 80) * 0.002)
	material.set_shader_param("time", time)
	pass
