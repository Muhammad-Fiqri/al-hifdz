extends Control

var elapsed_time:int = 0
var stage:int = 1
@onready var alif = preload("res://Assets/alif.png")
@onready var ba = preload("res://Assets/ba.png")
@onready var ta = preload("res://Assets/ta.png")
@onready var tsa = preload("res://Assets/tsa.png")
@onready var jim = preload("res://Assets/jim.png")
@onready var ha = preload("res://Assets/ha.png")
@onready var kho = preload("res://Assets/kho'.png")
@onready var dal = preload("res://Assets/dal.png")
@onready var dzal = preload("res://Assets/dzal.png")
@onready var ro = preload("res://Assets/ro'.png")
@onready var zay = preload("res://Assets/zay.png")
@onready var sin = preload("res://Assets/sin.png")
@onready var syin = preload("res://Assets/syin.png")
@onready var shod = preload("res://Assets/shod.png")
@onready var dhod = preload("res://Assets/dhod.png")
@onready var tho = preload("res://Assets/tho'.png")
@onready var zho = preload("res://Assets/zho'.png")
@onready var ain = preload("res://Assets/ain.png")
@onready var ghain = preload("res://Assets/ghain.png")
@onready var fa = preload("res://Assets/fa'.png")
@onready var qof = preload("res://Assets/qof.png")
@onready var kaf = preload("res://Assets/kaf.png")
@onready var lam = preload("res://Assets/lam.png")
@onready var mim = preload("res://Assets/mim.png")
@onready var nun = preload("res://Assets/nun.png")
@onready var waw = preload("res://Assets/waw.png")
@onready var haa = preload("res://Assets/ha'.png")
@onready var ya = preload("res://Assets/ya.png")
var abjad_list:Array = ["Alif","Ba'","Ta'","Tsa'","Jim","Ha'","Kho'","Dal","Dzal","Ro'","Zay","Sin","Syin","Shod","Dhod","Tho'","Zho'","'Ain","Ghain","Fa'","Qof","Kaf","Lam","Mim","Nun","Waw","Haa","Ya'"]
@onready var abjad_count:int = abjad_list.size()
var right_answer:String
var rng:int

func choose_abjad():
	rng = randi_range(0,abjad_count-1)
	right_answer = abjad_list.pop_at(rng)
	match right_answer:
		"Alif":
			%AbjadTexture.texture = alif
		"Ba'":
			%AbjadTexture.texture = ba
		"Ta'":
			%AbjadTexture.texture = ta
		"Tsa'":
			%AbjadTexture.texture = tsa
		"Jim":
			%AbjadTexture.texture = jim
		"Ha'":
			%AbjadTexture.texture = ha
		"Kho'":
			%AbjadTexture.texture = kho
		"Dal":
			%AbjadTexture.texture = dal
		"Dzal":
			%AbjadTexture.texture = dzal
		"Ro'":
			%AbjadTexture.texture = ro
		"Zay":
			%AbjadTexture.texture = zay
		"Sin":
			%AbjadTexture.texture = sin
		"Syin":
			%AbjadTexture.texture = syin
		"Shod":
			%AbjadTexture.texture = shod
		"Dhod":
			%AbjadTexture.texture = dhod
		"Tho'":
			%AbjadTexture.texture = tho
		"Zho'":
			%AbjadTexture.texture = zho
		"'Ain":
			%AbjadTexture.texture = ain
		"Ghain":
			%AbjadTexture.texture = ghain
		"Fa'":
			%AbjadTexture.texture = fa
		"Qof":
			%AbjadTexture.texture = qof
		"Kaf":
			%AbjadTexture.texture = kaf
		"Lam":
			%AbjadTexture.texture = lam
		"Mim":
			%AbjadTexture.texture = mim
		"Nun":
			%AbjadTexture.texture = nun
		"Waw":
			%AbjadTexture.texture = waw
		"Haa":
			%AbjadTexture.texture = haa
		"Ya'":
			%AbjadTexture.texture = ya
	
	abjad_count = abjad_list.size()

# Called when the node enters the scene tree for the first time.
func _ready():
	choose_abjad()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	elapsed_time += 1
	%TimerLabel.text = str(elapsed_time)

func next_stage():
	if stage < 28:
		stage += 1
		%Stage.text = "Stage "+str(stage)+"/28"
		choose_abjad()
	else:
		print("you win")

func _on_submit_button_down():
	if %Answer.text == right_answer:
		next_stage()
