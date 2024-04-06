extends Node2D

func _on_button_pressed():
	get_node("AudioStreamPlayer2D").playing = true
	await get_tree().create_timer(0.05).timeout
	get_tree().change_scene_to_file("res://main_game.tscn")
