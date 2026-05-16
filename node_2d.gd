extends Node2D

var texto : String
var veces :int
var lista_comandos = ['cd','cd .']
var clear = ["clear", "cls"]
var puntos: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Label3").text = str(puntos)
	if Input.is_action_just_pressed("ui_accept"):
		
		texto = str($LineEdit.text)
		#Presionar boton fisico
		cmd_base()
	
	if puntos <0:
		puntos = 0


func _on_button_pressed() -> void:
	#Presionar boton virtual
	cmd_base()
func cmd_base():
		if $LineEdit.text in lista_comandos and not $LineEdit.text in clear:
			llenar_cmd()
			sumar_puntos()
		elif $LineEdit.text in clear:
			sumar_puntos()
			vaciar_cmd("")
		else:
			restar_puntos()
			input_invalido()
		vaciar_input()
func sumar_puntos():
	puntos = puntos +1
func restar_puntos():
	puntos = puntos -1
func vaciar_input():
	$LineEdit.text = ""
func llenar_cmd():
	$Label.text =str($Label.text) + "\n" +str($LineEdit.text)
func vaciar_cmd(a):
		get_node("Label").text = ""+a
		veces = 0
func input_invalido():
	$Label.text =str($Label.text) + "\n"+"'" +str($LineEdit.text)+"' command is invalid"
func _on_label_resized() -> void:
	
	if veces <= 18:
		veces = veces + 1
		print(veces)
	else:
		validar_comando()
		veces = 0
		
func validar_comando():
	if texto in lista_comandos:
		vaciar_cmd(texto)
	else:
		vaciar_cmd("'"+texto+"' command is invalid")
