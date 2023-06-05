extends Damageable

@export var vanish_animation_name: String = "vanish"
@export var enemy: CharacterBody2D
@export var health: float= 20:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", enemy, value - health)
		health = value
	
@export var health_bar: ProgressBar

func _ready():
	health_bar.max_value = health
	health_bar.value = health
	
func hit(damage : int, knockback_diretion : Vector2):
	health -= damage
	health_bar.value -= damage
	emit_signal("on_hit", enemy, damage, knockback_diretion)

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == vanish_animation_name:
		get_parent().queue_free()
