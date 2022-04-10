extends Node2D

var vel = 200

func _ready():
	$laser.play()
	pass 


func _process(delta):
	translate(Vector2(0, -1)* vel * delta)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	queue_free()
	pass # Replace with function body.
