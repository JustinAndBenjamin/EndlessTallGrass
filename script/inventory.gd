extends Control

var inventory = [null, null, null, null, null, null, null, null]
var full = bool(false)

func _ready() -> void:
	if Global.hat_inventar:
		inventory = Global.inventar
		Global.hat_inventar = false

func _process(delta: float) -> void:
	var i = 0
	for object in inventory:
		i += 1
		if typeof(object) == TYPE_STRING:
			var direction_label = get_node("Monpok" + str(i) + "/Label")
			direction_label.text = object
	
func add(TEXT, IMAGE):
	full = false
	var free_place = inventory.find(null)
	if free_place != -1:
		free_place += 1
		var direction_rect = get_node("Monpok" + str(free_place) + "/TextureRect")
		var direction_label = get_node("Monpok" + str(free_place) + "/Label")
		direction_rect.texture = IMAGE
		direction_label.text = TEXT
		inventory[free_place - 1] = TEXT
	else:
		full = true
		$Timer.start()
		show()
		$Label.show()


func _on_timer_timeout() -> void:
	hide()
	$Label.hide()


func _on_clear_inventory_pressed() -> void:
	for place in range(inventory.size()):
		place += 1
		var direction_rect = get_node("Monpok" + str(place) + "/TextureRect")
		var direction_label = get_node("Monpok" + str(place) + "/Label")
		if direction_rect:
			direction_rect.texture = null
		if direction_label:
			direction_label.text = ""
	inventory = [null, null, null, null, null, null, null, null]
		
		
		
