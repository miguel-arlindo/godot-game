extends KinematicBody

var spin = 0.1 
export var speed = 5
export var gravity = -5
var target = null
var velocity = Vector3.ZERO

onready var camera = $Camera

func _physics_process(delta):
	velocity.y += gravity * delta
	if target:
		look_at(target, Vector3.UP)
		rotation.x = 0
		velocity = (target - transform.origin).normalized() * speed
		animatebody("move_forward");
		if transform.origin.distance_to(target) < .5:
			target = null
			velocity = Vector3.ZERO
			animatebody("idle");
	velocity = move_and_slide(velocity, Vector3.UP)
	rotation.y = camera.rotation.y

func animatebody(action):
	var modelAnim = get_node("3DGodotRobot/AnimationPlayer");
	match action:
		"idle":
			if modelAnim.current_animation != "Idle-loop":
				modelAnim.play("Idle-loop");
		"move_forward":
			if modelAnim.current_animation != "Run-loop":
				modelAnim.play("Run-loop");
		"move_back":
			if modelAnim.current_animation != "Run-loop":
				modelAnim.play("Run-loop");
		"strafe_left":
			if modelAnim.current_animation != "Run-loop":
				modelAnim.play("Run-loop");
		"strafe_right":
			if modelAnim.current_animation != "Run-loop":
				modelAnim.play("Run-loop");
