extends Node
# God is the project's main Autoload script.
# Project Settings > Globals > Autoload

# Load settings (Desisions.gd) which can be accessed as God.Decisions
var decisions:Decisions = Decisions.new()

# Create a new log signal. Loggers (like Jabberwocky.gd) connect to this.
signal jabber(detail: int,text:String)

# Create signals for key presses. Many things might connect to these.
signal orient(key:String) # Arrows
signal quantify(key:int) # Numbers
signal specify(key:String) # Special

# Listen for input events from Godot and turn them into God's signals.
func _input(event:InputEvent) -> void:
	# Really any node can listen, but we want
	# to make signals and filter out nonsense
	if event is InputEventKey:
		var key:InputEventKey = event
		if key.is_pressed():
			var t:String = key.as_text_key_label()
			jabber.emit(8,"KEY PRESS: " + t)
			match t:
				# Does not catch inputs like "Shift+7"
				"0","1","2","3","4","5","6","7","8","9":
					quantify.emit(int(t))
				"Left","Right","Up","Down":
					orient.emit(t)
				"Escape","Enter","Space":
					specify.emit(t)
