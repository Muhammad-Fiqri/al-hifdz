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
		
		var rng = randi_range(12,16)
		
		if rng == 12:
			$Abjad.texture = %Zay.texture
			right_answer = "Zay"
		if rng == 13:
			$Abjad.texture = %Sin.texture
			right_answer = "Sin"
		if rng == 14:
			$Abjad.texture = %Syin.texture
			right_answer = "Syin"
		if rng == 15:
			$Abjad.texture = %Shod.texture
			right_answer = "Shod"
		if rng == 16:
			$Abjad.texture = %Dhod.texture
			right_answer = "Dhod"
	
	if self.visible == false:
		%NextBtn.disabled = false


func _on_submit_button_down():
	if $Answer.text == right_answer:
		$Correction.visible = true
		%NextBtn.disabled = false
