class_name SpeedUpgradeResource
extends UpgradeResource

@export var speed_amount: float


func apply(owner: Node2D) -> void:
	print("apply speed upgrade to ", owner.name)
	
	if owner.velocity_component:
		print("found velocity component")
		var velocity_component: VelocityComponent = owner.velocity_component
		velocity_component.increase_acceleration(speed_amount)
	else:
		print("did not find velocity component")
