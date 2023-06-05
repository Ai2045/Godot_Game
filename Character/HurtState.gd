extends State

@export var hurt_animation: String = "hurt"
@export var ground_state: State
@export var return_animation_node: String = "move"
@export var hurtColdDownTimer: Timer
@export var player: Player
@export var attack_state: State
@export var knockback_speed: float = 500
@export var can_hurt = false

func on_enter():
	playback.travel(hurt_animation)
	SignalBus.connect("give_attack_value", on_hurt)

func  get_knockback_direction(enemy_position: Vector2):
	var knockback_direction = Vector2.ZERO
	if player.position.x > enemy_position.x:
		knockback_direction = Vector2.RIGHT
	elif player.position.x < enemy_position.x:
		knockback_direction = Vector2.LEFT
	return knockback_direction
	
func state_process(delta):
	if Input.is_action_just_pressed("attack") and can_hurt:
		can_hurt = false
		if player.is_on_floor():
			playback.travel("attack")
		else:
			playback.travel("jump_attack")
		next_state = attack_state
		
func on_hurt(value: float, enemy_position: Vector2):
		var knockback_direction = get_knockback_direction(enemy_position)
		player.velocity = knockback_speed*knockback_direction
		SignalBus.emit_signal("update_health", -value)
		
		hurtColdDownTimer.start()
		


func _on_hurt_cold_down_timer_timeout():
	can_hurt = true


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "hurt":
		next_state = ground_state
		playback.travel(return_animation_node)
