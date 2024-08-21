extends Node2D

var right_answer:String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visibility_changed():
	if self.visible == true:
		$Correction.visible = false
		%NextBtn.disabled = true
		
		var rng = randi_range(0,4)
		
		if rng == 0:
			$Abjad.texture = %Alif.texture
			right_answer = "Alif"
		if rng == 1:
			$Abjad.texture = %Ba.texture
			right_answer = "Ba\'"
		if rng == 2:
			$Abjad.texture = %Ta.texture
			right_answer = "Ta\'"
		if rng == 3:
			$Abjad.texture = %Tsa.texture
			right_answer = "Tsa\'"
		if rng == 4:
			$Abjad.texture = %Jim.texture
			right_answer = "Jim"
	
	if self.visible == false:
		%NextBtn.disabled = false


func _on_submit_button_down():
	if $Answer.text == right_answer:
		$Correction.visible = true
		%NextBtn.disabled = false
