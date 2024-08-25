extends Label

var score_record:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	load_record()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var idx:int
var score:int
var ordered:Array
func display_rank():
	for i in range(1,4):
		idx = score_record.find(score_record.max())
		score = score_record.pop_at(idx)
		ordered.append(score)
	text = "Top Leaderbord:
	1. "+str(ordered[0])+"
	2. "+str(ordered[1])+"
	3. "+str(ordered[2])

func load_record():
	var file:FileAccess = FileAccess.open("res://record_score.txt", FileAccess.READ)
	var content:String = file.get_as_text()
	for i in content.get_slice_count(","):
		var data = content.get_slice(",",i).to_int()
		if data != 0:
			score_record.append(data)
	display_rank()
