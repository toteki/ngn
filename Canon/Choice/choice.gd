extends Control

var Key:String = "X"
var Info:String = "Choice"

@export var Payload:Label # In the editor, this is set to the button text

func Rename(key:String, info:String) -> void:
	Key = key
	Info = info
	if Payload != null && is_instance_valid(Payload):
		Payload.text = "[" + Key + "] " + Info
