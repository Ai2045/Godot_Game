extends CharacterBody2D

@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var animation_tree: AnimationTree = $AnimationTree
@export var speed = 100
@export var hit_state: State
@export var player_chase=false
var player=null
var appeared = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal on_appears(has_appeared: bool)

	
func _ready():
	animation_tree.active = true
	visible = false
	
func _physics_process(delta):
	if player_chase && state_machine.check_if_can_move():
		var directionX = player.position.x - position.x
		var directionY = player.position.y - position.y
		
		position.x += directionX/speed
		if position.y +100 <= player.position.y:
			position.y += directionY/speed
			
		if directionX < 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
	


func _on_visibity_area_body_entered(body):
	if body is Player:
		print("Demon")
		visible = true
		player=body
		appeared = true
		player_chase=true


func _on_visibity_area_body_exited(body):
	player=null
	player_chase=false
