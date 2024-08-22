extends Control

var time_record:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	load_record()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var idx:int
var time:int
var ordered:Array
func display_rank():
	for i in range(1,4):
		idx = time_record.find(time_record.min())
		time = time_record.pop_at(idx)
		ordered.append(time)
	$Leaderboard.text = "Top Leaderbord:
	1. "+str(ordered[0])+"s
	2. "+str(ordered[1])+"s
	3. "+str(ordered[2])+"s"

func load_record():
	var file:FileAccess = FileAccess.open("res://record_time.txt", FileAccess.READ)
	var content:String = file.get_as_text()
	for i in content.get_slice_count(","):
		var data = content.get_slice(",",i).to_int()
		if data != 0:
			time_record.append(data)
	display_rank()


func _on_learn_abjad_button_down():
	get_tree().change_scene_to_file("res://Scenes/Learn Abjad.tscn")


func _on_practice_abjad_button_down():
	get_tree().change_scene_to_file("res://Scenes/practice_abjad.tscn")
