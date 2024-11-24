class_name AbilityManager
extends Node

signal ability_added(ability: AbilityResource)

var abilities: Array[AbilityResource] = []


func add_ability(ability: AbilityResource) -> void:
	var current_abilities = abilities.filter(func(ab: AbilityResource):
		return ab.id == ability.id
	)
	
	if current_abilities.size() < ability.max_allowed:
		abilities.append(ability)
		ability_added.emit(ability)
