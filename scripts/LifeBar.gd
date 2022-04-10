extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var frame = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Lifebar.frame = frame
	pass 

func dano():
	frame += 1  
	pass
	
func recuperar(x):
	frame = x
	pass
