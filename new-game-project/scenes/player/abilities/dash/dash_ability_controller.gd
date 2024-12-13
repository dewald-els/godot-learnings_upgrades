class_name DashAbilityController
extends AbilityController


@onready var dash_timer: Timer = %DashTimer

var dash_speed: float = 400.0
var base_acceleration: float = 0.0
var base_max_speed: float = 0.0
	
func setup() -> void:
	dash_timer.timeout.connect(_on_dash_timer_timeout)


func physics_process(delta: float) -> void:
	if not dash_timer.is_stopped():
		print("timer not stopped.")
		return 
		
	if Input.is_action_just_pressed("player_dash") and owner.velocity_component and dash_timer.is_stopped():
		var velocity_component: VelocityComponent = owner.velocity_component
		base_acceleration = velocity_component.acceleration
		base_max_speed = velocity_component.max_speed
		velocity_component.set_fixed_acceleration(dash_speed)
		dash_timer.start()
			
func _on_dash_timer_timeout() -> void:
	if not owner.velocity_component:
		print("missing velocity component on timeout")
		return
	owner.velocity_component.stop()
	owner.velocity_component.acceleration = base_acceleration
	owner.velocity_component.max_speed = base_max_speed
