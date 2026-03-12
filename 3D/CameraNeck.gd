extends Node3D
class_name CameraNeck

const PITCH_MIN : float = -PI*0.45;
const PITCH_MAX : float = PI*0.45;

@export var camera : Camera3D;

func yawAlignVec2D(vec : Vector2) -> Vector2: return vec.rotated(-rotation.y);

func takeCamera(cam : Camera3D, keepTransform : bool = true) -> void:
	cam.reparent(self, keepTransform);
	camera = cam;

func leanTo(angle : float, delta : float) -> void: rotation.z = lerp_angle(rotation.z, angle, delta * 10.0);

func fpsRotate(yaw : float, pitch : float) -> void:
	rotate_y(yaw);
	camera.rotate_x(pitch);
	camera.rotation.x = clamp(camera.rotation.x, PITCH_MIN, PITCH_MAX);
