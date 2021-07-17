extends Node
class_name StateMachine

onready var player : Player = get_parent()
onready var states : Array = get_children()

onready var current_state : State = states[0]

func _ready() -> void:
	for state in states:
		state = state as State
		state.p = player
		state.connect("transition", self, "transition")

func _physics_process(delta: float) -> void:
	current_state._update(delta)
	current_state._animate(player.animation_player, player.animation_tree, player.animation_state)
	
func transition(newstate : String) -> void:
	current_state._exit()
	current_state = get_node(newstate)
	current_state._enter()
