extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$busterTimer.value -= delta
	if $busterTimer.value == 0:
		get_tree().call_group("player", "Degrade")
		queue_free()
	pass
