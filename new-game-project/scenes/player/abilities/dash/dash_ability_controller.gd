class_name DashAbilityController
extends AbilityController


@onready var dash_timer: Timer = %DashTimer

var velocity_component: VelocityComponent = null
var base_acceleration: float = 0.0
var base_max_speed: float = 0.0

func _ready() -> void:
	print("Ability is for onwer: ", owner.name)
	
	Callable(setup).call_deferred()
	
func setup() -> void:
	print("owner is: ", owner.get_class())
	
	if owner is CharacterBody2D and owner.velocity_component:
		print("Ability is on CharacterBody")
		velocity_component = owner.velocity_component
		base_acceleration = velocity_component.acceleration
		base_max_speed = velocity_component.max_speed
	
	dash_timer.timeout.connect(_on_dash_timer_timeout)


func physics_process(delta: float) -> void:
	if not dash_timer.is_stopped():
		print("timer not stopped.")
		return 
		
	if Input.is_action_just_pressed("player_dash") and velocity_component:
		print("Starting dash")
		base_acceleration = velocity_component.acceleration
		base_max_speed = velocity_component.max_speed
		print("Found base accleration: ", str(base_acceleration))
		velocity_component.increase_acceleration(2)
		dash_timer.start()
			
func _on_dash_timer_timeout() -> void:
	if not velocity_component:
		print("missing velocity component on timeout")
		return
	print("reset velocity acceleration")
	velocity_component.stop()
	velocity_component.acceleration = base_acceleration
	velocity_component.max_speed = base_max_speed
