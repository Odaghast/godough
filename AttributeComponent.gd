extends Node
class_name AttributeComponent

signal ATTRIBUTE_CHANGED(attribute : AttributeComponent);
signal VALUE_CHANGED(currentValue : int, change : int);

@export var minValue : int = 0;
@export var maxValue : int = 100;
@export var value : int = 0;

func adjustValue(change : int) -> void:
	value = clampi(value + change, minValue, maxValue);
	VALUE_CHANGED.emit(value, change);

func setMax(newMax : int) -> void:
	if newMax <= minValue: 
		push_warning("Attempted to set maximum value below minimum value!");
		return;
	
	maxValue = newMax;
	if value > maxValue: value = maxValue;
	ATTRIBUTE_CHANGED.emit(self);

func setMin(newMin : int) -> void:
	if newMin >= maxValue: 
		push_warning("Attempted to set minimum value above maximum value!");
		return;
	
	minValue = newMin;
	if value < minValue: value = minValue;
	ATTRIBUTE_CHANGED.emit(self);
