extends CanvasLayer

export var score =0
var vida = 10

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ranking/valor.text = str(score)
	pass

func pontuacao(ast):
	var points = (6 - ast.chosen) * 10
	score += points
	$score.text = str(score)
	pass
	
func boss_points():
	score += 2000	
	
func score ():
	var pontos = int($score.text)
	get_tree().call_group("rematch","salvar", pontos)
	return pontos
