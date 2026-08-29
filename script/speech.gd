extends Node

@export var full_time : float
@export var text : String

func speech() -> void:
	var text_length = text.length()
	var wait_time : float = full_time / text_length
	
	for buchstabe in text:
		$Text.text += str(buchstabe)
		var timer = get_tree().create_timer(wait_time)
		await timer.timeout

func _ready() -> void:
	speech()
