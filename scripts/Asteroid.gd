extends Node2D

var chosen = 0
onready var velY = rand_range(10, 80)
onready var velX = rand_range(-50, 50)

signal destroied(node)

func _ready():
	randomize()
	for a in $asteroids.get_children():
		a.visible = false
		
	if not chosen:
		chosen = (randi() % $asteroids.get_child_count()) +1
	
	var node = get_node("asteroids/Asteroid-" + str(chosen))
	node.visible = true
	
	$Area2D/shape.shape.radius = node.texture.get_width() /2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(velX, velY) * delta)
	
	if global_position.x > 200:
		global_position.x = -40
	if global_position.x < -40:
		global_position.x = 200
		
	if global_position.y > 300:
		global_position.y = -60
	pass


func _on_Area2D_area_entered(area):
	get_tree().call_group("camera", "treme", 0.8)
	emit_signal("destroied", self)
	queue_free()
	pass # Replace with function body.
