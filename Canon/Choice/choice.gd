extends Control

# This button is meant to be simple and passive.
# It allows itself to be renamed and updated, but
# does not affect other objects.

@export var Key:String = "Key" # First part of displayed text
@export var Info:String = "Choice" # Second part of displayed text
@export var Hue:int = 7 # Border and highlight color. Range 0-7

@export var Payload:Label # In the editor, this is set to the button text
@export var Highlight:ColorRect # Animated flash (set in editor)
@export var Border:ColorRect # Colored border (set in editor)

func _ready() -> void:
	Rename(Key,Info,Hue)
	Reset()

func _process(delta: float) -> void:
	if Highlight != null && is_instance_valid(Highlight):
		if Highlight.color.a <= God.decisions.choiceFlashMin:
			Highlight.color.a = God.decisions.choiceFlashMin
		if Highlight.color.a > God.decisions.choiceFlashMin:
			Highlight.color.a -= God.decisions.choiceFlashDecay * delta

func Reset() -> void:
	if Highlight != null && is_instance_valid(Highlight):
		Highlight.color.a = God.decisions.choiceFlashMin

func Flash() -> void:
	if Highlight != null && is_instance_valid(Highlight):
		Highlight.color.a = God.decisions.choiceFlashMax

func Rename(key:String, info:String, hue:int) -> void:
	if Highlight != null && is_instance_valid(Highlight):
		var oldAlpha:float = Highlight.color.a
		match hue:
			0:
				Highlight.color = Color(0,0,0,oldAlpha)
			1:
				Highlight.color = Color(1,0,0,oldAlpha)
			2:
				Highlight.color = Color(1,1,0,oldAlpha)
			3:
				Highlight.color = Color(0,1,0,oldAlpha)
			4:
				Highlight.color = Color(0,1,1,oldAlpha)
			5:
				Highlight.color = Color(0,0,1,oldAlpha)
			6:
				Highlight.color = Color(1,0,1,oldAlpha)
			7:
				Highlight.color = Color(1,1,1,oldAlpha)
	if Border != null && is_instance_valid(Border):
		match hue:
			0:
				Border.color = Color(0,0,0)
			1:
				Border.color = Color(1,0,0)
			2:
				Border.color = Color(1,1,0)
			3:
				Border.color = Color(0,1,0)
			4:
				Border.color = Color(0,1,1)
			5:
				Border.color = Color(0,0,1)
			6:
				Border.color = Color(1,0,1)
			7:
				Border.color = Color(1,1,1)
	if Payload != null && is_instance_valid(Payload):
		Payload.text = "[" + key + "] " + info
	Key = key
	Info = info
	Hue = hue
