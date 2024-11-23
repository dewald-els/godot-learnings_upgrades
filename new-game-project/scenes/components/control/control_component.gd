class_name ControlComponent
extends Node


func get_movement_direction(normalise: bool = false) -> Vector2:
	var horizontal = Input.get_axis("player_left", "player_right")
	var vertical = Input.get_axis("player_up", "player_down")
	
	var direction: Vector2 = Vector2(
		horizontal, 
		vertical
	)

	if normalise:
		return direction.normalized()
	
	return direction
