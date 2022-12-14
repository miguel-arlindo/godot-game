extends Spatial

var winvideo := preload("res://assets/anims/Parabens_1.webm");
var losevideo := preload("res://assets/anims/Lose.webm");

var Winsequence = []

onready var camera_anim = get_node("player/Camera/AnimationPlayer");
onready var player = get_node("player");
onready var bt_restart = get_node("player/Camera/Restart");
onready var videoplayer := $VideoPlayer 

export(int) var win_level = 4;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func checkWins(level):
	if(level < win_level):
		return;
	
	print(Winsequence);
	
	if(Winsequence.count(Winsequence[0]) >= win_level):
		videoplayer.stream = winvideo;
		videoplayer.play();
		$VideoPlayer.visible = true
		print("GANHASTE");
		#VideoStream.stream();
	else:
		videoplayer.stream = losevideo;
		videoplayer.play();
		$VideoPlayer.visible = true
		print("Perdeste");
		
		
	bt_restart.visible = true;
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	print("_on_Button_button_down");
	player.global_transform.origin = Vector3(-9.921, 0.141, 0);
	player.global_rotation = Vector3(0, -PI/2, 0);
	bt_restart.visible = false;
	camera_anim.play();
	pass # Replace with function body.


func _on_VideoPlayer_finished():
	videoplayer.play()
