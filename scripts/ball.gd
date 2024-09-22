class_name Ball extends Area2D

@export var speed: int = 300
@export var velocity: Vector2 = Vector2(1, 0).normalized() * speed
@export var max_bounce_angle: float = PI / 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
		
