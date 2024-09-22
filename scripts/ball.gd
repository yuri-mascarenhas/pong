class_name Ball extends Area2D

@export var speed: int = 300
@export var velocity: Vector2 = Vector2(1, 0).normalized() * speed
@export var max_bounce_angle: float = PI / 3

var window_size: Vector2 = Vector2()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_size = self.get_viewport().get_visible_rect().size
	reset_ball()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < 0 or position.x > window_size.x:
		reset_ball()
	position += velocity * delta
	
	
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerRight or body is PlayerLeft:
		# Calculate the difference in heigh between the ball and the paddle
		var paddle_center = body.position.y
		var capsule_shape = body.get_node("CollisionShape2D").shape as CapsuleShape2D
		var paddle_height = capsule_shape.height + 2 * capsule_shape.radius
		var relative_intersect_y = self.position.y - paddle_center
		# Normalize the relative intersection (to a number between -1.0 and 1.0)
		var normalized_relative_intersect_y = relative_intersect_y / (paddle_height / 2)
		# Calculate bounce angle
		var bounce_angle = normalized_relative_intersect_y * max_bounce_angle
		# Adjust the ball's velocity
		var direction = sign(velocity.x)
		velocity = Vector2(direction * cos(bounce_angle), sin(bounce_angle)).normalized() * speed
		

func reset_ball() -> void:
	# Reset position
	self.position = window_size / 2
	# Reset velocity
	var direction_x = randf_range(-1.0, 1.0)
	self.velocity = Vector2(direction_x, 0).normalized() * speed	
	
