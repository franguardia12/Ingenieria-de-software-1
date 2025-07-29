!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:25:03'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := Vehicle electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:27:17'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:20'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := Vehicle electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:16'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := Vehicle gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:11'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Vehicle helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:47:14'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:05'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := Vehicle electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:53:50'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := Vehicle gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:55:32'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Vehicle helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed altitude engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'Franco Guardia 4/4/2025 14:23:09'!
initialize

	state := VehicleStateOff new.
	speed := 0 * kilometer / hour.
	! !


!Vehicle methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:21:48'!
accelerate

	self subclassResponsibility.! !

!Vehicle methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:19:08'!
altitudeAt: anAltitude

	self subclassResponsibility.! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'Franco Guardia 4/3/2025 14:21:38'!
turnOff

	state := VehicleStateOff new.
! !

!Vehicle methodsFor: 'on/off' stamp: 'Franco Guardia 4/3/2025 14:21:03'!
turnOn

	state := VehicleStateOn new.! !


!Vehicle methodsFor: 'error messages' stamp: 'Franco Guardia 4/3/2025 14:19:42'!
canNotAccelerateErrorMessage

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'Franco Guardia 4/4/2025 14:16:55'!
electricMotorcycle

	^ Motorcycle new initializeWithEngineType: VehicleElectricEngine andSurroundings: VehicleCitySurroundings

! !

!Vehicle class methodsFor: 'instance creation' stamp: 'Franco Guardia 4/4/2025 14:16:12'!
gasolineMotorcycle

	^Motorcycle new initializeWithEngineType: VehicleGasolineEngine andSurroundings: VehicleOpenRoadSurroundings! !

!Vehicle class methodsFor: 'instance creation' stamp: 'Franco Guardia 4/4/2025 11:04:57'!
helicopter

	^ Helicopter new initialize.! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'acceleration'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'error messages' stamp: 'Franco Guardia 4/4/2025 14:30:25'!
canNotAccelerateErrorMessage
	^self error: 'Can not fly when turned off'! !


!Helicopter methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:00:37'!
accelerate
	state accelerate: self with: speed and: engineType.
	! !

!Helicopter methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:45:34'!
altitudeAt: anAltitude
	^ altitude = anAltitude! !

!Helicopter methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 13:50:38'!
incrementVelocitywith: anAcceleration
	speed := speed + anAcceleration.
	altitude := altitude + (5 * meter).
	where accelerate: self with: speed.
! !

!Helicopter methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 11:20:14'!
limitVelocity: aVelocity
	speed := aVelocity.
	! !


!Helicopter methodsFor: 'initialization' stamp: 'Franco Guardia 4/4/2025 10:43:55'!
initialize
	super initialize.
	altitude := 0 * meter.
	engineType := VehicleJetFueledEngine new.
	where := VehicleSkiesSurroundings new.! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: 'acceleration'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'error messages' stamp: 'Franco Guardia 4/4/2025 14:29:46'!
canNotAccelerateErrorMessage
	^self error: 'Can not run when turned off'! !


!Motorcycle methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:10:58'!
accelerate
	state accelerate: self with: speed and: engineType.
! !

!Motorcycle methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:12:21'!
incrementVelocitywith: anAcceleration
	speed := speed + anAcceleration.
	where accelerate: self with: speed.! !

!Motorcycle methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:13:15'!
limitVelocity: aVelocity
	speed := aVelocity! !


!Motorcycle methodsFor: 'initialization' stamp: 'Franco Guardia 4/4/2025 11:44:56'!
initializeWithEngineType: anEngineType andSurroundings: surroundings
	super initialize.
	engineType := anEngineType new.
	where := surroundings new.! !


!classDefinition: #VehicleEngine category: #'4.Replace-if-Strategy'!
Object subclass: #VehicleEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #VehicleElectricEngine category: #'4.Replace-if-Strategy'!
VehicleEngine subclass: #VehicleElectricEngine
	instanceVariableNames: 'acceleration'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleElectricEngine methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 13:45:51'!
accelerate: aVehicle with: aVelocity
	acceleration := (aVelocity + (5 * kilometer / hour)) * 2.
	aVehicle incrementVelocitywith: acceleration.
	! !


!classDefinition: #VehicleGasolineEngine category: #'4.Replace-if-Strategy'!
VehicleEngine subclass: #VehicleGasolineEngine
	instanceVariableNames: 'acceleration'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleGasolineEngine methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 13:46:51'!
accelerate: aVehicle with: aVelocity
	acceleration := 10 * kilometer / hour.
	aVehicle incrementVelocitywith: acceleration.! !


!classDefinition: #VehicleJetFueledEngine category: #'4.Replace-if-Strategy'!
VehicleEngine subclass: #VehicleJetFueledEngine
	instanceVariableNames: 'acceleration'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleJetFueledEngine methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 13:47:59'!
accelerate: aVehicle with: aVelocity
	acceleration := ((aVelocity amount + 1) ^ 2) * kilometer / hour.
	aVehicle incrementVelocitywith: acceleration.! !


!classDefinition: #VehicleState category: #'4.Replace-if-Strategy'!
Object subclass: #VehicleState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #VehicleStateOff category: #'4.Replace-if-Strategy'!
VehicleState subclass: #VehicleStateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleStateOff methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 13:59:47'!
accelerate: aVehicle with: aVelocity and: anEngine
	aVehicle canNotAccelerateErrorMessage.! !


!classDefinition: #VehicleStateOn category: #'4.Replace-if-Strategy'!
VehicleState subclass: #VehicleStateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleStateOn methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 14:01:50'!
accelerate: aVehicle with: aVelocity and: anEngine
	anEngine accelerate: aVehicle with: aVelocity.! !


!classDefinition: #VehicleSurroundings category: #'4.Replace-if-Strategy'!
Object subclass: #VehicleSurroundings
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #VehicleCitySurroundings category: #'4.Replace-if-Strategy'!
VehicleSurroundings subclass: #VehicleCitySurroundings
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleCitySurroundings methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 11:28:42'!
accelerate: aVehicle with: aVelocity
	aVehicle limitVelocity: (aVelocity min: 70 * kilometer / hour).
! !


!classDefinition: #VehicleOpenRoadSurroundings category: #'4.Replace-if-Strategy'!
VehicleSurroundings subclass: #VehicleOpenRoadSurroundings
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleOpenRoadSurroundings methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 11:32:27'!
accelerate: aVehicle with: aVelocity
	aVehicle limitVelocity: (aVelocity min: 130 * kilometer / hour).
! !


!classDefinition: #VehicleSkiesSurroundings category: #'4.Replace-if-Strategy'!
VehicleSurroundings subclass: #VehicleSkiesSurroundings
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleSkiesSurroundings methodsFor: 'move' stamp: 'Franco Guardia 4/4/2025 11:24:09'!
accelerate: aVehicle with: aVelocity
	aVehicle limitVelocity: (aVelocity min: 500 * kilometer / hour).
! !
