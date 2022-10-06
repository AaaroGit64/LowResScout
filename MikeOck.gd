extends KinematicBody

var run_speed : float = 8.0
var ss_speed : float = 5.0
var velocity := Vector3()

var time : float = 0.0
var step_freq : float = 5.0
var step_height : float = 0.2
var step_tilt : float = 9.0


onready var body_hinge = $hinge
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
