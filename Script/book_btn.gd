extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	get_tree().change_scene_to_file("res://Scenes/book_submenu.tscn")


func _on_mouse_entered():
	$PointLight2D.visible = true


func _on_mouse_exited():
	$PointLight2D.visible = false


func _on_adventure_btn_button_down():
	get_tree().change_scene_to_file("res://Scenes/adventure.tscn")
