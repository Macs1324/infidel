extends State
class_name PlayerStateMove

const MAX_WALK_SPEED : int = 100
const ACCELERATION : int = 800
const FRICTION : int = 800

var input_vector : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO

func _update(delta : float) -> void:
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	

	if input_vector == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	else:
		velocity = velocity.move_toward(input_vector.normalized() * MAX_WALK_SPEED, ACCELERATION * delta)
		
	velocity = p.move_and_slide(velocity)
	
	if Input.is_action_pressed("run"):
		emit_signal("transition", "Run")

func _animate(player : AnimationPlayer = null, tree : AnimationTree = null, state = AnimationNodeStateMachinePlayback) -> void:
	if input_vector != Vector2.ZERO:
		tree["parameters/idle/blend_position"] = input_vector
		tree["parameters/walk/blend_position"] = input_vector
		state.travel("walk")
	else:
		state.travel("idle")
