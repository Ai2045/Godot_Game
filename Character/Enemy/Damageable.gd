extends Node

class_name Damageable

signal on_hit(node : Node, Damage_taken : int, knockback_diretion: Vector2)

@export var health: float = 20 :
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

@export var vanish_animation_name : String = "vanish"
func hit(damage : int, knockback_diretion : Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_diretion)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == vanish_animation_name:
		get_parent().queue_free()
