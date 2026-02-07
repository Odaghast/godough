extends Object
class_name Registry

static var _entries : Dictionary = {};

static func addEntry(name : String, data : Variant) -> Variant: 
	_entries[name] = data;
	return data;

static func getEntry(name : String) -> Variant:
	if _entries.has(name): return _entries[name];
	
	push_error("Entry %s not found in this Registry!" % name);
	return null;
