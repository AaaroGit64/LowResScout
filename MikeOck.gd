extends KinematicBody

var run_speed : float
var ss_speed : float = 5.0
var velocity := Vector3()
var gravity : float
var jump_speed : float

var time : float = 0.0
var step_freq : float = 2.0
var step_height : float = 0.2
var step_tilt : float = 9.0
# Stand Name: Milk Man
# Stand User: Maitomies


onready var body_hinge = $hinge
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func SetUp_Jump(length : float, height : float, speed : float):
	run_speed = speed
	gravity = 8.0 * height * speed * speed / (length * length)
	jump_speed = 4.0 * height * speed / length
	#speen


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	body_hinge.translation.y = step_height * (1 + sin(2.0 * PI * step_freq * time))
	body_hinge.rotation_degrees.z = step_tilt * sin(PI * step_freq * time)
	time += delta
	
	var sideways : float = 0.0
	if Input.is_action_pressed("move_right"):
	  sideways += 3.0
	if Input.is_action_pressed("move_left"):
	  sideways -= 3.0
	
	velocity.x = sideways * ss_speed
	velocity.z = -run_speed
	
	move_and_slide(velocity)
