extends State

@export var hurt_animation: String = "hurt"
@export var ground_state: State
@export var return_animation_node: String = "move"
@export var coldDownTimer: Timer
@export var player: Player
@export var knockback_speed: float = 500
@export var can_hurt = true

func on_enter():
	can_hurt = true
	playback.travel(hurt_animation)
	SignalBus.connect("give_attack_value", on_hurt)
	SignalBus.connect("on_exit_range_attack", return_state)

func  get_knockback_direction(enemy_position: Vector2):
	var knockback_direction = Vector2.ZERO
	if player.position.x > enemy_position.x:
		knockback_direction = Vector2.RIGHT
	elif player.position.x < enemy_position.x:
		knockback_direction = Vector2.LEFT
	return knockback_direction
	
func on_hurt(value: float, enemy_position: Vector2):
		var knockback_direction = get_knockback_direction(enemy_position)
		print(knockback_speed*knockback_direction)
		player.velocity = knockback_speed*knockback_direction
		SignalBus.emit_signal("update_health", -value)
		can_hurt = false

func return_state(is_exit: bool):
	print(ground_state)
	next_state = ground_state
	playback.travel(return_animation_node)
