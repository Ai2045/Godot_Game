extends CharacterBody2D

@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var animation_tree: AnimationTree = $AnimationTree
@export var speed = 40
@export var hit_state: State
@export var player_chase=false
var player=null
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true
	
func _physics_process(delta):
	if player_chase:
		position+=(player.position-position)/speed
		if(player.position.x-position.x)<0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
	
func _on_area_2d_body_entered(body):
	player=body
	player_chase=true



func _on_area_2d_body_exited(body):
	player=null
	player_chase=false

