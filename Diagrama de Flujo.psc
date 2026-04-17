Algoritmo Plataforma_Logistica
	// Definición de variables
	Definir opcion, rol, viaje_creado, viaje_enviado, viaje_iniciado Como Entero
	Definir folio Como Entero
	Definir salir_app, cerrar_sesion Como Logico
	Definir destino, operador, horarioideal Como Cadena
	
	// Inicialización
	folio <- 0
	salir_app <- Falso
	
	Mientras salir_app = Falso Hacer
		cerrar_sesion <- Falso
		Escribir 'Bienvenido a la Plataforma'
		Escribir '1. Iniciar Sesion'
		Escribir '2. Registrarse'
		Escribir '3. Cerrar Aplicacion'
		Leer opcion
		
		Si opcion = 2 Entonces
			Escribir 'Registro enviado, esperando autorizacion del Supervisor...'
			Escribir 'Supervisor da de alta y asigna rol (Operador/Admin)'
			Escribir 'Clave enviada por correo'
		FinSi
		
		Si opcion = 1 Entonces
			Escribir 'Ingrese usuario y contraseña'
			Escribir 'Seleccione su rol: 1. Admin, 2. Operador, 3. Supervisor'
			Leer rol
			
			Mientras cerrar_sesion = Falso Hacer
				Segun rol Hacer
					1: // ROL ADMINISTRADOR
						Escribir '--- Opciones de Administrador ---'
						Escribir '1. Revisar Bitacoras (Autorizar/Rechazar)'
						Escribir '2. Crear Viaje'
						Escribir '3. Liquidar Bitacoras'
						Escribir '4. Autorizar/Rechazar Anticipos'
						Escribir '5. Cerrar Sesion'
						Leer opcion
						
						Si opcion = 2 Entonces
							folio <- folio + 1
							Escribir 'Ingrese destino:'
							Leer destino
							Escribir 'Seleccione operador:'
							Leer operador
							Escribir 'Ingrese horario ideal de llegada:'
							Leer horarioideal
							viaje_creado <- 1
							viaje_enviado <- 2
							viaje_iniciado <- 0
							Escribir 'Viaje creado con folio: ', folio
						FinSi
						
						Si opcion = 5 Entonces
							cerrar_sesion <- Verdadero
						FinSi
						
					2: // ROL OPERADOR
						Escribir '--- Opciones de Operador ---'
						Escribir '1. Iniciar Bitacora (si hay viaje en curso)'
						Escribir '2. Enviar/Editar/Eliminar Bitacora'
						Escribir '3. Ver motivo de rechazo'
						Escribir '4. Cerrar Sesion'
						Leer opcion
						
						Si opcion = 1 Entonces
							Si viaje_enviado = 2 Entonces
								viaje_iniciado <- 1
								Escribir 'Bitacora iniciada para viaje folio: ', folio
							SiNo
								Escribir 'No hay viajes disponibles'
							FinSi
						FinSi
						
						Si opcion = 2 Entonces
							Escribir 'Nota: Bitacoras aceptadas y enviadas no se pueden modificar ni borrar'
						FinSi
						
						Si opcion = 4 Entonces
							cerrar_sesion <- Verdadero
						FinSi
						
					3: // ROL SUPERVISOR
						Escribir '--- Opciones de Supervisor ---'
						Escribir '1. Dar de alta usuarios'
						Escribir '2. Enviar claves por correo'
						Escribir '3. Asignar rol (Operador/Admin)'
						Escribir '4. Cerrar Sesion'
						Leer opcion
						
						Escribir 'Supervisor ejecuta accion seleccionada'
						
						Si opcion = 4 Entonces
							cerrar_sesion <- Verdadero
						FinSi
						
					De Otro Modo:
						Escribir "Rol no valido"
						cerrar_sesion <- Verdadero
				FinSegun
			FinMientras
		FinSi
		
		Si opcion = 3 Entonces
			salir_app <- Verdadero
			Escribir 'Aplicación cerrada'
		FinSi
		
	FinMientras
	
FinAlgoritmo