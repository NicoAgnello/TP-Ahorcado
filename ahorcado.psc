Proceso ahorcado
	Definir palabra_a_descubrir,vector_palabra Como Caracter
	Definir largo_palabra, posicion Como Entero
	
	
	Escribir "Jugador 1 --> Ingrese una palabra: "
	Leer palabra_a_descubrir
	
	Escribir palabra_a_descubrir
	palabra_a_descubrir = Mayusculas(SACAR_ESPACIOST(palabra_a_descubrir))
	largo_palabra = Longitud(palabra_a_descubrir)
	Dimensionar vector_palabra(largo_palabra)
	DeTextoAVector(palabra_a_descubrir, vector_palabra)
	Esperar Tecla
	Borrar Pantalla
	
	Para posicion = 1 hasta largo_palabra Hacer
		Escribir vector_palabra(posicion) + " -"
	FinPara
	
	
	
	
	
FinProceso













////  funciones generales

SubProceso  texto_retorno = ALINEARN(un_numero,cantidad,justificado)
	definir texto_retorno Como Caracter
	texto_retorno = ALINEAR(ConvertirATexto(un_numero),cantidad,justificado)
FinSubProceso


SubProceso  texto_retorno = ALINEAR(un_texto,cantidad,justificado)
	/// ALINEAR recibe como parámetros un texto, la cantidad de caracteres 
	/// del ancho con que tiene que devolver el texto y  la opción que se 
	/// selecciona para la alineación (D-derecha I -Izquierda C -Centrado) 
	/// Retorna el texto alineado dependiendo de la opción seleccionada 
	/// y con el ancho del parametro CANTIDAD
	definir largo, cant_espacios, espacios_derecha, espacios_izquierda Como Entero
	definir texto_retorno Como Caracter
	un_texto = SACAR_ESPACIOS(un_texto,"A")
    largo=Longitud(un_texto)
	cant_espacios=cantidad-largo
	
	justificado=Mayusculas(justificado)
	segun justificado Hacer
		"D": espacios_izquierda = cant_espacios
			espacios_derecha=0
		"I": espacios_derecha = cant_espacios
			espacios_izquierda =0
		"C": espacios_derecha = trunc(cant_espacios / 2)
			espacios_izquierda = cant_espacios - espacios_derecha
	FinSegun
	texto_retorno=Repetir_texto(" ",espacios_izquierda) + un_texto +  Repetir_texto(" ",espacios_derecha)
FinSubProceso



SubProceso  texto_retorno = SACAR_ESPACIOS(oracion,de_donde)
	/// SACARESPACIOS la misma tiene como propósito que se le pasen como 
	///parámetros un texto y la opción que se selecciona 
	/// para sacar los espacios (D-derecha I -Izquierda A -Ambos lados) y tiene 
	///que devolver el texto sin los espacios dependiendo de la opción seleccionada.
	Definir texto_retorno Como Caracter
	Definir posicion, largo, inicio,final, todos_espacios como entero
	de_donde = Mayusculas(de_donde)
	largo=Longitud(oracion)
	inicio=1
	final=largo
	todos_espacios=1    /// El valor 1 es que tiene todos espacios 
	si de_donde="I" o de_donde="A"
		para posicion=1 Hasta largo Con Paso 1 Hacer
			si Subcadena(oracion,posicion,posicion)<> " "
				inicio=posicion
				posicion=largo   /// para salir (break)
				todos_espacios=0   /// el valor 0 es que no son todos espacios
			FinSi
		FinPara
	FinSi
	si de_donde="D"o de_donde="A"
		para posicion=largo Hasta 1 Con Paso -1 Hacer
			si Subcadena(oracion,posicion,posicion)<> " "
				final=posicion
				posicion=1   /// para salir (break)
				todos_espacios=0 /// el valor 0 es que no son todos espacios
			FinSi
		FinPara
	FinSi
	si todos_espacios=1   /// si la cadena tieno solo espacios devuelve nulo
		texto_retorno=""
	SiNo
		texto_retorno=Subcadena(oracion,inicio,final)
	FinSi
FinsubProceso

SubProceso texto_sin_espacios = SACAR_ESPACIOST(oracion)
	Definir  posicion, largo Como Entero
	Definir texto_sin_espacios Como Caracter
	largo = Longitud(oracion)
	texto_sin_espacios = ""
	Para posicion = 1 Hasta largo
		Si Subcadena(oracion, posicion, posicion) <> " "
			texto_sin_espacios = texto_sin_espacios + Subcadena(oracion, posicion, posicion)
		FinSi
	FinPara
FinSubProceso


SubProceso texto_concatenado=Repetir_texto(un_texto,repeticiones)
	definir texto_concatenado Como Caracter
	definir contador Como Entero
	texto_concatenado=""
	para contador=1 hasta repeticiones Con Paso 1 Hacer
		texto_concatenado=texto_concatenado + un_texto
	FinPara
FinSubProceso

SubProceso posicion_encontro=busquedaEnCadena(una_cadena,texto_a_buscar)
	definir posicion,largo_cadena, largo_texto Como Entero
	definir posicion_encontro  Como Entero
	definir porcion_cadena Como Caracter
	largo_cadena=Longitud(una_cadena)
	largo_texto = Longitud(texto_a_buscar)
	posicion_encontro=0  /// por defecto pongo cero que es que no lo encontró
	para posicion=1 Hasta largo_cadena-largo_texto+1 Con Paso 1 Hacer
		porcion_cadena = Subcadena(una_cadena,posicion,posicion+largo_texto-1)
		Escribir "posicion: ", posicion
		Escribir "porcion_cadena: ", porcion_cadena,"|"
		Esperar Tecla
		si Mayusculas(porcion_cadena) = Mayusculas(texto_a_buscar)
			/// encontro el texto en la cadena necesito sacar la posicion
			posicion_encontro = posicion
			posicion=largo_cadena /// para salir del para (break)
		FinSi
	FinPara
FinSubProceso

SubProceso DeTextoAVector(un_texto,vector)
	definir largo,posicion como entero
	largo=Longitud(un_texto)    /// cantidad de caracteres del texto
	para posicion=1 Hasta largo Con Paso 1 Hacer
		vector(posicion)= Subcadena(un_texto,posicion,posicion)
	FinPara
FinSubProceso


SubProceso mostrarMatriz(matriz,cant_filas,cant_columnas)
	definir fila,colu Como Entero
	Escribir "   " Sin Saltar
	para colu=1 Hasta cant_columnas Con Paso 1 Hacer
		Escribir "  ",colu,"  " Sin Saltar
	FinPara
	Escribir ""
	para fila=1 Hasta cant_filas Con Paso 1 Hacer
		Escribir fila,"- " Sin Saltar
		para colu=1 Hasta cant_columnas Con Paso 1 Hacer
			escribir matriz(fila,colu) ,"  " Sin Saltar
		FinPara
		Escribir ""
	FinPara
FinSubProceso



SubProceso resultado=VALIDA_FECHA(dia,mes,anio)
	definir resultado Como Logico
	definir cant_dias Como Entero
	/// busca la cantidad de dias de un mes de un año determinado
	cant_dias=DIAS_MES(mes,anio)
	
	si (mes >=1 y mes <=12) y (dia >= 1 y dia<= cant_dias) Entonces
		resultado = Verdadero
	SiNo
		resultado = Falso
	FinSi
	
FinSubProceso

SubProceso cant_dias=DIAS_MES(mes,anio)
	Definir cant_dias como entero
	
	/// busca la cantidad de dias de un mes de un año determinado
	Segun mes Hacer
		1,3,5,7,8,10,12: 
			cant_dias = 31
		2:
			SI ANIO_BISIESTO(anio)
				cant_dias = 29
			SiNo
				cant_dias = 28
			FinSi
		De Otro Modo:	
			cant_dias = 30
	FinSegun
	
	
FinSubProceso

SubProceso es_bisiesto=ANIO_BISIESTO(anio)
	definir es_bisiesto Como Logico
	SI (anio mod 4 =0) y (anio mod 100 <> 0) o (anio mod 400 =0) Entonces 
		/// es bisiesto
		es_bisiesto = Verdadero
	SINO
		/// no es bisiesto
		es_bisiesto = Falso
	FinSi
FinSubProceso

	