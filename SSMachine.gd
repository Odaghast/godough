extends Object
class_name SSMachine

# Simple State Machine
# This class was made to be more compact over the classic node-based state machine that most use.
# The main downside is that the SSMachine becomes inaccessable using a node system.
# Rather you must use classic OOP to access it.

var states : Dictionary = {};
var currentStateName : String = "";
var currentState : Dictionary = {};

func begin(name : String) -> void:
	currentStateName = name;
	currentState = states.get(name);
	currentState.enterCall.call();

func swapState(name : String) -> void:
	if name == currentStateName: return;
	
	currentState.exitCall.call();
	
	currentStateName = name;
	currentState = states.get(name);
	
	currentState.enterCall.call();

#calls
func physicsUpdate(delta : float) -> void:
	currentState.physicsCall.call(delta);

func update(delta : float) -> void:
	currentState.updateCall.call(delta);

#state building
func newState(name : String) -> builder:
	return builder.new(name, self);

static func emptyCall() -> void: pass;
static func emptyUpdateCall(_delta : float) -> void: pass;

class builder:
	var _name : String;
	var _machine : SSMachine;
	var _dict : Dictionary = {
		enterCall = SSMachine.emptyCall,
		exitCall = SSMachine.emptyCall,
		physicsCall = SSMachine.emptyUpdateCall,
		updateCall = SSMachine.emptyUpdateCall
	};
	
	func _init(name : String, machine : SSMachine) -> void:
		self._name = name;
		self._machine = machine;
	
	func physicsCall(callable : Callable) -> builder:
		self._dict.physicsCall = callable;
		return self;
	
	func updateCall(callable : Callable) -> builder:
		self._dict.updateCall = callable;
		return self;
	
	func enterCall(callable : Callable) -> builder:
		self._dict.enterCall = callable;
		return self;
	
	func exitCall(callable : Callable) -> builder:
		self._dict.exitCall = callable;
		return self;
	
	func build() -> void:
		self._machine.states[self._name] = self._dict;
