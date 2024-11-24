extends Node2D

@onready var pickup_area_2d: Area2D = %PickupArea2D
@onready var ability_sprite_2d: Sprite2D = %AbilitySprite2D

@export var ability_manager: AbilityManager
@export var ability: AbilityResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not ability:
		return

	ability_sprite_2d.texture = ability.texture
	pickup_area_2d.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	print("Body", body)
	if "Player" in body.name:
		print("Player collected")
		ability_manager.add_ability(ability)
		queue_free()
