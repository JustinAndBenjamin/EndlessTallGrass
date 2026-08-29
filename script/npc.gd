extends CharacterBody2D

@onready var speech_bubble = $SpeechBubble

func _on_speech_trigger_body_entered(body: Node2D) -> void:
	if body.name == "Player":
			speech_bubble.speech()
