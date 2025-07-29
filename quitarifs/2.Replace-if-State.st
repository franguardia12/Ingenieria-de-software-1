!classDefinition: #Automobil category: #'2.Replace-if-State'!
Object subclass: #Automobil
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobil methodsFor: 'initialization' stamp: 'ER 4/1/2025 20:04:53'!
initialize

	state := AutomobilStateOff new.
	speed := 0 * kilometer / hour.! !


!Automobil methodsFor: 'move' stamp: 'ER 4/1/2025 20:16:50'!
accelerate

	state accelerate: self.
! !

!Automobil methodsFor: 'move' stamp: 'Franco Guardia 4/3/2025 10:51:36'!
errorCanNotAccelerateWhenTurnedOff

	^self error: 'Can not accelerate when turned off'! !

!Automobil methodsFor: 'move' stamp: 'Franco Guardia 4/3/2025 10:47:34'!
incrementVelocity

	speed := speed + (10 * kilometer / hour)! !

!Automobil methodsFor: 'move' stamp: 'Franco Guardia 4/3/2025 10:59:48'!
turnOff
	
	self initialize! !

!Automobil methodsFor: 'move' stamp: 'ER 4/1/2025 20:08:39'!
turnOn

	state := AutomobilStateOn new.! !


!classDefinition: #AutomobilState category: #'2.Replace-if-State'!
Object subclass: #AutomobilState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!


!classDefinition: #AutomobilStateOff category: #'2.Replace-if-State'!
AutomobilState subclass: #AutomobilStateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobilStateOff methodsFor: 'move' stamp: 'Franco Guardia 4/3/2025 10:55:00'!
accelerate: unAutomobil
	
	unAutomobil errorCanNotAccelerateWhenTurnedOff.! !


!classDefinition: #AutomobilStateOn category: #'2.Replace-if-State'!
AutomobilState subclass: #AutomobilStateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobilStateOn methodsFor: 'move' stamp: 'Franco Guardia 4/3/2025 10:54:46'!
accelerate: unAutomobil

	unAutomobil incrementVelocity.! !
