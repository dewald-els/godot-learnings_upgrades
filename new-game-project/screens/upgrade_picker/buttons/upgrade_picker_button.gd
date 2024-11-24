class_name UpgradePickerButton
extends PanelContainer

signal upgrade_selected(upgrade: UpgradeResource)

@onready var upgrade_texture_rect: TextureRect = %UpgradeTextureRect
@onready var name_label: Label = %NameLabel
@onready var description_label: Label = %DescriptionLabel

@export var upgrade: UpgradeResource

func _ready() -> void:
	Callable(setup_upgrade).call_deferred()
	
func setup_upgrade() -> void:
	if not upgrade:
		return
		
	name_label.text = upgrade.name
	description_label.text = upgrade.description
	upgrade_texture_rect.texture = upgrade.texture


func _on_upgrade_selected() -> void:
	upgrade_selected.emit(upgrade)
