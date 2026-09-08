extends Control

@export var scene_1 : PackedScene
@export var scene_2 : PackedScene
@export var scene_3 : PackedScene



func _on_monpok_map_pressed() -> void:
	if scene_1:
		get_tree().change_scene_to_packed(scene_1)


func _on_npc_test_pressed() -> void:
	if scene_2:
		get_tree().change_scene_to_packed(scene_2)


func _on_house_map_pressed() -> void:
	if scene_3:
		get_tree().change_scene_to_packed(scene_3)
