!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/27/2025 08:40:58'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
		
	self assert: (self verificarQueLaOperacion: [ customerBook addCustomerNamed: 'John Lennon'] dureMenosQue: 50).
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/27/2025 08:44:43'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  	
	self assert: (self verificarQueLaOperacion: [ customerBook removeCustomerNamed: paulMcCartney ]  dureMenosQue: 100).
		
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/24/2025 21:00:44'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self devolverError: Error
		cuandoSeEvalua:  [ customerBook addCustomerNamed: ''. ]
		yEjecutar: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: (self verificarCantidadDeCustomers: customerBook igualA: 0).  ].

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/24/2025 21:05:16'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self devolverError: NotFound
		cuandoSeEvalua: [ customerBook removeCustomerNamed: 'Paul McCartney' ]
		yEjecutar:  [ :anError | 
			self assert: (self verificarCantidadDeCustomers: customerBook igualA: 1).
			self assert: (self verificarCustomerExistente: johnLennon en: customerBook) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/27/2025 09:05:43'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: (self evaluarCondiciones: [ ([ (self verificarCantidadDeCustomersActivos: customerBook igualA: 0) ] value and: [ (self verificarCantidadDeCustomersSuspendidos: customerBook igualA: 1) ] value and: [ (self verificarCantidadDeCustomers: customerBook igualA: 1) ] value and: [ (self verificarCustomerExistente: paulMcCartney en: customerBook) ] value) ]).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/27/2025 09:43:40'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: (self evaluarCondiciones: [ [ (self verificarCantidadDeCustomersActivos: customerBook igualA: 0) ] value and: [ (self verificarCantidadDeCustomersSuspendidos: customerBook igualA: 0) ] value and: [ (self verificarCantidadDeCustomers: customerBook igualA: 0) ] value and: [ (self verificarCustomerExistente: paulMcCartney en: customerBook) ] value not ]).



	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/27/2025 10:02:57'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self devolverError: CantSuspend
		cuandoSeEvalua: [ customerBook suspendCustomerNamed: 'Ringo Starr' ]
		yEjecutar: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon). ].

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/27/2025 10:10:28'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self devolverError: CantSuspend
		cuandoSeEvalua: [ customerBook suspendCustomerNamed: johnLennon ]
		yEjecutar: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Franco Guardia 3/27/2025 08:42:32'!
verificarQueLaOperacion: aClosure dureMenosQue: unTiempo
	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^(millisecondsAfterRunning  - millisecondsBeforeRunning) < (unTiempo * millisecond).! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'Franco Guardia 3/24/2025 20:58:28'!
devolverError: unError cuandoSeEvalua: closureConOperacion yEjecutar: closureConValidaciones
	[ closureConOperacion value.
		self fail ]
			on: unError
			do: closureConValidaciones.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'Franco Guardia 3/27/2025 09:03:53'!
evaluarCondiciones: unBloqueDeCondiciones
	^unBloqueDeCondiciones value.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'Franco Guardia 3/23/2025 22:26:59'!
verificarCantidadDeCustomers: aCustomerBook igualA: cantidad
	(cantidad = 0) ifTrue: [^aCustomerBook isEmpty ].
	^aCustomerBook numberOfCustomers = cantidad.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'Franco Guardia 3/23/2025 23:23:37'!
verificarCantidadDeCustomersActivos: aCustomerBook igualA: cantidad
	^aCustomerBook numberOfActiveCustomers = cantidad.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'Franco Guardia 3/23/2025 23:25:53'!
verificarCantidadDeCustomersSuspendidos: aCustomerBook igualA: cantidad
	^aCustomerBook numberOfSuspendedCustomers = cantidad.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'Franco Guardia 3/23/2025 20:16:04'!
verificarCustomerExistente: aCustomer en: aCustomerBook
	^aCustomerBook includesCustomerNamed: aCustomer.! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'Franco Guardia 3/23/2025 19:29:44'!
includesActiveCustomerNamed: aName
	^active includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'Franco Guardia 3/23/2025 19:32:42'!
includesCustomerNamed: aName

	^(self includesActiveCustomerNamed: aName) or: [ self includesSuspendedCustomerNamed: aName]! !

!CustomerBook methodsFor: 'testing' stamp: 'Franco Guardia 3/23/2025 19:30:43'!
includesSuspendedCustomerNamed: aName
	^suspended includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Franco Guardia 3/23/2025 19:33:08'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Franco Guardia 3/23/2025 19:25:24'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Franco Guardia 3/27/2025 10:43:21'!
removeCustomerNamed: aName 
	((self buscarCustomer: aName en: active) = aName) ifTrue: [ ^aName ].
	((self buscarCustomer: aName en: suspended) = aName) ifTrue: [ ^aName ].
	^ NotFound signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Franco Guardia 3/23/2025 19:33:28'!
suspendCustomerNamed: aName 
	
	(self includesActiveCustomerNamed: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'Franco Guardia 3/27/2025 10:46:37'!
buscarCustomer: aName en: aCollection
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName 
			] 
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
