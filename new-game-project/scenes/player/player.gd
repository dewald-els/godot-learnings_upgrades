class_name Player
extends CharacterBody2D

# Components
@onready var health_component: HealthComponent = %HealthComponent
@onready var velocity_component: VelocityComponent = %VelocityComponent
@onready var control_component: ControlComponent = %ControlComponent
@onready var ability_controllers: Node = %AbilityControllers

@export var base_stats: StatsResource
@export var upgrade_manager: UpgradeManager

var abilities: Array[AbilityController] = []


func _ready() -> void:
	if base_stats:
		health_component.health = base_stats.base_health
		velocity_component.acceleration = base_stats.base_speed
		
	if upgrade_manager:
		upgrade_manager.upgrade_collected.connect(_on_upgrade_added)
		
	if ability_controllers and ability_controllers.get_child_count() > 0:
		for possible_ability in ability_controllers.get_children():
			if possible_ability is AbilityController:
				abilities.append(possible_ability)
		
	await get_tree().create_timer(2.0).timeout
	health_component.remove_health(1)

func _physics_process(delta: float) -> void:
	var movement_vector: Vector2 = control_component.get_movement_direction(true)
	var direction: Vector2 = movement_vector.normalized()
	
	for ability in abilities:
		ability.physics_process(delta)
	
	velocity_component.accelerate(direction)
	velocity_component.move(self)


func _on_upgrade_added(upgrade: UpgradeResource) -> void:
	upgrade.apply(self)
