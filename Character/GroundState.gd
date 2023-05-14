extends State

class_name GroundState

@export var jump_velocity : float = -200.0
@export var air_state: State
@export var jump_animation : String = "jump"


	
func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("jump")):
		jump()
