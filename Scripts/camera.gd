
extends Camera2D

var pos
var scrollSpeed = 1000

func _ready():
	set_process(true)
	set_process_input(true)
	pos = self.get_pos()


func _process(delta):
	if Input.is_action_pressed("camera_down"):
		pos.y += scrollSpeed * delta
		self.set_pos(pos)


	if Input.is_action_pressed("camera_up"):
		pos.y += -scrollSpeed * delta
		self.set_pos(pos)


	if Input.is_action_pressed("camera_left"):
		pos.x += -scrollSpeed * delta
		self.set_pos(pos)


	if Input.is_action_pressed("camera_right"):
		pos.x += scrollSpeed * delta
		self.set_pos(pos)
