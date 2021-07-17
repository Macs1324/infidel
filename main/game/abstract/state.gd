extends Node
class_name State

var p : Player
signal transition(newstate)

func _ready() -> void:
	pass

func _enter() -> void:
	pass
	
func _update(delta : float) -> void:
	pass
	
func _animate(player : AnimationPlayer = null, tree : AnimationTree = null, state = AnimationNodeStateMachinePlayback) -> void:
	pass
	
func _exit() -> void:
	pass
