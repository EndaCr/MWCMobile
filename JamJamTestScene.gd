extends Node2D

func _ready():
	# Connect the input event
	set_process_input(true)

func _input(event):
	# Check if the event is a mouse or touch input
	if event is InputEventScreenTouch:
		# Get the position of the touch
		var touch_pos = event.position

		# Check if the touch is within the bounds of the transparent circle
		if is_touch_inside_circle(touch_pos):
			# User drew inside the circle, you can perform further actions here
			print("User drew inside the circle")

func is_touch_inside_circle(touch_pos):
	# You'll need to implement this function to check if the touch position is inside the circle
	# You can use the circle's position and radius to determine this
	# For example:
	var circle_pos = $TextureRect.global_position
	var circle_radius = $TextureRect.rect_size.x / 2

	var distance = (touch_pos - circle_pos).length()
	return distance <= circle_radius
