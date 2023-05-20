extends State

class_name HitState

@export var damageable : Damageable
@export var vanish_state : State
@export var vanish_animation_node: String = "vanish"
@export var knockback_speed: float = 100.0
@export var return_state :State
@onready var timer : Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_damageable_hit(node : Node, damage_amount : int, knockback_diretion: Vector2):
	if damageable.health > 0:
		character.velocity = knockback_speed * knockback_diretion
		emit_signal("interrupt_state", self)
	else :
		emit_signal("interrupt_state", vanish_state)
		playback.travel(vanish_animation_node)
	

func on_exit():
	character.velocity = Vector2.ZERO

func _on_timer_timeout():
	next_state = return_state
