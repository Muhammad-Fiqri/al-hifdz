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
		
		var rng = randi_range(24,28)
		
		if rng == 24:
			$Abjad.texture = %Tho.texture
			right_answer = "Tho'"
		if rng == 25:
			$Abjad.texture = %Zho.texture
			right_answer = "Zho'"
		if rng == 27:
			$Abjad.texture = %Ain.texture
			right_answer = "'Ain"
		if rng == 28:
			$Abjad.texture = %Ghain.texture
			right_answer = "Ghain"
		if rng == 29:
			$Abjad.texture = %Fa.texture
			right_answer = "Fa'"
	
	if self.visible == false:
		%NextBtn.disabled = false


func _on_submit_button_down():
	if $Answer.text == right_answer:
		$Correction.visible = true
		%NextBtn.disabled = false
