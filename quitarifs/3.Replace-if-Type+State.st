!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed state'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'ER 4/1/2025 20:29:50'!
initialize

	state := VehicleStateOff new.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'Franco Guardia 4/1/2025 11:23:51'!
accelerate

	self subclassResponsibility.! !


!Vehicle methodsFor: 'on/off' stamp: 'Franco Guardia 4/3/2025 11:41:07'!
turnOff

	self initialize! !

!Vehicle methodsFor: 'on/off' stamp: 'ER 4/1/2025 20:30:44'!
turnOn

	state := VehicleStateOn new.! !


!Vehicle methodsFor: 'error messages' stamp: 'Franco Guardia 4/1/2025 11:38:04'!
canNotAccelerateErrorMessage

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'3.Replace-if-Type+State'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'Franco Guardia 4/1/2025 14:32:13'!
helicopter

	^Helicopter new initialize.! !

!Vehicle class methodsFor: 'instance creation' stamp: 'Franco Guardia 4/1/2025 11:20:55'!
motorcycle

	^Motorcycle new.! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'move' stamp: 'ER 4/1/2025 20:47:37'!
accelerate

	state accelerate: self.! !

!Helicopter methodsFor: 'move' stamp: 'ER 4/1/2025 20:39:46'!
incrementVelocity

	speed := speed + 10 * kilometer/hour.
	altitude := altitude + 5 * meter.! !


!Helicopter methodsFor: 'initialization' stamp: 'ER 4/1/2025 20:39:04'!
initialize
	super initialize.
	
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'error messages' stamp: 'Franco Guardia 4/3/2025 11:33:48'!
canNotAccelerateErrorMessage

	^self error: 'Can not fly when turned off'! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'move' stamp: 'ER 4/1/2025 20:47:49'!
accelerate

	state accelerate: self.! !

!Motorcycle methodsFor: 'move' stamp: 'Franco Guardia 4/3/2025 11:24:05'!
incrementVelocity

	speed := speed + 20 * kilometer/hour.! !


!Motorcycle methodsFor: 'error messages' stamp: 'Franco Guardia 4/3/2025 11:35:48'!
canNotAccelerateErrorMessage
	^self error: 'Can not accelerate when turned off'! !


!classDefinition: #VehicleState category: #'3.Replace-if-Type+State'!
Object subclass: #VehicleState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!


!classDefinition: #VehicleStateOff category: #'3.Replace-if-Type+State'!
VehicleState subclass: #VehicleStateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!VehicleStateOff methodsFor: 'move' stamp: 'ER 4/1/2025 20:42:21'!
accelerate: aVehicle
	aVehicle canNotAccelerateErrorMessage ! !


!classDefinition: #VehicleStateOn category: #'3.Replace-if-Type+State'!
VehicleState subclass: #VehicleStateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!VehicleStateOn methodsFor: 'move' stamp: 'ER 4/1/2025 20:40:32'!
accelerate: aVehicle
	aVehicle incrementVelocity.! !
