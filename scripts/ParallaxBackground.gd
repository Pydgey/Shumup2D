extends ParallaxBackground

export (float) var sc_speed = 30.0
func _ready():
	pass # Replace with function body.

func _process(delta):
	scroll_offset.y += sc_speed * delta
	pass
