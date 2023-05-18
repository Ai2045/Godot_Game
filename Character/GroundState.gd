extends State

@export var jump_velocity: float = -200.0
@export var air_state: State
@export var jump_animation: String = "jump_start"
@export var attack_state: State
@export var attack_node: String = "attack"
func state_process(delta: float) -> void:
	if !character.is_on_floor():
		next_state = air_state

func jump() -> void:
	character.velocity.y = jump_velocity
	playback.travel(jump_animation)
	next_state = air_state
	
func attack():
	next_state = attack_state
	playback.travel(attack_node)
	
func on_enter() -> void:
	playback.travel("move")

func on_exit() -> void:
	pass

func state_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		jump()
	if Input.is_action_just_pressed("attack"):
		attack()
