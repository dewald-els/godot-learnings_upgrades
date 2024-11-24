class_name UpgradeChest
extends Node2D


@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var collection_area_2d: Area2D = %CollectionArea2D

@export var uprade_scene: PackedScene
@export var available_upgrades: Array[UpgradeResource] = []
@export var upgrade_manager: UpgradeManager

var is_empty: bool = false

func _ready() -> void:
	collection_area_2d.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D) -> void:
	if is_empty:
		return
		
	if "Player" in body.name:
		await get_tree().create_timer(0.5).timeout
		open()

func open() -> void:
	animated_sprite_2d.play("open")
	await animated_sprite_2d.animation_finished
	var upgrade: UpgradeScene = uprade_scene.instantiate()
	upgrade.upgrade = available_upgrades.pick_random()
	upgrade.upgrade_manager = upgrade_manager
	var upgrade_container: Node = get_tree().get_first_node_in_group("upgrades_container")
	if not upgrade_container:
		return
	
	upgrade_container.add_child(upgrade)
	upgrade.global_position = global_position + Vector2(16, 16)

	animated_sprite_2d.play("empty")
	is_empty = true
