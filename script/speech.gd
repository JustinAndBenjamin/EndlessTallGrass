extends Control

@export var full_time : float
@export var text : String

@onready var canvas_layer = $CanvasLayer

func speech() -> void:
	canvas_layer.show()
	
	var text_length = text.length()
	var wait_time : float = full_time / text_length
	
	for buchstabe in text:
		$CanvasLayer/Text.text += str(buchstabe)
		var timer = get_tree().create_timer(wait_time)
		await timer.timeout
	
	var delete_time = get_tree().create_timer(2)
	await delete_time.timeout
	$CanvasLayer/Text.text = ""
	canvas_layer.hide()
