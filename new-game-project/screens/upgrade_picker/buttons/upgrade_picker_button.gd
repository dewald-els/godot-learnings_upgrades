class_name UpgradePickerButton
extends PanelContainer

signal upgrade_selected(upgrade: UpgradeResource)
signal ability_selected(upgrade: AbilityResource)

@onready var upgrade_texture_rect: TextureRect = %UpgradeTextureRect
@onready var name_label: Label = %NameLabel
@onready var description_label: Label = %DescriptionLabel

@export var upgrade: UpgradeResource
@export var ability: AbilityResource


func _ready() -> void:
	Callable(setup_upgrade).call_deferred()
	
	
func setup_upgrade() -> void:
	if not upgrade and not ability:
		return
	
	if upgrade:
		name_label.text = upgrade.name
		description_label.text = upgrade.description
		upgrade_texture_rect.texture = upgrade.texture
	else:
		name_label.text = ability.name
		description_label.text = ability.description
		upgrade_texture_rect.texture = ability.texture
		
	gui_input.connect(_on_gui_input)


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("clicked"):
		_on_pressed()

func _on_pressed() -> void:
	if ability:
		ability_selected.emit(ability)
	else:
		upgrade_selected.emit(upgrade)
		
