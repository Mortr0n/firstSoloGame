extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	


func _on_PlayerTopDown_child_exiting_tree(node):
	scroll_offset.y += 10
	scroll_offset.x += 10
