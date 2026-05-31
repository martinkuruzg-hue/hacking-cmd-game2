extends Node2D

var texto : String
var veces :int
#lista para comandos CORRECTOS que SUMAN PUNTOS
var lista_comandos = ['cd','cd .']
 #COMANDOS para CERRAR TERMINAL
var clear = ["clear", "cls"]
#VARIABLE PUNTOS (cuando se utilizan "lista_comandos" AUMENTA)
var puntos: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#LABEL DE PUNTOS (Indicador de puntaje en PANTALLA)
	get_node("Label3").text = str(puntos)
	if Input.is_action_just_pressed("ui_accept"):
		cmd_base()
	
	if puntos <0:
		puntos = 0

#BOTÓN ENTER (Para Celular)
func _on_button_pressed() -> void:
	#Ejecuta funcion base del juego
	cmd_base()
#FUNCION BASE (Reutilizable para Enter)
func cmd_base():
		#SI EL COMANDO DE LA ENTRADA DE TEXTO
		#ESTA EN LA LISTA DE COMANDOS CORRECTOS
		if $LineEdit.text in lista_comandos and not $LineEdit.text in clear:
			#ENVIA EL COMANDO ESCRITO AL TERMINAL
			llenar_cmd()
			#SUMA PUNTOS (deberia variar segun dificultad de comando)
			sumar_puntos()
			
		#SI es un comando para CERRAR TERMINAL
		elif $LineEdit.text in clear:
			#SUMA PUNTOS (deberia ser 1)
			sumar_puntos()
			#VACIA TERMINAL
			vaciar_cmd()
		#SI es COMANDO INCORRECTO X
		else:
			#RESTA 1 PUNTO
			restar_puntos()
			#ACTIVA FUNCION DE COMANDO INCORRECTO Y
			#           MANDA MENSAJE DE ERROR
			input_invalido()
		
		#SE VACIA/LIMPIA LA ENTRADA PARA
		# ESCRIBIR OTRO COMANDO
		vaciar_input()
#SUMA con LISTA_COMANDOS (COMANDOS CORRECTOS)
func sumar_puntos():
	#A futuro que cambie la suma segun dificultad
	puntos = puntos +1
#RESTA con COMANDOS INCORRECTOS (-1 punto siempre)
func restar_puntos():
	puntos = puntos -1
#FUNCION para VACIAR LA ENTRADA DE TEXTO
func vaciar_input():
	$LineEdit.text = ""
#ENVIA el texto del INPUT al TERMINAL
func llenar_cmd():
	$Label.text =str($Label.text) + "\n" +str($LineEdit.text)
#VACIA TERMINAL cuando se LLENA
func vaciar_cmd():
	get_node("Label").text = ""
	veces = 0
#CONCATENA mensaje de error , con comando fuera 
# de lista_comandos
func input_invalido():
	$Label.text =str($Label.text) + "\n"+"'" +str($LineEdit.text)+"' command is invalid"
#REINICIA TERMINAL CUANDO SE LLENA
func _on_label_resized() -> void:
	#TERMINAL acepta MAXIMO 18 FILAS
	if veces <= 18:
		veces = veces + 1
		print(veces)
	#CUANDO SUPERA LAS 18 FILAS
	else:
		#REINICIA RECUENTO A 0
		veces = 0
		#LIMPIA TERMINAL
		get_node("Label").text =""
