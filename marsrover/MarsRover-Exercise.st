!classDefinition: #MarsRoverTest category: #'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRoverMirandoASur marsRoverMirandoANorte marsRoverMirandoAEste marsRoverMirandoAOeste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 22:46:02'!
setUp
	
	marsRoverMirandoASur := MarsRover crearEn: 0@0 yApuntandoHacia: 'S'.
	marsRoverMirandoANorte := MarsRover crearEn: 0@0 yApuntandoHacia: 'N'.
	marsRoverMirandoAEste := MarsRover crearEn: 0@0 yApuntandoHacia: 'E'.
	marsRoverMirandoAOeste := MarsRover crearEn: 0@0 yApuntandoHacia: 'O'.
	
	
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:44:25'!
test01MarsRoverSeMantieneEnElMismoLugarSiRecibeComunicacionVacia

	marsRoverMirandoANorte recibir: ''.
	
	self assert: (self verificar: marsRoverMirandoANorte SeEncuentraEn: 0@0 ApuntandoHacia: 'N')
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:44:48'!
test02MarsRoverAvanzaSiComienzaApuntandoAlNorte
	
	marsRoverMirandoANorte recibir: 'f'.
	
	self assert: (self verificar: marsRoverMirandoANorte SeEncuentraEn: 0@1 ApuntandoHacia: 'N')

	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:45:32'!
test03MarsRoverAvanzaSiComienzaApuntandoAlSur
	
	marsRoverMirandoASur recibir: 'f'.
	
	self assert: (self verificar: marsRoverMirandoASur SeEncuentraEn: 0@-1 ApuntandoHacia: 'S')

	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:45:55'!
test04MarsRoverAvanzaSiComienzaApuntandoAlEste
	
	marsRoverMirandoAEste recibir: 'f'.
	
	self assert: (self verificar: marsRoverMirandoAEste SeEncuentraEn: 1@0 ApuntandoHacia: 'E')

	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:46:23'!
test05MarsRoverAvanzaSiComienzaApuntandoAlOeste
	
	marsRoverMirandoAOeste recibir: 'f'.
	
	self assert: (self verificar: marsRoverMirandoAOeste SeEncuentraEn: -1@0 ApuntandoHacia: 'O')
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:46:49'!
test06MarsRoverRetrocedeSiComienzaApuntandoAlNorte
	
	marsRoverMirandoANorte recibir: 'b'.
	
	self assert: (self verificar: marsRoverMirandoANorte SeEncuentraEn: 0@-1 ApuntandoHacia: 'N')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:47:13'!
test07MarsRoverRetrocedeSiComienzaApuntandoAlSur
	
	marsRoverMirandoASur recibir: 'b'.
	
	self assert: (self verificar: marsRoverMirandoASur SeEncuentraEn: 0@1 ApuntandoHacia: 'S')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:47:44'!
test08MarsRoverRetrocedeSiComienzaApuntandoAlEste
	
	marsRoverMirandoAEste recibir: 'b'.
	
	self assert: (self verificar: marsRoverMirandoAEste SeEncuentraEn: -1@0 ApuntandoHacia: 'E')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:48:14'!
test09MarsRoverRetrocedeSiComienzaApuntandoAlOeste
	
	marsRoverMirandoAOeste recibir: 'b'.
	
	self assert: (self verificar: marsRoverMirandoAOeste SeEncuentraEn: 1@0 ApuntandoHacia: 'O')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:48:40'!
test10MarsRoverGiraALaIzquierdaYApuntaAlOEsteSiComienzaEnElNorte
	
	marsRoverMirandoANorte recibir: 'l'.
	
	self assert: (self verificar: marsRoverMirandoANorte SeEncuentraEn: 0@0 ApuntandoHacia: 'O')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:49:07'!
test11MarsRoverGiraALaIzquierdaYApuntaAlSurSiComienzaEnElOeste
	
	marsRoverMirandoAOeste recibir: 'l'.
	
	self assert: (self verificar: marsRoverMirandoAOeste SeEncuentraEn: 0@0 ApuntandoHacia: 'S')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:49:36'!
test12MarsRoverGiraALaIzquierdaYApuntaAlEsteSiComienzaEnElSur
	
	marsRoverMirandoASur recibir: 'l'.
	
	self assert: (self verificar: marsRoverMirandoASur SeEncuentraEn: 0@0 ApuntandoHacia: 'E')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:50:12'!
test13MarsRoverGiraALaIzquierdaYApuntaAlNorteSiComienzaEnElEste
	
	marsRoverMirandoAEste recibir: 'l'.
	
	self assert: (self verificar: marsRoverMirandoAEste SeEncuentraEn: 0@0 ApuntandoHacia: 'N')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:50:35'!
test14MarsRoverGiraALaDerechaYApuntaAlEsteSiComienzaEnElNorte
	
	marsRoverMirandoANorte recibir: 'r'.
	
	self assert: (self verificar: marsRoverMirandoANorte SeEncuentraEn: 0@0 ApuntandoHacia: 'E')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:50:59'!
test15MarsRoverGiraALaDerechaYApuntaAlSurSiComienzaEnElEste
	
	marsRoverMirandoAEste recibir: 'r'.
	
	self assert: (self verificar: marsRoverMirandoAEste SeEncuentraEn: 0@0 ApuntandoHacia: 'S')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:51:27'!
test16MarsRoverGiraALaDerechaYApuntaAlOesteSiComienzaEnElSur
	
	marsRoverMirandoASur recibir: 'r'.
	
	self assert: (self verificar: marsRoverMirandoASur SeEncuentraEn: 0@0 ApuntandoHacia: 'O')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:51:52'!
test17MarsRoverGiraALaDerechaYApuntaAlNorteSiComienzaEnElOeste
	
	marsRoverMirandoAOeste recibir: 'r'.
	
	self assert: (self verificar: marsRoverMirandoAOeste SeEncuentraEn: 0@0 ApuntandoHacia: 'N')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:52:16'!
test18MarsRoverProcesaNComandosValidosCorrectamente
	
	marsRoverMirandoANorte recibir: 'rffllff'.
	
	self assert: (self verificar: marsRoverMirandoANorte SeEncuentraEn: 0@0 ApuntandoHacia: 'O')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:52:50'!
test19MarsRoverNoPuedeProcesarComandosInvalidos
	
	self should: [ marsRoverMirandoANorte recibir: 'rffxlff' ] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: 'Se ha ingresado un comando no valido' ].

	
	self assert: (self verificar: marsRoverMirandoANorte SeEncuentraEn: 2@0 ApuntandoHacia: 'E')

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'F12 5/6/2025 23:43:17'!
verificar: marsRover SeEncuentraEn: unaPosicion ApuntandoHacia: unPuntoCardinal

	^(marsRover seEncuentraEn: unaPosicion) and: (marsRover estaApuntandoHacia: unPuntoCardinal)! !


!classDefinition: #DireccionDeMarsRover category: #'MarsRover-Exercise'!
Object subclass: #DireccionDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!DireccionDeMarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:53:40'!
avanzarPosicionDe: marsRover

	self subclassResponsibility.! !

!DireccionDeMarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:53:47'!
retrocederPosicionDe: marsRover

	self subclassResponsibility.! !

!DireccionDeMarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:53:55'!
rotarADerechaPosicionDe: marsRover

	self subclassResponsibility.! !

!DireccionDeMarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:54:00'!
rotarAIzquierdaPosicionDe: marsRover

	self subclassResponsibility.! !


!DireccionDeMarsRover methodsFor: 'accesing' stamp: 'F12 5/4/2025 22:02:10'!
obtenerPuntoCardinal

	self subclassResponsibility.! !


!classDefinition: #MarsRoverApuntandoHaciaElEste category: #'MarsRover-Exercise'!
DireccionDeMarsRover subclass: #MarsRoverApuntandoHaciaElEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverApuntandoHaciaElEste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:49:52'!
avanzarPosicionDe: marsRover

	marsRover moverHaciaLaDerecha ! !

!MarsRoverApuntandoHaciaElEste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:50:05'!
retrocederPosicionDe: marsRover

	marsRover moverHaciaLaIzquierda ! !

!MarsRoverApuntandoHaciaElEste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:50:34'!
rotarADerechaPosicionDe: marsRover

	marsRover rotarHaciaElSur ! !

!MarsRoverApuntandoHaciaElEste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:50:43'!
rotarAIzquierdaPosicionDe: marsRover

	marsRover rotarHaciaElNorte ! !


!MarsRoverApuntandoHaciaElEste methodsFor: 'accesing' stamp: 'F12 5/4/2025 22:02:28'!
obtenerPuntoCardinal

	^'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverApuntandoHaciaElEste class' category: #'MarsRover-Exercise'!
MarsRoverApuntandoHaciaElEste class
	instanceVariableNames: ''!

!MarsRoverApuntandoHaciaElEste class methodsFor: 'testing' stamp: 'F12 5/4/2025 20:39:40'!
puedeCrearseEnDireccion: unaDireccion

	^unaDireccion = 'E'! !


!classDefinition: #MarsRoverApuntandoHaciaElNorte category: #'MarsRover-Exercise'!
DireccionDeMarsRover subclass: #MarsRoverApuntandoHaciaElNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverApuntandoHaciaElNorte methodsFor: 'updating' stamp: 'F12 5/4/2025 21:42:13'!
avanzarPosicionDe: marsRover

	marsRover moverHaciaArriba ! !

!MarsRoverApuntandoHaciaElNorte methodsFor: 'updating' stamp: 'F12 5/4/2025 21:42:26'!
retrocederPosicionDe: marsRover

	marsRover moverHaciaAbajo ! !

!MarsRoverApuntandoHaciaElNorte methodsFor: 'updating' stamp: 'F12 5/4/2025 21:48:04'!
rotarADerechaPosicionDe: marsRover

	marsRover rotarHaciaElEste ! !

!MarsRoverApuntandoHaciaElNorte methodsFor: 'updating' stamp: 'F12 5/4/2025 21:48:16'!
rotarAIzquierdaPosicionDe: marsRover

	marsRover rotarHaciaElOeste ! !


!MarsRoverApuntandoHaciaElNorte methodsFor: 'accesing' stamp: 'F12 5/4/2025 22:01:40'!
obtenerPuntoCardinal

	^'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverApuntandoHaciaElNorte class' category: #'MarsRover-Exercise'!
MarsRoverApuntandoHaciaElNorte class
	instanceVariableNames: ''!

!MarsRoverApuntandoHaciaElNorte class methodsFor: 'testing' stamp: 'F12 5/4/2025 20:39:56'!
puedeCrearseEnDireccion: unaDireccion

	^unaDireccion = 'N'! !


!classDefinition: #MarsRoverApuntandoHaciaElOeste category: #'MarsRover-Exercise'!
DireccionDeMarsRover subclass: #MarsRoverApuntandoHaciaElOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverApuntandoHaciaElOeste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:48:41'!
avanzarPosicionDe: marsRover

	marsRover moverHaciaLaIzquierda ! !

!MarsRoverApuntandoHaciaElOeste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:48:53'!
retrocederPosicionDe: marsRover

	marsRover moverHaciaLaDerecha ! !

!MarsRoverApuntandoHaciaElOeste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:49:21'!
rotarADerechaPosicionDe: marsRover

	marsRover rotarHaciaElNorte ! !

!MarsRoverApuntandoHaciaElOeste methodsFor: 'updating' stamp: 'F12 5/4/2025 21:49:33'!
rotarAIzquierdaPosicionDe: marsRover

	marsRover rotarHaciaElSur ! !


!MarsRoverApuntandoHaciaElOeste methodsFor: 'accesing' stamp: 'F12 5/4/2025 22:01:52'!
obtenerPuntoCardinal

	^'O'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverApuntandoHaciaElOeste class' category: #'MarsRover-Exercise'!
MarsRoverApuntandoHaciaElOeste class
	instanceVariableNames: ''!

!MarsRoverApuntandoHaciaElOeste class methodsFor: 'testing' stamp: 'F12 5/4/2025 20:40:11'!
puedeCrearseEnDireccion: unaDireccion

	^unaDireccion = 'O'! !


!classDefinition: #MarsRoverApuntandoHaciaElSur category: #'MarsRover-Exercise'!
DireccionDeMarsRover subclass: #MarsRoverApuntandoHaciaElSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverApuntandoHaciaElSur methodsFor: 'accessing' stamp: 'F12 5/4/2025 21:59:48'!
obtenerPuntoCardinal

	^'S'! !


!MarsRoverApuntandoHaciaElSur methodsFor: 'updating' stamp: 'F12 5/4/2025 21:51:04'!
avanzarPosicionDe: marsRover

	marsRover moverHaciaAbajo ! !

!MarsRoverApuntandoHaciaElSur methodsFor: 'updating' stamp: 'F12 5/4/2025 21:51:14'!
retrocederPosicionDe: marsRover

	marsRover moverHaciaArriba ! !

!MarsRoverApuntandoHaciaElSur methodsFor: 'updating' stamp: 'F12 5/4/2025 21:51:29'!
rotarADerechaPosicionDe: marsRover

	marsRover rotarHaciaElOeste ! !

!MarsRoverApuntandoHaciaElSur methodsFor: 'updating' stamp: 'F12 5/4/2025 21:51:42'!
rotarAIzquierdaPosicionDe: marsRover

	marsRover rotarHaciaElEste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverApuntandoHaciaElSur class' category: #'MarsRover-Exercise'!
MarsRoverApuntandoHaciaElSur class
	instanceVariableNames: ''!

!MarsRoverApuntandoHaciaElSur class methodsFor: 'testing' stamp: 'F12 5/4/2025 20:40:27'!
puedeCrearseEnDireccion: unaDireccion

	^unaDireccion = 'S'! !


!classDefinition: #MarsRover category: #'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual direccionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'initialization' stamp: 'F12 5/6/2025 22:14:36'!
inicializarEn: posicionInicial yApuntandoHacia: puntoCardinalInicial 
	
	posicionActual := posicionInicial.
	direccionActual := puntoCardinalInicial new.
! !


!MarsRover methodsFor: 'evaluating' stamp: 'F12 5/6/2025 20:23:24'!
estaApuntandoHacia: unPuntoCardinal 
	
	^unPuntoCardinal = (direccionActual obtenerPuntoCardinal)! !

!MarsRover methodsFor: 'evaluating' stamp: 'F12 5/6/2025 22:15:11'!
recibir: unConjuntoDeComandos
	
	| comandosValidos |
	
	comandosValidos := {$f. $b. $l. $r. }.
	

	1 to: unConjuntoDeComandos size do: [ :index |
		
		(comandosValidos includes: (unConjuntoDeComandos at: index)) ifFalse: [ ^self error: self class noSePuedenProcesarComandosInvalidosMensajeDeError ].
		
		((unConjuntoDeComandos at: index) = $f) ifTrue: [ 
		
			direccionActual avanzarPosicionDe: self
		
		].

		((unConjuntoDeComandos at: index) = $b) ifTrue: [ 
			
			direccionActual retrocederPosicionDe: self
			
		].

		((unConjuntoDeComandos at: index) = $l) ifTrue: [ 
			
			direccionActual rotarAIzquierdaPosicionDe: self
			
		].

		((unConjuntoDeComandos at: index) = $r) ifTrue: [ 
			
			direccionActual rotarADerechaPosicionDe: self
			
		] 	
			
	]



	
	! !

!MarsRover methodsFor: 'evaluating' stamp: 'F12 5/6/2025 20:21:30'!
seEncuentraEn: unaPosicion
	
	^unaPosicion = posicionActual ! !



!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 20:50:04'!
moverHaciaAbajo

	posicionActual := Point x: (posicionActual x) y: (posicionActual y) - 1! !

!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 20:46:06'!
moverHaciaArriba

	posicionActual := Point x: (posicionActual x) y: (posicionActual y) + 1! !

!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 20:51:18'!
moverHaciaLaDerecha

	posicionActual := Point x: (posicionActual x) + 1 y: (posicionActual y) ! !

!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 20:51:27'!
moverHaciaLaIzquierda

	posicionActual := Point x: (posicionActual x) - 1 y: (posicionActual y) ! !

!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:46:51'!
rotarHaciaElEste

	direccionActual := MarsRoverApuntandoHaciaElEste new.! !

!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:46:34'!
rotarHaciaElNorte

	direccionActual := MarsRoverApuntandoHaciaElNorte new.! !

!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:46:59'!
rotarHaciaElOeste

	direccionActual := MarsRoverApuntandoHaciaElOeste new.! !

!MarsRover methodsFor: 'updating' stamp: 'F12 5/4/2025 21:46:43'!
rotarHaciaElSur

	direccionActual := MarsRoverApuntandoHaciaElSur new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'F12 5/4/2025 22:03:40'!
crearEn: posicionInicial yApuntandoHacia: puntoCardinalInicial 


	DireccionDeMarsRover subclasses asOrderedCollection detect: [ :unaClase | unaClase puedeCrearseEnDireccion: puntoCardinalInicial ]
			ifFound: [ :claseAInstanciar | ^self new inicializarEn: posicionInicial yApuntandoHacia: claseAInstanciar ]
			ifNone: [ ^Error signal ].
! !


!MarsRover class methodsFor: 'error handling' stamp: 'F12 5/6/2025 22:21:19'!
noSePuedenProcesarComandosInvalidosMensajeDeError

	^'Se ha ingresado un comando no valido'! !
