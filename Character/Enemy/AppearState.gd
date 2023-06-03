extends State

class_name AppearState

@export var enemy: CharacterBody2D
@export var idle_state: State
@export var timer : Timer
var hasAppeared = false

func _ready():
	enemy.connect("on_appears", on_appear_animation)
	
func on_appear_animation(hasAppeared: bool):
	if !hasAppeared:
		timer.start()
		playback.travel("appears")

func _on_timer_timeout():
	next_state = idle_state
