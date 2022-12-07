extends MeshInstance


var sound_enter := preload("res://assets/sound/gameplay/door_enter.wav");
var sound_exit := preload("res://assets/sound/gameplay/door_exit.wav");


onready var audio := get_node("audio");
onready var audio_fx := get_node("audio_fx");
onready var audio_global := get_node("audio_global");
onready var collision := get_node("StaticBody");
onready var area := get_node("Area");


# Called when the node enters the scene tree for the first time.
func _ready():
	area.connect("body_entered", self, "_on_Area_body_entered");
	area.connect("body_exited", self, "_on_Area_body_exited");


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Area_body_exited(body):
	if(body):
		if(body.name == "player"):
			collision.collision_layer = 1;
			audio_fx.stream = sound_exit;
			audio_fx.play();
			audio_global.play(audio.get_playback_position())


func _on_Area_body_entered(body):
	if(body):
		if(body.name == "player"):
			audio_fx.stream = sound_enter;
			audio_fx.play();
			print(get_name())
			audio.unit_db = -12;
