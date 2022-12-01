extends Spatial

var run_speed : float = 13.0
var jump_length : float = 5.5
var jump_height : float = 2.0

var initial_road_count :int = 5
var road_scenes = [
	load("res://RoadStart.tscn"),
	load("res://obs.tscn"),
	load("res://RoadBase.tscn"),
	
]
onready var player = $PLAYER
onready var Pivotcamera = $pivotcam
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player.SetUp_Jump(jump_height, jump_length, run_speed)
	randomize()
	for i in range(initial_road_count):
		var road = make_random_road() # Replace with function body.
		road.translation.z = -(i+1) * RoadBase.LENGTH
		add_child(road)
	
func _physics_process(delta):
	if player.translation.z < -RoadBase.LENGTH:
		player.translation.z += RoadBase.LENGTH
		
		for child in get_children():
			var road = child as RoadBase
			if road:
				road.translation.z += RoadBase.LENGTH
				if road.translation.z > RoadBase.LENGTH:
					road.queue_free()
		var new_road := make_random_road()
		new_road.translation.z = initial_road_count * - RoadBase.LENGTH
	
			
	Pivotcamera.translation = player.translation
	Pivotcamera.translation.y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func make_random_road() ->RoadBase:
	var road_scene = road_scenes[randi() % road_scenes.size()]
	var road = road_scene.instance()
	return road
