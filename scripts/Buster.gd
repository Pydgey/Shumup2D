extends Node2D

var vel = 20

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(0, 2)* vel * delta)
	pass


func _on_Area2D_area_entered(area):
	get_tree().call_group("player", "Upgrade")
	$Audio.play()
	visible = false
	pass 


func _on_Audio_finished():
	queue_free()
	pass # Replace with function body.
