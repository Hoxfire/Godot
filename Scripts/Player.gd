extends Node3D

func _process(delta):
	look_at(ScreenPointToRay(), Vector3.UP)
	
func ScreenPointToRay():
	var spaceState = get_world_3d().direct_space_state
	
	var mousePos = get_viewport().get_mouse_position()
	var camera = get_tree().root.get_camera_3d()
	
	var rayOrigin = camera.project_ray_origin(mousePos)
	var rayEnd = rayOrigin + camera.project_ray_normal(mousePos) * 2000
	var thing = PhysicsRayQueryParameters3D.create(rayOrigin,rayEnd)
	var rayArray = spaceState.intersect_ray(thing)
	if rayArray.has("position"):
		return rayArray["position"]
	return Vector3()



