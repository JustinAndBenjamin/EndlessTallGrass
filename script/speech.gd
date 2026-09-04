extends Control

@onready var Audio = $Audio
@onready var full_time : float
@onready var text : String
@onready var canvas_layer = $CanvasLayer

func _ready() -> void:
	if Audio.stream:
		full_time = Audio.stream.get_length()
	else:
		full_time = 0.0 # Standardwert, falls kein Ton existiert


func speech() -> void:
	canvas_layer.show()
	
	var text_length = text.length()
	var wait_time : float = full_time / text_length
	
	Audio.play()
	for buchstabe in text:
		$CanvasLayer/Text.text += str(buchstabe)
		var timer = get_tree().create_timer(wait_time)
		await timer.timeout
	
	var delete_time = get_tree().create_timer(2)
	await delete_time.timeout
	$CanvasLayer/Text.text = ""
	canvas_layer.hide()
