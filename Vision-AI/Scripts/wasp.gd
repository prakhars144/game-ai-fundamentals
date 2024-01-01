extends CharacterBody3D

var SPEED = 5.0
const MAX_DISTANCE = 6
var DISTANCE_MOVED = 0
var DIRECTION = "FORWARD"

func _ready():
	DISTANCE_MOVED = 0
	$AnimationPlayer.play("FlyingWasp")

func _physics_process(delta):
	if DIRECTION == "FORWARD":
		DISTANCE_MOVED += SPEED * delta
		velocity.x = SPEED
	else:
		velocity.x = -SPEED
		DISTANCE_MOVED += SPEED * delta
	
	if DISTANCE_MOVED > MAX_DISTANCE:
		DISTANCE_MOVED = 0
		SPEED = 5.0
		DIRECTION = "FORWARD" if DIRECTION == "BACKWARD" else "BACKWARD"

	move_and_slide()
	look_at(position - velocity, Vector3.UP)
	SPEED = SPEED * 0.99

func get_wasp_eyes():
	return $Eyes.global_position

