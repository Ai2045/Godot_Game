extends Area2D

@export var animation_player: AnimationPlayer
@export var next_level_path: String
func _on_body_entered(body):
	print(body.name)
	if body.name == "Player":
		animation_player.play("fake out")
		get_tree().change_scene_to_file(next_level_path)
