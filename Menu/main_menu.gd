extends Node2D


@export var level_1_path: String = "res://Levels/level_1.tscn"

func _on_new_game_button_button_up():
	get_tree().change_scene_to_file(level_1_path)
