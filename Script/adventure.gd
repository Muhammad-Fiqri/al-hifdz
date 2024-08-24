extends Control

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
	right_answer = abjad_list[rng]
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

var right_btn_num:int
var right_btn_node:Button
func choose_right_btn():
	right_btn_num = randi_range(1,4)
	right_btn_node = get_node("Player/PlayerAnswer"+str(right_btn_num))
	right_btn_node.text = right_answer

var rng_falsify:int
var abjad_falsify:String
func generate_false_abjad():
	rng_falsify = randi_range(0,27)
	abjad_falsify = abjad_list[rng_falsify]
	if abjad_falsify == right_answer:
		generate_false_abjad()
	return abjad_falsify

func falsify_wrong_btn():
	for i in range(1,5):
		if i != right_btn_num:
			var btn:Button = get_node("Player/PlayerAnswer"+str(i))
			var false_abjad:String = generate_false_abjad()
			btn.text = false_abjad

func create_round():
	choose_abjad()
	choose_right_btn()
	falsify_wrong_btn()

# Called when the node enters the scene tree for the first time.
func _ready():
	create_round()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_stage():
	%EnemyHealth.max_value = 100  + (stage * 10)
	%EnemyHealth.value = 100  + (stage * 10)
	stage += 1
	%Stage.text = "Stage "+str(stage)

var base_damage:int = 10
func validate_player_answer():
	if chosen_answer == right_btn_num:
		%EnemyHealth.value -= base_damage * (stage)
	else:
		%PlayerHealth.value -= base_damage * (stage)
	
	if %PlayerHealth.value <= 0:
		$"Lose Panel".visible = true
	
	if %EnemyHealth.value <= 0:
		new_stage()
	
	create_round()

var chosen_answer:int
func _on_player_answer_1_button_down():
	chosen_answer = 1
	validate_player_answer()


func _on_player_answer_2_button_down():
	chosen_answer = 2
	validate_player_answer()


func _on_player_answer_3_button_down():
	chosen_answer = 3
	validate_player_answer()


func _on_player_answer_4_button_down():
	chosen_answer = 4
	validate_player_answer()
