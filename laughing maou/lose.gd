extends Node2D
func _on_menu_pressed():
	get_node("AudioStreamPlayer2D").play()
	await get_tree().create_timer(0.05).timeout
	get_tree().change_scene_to_file("res://menu.tscn")
func _on_play_pressed():
	get_node("AudioStreamPlayer2D").playing = true
	await get_tree().create_timer(0.05).timeout
	get_tree().change_scene_to_file("res://main_game.tscn")
