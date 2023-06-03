extends CharacterBody2D

class_name  Player
@export var speed: float = 200.0
@export var jump_velocity: float = -300.0
@export var hurt_state: State
@export var coldDownTimer: Timer
@export var health_return = 5
@export var GameOverScene: PackedScene
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var character_state_machine: CharacterStateMachine = $CharacterStateMachine
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2 = Vector2.ZERO


signal facing_direction_changed(facing_right: bool)

func _ready():
	animation_tree.active = true
	SignalBus.connect("on_attack_player", update_hurt)
	SignalBus.connect("on_game_over", game_over)

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and character_state_machine.check_if_can_move():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")

	if direction.x != 0 && character_state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation()
	update_health()
	update_facing_direction()

func update_animation():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
		
	elif direction.x < 0:
		sprite.flip_h = true
	
	emit_signal("facing_direction_changed", !sprite.flip_h)

func update_health():
	pass
	
	
func update_hurt(is_attacked: bool):
	if is_attacked :
		character_state_machine.switch_state(hurt_state)
		coldDownTimer.start()
		
	
	

func _on_cold_down_timer_timeout():
	SignalBus.emit_signal("update_health", health_return)
	coldDownTimer.start()

func game_over(is_game_over : bool):
	if is_game_over:
		get_tree().change_scene_to_packed(GameOverScene)
