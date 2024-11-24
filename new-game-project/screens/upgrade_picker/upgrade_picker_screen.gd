class_name UpgradePickerScreen
extends CanvasLayer

@onready var button_v_box_container: GridContainer = %ButtonVBoxContainer

@export var upgrade_button: PackedScene
@export var upgrade_manager: UpgradeManager
@export var upgrades: Array[UpgradeResource] = []


func _ready() -> void:
	for upgrade in upgrades:
		var button: UpgradePickerButton = upgrade_button.instantiate()
		button.upgrade = upgrade
		button_v_box_container.add_child(button)
	
func _on_upgrade_selected(upgrade: UpgradeResource):
	upgrade_manager.add_upgrade(upgrade)
	Callable(queue_free).call_deferred()
