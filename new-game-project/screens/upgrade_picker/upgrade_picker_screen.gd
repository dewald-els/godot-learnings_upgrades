class_name UpgradePickerScreen
extends CanvasLayer

@onready var upgrade_button_v_box_container: GridContainer = %UpgradeButtonVBoxContainer
@onready var ability_button_v_box_container: GridContainer = %AbilityButtonVBoxContainer

@export var upgrade_button: PackedScene
@export var upgrade_manager: UpgradeManager
@export var ability_manager: AbilityManager
@export var upgrades: Array[UpgradeResource] = []
@export var abilities: Array[AbilityResource] = []


func _ready() -> void:
	for upgrade in upgrades:
		var button: UpgradePickerButton = upgrade_button.instantiate()
		button.upgrade = upgrade
		upgrade_button_v_box_container.add_child(button)
		button.upgrade_selected.connect(_on_upgrade_selected)
	
	for ability in abilities:
		var button: UpgradePickerButton = upgrade_button.instantiate()
		button.ability = ability
		ability_button_v_box_container.add_child(button)
		button.ability_selected.connect(_on_ability_selected)
	
func _on_upgrade_selected(upgrade: UpgradeResource):
	upgrade_manager.add_upgrade(upgrade)
	Callable(queue_free).call_deferred()


func _on_ability_selected(ability: AbilityResource) -> void:
	ability_manager.add_ability(ability)
	Callable(queue_free).call_deferred()
