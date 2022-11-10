extends Spatial

var run_speed : float = 8.0
var jump_length : float = 5.5
var jump_height : float = 2.0

onready var player = $PLAYER
onready var Pivotcamera = $pivotcam
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player.SetUp_Jump(jump_height, jump_length, run_speed) # Replace with function body.

func _physics_process(delta):
	Pivotcamera.translation = player.translation
	Pivotcamera.translation.y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
