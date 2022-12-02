extends Node

onready var banas = preload("res://F9 Space Vox Blip 90 Amin.4.wav");


func _on_Area_area_entered(_area):
	$doorsound.play(true);
	pass # Replace with function body.


func _on_StaticBody_input_event(_camera, _event, _position, _normal, _shape_idx):
	$doorsound.play(banas);
	pass # Replace with function body.
