class_name HealthComponent
extends Node

signal health_depleated
signal health_lost(health: int)
signal health_increased(health: int)


@export var health: int
@export var max_health: int

func _ready() -> void:
	print("Health", health)


func add_health(amount: int) -> void:
	health = clamp(health, health + amount, max_health);
	health_increased.emit(health)

func remove_health(amount: int) -> void:
	health = clamp(health, 0, health - amount)
	
	if health == 0:
		health_depleated.emit()
	else:
		health_lost.emit(health)
