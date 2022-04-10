extends Node2D

const SAVE_FILE_PATH = "user://savedata.save"

var umscore = 0
var doisscore = 0
var tresscore = 0
var quascore = 0
var cincoscore = 0 

func _ready():
	load_highscore()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func load_highscore():
	var save_game = File.new()
	if not save_game.file_exists(SAVE_FILE_PATH):
		return
	save_game.open(SAVE_FILE_PATH, File.READ)
	var node_data = parse_json(save_game.get_line())
	umscore = node_data["umscore"]
	doisscore = node_data["doisscore"]
	tresscore = node_data["tresscore"]
	quascore = node_data["quascore"]
	cincoscore = node_data["cincoscore"]
	save_game.close()

	$scores/um.text = "1-  " + str(umscore)
	$scores/dois.text = "2-  " + str(doisscore)
	$scores/tres.text = "3-  " + str(tresscore)
	$scores/quatro.text = "4-  " + str(quascore)
	$scores/cinco.text = "5-  " + str(cincoscore)
	pass



func _on_esc_pressed():
	pass # Replace with function body.
