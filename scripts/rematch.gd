extends Node2D

var opcao = 0
var blink = 0
 
const SAVE_FILE_PATH = "user://savedata.save"

var score = 0 

var umscore = 0
var doisscore = 0
var tresscore = 0
var quascore = 0
var cincoscore = 0 

var delay = 10

func _ready():
	load_game()
	
	pass # Replace with function body.

func salvar(x):
	score = x
	print(score)
	sort()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("ui_down") :
		opcao += 1
	if Input.is_action_just_pressed("ui_up") :
		opcao -= 1
		
	if opcao < 0 :
		opcao = $itens.get_child_count() - 1
	if opcao > $itens.get_child_count() - 1 :
		opcao = 0
		
	if Input.is_action_just_pressed("ui_accept") :
		match opcao:
			0:
				$timer_blink.start()
				pass
			1:
				get_tree().change_scene("res://scenes/Start_scene.tscn")
				pass
		
	$seta.global_position = $itens.get_child(opcao).global_position + Vector2(-13, 7)
	pass

func _on_timer_blink_timeout():
	blink += 1
	$itens/start.visible = not $itens/start.visible
	if blink > 10:
		get_tree().change_scene("res://scenes/Game.tscn")
	pass # Replace with function body.

func _on_touchstart_pressed():
	$timer_blink.start()
	pass # Replace with function body.

func _on_touchmenu_pressed():
	get_tree().change_scene("res://scenes/Start_scene.tscn")
	pass # Replace with function body.

func sort():
	if score > cincoscore && score < quascore :
		cincoscore = score
	elif score > quascore && score < tresscore:
		cincoscore = quascore
		quascore = score
	elif score > tresscore && score < doisscore:
		cincoscore = quascore
		quascore = tresscore
		tresscore = score
	elif score > doisscore && score < umscore:
		cincoscore = quascore
		quascore = tresscore
		tresscore = doisscore
		doisscore = score
	elif score > umscore :
		cincoscore = quascore
		quascore = tresscore
		tresscore = doisscore
		doisscore = umscore
		umscore = score
		$record.visible = true
	save_game()

func save_game():
	var save_dict = {
	"filename" : get_filename(),
	"umscore" : umscore,
	"doisscore" : doisscore,
	"tresscore" : tresscore,
	"quascore" : quascore,
	"cincoscore" : cincoscore
}

	var save_game = File.new()
	save_game.open(SAVE_FILE_PATH, File.WRITE)
	save_game.store_line(to_json(save_dict))
	save_game.close()
	
func load_game():
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
