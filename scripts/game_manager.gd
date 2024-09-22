class_name GameManager extends Control

# Global utils variables
var window_size: Vector2

# Variables to track scores
var left_score = 0
var right_score = 0

# Reference to the ball and score labels
var ball: Ball
var left_score_label: Label
var right_score_label: Label


func _ready() -> void:
	# Start global utils
	window_size = self.get_viewport().get_visible_rect().size
	# Access ball and UI lables
	ball = get_node("../../Ball")
	left_score_label = $LeftScoreLabel
	right_score_label = $RightScoreLabel
	# Initialize the game
	reset_ball()


func _process(delta: float) -> void:
	# Get window size
	var window_size = get_viewport_rect().size
	
	# Check if the ball goes beyond the left or right boundary
	if ball.position.x < 0:
		# Right player scores
		right_score += 1
		update_score()
		reset_ball()
	elif ball.position.x > window_size.x:
		# Left player scores
		left_score += 1
		update_score()
		reset_ball()


func reset_ball() -> void:
	# Reset positionw
	ball.position = window_size / 2
	# Reset velocity
	var direction_x = randf_range(-1.0, 1.0)
	ball.velocity = Vector2(direction_x, 0).normalized() * ball.speed
	

func update_score() -> void:
	# Update the text of the labels to reflect the current score
	left_score_label.text = str(left_score)
	right_score_label.text = str(right_score)
