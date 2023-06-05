extends State

class_name DemonHitState

@export var damageable : Damageable
@export var dead_state : State
@export var knockback_speed: float = 1000
@export var return_state :State
@onready var timer : Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter() -> void:
	timer.start()

func on_damageable_hit(node : Node, damage_amount : int, knockback_diretion: Vector2):
	if damageable.health > 0:
		character.velocity = knockback_speed * knockback_diretion
		emit_signal("interrupt_state", self)
	if damageable.health <= 0:
		emit_signal("interrupt_state", dead_state)
	

func on_exit():
	character.velocity = Vector2.ZERO

func _on_timer_timeout():
	next_state = return_state
