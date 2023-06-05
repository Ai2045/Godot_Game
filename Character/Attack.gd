extends State

@export var ground_state: State
@export var air_state: State
@export var return_animation_node: String = "move"
@export var attack_ground: String = "attack"
@export var attack_jump: String = "jump_attack"
@export var hurt: String = "hurt"

@export var timer: Timer
var is_attackble = true


func _on_animation_tree_animation_finished(anim_name: String) -> void:
		if anim_name == attack_ground:
			next_state = ground_state
			playback.travel(return_animation_node)
		elif anim_name == attack_jump:
			next_state = air_state
			playback.travel(return_animation_node)
			
		
		


func _on_timer_timeout():
	is_attackble = true
