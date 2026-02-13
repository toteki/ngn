extends Label

# On Creation

func _ready() -> void:
	text = "" # Hide
	God.jabber.connect(jabber) # Listen
	God.orient.connect(orient)
	God.quantify.connect(quantify)
	God.specify.connect(specify)

# Main Workings

func speak(s:String) -> void:
	text = s
	if God.decisions.jabberwockyDev:
		print(s)

# Individual Signal Listeners  (If you want to log them)

func jabber(detail:int, txt:String) -> void:
	if detail <= God.decisions.jabberwockyDetail:
		speak(txt)

func orient(arrow:String) -> void:
	if God.decisions.jabberwockyDetail >= God.decisions.jabberwockyOrientDetail:
		speak("orient: " + arrow)

func specify(key:String) -> void:
	if God.decisions.jabberwockyDetail >= God.decisions.jabberwockySpecifyDetail:
		speak("specify: " + key)

func quantify(num:int) -> void:
	if God.decisions.jabberwockyDetail >= God.decisions.jabberwockyOrientDetail:
		speak("quantify: " + str(num))
