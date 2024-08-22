extends Sprite2D

@onready var abjad_nodes:Array = get_children()
@onready var page_length:int = abjad_nodes.size()

# Called when the node enters the scene tree for the first time.
func _ready():
	abjad_nodes[Global.current_page-1].visible = true
	get_parent().get_node("PageNum").value = Global.current_page


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func handle_page_change():
	if Global.current_page > page_length:
		Global.current_page = 1
	if Global.current_page < 1:
		Global.current_page = page_length
	
	get_parent().get_node("PageNum").value = Global.current_page
	
	for node in abjad_nodes:
		node.visible = false
	abjad_nodes[Global.current_page-1].visible = true


func _on_next_btn_button_down():
	Global.current_page += 1
	handle_page_change()


func _on_previous_button_down():
	Global.current_page -= 1
	handle_page_change()


func _on_page_num_value_changed(value):
	Global.current_page = value
	handle_page_change()
