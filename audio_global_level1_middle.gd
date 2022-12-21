extends AudioStreamPlayer

export(Array, AudioStream) var audio_files: Array

func ready(): 
	$"../../door1L/audio".connect("final", self, "final")
	
func final(middle, right, left):
	print ("global_middle - ", middle)
	#$".".stream = audio_files[middle]
	#$".".play()
