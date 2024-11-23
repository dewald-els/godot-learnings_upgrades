class_name HealthIndicator
extends Node2D

@export var health_component: HealthComponent

@onready var health_label: Label = %HealthLabel


func _ready() -> void:
	if health_component:	
		health_label.text = str(health_component.health)
		health_component.health_lost.connect(_on_health_lost)
		health_component.health_increased.connect(_on_healt_increased)
	
func _on_health_lost(health: int) -> void:
	health_label.text = str(health)
	
func _on_healt_increased(health: int) -> void:
	health_label.text = str(health)
	
		
