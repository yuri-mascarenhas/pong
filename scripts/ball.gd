extends Area2D

@export var speed = 300
@export var velocity = Vector2(1, 0).normalized() * speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# Initialize ball's movement


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta
	
	
func _on_body_entered(body: Node2D) -> void:
	print(body)
