extends Node3D

@export var VISION_CONE_ARC = 90.00

func in_vision_cone(point: Vector3):
	var spider_forward_direction = global_transform.basis.z
	var spider_position = global_position
	var direction_to_point = point - spider_position
	return rad_to_deg(direction_to_point.angle_to(spider_forward_direction)) <= VISION_CONE_ARC/2.0
	
func has_los(point: Vector3):
	var space_state = get_world_3d().direct_space_state
	var params = PhysicsRayQueryParameters3D.new()
	params.from = global_transform.origin
	params.to = point
	params.exclude = []
	params.collision_mask = 1
	var result = space_state.intersect_ray(params)
	if result and result.collider.is_in_group("target"):
		return true
	else:
		return false
