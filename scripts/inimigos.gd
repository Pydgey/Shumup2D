extends Node2D

const PRE_ASTEROID = preload("res://scenes/Asteroid.tscn")
const PRE_EXP = preload("res://scenes/explosion.tscn")
const PRE_BOSS = preload("res://scenes/boss.tscn")

func _ready():
	restartTimer()
	restartBossTimer()
	$trilha.play()
	pass 

#func _process(delta):
#	if Input.is_action_just_pressed("troca_test"):
#	pass

func _on_spawn_timer_timeout():
	var ast = create_asteroid()
	add_child(ast)
	ast.global_position = Vector2(rand_range(40, 160), -60)
	restartTimer()
	pass # Replace with function body.

func restartTimer():
	$spawn_timer.wait_time = rand_range(.3,1)
	$spawn_timer.start()
	
func restartBossTimer():
	$boss_timer.wait_time = rand_range(40,60)
	$boss_timer.start()
	pass
	
func on_ast_destroid(ast):
	if ast.chosen >= 3:
		for a in range((randi() % 2) + 1):
			var new_ast = create_asteroid()
			new_ast.chosen = (randi() % 2) + 1
			add_child(new_ast)
			new_ast.global_position = ast.global_position
			
	get_tree().call_group("score","pontuacao", ast)
	
	var e = PRE_EXP.instance()
	add_child(e)
	e.global_position = ast.global_position
	pass
	
func create_asteroid():
	var ast = PRE_ASTEROID.instance()
	ast.connect("destroied", self, "on_ast_destroid")
	return ast


func _on_boss_timer_timeout():
	var new_boss = PRE_BOSS.instance()
	add_child(new_boss)
	new_boss.connect("destroid", self, "on_boss_destroid")
	$trilha.stop()
	$trilha2.play()
	pass
	 # Replace with function body.
func on_boss_destroid(node):
	var e = PRE_EXP.instance()
	add_child(e)
	e.global_position = node.global_position
	$trilha2.stop()
	$trilha.play()
	pass
