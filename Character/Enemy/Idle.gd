extends State

class_name IdleState

@export var attack_state: State


var can_hurt = true
func on_enter() -> void:
	playback.travel("idle")
	

func on_exit() -> void:
	pass


func _on_hurt_box_body_entered(body):
	if body is Player:
		emit_signal("interrupt_state", attack_state)
