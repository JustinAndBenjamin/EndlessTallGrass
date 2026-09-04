extends CharacterBody2D

@onready var speech_bubble = $SpeechBubble

@export var text : String

func _ready() -> void:
	speech_bubble.text = text

func _on_speech_trigger_body_entered(body: Node2D) -> void:
	if body.name == "Player":
			speech_bubble.speech()
