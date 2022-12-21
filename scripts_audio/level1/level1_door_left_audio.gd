extends AudioStreamPlayer3D

export(Array, AudioStream) var audio_files: Array

var random_index
onready var signal_emmited = false
signal final
var escolha1
var escolha2


func _ready():
	$"../../door1R/audio".connect("choice_middle_right", self, "choice")
	randomize()

func choice(escolha1, escolha2):
	var escolhas = escolha1 + escolha2
	if escolhas == 1:
		random_index = 2
	elif escolhas == 2:
		random_index = 1
	elif escolhas == 3:
		random_index = 0
	print("LEVEL1 - ", " LEFT - ",random_index ,"|| MIDDLE - ",  escolha1 , " || RIGHT - ", escolha2 )
	$".".stream = audio_files[random_index]
	$".".play()


func _process(delta):
	if signal_emmited == false:
		emit_signal("final", escolha1, escolha2, random_index)
		print("bitch")
		signal_emmited = true
