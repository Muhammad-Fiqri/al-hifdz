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
		
		var rng = randi_range(6,10)
		
		if rng == 6:
			$Abjad.texture = %Ha.texture
			right_answer = "Ha'"
		if rng == 7:
			$Abjad.texture = %Kho.texture
			right_answer = "Kho\'"
		if rng == 8:
			$Abjad.texture = %Dal.texture
			right_answer = "Dal"
		if rng == 9:
			$Abjad.texture = %Dzal.texture
			right_answer = "Dzal"
		if rng == 10:
			$Abjad.texture = %Ro.texture
			right_answer = "Ro'"
	
	if self.visible == false:
		%NextBtn.disabled = false


func _on_submit_button_down():
	if $Answer.text == right_answer:
		$Correction.visible = true
		%NextBtn.disabled = false
