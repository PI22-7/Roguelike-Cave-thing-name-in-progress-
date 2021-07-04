extends KinematicBody2D

var tile_size = 16
#var inputs = {"ui_right": Vector2.RIGHT,
#"ui_left": Vector2.LEFT,
#"ui_up": Vector2.UP,
#"ui_down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2


func _physics_process(delta):
	var move_dir = 0
	if Input.is_action_pressed("ui_right"):
		move_dir += 1
	if Input.is_action_pressed("ui_left"):
		move_dir -= 1
	move_and_slide(Vector2(move_dir * tile_size))
