extends KinematicBody2D

var speed = 50
var tile_size = 16
var corner = 1
var last_position = Vector2()
var target_position = Vector2()
var move_dir = Vector2()
var post_move = 0

func _ready():
	position = position.snapped(Vector2(24, 24))
	last_position = position
	target_position = position
	
func _process(delta):
	
	position += speed * move_dir * delta
	
	if position.distance_to(last_position) >= tile_size * corner - speed * delta:
		position = target_position
	
	if position == target_position:
		get_movedir()
		last_position = position
		target_position += move_dir * tile_size
	
func get_movedir():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	move_dir.x = -int(LEFT) + int(RIGHT)
	move_dir.y = -int(UP) + int(DOWN)

	if move_dir.x != 0 && move_dir.y != 0:
		corner = sqrt(2)
	else:
		corner = 1

