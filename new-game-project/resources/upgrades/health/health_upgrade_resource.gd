class_name HealthUpgradeResource
extends UpgradeResource

@export var health_amount: int
@export var max_health: int


func apply(owner: Node2D) -> void:
	if owner.health_component:
		print("Found health component on ", owner.name)
		var health_component: HealthComponent = owner.health_component
		health_component.add_health(health_amount)
	else:
		print("Did not find health component on ", owner.name)
