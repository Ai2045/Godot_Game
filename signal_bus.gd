extends Node

signal on_health_changed(node : Node, amount_changed : int)
signal update_health(current_health: float)
signal on_attack_player(is_attacked: bool)
signal on_exit_range_attack(is_exit: bool)
signal give_attack_value(attack_value: float, position: Vector2)
signal on_game_over(is_game_over: bool)
