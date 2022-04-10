extends Node2D

var opcao = 0
var blink = 0
 
func _ready():
	if get_tree().paused :
		get_tree().paused = false
	pass # Replace with function body.


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
				$itens.visible = false
				$ranking.visible = true
				pass
			2:
				get_tree().quit()
		
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


func _on_touchexit_released():
	get_tree().quit()
	pass # Replace with function body.


func _on_esc_pressed():
	$itens.visible = true
	$ranking.visible = false
	pass # Replace with function body.


func _on_touchranking_released():
	$itens.visible = false
	$ranking.visible = true
	pass # Replace with function body.
