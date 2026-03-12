extends Area3D
class_name HurtBox

func dealDamage(value : int) -> void:
	var _array : Array[Area3D] = get_overlapping_areas();
	for _a in _array:
		if _a is HitBox:
			_a.receiveDamage(value);
