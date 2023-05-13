extends Node

class_name CharacterStateMachine

var states: Array[State]
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
		
		else :
			push_warning("Child" + child.name + "is not a State for CharacterStateMachine")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
