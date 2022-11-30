extends KinematicBody

var gravity = Vector3.DOWN * 12  # strength of gravity
export var speed = 7  # movement speed
var jump_speed = 6  # jump strength
var spin = 0.1  # rotation speed

var velocity = Vector3.ZERO
var jump = false

func get_input():
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("move_forward"):
		velocity += -transform.basis.z * speed
		animatebody("move_forward");
	if Input.is_action_pressed("move_back"):
		velocity += transform.basis.z * speed
		animatebody("move_back");
	if Input.is_action_pressed("strafe_right"):
		velocity += transform.basis.x * speed
		animatebody("strafe_right");
	if Input.is_action_pressed("strafe_left"):
		velocity += -transform.basis.x * speed
		animatebody("strafe_left");
	velocity.y = vy

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	if abs(velocity.x) <= 0.2 && abs(velocity.z) <= 0.2:
		animatebody("idle");

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
		elif event.relative.x < 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))

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
		
			
			# Declare member variables here. Examples:
# var a = 2
# var b = "tex

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
