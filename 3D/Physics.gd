extends Object
class_name Physics

const GRAVITY : float = 12.0;

static func friction(vel : Vector3, fric : float, delta : float) -> Vector3:
	var _speed : float = vel.length();
	var _newSpeed : float = max(_speed - (fric * delta), 0.0);
	if _speed > 0.0: _newSpeed /= _speed;
	vel.x *= _newSpeed;
	vel.z *= _newSpeed;
	return vel;

#currentSpeed is vel.dot(dir);
#addSpeed is clamp(speed - currentSpeed, 0, accel * delta);
static func accelerate(vel : Vector3, dir : Vector3, speed : float, accel : float, delta : float) -> Vector3: return vel + (clampf(speed - vel.dot(dir), 0, accel * delta) * dir);

#applies gravity using the UP vector
static func gravity(vel : Vector3, mult : float, delta : float) -> Vector3: return vel - (Vector3.UP * (GRAVITY * mult * delta));

#applies gravity with gravity()
#lerps towards a cap on velocity.y using delta and an acceleration
static func cappedGravity(vel : Vector3, mult : float, minGrav : float, maxGrav : float, accel : float, delta : float) -> Vector3:
	vel = gravity(vel, mult, delta);
	vel.y = lerpf(vel.y, clampf(vel.y, minGrav, maxGrav), accel * delta);
	return vel;
