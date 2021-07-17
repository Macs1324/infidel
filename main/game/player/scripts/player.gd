extends KinematicBody2D
class_name Player

#------------------			STATES
enum {
	STATE_MOVE
}

var MAX_WALK_SPEED : float = 100

var input_vector : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree["parameters/playback"]

