extends ProgressBar


func _ready():
	max_value = GlobalVariables.health_player
	value = max_value
	SignalBus.connect("update_health", change_healthBar)

func change_healthBar(currentHealth: float):
	if value <= max_value and value > 0:
		value += currentHealth
	elif value <= 0:
		SignalBus.emit_signal("on_game_over", true)
		
	
