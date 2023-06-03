extends State
class_name ShriekState

@export var shriek_animation: String = "shriek"
@export var idle_state: State
@export var hurt_value = 5
@export var could_down_timer: Timer
@export var enemy: CharacterBody2D
@export var can_hurt = true

func on_enter() -> void:
	playback.travel(shriek_animation)
	SignalBus.emit_signal("on_attack_player", true)
	
func state_process(delta):
	if can_hurt:
		SignalBus.emit_signal("give_attack_value", hurt_value, enemy.position)
		can_hurt = false
		could_down_timer.start()

func _on_attackable_body_exited(body):
	if body is Player:
		emit_signal("interrupt_state", idle_state)
		SignalBus.emit_signal("on_exit_range_attack", true)


func _on_cold_down_timer_timeout():
	can_hurt = true
	could_down_timer.start()
