extends Area2D

@export var animation_player: AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body.name)
	if body.name == "Player":
		animation_player.play("fake out")
		get_tree().change_scene_to_file("res://Levels/livello_2.tscn")
