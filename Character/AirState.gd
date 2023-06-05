extends State

@export var player: Player
@export var ground_state: State
@export var jump_animation: String = "jump_end"
@export var attack_state: State
@export var jump_attack: String = "jump_attack"
@export var jump_velocity: float = -200.0


func on_enter() -> void:
	pass

func on_exit() -> void:
	pass

func state_process(delta: float) -> void:
	if player.is_on_floor():
			playback.travel(jump_animation)
			next_state = ground_state
		
			

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		playback.travel(jump_attack)
		next_state = attack_state
