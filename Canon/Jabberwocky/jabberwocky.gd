extends Label

func _ready() -> void:
	text = ""
	# As a logger, Jabberwocky listens to a lot of signal types
	God.jabber.connect(jabber)
	God.orient.connect(orient)
	God.quantify.connect(quantify)
	God.specify.connect(specify)

# Main Functionality

func speak(s:String) -> void:
	text = s # Modify label text
	if God.decisions.jabberwockyDev:
		print(s) # Optional console output

# Individual Signal Listeners

func jabber(detail:int, txt:String) -> void:
	if detail >= God.decisions.jabberwockyFilter:
		speak(txt)

func orient(arrow:String) -> void:
	if God.decisions.jabberwockyLvOrient >= God.decisions.jabberwockyFilter:
		speak("orient: " + arrow)

func specify(key:String) -> void:
	if God.decisions.jabberwockyLvSpecify >= God.decisions.jabberwockyFilter:
		speak("specify: " + key)

func quantify(num:int) -> void:
	if God.decisions.jabberwockyLvQuantify >= God.decisions.jabberwockyFilter:
		speak("quantify: " + str(num))
