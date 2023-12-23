extends KinematicBody2D

export var speed := 300 #in pixels per second
export var friction = .18

var _sprites := {Vector2.RIGHT: 1, Vector2.LEFT: 3, Vector2.UP: 4, Vector2.DOWN: 2}
var _velocity := Vector2.ZERO

onready var animated_sprite: AnimatedSprite = $AnimatedSprite 

func _physics_process(_delta) -> void:
	var direction := Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if direction.length() > 1:
		direction = direction.normalized()
	move_and_slide(speed * direction)
	
	var target_velocity = direction * speed
	_velocity += (target_velocity - _velocity) * friction
	_velocity = move_and_slide(_velocity)
 
func _unhandled_input(event):
	if event.is_action_pressed("right"):
		_update_sprite(Vector2.RIGHT)
	elif event.is_action_pressed("left"):
		_update_sprite(Vector2.LEFT)
	elif event.is_action_pressed("down"):
		_update_sprite(Vector2.DOWN)
	elif event.is_action_pressed("up"):
		_update_sprite(Vector2.UP)

func _update_sprite(direction: Vector2) -> void:
	animated_sprite.frame = _sprites[direction]

#
#func _on_ParallaxBackground_child_exiting_tree(node):
#	scroll_offset.y += 10
#	scroll_offset.x += 10


#func _on_ParallaxLayer_child_exiting_tree(node):
#	scroll_offset.y += 10
#	scroll_offset.x += 10

