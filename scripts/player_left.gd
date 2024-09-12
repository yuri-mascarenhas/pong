extends RigidBody2D

const JUMP_VELOCITY = -400.0

@export var speed = 300.0

var width = 0
var height = 0
var sprite_height = 0

# Reference to node
@onready var sprite = $player_right_sprite

func _ready():
	width = self.get_viewport().get_visible_rect().size.x
	height = self.get_viewport().get_visible_rect().size.y
	# Check if sprite node is valid
	if sprite and sprite.texture:
		sprite_height = sprite.texture.get_size().y

func _physics_process(delta: float) -> void:
	if self.global_position.y > height + sprite_height:
		self.set_linear_velocity(Vector2(0,0))
		self.global_position = Vector2(67, height / 2)
	if Input.is_action_just_pressed("left_move_up"):
		self.set_linear_velocity(Vector2(0, -200))
	
