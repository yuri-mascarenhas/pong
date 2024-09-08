extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	
	# Get movement input
	if Input.is_action_pressed("right_move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("right_move_up"):
		input_vector.y -= 1
	
	# Normalize vector
	input_vector = input_vector.normalized()
	
	# Move paddle
	position += input_vector * SPEED * delta

	move_and_slide()
