extends Camera2D

var time =0
var forca =0

func _ready():
	pass # Replace with function body.

func _process(delta):
	if forca > 0:
		time += delta * 50
		global_position = Vector2(forca,forca).rotated(time)
		forca = lerp(forca, 0, .1)
	pass

func treme(v):
	forca = v
