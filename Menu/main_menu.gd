extends Node2D

@export var mainGameScene : PackedScene


func _on_new_game_button_button_up():
	get_tree().change_scene_to_packed(mainGameScene)
