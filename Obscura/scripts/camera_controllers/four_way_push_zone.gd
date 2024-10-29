class_name FourWayPushZone
extends CameraControllerBase

# Exported variables
@export var push_ratio: float = 0.5
@export var pushbox_top_left: Vector2
@export var pushbox_bottom_right: Vector2
@export var speedup_zone_top_left: Vector2
@export var speedup_zone_bottom_right: Vector2

var box_width: float
var box_height: float

func _ready() -> void:
	super()
	position = target.global_position
	box_width = pushbox_bottom_right.x - pushbox_top_left.x
	box_height  = pushbox_bottom_right.y - pushbox_top_left.y
func _process(delta: float) -> void:
	if !current:
		return

	if draw_camera_logic:
		draw_logic()

	var tpos = target.global_position
	var cpos = global_position

	# Determine if the target is in each zone
	var in_pushbox_x = (tpos.x - cpos.x < pushbox_bottom_right.x and tpos.x - cpos.x > pushbox_top_left.x)
	var in_pushbox_z = (tpos.z - cpos.z < pushbox_bottom_right.y and tpos.z - cpos.z > pushbox_top_left.y)
	var in_speedup_zone_x = (tpos.x - cpos.x < speedup_zone_bottom_right.x and tpos.x - cpos.x > speedup_zone_top_left.x)
	var in_speedup_zone_z = (tpos.z - cpos.z < speedup_zone_bottom_right.y and tpos.z - cpos.z > speedup_zone_top_left.y)

	# Camera movement calculation
	var cam_move_x = 0.0
	var cam_move_z = 0.0

	# Case 1: Target is within innermost area - no movement
	if in_speedup_zone_x and in_speedup_zone_z:
		# No need to move camera if target is in the area
		return

	# Case 2: Target is in the area between speedup zone and pushbox
	elif in_pushbox_x and in_pushbox_z:
		# Move camera towards target at reduced speed (push_ratio)
		cam_move_x = (tpos.x - cpos.x) * push_ratio
		cam_move_z = (tpos.z - cpos.z) * push_ratio

	# Case 3: Target is touching the edge of the pushbox (outer boundary)
	else:
		# Code copied from pushbox lol
		# Left
		var diff_between_left_edges = (tpos.x - target.WIDTH / 2.0) - (cpos.x - box_width / 2.0)
		if diff_between_left_edges < 0:
			global_position.x += diff_between_left_edges
			
		#right
		var diff_between_right_edges = (tpos.x + target.WIDTH / 2.0) - (cpos.x + box_width / 2.0)
		if diff_between_right_edges > 0:
			global_position.x += diff_between_right_edges
		#top
		var diff_between_top_edges = (tpos.z - target.HEIGHT / 2.0) - (cpos.z - box_height / 2.0)
		if diff_between_top_edges < 0:
			global_position.z += diff_between_top_edges
		#bottom
		var diff_between_bottom_edges = (tpos.z + target.HEIGHT / 2.0) - (cpos.z + box_height / 2.0)
		if diff_between_bottom_edges > 0:
			global_position.z += diff_between_bottom_edges

	# Update camera position based on calculated movement
	global_position += Vector3(cam_move_x, 0, cam_move_z) * delta

	super(delta)

func draw_logic() -> void:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	
	draw_box(immediate_mesh, pushbox_top_left, pushbox_bottom_right, Color(1, 0, 0))
	draw_box(immediate_mesh, speedup_zone_top_left, speedup_zone_bottom_right, Color(0, 1, 0))

	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mesh_instance.material_override = material
	add_child(mesh_instance)
	mesh_instance.global_transform = Transform3D.IDENTITY
	mesh_instance.global_position = Vector3(global_position.x, target.global_position.y, global_position.z)

	await get_tree().process_frame
	mesh_instance.queue_free()

func draw_box(immediate_mesh: ImmediateMesh, top_left: Vector2, bottom_right: Vector2, color: Color) -> void:
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, null)
	
	immediate_mesh.surface_add_vertex(Vector3(bottom_right.x, 0, top_left.y))
	immediate_mesh.surface_add_vertex(Vector3(bottom_right.x, 0, bottom_right.y))
	
	immediate_mesh.surface_add_vertex(Vector3(bottom_right.x, 0, bottom_right.y))
	immediate_mesh.surface_add_vertex(Vector3(top_left.x, 0, bottom_right.y))
	
	immediate_mesh.surface_add_vertex(Vector3(top_left.x, 0, bottom_right.y))
	immediate_mesh.surface_add_vertex(Vector3(top_left.x, 0, top_left.y))
	
	immediate_mesh.surface_add_vertex(Vector3(top_left.x, 0, top_left.y))
	immediate_mesh.surface_add_vertex(Vector3(bottom_right.x, 0, top_left.y))
	immediate_mesh.surface_end()
