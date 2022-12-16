extends AudioStreamPlayer3D

export(Array, AudioStream) var audio_files: Array



func _ready():
  randomize()

func play_random():
  var random_index: = randi() % audio_files.size()
  stop()
  stream = audio_files[random_index]
  play()

