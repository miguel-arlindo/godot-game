extends AudioStreamPlayer3D

export(Array, AudioStream) var audio_files: Array

signal choice_middle
var random_index = -1
var escolha = 10
onready var signal_emmited = false

func _ready():
	randomize()
	play_random()

func play_random():
	var random_index = RandomNumberGenerator.new()
	random_index = randi() % audio_files.size()
	escolha = random_index
	$".".stream = audio_files[random_index]
	$".".play()

func _process(delta):
	if signal_emmited == false:
		emit_signal("choice_middle", escolha)
		signal_emmited = true

