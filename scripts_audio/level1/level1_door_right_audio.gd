extends AudioStreamPlayer3D

export(Array, AudioStream) var audio_files: Array
var random_index
signal choice_middle_right
var escolha
var escolha2
onready var signal_emmited = false


func _ready():
	$"../../door1C/audio".connect("choice_middle", self, "choice")
	randomize()

func choice(escolha):
	random_index = randi() % audio_files.size()
	while random_index == escolha:
		random_index = randi() % audio_files.size()
	escolha2 = random_index
#	print( "escolha1 - ",  escolha, " || escolha2 - ",random_index)
	$".".stream = audio_files[random_index]
	$".".play()
	if signal_emmited == false:
		emit_signal("choice_middle_right", escolha, escolha2)
		signal_emmited = true

