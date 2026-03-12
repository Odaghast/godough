extends Area3D
class_name HitBox

@export var healthAttribute : AttributeComponent;

func receiveDamage(damage : int) -> void:
	healthAttribute.adjustValue(-damage);
