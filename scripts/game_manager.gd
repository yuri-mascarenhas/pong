class_name GameManager extends Control


# Variables to track scores
var left_score = 0
var right_score = 0

# Reference to the ball and score labels
var ball: Ball
var left_score_label: Label
var right_score_label: Label

@export var ball_speed = 300


func _ready() -> void:
	# Access ball and UI lables
	ball = get_node("../Ball")
	left_score_label = $LeftScoreLabel
	right_score_label = $RightScoreLabel
	# Initialize Game
