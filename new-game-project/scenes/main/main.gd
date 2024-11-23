extends Node2D

@export var upgrade_picker_scene: PackedScene
@export var upgrade_manager: UpgradeManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Callable(show_upgrade_picker).call_deferred()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func show_upgrade_picker() -> void:
	await get_tree().create_timer(4.0).timeout
	var upgrade_picker: UpgradePickerScreen = upgrade_picker_scene.instantiate()
	upgrade_picker.upgrade_manager = upgrade_manager
	add_child(upgrade_picker)
