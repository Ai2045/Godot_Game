extends State

@export var ground_state: State
@export var air_state: State
@export var return_animation_node: String = "move"
@export var attack_ground: String = "attack"
@export var attack_jump: String = "jump_attack"

@onready var timer: Timer = $Timer

var is_attacking: bool = false
var is_timer_active: bool = false

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		if !is_timer_active:
			timer.start()
			is_attacking = true
			is_timer_active = true

func _on_animation_tree_animation_finished(anim_name: String) -> void:
		if anim_name == attack_ground:
			next_state = ground_state
			playback.travel(return_animation_node)
		elif anim_name == attack_jump:
			next_state = air_state
			playback.travel(return_animation_node)
		
		is_attacking = false
		is_timer_active = false
