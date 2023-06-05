extends State

@export var enemy: CharacterBody2D
func on_enter():
	enemy.queue_free()
