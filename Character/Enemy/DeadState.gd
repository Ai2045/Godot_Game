extends State

@export var enemy: CharacterBody2D
func on_enter():
	playback.travel("die")
	enemy.queue_free()
