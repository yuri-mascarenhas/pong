extends CharacterBody2D


@export var speed = 300.0
const JUMP_VELOCITY = -400.0

var min_y = 0
var max_y = 0

# Reference to node
@onready var sprite = $player_right_sprite

func _ready():
	# Check if sprite node is valid
	if sprite and sprite.texture:
		var sprite_height = sprite.texture.get_size().y
		min_y = sprite_height / 2
		max_y = get_viewport().size.y - sprite_height / 2

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	
	# Get movement input
	if Input.is_action_pressed("right_move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("right_move_up"):
		input_vector.y -= 1
	
	# Normalize vector
	input_vector = input_vector.normalized()
	
	# Move and limit paddle
	var new_position = position + input_vector * speed * delta
	new_position.y = clamp(new_position.y, min_y, max_y)
	position = new_position
	move_and_slide()
