extends Node2D

const PRE_REMATCH = preload("res://scenes/rematch.tscn")
var music_bus = AudioServer.get_bus_index("Music")
var music_sounds = AudioServer.get_bus_index("Sounds")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $ship.vida > 18 :
		get_tree().paused = true
		$HUD/ranking.visible = true
		
		var rematch = PRE_REMATCH.instance()
		$HUD.add_child(rematch)
		get_tree().call_group("score","score")
	if Input.is_action_just_pressed("ui_cancel") :
		get_tree().change_scene("res://scenes/Start_scene.tscn")
	pass



func _on_config_pressed():
	get_tree().paused = not get_tree().paused
	$configs/config/Label.visible = not $configs/config/Label.visible
	$configs/config/configlist.visible = not $configs/config/configlist.visible
	pass # Replace with function body.


func _on_musicOn_pressed():
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	$configs/config/configlist/Sprite/on/musicOn.visible = false
	$configs/config/configlist/Sprite/off/musicOff.visible = true
	pass # Replace with function body.


func _on_musicOff_pressed():
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	$configs/config/configlist/Sprite/on/musicOn.visible = true
	$configs/config/configlist/Sprite/off/musicOff.visible = false
	pass # Replace with function body.


func _on_soundOn_pressed():
	AudioServer.set_bus_mute(music_sounds, not AudioServer.is_bus_mute(music_sounds))
	$configs/config/configlist/Sprite/on/soundOn.visible = false
	$configs/config/configlist/Sprite/off/soundOff.visible = true
	pass # Replace with function body.


func _on_soundOff_pressed():
	AudioServer.set_bus_mute(music_sounds, not AudioServer.is_bus_mute(music_sounds))
	$configs/config/configlist/Sprite/on/soundOn.visible = true
	$configs/config/configlist/Sprite/off/soundOff.visible = false
	pass # Replace with function body.


func _on_esq_pressed():
	$Gamepad/gamepad.global_position = Vector2(-75,0)
	$LifeBar.global_position = Vector2(154, 248)
	pass # Replace with function body.


func _on_dir_pressed():
	$Gamepad/gamepad.global_position = Vector2(0,0)
	$LifeBar.global_position = Vector2(8, 248)
	pass # Replace with function body.
