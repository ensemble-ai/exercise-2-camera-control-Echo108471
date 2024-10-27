class_name FramingAutoScroller
extends CameraControllerBase

@export var top_left: Vector2
@export var bottom_right: Vector2
@export var autoscroll_speed: Vector3

func _ready() -> void:
	super()
	position = target.position



func _process(delta: float) -> void:
	if !current:
		return
	var scroll_offset = autoscroll_speed * delta
	top_left += Vector2(scroll_offset.x, scroll_offset.z)
	bottom_right += Vector2(scroll_offset.x, scroll_offset.z)
	
	global_position.x = (top_left.x + bottom_right.x) / 2
	global_position.z = (top_left.y + bottom_right.y) / 2
	global_position.y = target.global_position.y
	
	var player_left_edge = target.global_position.x - target.WIDTH / 2.0
	var frame_left_edge = top_left.x
	if player_left_edge < frame_left_edge:
		target.global_position.x += frame_left_edge - player_left_edge
		
	if draw_camera_logic:
		draw_frame_box()
	super(delta)
	
	
func draw_frame_box() -> void:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	
	var top_left_3d = Vector3(top_left.x, 0, top_left.y)
	var top_right_3d = Vector3(bottom_right.x, 0, top_left.y)
	var bottom_left_3d = Vector3(top_left.x, 0, bottom_right.y)
	var bottom_right_3d = Vector3(bottom_right.x, 0, bottom_right.y)
	
	immediate_mesh.surface_add_vertex(top_left_3d)
	immediate_mesh.surface_add_vertex(top_right_3d)
	
	immediate_mesh.surface_add_vertex(top_right_3d)
	immediate_mesh.surface_add_vertex(bottom_right_3d)
	
	immediate_mesh.surface_add_vertex(bottom_right_3d)
	immediate_mesh.surface_add_vertex(bottom_left_3d)
	
	immediate_mesh.surface_add_vertex(bottom_left_3d)
	immediate_mesh.surface_add_vertex(top_left_3d)
	
	immediate_mesh.surface_end()
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = Color.BLACK
	
	add_child(mesh_instance)
	mesh_instance.global_transform = Transform3D.IDENTITY
	mesh_instance.global_position = Vector3(global_position.x, target.global_position.y, global_position.z)
	
	await get_tree().process_frame
	mesh_instance.queue_free()
