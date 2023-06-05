extends Area2D

@export var damage: int = 10
@export var player: Player
@export var facing_shape : FacingCollisionShape2D
func  _ready():
	monitoring = false
	player.connect("facing_direction_changed", _on_player_facing_diretion_changed)
	
func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			#get direction from sword to the body
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var diretion_sign = sign(direction_to_damageable.x)
			
			if diretion_sign > 0:
				child.hit(damage, Vector2.RIGHT)
			elif diretion_sign < 0:
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)
			print(body.name)

func _on_player_facing_diretion_changed(facing_right : bool):
	if facing_right:
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position
	
