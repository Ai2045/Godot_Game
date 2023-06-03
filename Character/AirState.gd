extends State

@export var ground_state: State
@export var jump_animation: String = "jump_end"
@export var attack_state: State
@export var jump_attack: String = "jump_attack"
var jumpEnded: bool = false

func on_enter() -> void:
	pass

func on_exit() -> void:
	pass

func state_process(delta: float) -> void:
	if character.is_on_floor():
		if !jumpEnded:
			jumpEnded = true
			playback.travel(jump_animation)
			print(ground_state)
			next_state = ground_state
	else:
		jumpEnded = false
		
			

func state_input(event: InputEvent) -> void:
	if(event.is_action_pressed("attack") and !character.is_on_floor()):
		next_state = attack_state
		playback.travel(jump_attack)
