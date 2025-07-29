!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'Franco Guardia 4/3/2025 11:56:56'!
initialize

	speed := 0 * kilometer / hour.
	
	! !


!Vehicle methodsFor: 'move' stamp: 'Franco Guardia 3/30/2025 22:49:48'!
accelerate

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'1.Replace-if-Type'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'Franco Guardia 4/3/2025 11:58:53'!
helicopter

	^Helicopter new initialize.! !

!Vehicle class methodsFor: 'instance creation' stamp: 'Franco Guardia 3/30/2025 22:50:43'!
motorcycle

	^Motorcycle new.! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'move' stamp: 'Franco Guardia 3/30/2025 22:43:19'!
accelerate
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)! !


!Helicopter methodsFor: 'initialization' stamp: 'Franco Guardia 4/3/2025 11:57:53'!
initialize
	super initialize.
	altitude := 0 * meter.! !


!classDefinition: #Motorcycle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Motorcycle methodsFor: 'move' stamp: 'Franco Guardia 3/30/2025 22:43:34'!
accelerate
	speed := speed + (20 * kilometer / hour)! !
