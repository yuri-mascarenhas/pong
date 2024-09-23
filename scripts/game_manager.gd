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

@export var label_y_offset = 10
@export var font_size = 20

func _ready() -> void:
	window_size = self.get_viewport().get_visible_rect().size
	
	ball = get_node("../../Ball")
	left_score_label = $LeftScoreLabel
	right_score_label = $RightScoreLabel
	
	_update_score_labels()
	reset_ball()


func _process(delta: float) -> void:
	window_size = get_viewport_rect().size
	
	_update_score_labels()
	
	if ball.position.x < 0:
		right_score += 1
		update_score()
		reset_ball()
	elif ball.position.x > window_size.x:
		left_score += 1
		update_score()
		reset_ball()

## Updates all info and styling of the score UI components
func _update_score_labels():
	var left_half_center_x = window_size.x / 4
	var right_half_center_x = 3 * window_size.x / 4
	var left_label_size = left_score_label.get_minimum_size()
	var right_label_size = right_score_label.get_minimum_size()
	
	left_score_label.position = Vector2(left_half_center_x - left_label_size.x / 2, label_y_offset)
	right_score_label.position = Vector2(right_half_center_x - right_label_size.x / 2, label_y_offset)


## Resets to the initial position and velocity of the ball, randomizing it's direction
func reset_ball() -> void:
	ball.position = window_size / 2
	
	var direction_x = randf_range(-1.0, 1.0)
	ball.velocity = Vector2(direction_x, 0).normalized() * ball.speed


## Updates the score visual elements according to its game manager variable
func update_score() -> void:
	left_score_label.text = str(left_score)
	right_score_label.text = str(right_score)
	
