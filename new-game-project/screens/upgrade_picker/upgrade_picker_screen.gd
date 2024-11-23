class_name UpgradePickerScreen
extends CanvasLayer

@onready var button_speed: Button = %ButtonSpeed
@onready var button_health: Button = %ButtonHealth

@export var upgrade_manager: UpgradeManager
@export var health_upgrade: HealthUpgradeResource
@export var speed_upgrade: SpeedUpgradeResource


func _ready() -> void:
	button_speed.pressed.connect(_on_speed_pressed)
	button_health.pressed.connect(_on_health_pressed)


func _on_speed_pressed() -> void:
	upgrade_manager.add_upgrade(speed_upgrade)
	Callable(queue_free).call_deferred()
	
func _on_health_pressed() -> void:
	upgrade_manager.add_upgrade(health_upgrade)
	Callable(queue_free).call_deferred()
