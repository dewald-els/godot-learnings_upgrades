class_name UpgradeScene
extends Node2D

@onready var pickup_area: Area2D = %PickupArea
@onready var upgrade_sprite: Sprite2D = %UpgradeSprite

@export var upgrade_manager: UpgradeManager
@export var upgrade: UpgradeResource


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if upgrade:
		upgrade_sprite.texture = upgrade.texture
		pickup_area.body_entered.connect(_on_body_entered)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		if upgrade_manager: 
			upgrade_manager.add_upgrade(upgrade)
		queue_free()
