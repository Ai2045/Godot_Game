extends State


func on_enter():
	get_parent().queue_free()
