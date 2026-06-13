extends Node2D
var lista_comandos = {'cd':1,'cd .':2,'cd ..':3,'cd ~':4,'cp':5,'rm':5,
'ls':6, 'mkdir':7,'pwd':8,'touch':9}


 #COMANDOS para CERRAR TERMINAL
var clear = {"clear":1, "cls":1}
#VARIABLE PUNTOS (cuando se utilizan "lista_comandos" AUMENTA)
var puntos: int
#Variable ficheros 
var lista_carpetas = ["home"]
var jerarquia_carpetas = {"home":0 , "Documents":1, "Desktop":1, "Download":1, "a":2,"e":3}
var fichero = "~\\home>"
var optimizacion = [1,2,3]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	optimizacion2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	optimizacion2()
	$Label.text =$Button2.text


func _on_button_3_pressed() -> void:
	optimizacion2()
	$Label.text =$Button3.text

func _on_button_1_pressed() -> void:
	optimizacion2()
	$Label.text =$Button1.text
	
func optimizacion2():
	for i in optimizacion :
		get_node("Button"+str(i)).text= str(lista_comandos.find_key(randi_range(1,8)))
	
