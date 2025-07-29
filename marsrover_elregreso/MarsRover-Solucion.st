!classDefinition: #MarsRoverRegisterFollowingTest category: #'MarsRover-Solucion'!
TestCase subclass: #MarsRoverRegisterFollowingTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!


!classDefinition: #MarsRoverLogRegisterTest category: #'MarsRover-Solucion'!
MarsRoverRegisterFollowingTest subclass: #MarsRoverLogRegisterTest
	instanceVariableNames: 'correctResponse changeFollowers marsRover logRegisterTrackingPosition logRegisterTrackingDirection logRegisterTrackingDirectionAndPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:03'!
assertThatMarsRoverafterProcessing: aStringOfCommands hasAReportOf: aLogRegister equalsTo: aCorrectResponse	

	changeFollowers add: aLogRegister.

	marsRover addFollowers: changeFollowers.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (aLogRegister report) equals: aCorrectResponse ! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:31:04'!
assertThatTheReportOf: aLogRegister equals: aCorrectResponse
	
	self assert: (aLogRegister report) equals: aCorrectResponse ! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:55:57'!
setUp

	logRegisterTrackingPosition := MarsRoverLogRegister tracking: #Position.
	logRegisterTrackingDirection := MarsRoverLogRegister tracking: #Direction.
	logRegisterTrackingDirectionAndPosition := MarsRoverLogRegister tracking: #DirectionAndPosition.
	correctResponse := OrderedCollection new.
	changeFollowers := OrderedCollection new.
	marsRover := MarsRover startingAt: 0@0 heading: #North! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:09'!
test01LogRegisterForChangesOfPositionTrackingIsEmptyIfMarsRoverDidNotDoAnyMovement
	self assertThatTheReportOf: logRegisterTrackingPosition equals: correctResponse
	
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:14'!
test02LogRegisterForChangesOfDirectionTrackingIsEmptyIfMarsRoverDidNotDoAnyMovement
	self assertThatTheReportOf: logRegisterTrackingDirection equals: correctResponse! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:18'!
test03LogRegisterForChangesOfDirectionAndPositionTrackingIsEmptyIfMarsRoverDidNotDoAnyMovement
	self assertThatTheReportOf: logRegisterTrackingDirectionAndPosition equals: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:25'!
test04LogRegisterForChangesOfPositionHasAChangeIfMarsRoverChangedHisPosition
	correctResponse add: 0@1.
	
	self assertThatMarsRoverafterProcessing: 'f' hasAReportOf: logRegisterTrackingPosition equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:31'!
test05LogRegisterForChangesOfDirectionHasAChangeIfMarsRoverChangedHisDirection
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'r' hasAReportOf: logRegisterTrackingDirection equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:38'!
test06LogRegisterForChangesOfDirectionAndPositionHasOneChangeIfMarsRoverOnlyChangedHisDirection
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'r' hasAReportOf: logRegisterTrackingDirectionAndPosition equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:45'!
test07LogRegisterForChangesOfDirectionAndPositionHasOneChangeIfMarsRoverOnlyChangedHisPosition
	correctResponse add: 0@1.
	
	self assertThatMarsRoverafterProcessing: 'f' hasAReportOf: logRegisterTrackingDirectionAndPosition equalsTo: correctResponse
	
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:53'!
test08LogRegisterForChangesOfDirectionAndPositionHasBothChangesIfMarsRoverChangedHisDirectionAndHisPosition
	correctResponse add: 0@1.
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'fr' hasAReportOf: logRegisterTrackingDirectionAndPosition equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:56:57'!
test09LogRegisterForChangesOfDirectionIsEmptyIfMarsRoverOnlyChangedHisPosition
	self assertThatMarsRoverafterProcessing: 'f' hasAReportOf: logRegisterTrackingDirection equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:57:02'!
test10LogRegisterForChangesOfPositionIsEmptyIfMarsRoverOnlyChangedHisDirection
	self assertThatMarsRoverafterProcessing: 'r' hasAReportOf: logRegisterTrackingPosition equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:57:11'!
test11LogRegisterForChangesOfPositionHasTwoChangesIfMarsRoverChangedHisPositionTwice
	correctResponse add: 0@1.
	correctResponse add: 0@0.
	
	self assertThatMarsRoverafterProcessing: 'fb' hasAReportOf: logRegisterTrackingPosition equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:57:33'!
test12LogRegisterForChangesOfDirectionHasTwoChangesIfMarsRoverChangedHisDirectionTwice
	correctResponse add: 'E'.
	correctResponse add: 'N'.
	
	self assertThatMarsRoverafterProcessing: 'rl' hasAReportOf: logRegisterTrackingDirection equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:57:42'!
test13LogRegisterForChangesOfPositionHasOnlyThePositionChangesOfTheMarsRoverChanges
	correctResponse add: 0@1.
	correctResponse add: 0@2.
	correctResponse add: 1@2.
	correctResponse add: 1@1.
	
	self assertThatMarsRoverafterProcessing: 'fflblf' hasAReportOf: logRegisterTrackingPosition equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:57:51'!
test14LogRegisterForChangesOfDirectionHasOnlyTheDirectionChangesOfTheMarsRoverChanges
	correctResponse add: 'W'.
	correctResponse add: 'S'.
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'fflblfl' hasAReportOf: logRegisterTrackingDirection equalsTo: correctResponse
	! !

!MarsRoverLogRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:58:04'!
test15LogRegisterForChangesOfDirectionHasOnlyTheDirectionChangesOfTheMarsRoverChanges

	correctResponse add: 0@1.
	correctResponse add: 'W'.
	correctResponse add: 1@1.
	correctResponse add: 'S'.
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'flbll' hasAReportOf: logRegisterTrackingDirectionAndPosition equalsTo: correctResponse
	! !


!classDefinition: #MarsRoverWindowRegisterTest category: #'MarsRover-Solucion'!
MarsRoverRegisterFollowingTest subclass: #MarsRoverWindowRegisterTest
	instanceVariableNames: 'windowRegisterTrackingPosition windowRegisterTrackingDirection windowRegisterTrackingDirectionAndPosition correctResponse changeFollowers marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:13:33'!
assertThatMarsRoverafterProcessing: aStringOfCommands hasAReportOf: aWindowRegister equalsTo: aCorrectResponse	

	changeFollowers add: aWindowRegister.

	marsRover addFollowers: changeFollowers.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (aWindowRegister report) equals: aCorrectResponse 
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:13:41'!
assertThatTheReportOf: aWindowRegister equals: aCorrectResponse
	
	self assert: (aWindowRegister report) equals: aCorrectResponse 
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:13:11'!
setUp

	windowRegisterTrackingPosition := MarsRoverWindowRegister tracking: #Position.
	windowRegisterTrackingDirection := MarsRoverWindowRegister tracking: #Direction.
	windowRegisterTrackingDirectionAndPosition := MarsRoverWindowRegister tracking: #DirectionAndPosition.
	correctResponse := OrderedCollection new.
	changeFollowers := OrderedCollection new.
	marsRover := MarsRover startingAt: 0@0 heading: #North
	! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:13:21'!
test01WindowRegisterForPositionIsEmptyIfTheMarsRoverDidNotMove
	self assertThatTheReportOf: windowRegisterTrackingPosition equals: correctResponse
	
	
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:13:26'!
test02WindowRegisterForDirectionIsEmptyIfTheMarsRoverDidNotMove
	self assertThatTheReportOf: windowRegisterTrackingDirection equals: correctResponse

	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:13:48'!
test03WindowRegisterForDirectionAndPositionIsEmptyIfTheMarsRoverDidNotMove
	self assertThatTheReportOf: windowRegisterTrackingDirectionAndPosition equals: correctResponse

	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:13:56'!
test04WindowRegisterForDirectionHasTheLastDirectionIfTheMarsRoverChangedHisDirection
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'r' hasAReportOf: windowRegisterTrackingDirection equalsTo: correctResponse
	
! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:02'!
test05WindowRegisterForPositionHasTheLastPositionIfTheMarsRoverChangedHisPosition
	correctResponse add: 0@1.
	
	self assertThatMarsRoverafterProcessing: 'f' hasAReportOf: windowRegisterTrackingPosition equalsTo: correctResponse 
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:10'!
test06WindowRegisterForDirectionAndPositionHasTheLastDirectionAndPositionIfTheMarsRoverChangedThem
	correctResponse add: 0@1.
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'fr' hasAReportOf: windowRegisterTrackingDirectionAndPosition equalsTo: correctResponse 
	
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:18'!
test07WindowRegisterForDirectionAndPositionOnlyHasTheLastDirectionUpdatedIfTheMarsRoverOnlyChangedHisDirection
	correctResponse add: nil.
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'r' hasAReportOf: windowRegisterTrackingDirectionAndPosition equalsTo: correctResponse 
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:26'!
test08WindowRegisterForDirectionAndPositionOnlyHasTheLastPositionUpdatedIfTheMarsRoverOnlyChangedHisPosition
	correctResponse add: 0@1.
	correctResponse add: ''.
	
	self assertThatMarsRoverafterProcessing: 'f' hasAReportOf: windowRegisterTrackingDirectionAndPosition equalsTo: correctResponse ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:34'!
test09WindowRegisterForPositionHasTheLastPositionIfTheMarsRoverChangedHisPositionTwice
	correctResponse add: 0@2.
	
	self assertThatMarsRoverafterProcessing: 'ff' hasAReportOf: windowRegisterTrackingPosition equalsTo: correctResponse 
	
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:41'!
test10WindowRegisterForDirectionHasTheLastDirectionIfTheMarsRoverChangedHisDirectionTwice
	correctResponse add: 'S'.
	
	self assertThatMarsRoverafterProcessing: 'll' hasAReportOf: windowRegisterTrackingDirection equalsTo: correctResponse 
	
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:52'!
test11WindowRegisterForDirectionAndPositionHasTheLastDirectionAndPositionIfTheMarsRoverChangedBothTwice
	correctResponse add: 0@-2.
	correctResponse add: 'S'.
	
	self assertThatMarsRoverafterProcessing: 'llff' hasAReportOf: windowRegisterTrackingDirectionAndPosition equalsTo: correctResponse 
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:14:59'!
test12WindowRegisterForPositionOnlyRegisterTheLastPositionInTheMarsRoverMovement
	correctResponse add: 1@1.
	
	self assertThatMarsRoverafterProcessing: 'fflblf' hasAReportOf: windowRegisterTrackingPosition equalsTo: correctResponse ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:15:07'!
test13WindowRegisterForDirectionOnlyRegisterTheLastDirectionInTheMarsRoverMovement
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'fflblfl' hasAReportOf: windowRegisterTrackingDirection equalsTo: correctResponse 
	! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:15:14'!
test14WindowRegisterForDirectionAndPositionOnlyRegisterTheLastDirectionAndPositionInTheMarsRoverMovement
	correctResponse add: 1@1.
	correctResponse add: 'E'.
	
	self assertThatMarsRoverafterProcessing: 'fflblfl' hasAReportOf: windowRegisterTrackingDirectionAndPosition equalsTo: correctResponse
	
	 ! !

!MarsRoverWindowRegisterTest methodsFor: 'tests' stamp: 'F12 5/30/2025 12:12:52'!
test15MarsRoverWithWindowForDirectionAndPositionAndLogRegisterForDirectionAndPosition

	| marsRoverLastTest marsRoverWindowRegister marsRoverLogRegister changeFollowersCollection correctWindowRegisterResponse correctLogRegisterResponse |
	
	marsRoverWindowRegister := MarsRoverWindowRegister tracking: #DirectionAndPosition.
	marsRoverLogRegister := MarsRoverLogRegister tracking: #DirectionAndPosition.
	
	changeFollowersCollection := OrderedCollection with: marsRoverWindowRegister with: marsRoverLogRegister.
	
	marsRoverLastTest := MarsRover startingAt: 0@0 heading: #North with: changeFollowersCollection.
	correctWindowRegisterResponse := OrderedCollection with: 1@1 with: 'E'. 
	correctLogRegisterResponse := OrderedCollection with: 0@1 with: 'W' with: 1@1 with: 'S' with: 'E'.


	marsRoverLastTest processCommands: 'flbll'.
		
	self assert: (marsRoverWindowRegister report) equals: correctWindowRegisterResponse.
	self assert: (marsRoverLogRegister report) equals: correctLogRegisterResponse.
	
	 ! !


!classDefinition: #TestMarsRover category: #'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'F12 5/20/2025 20:45:20'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #MarsRover category: #'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head changePositionFollowers changeDirectionFollowers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'F12 5/30/2025 09:24:11'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	changePositionFollowers := OrderedCollection new.

	changeDirectionFollowers := OrderedCollection new.	
! !


!MarsRover methodsFor: 'process commands' stamp: 'F12 5/30/2025 08:38:17'!
processCommands: aStringWithCommands
	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.		
	].
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'F12 5/26/2025 00:03:34'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ 
		^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ 
		^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ 
		^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ 	
		^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'F12 5/30/2025 08:35:28'!
moveDown
	position := position + (0@-1).
	
	self notifyPositionFollowers  ! !

!MarsRover methodsFor: 'dd - moving' stamp: 'F12 5/30/2025 08:35:37'!
moveLeft
	position := position + (-1@0).
		
	self notifyPositionFollowers  ! !

!MarsRover methodsFor: 'dd - moving' stamp: 'F12 5/30/2025 08:35:43'!
moveRight
	position := position + (1@0).
	
	self notifyPositionFollowers.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'F12 5/30/2025 08:35:51'!
moveUp
	position := position + (0@1).
		
	self notifyPositionFollowers  ! !


!MarsRover methodsFor: 'private - following' stamp: 'F12 5/30/2025 11:24:03'!
addFollowers: aCollectionOfFollowers
	| currentFollower |

	1 to: (aCollectionOfFollowers size) do: [ :index |
		
		currentFollower := aCollectionOfFollowers at: index.
		
		(currentFollower itsPositionRegister) ifTrue: [ changePositionFollowers add: currentFollower ].
		
		(currentFollower itsDirectionRegister) ifTrue: [ changeDirectionFollowers add: currentFollower ].
		
	].
! !

!MarsRover methodsFor: 'private - following' stamp: 'F12 5/30/2025 08:36:01'!
notifyDirectionFollowers
	1 to: changeDirectionFollowers size do: [ :index |
		(changeDirectionFollowers at: index) updateDirection: (head obtainCardinalPoint )

	].! !

!MarsRover methodsFor: 'private - following' stamp: 'F12 5/30/2025 08:31:40'!
notifyPositionFollowers
	1 to: changePositionFollowers size do: [ :index |
		(changePositionFollowers at: index) updatePosition: position

	].! !


!MarsRover methodsFor: 'dd - heading' stamp: 'F12 5/30/2025 08:33:33'!
headEast
	head := MarsRoverHeadFacingEast of: self.
	
	self notifyDirectionFollowers ! !

!MarsRover methodsFor: 'dd - heading' stamp: 'F12 5/30/2025 08:33:40'!
headNorth
	head := MarsRoverHeadFacingNorth of: self.
	
	self notifyDirectionFollowers ! !

!MarsRover methodsFor: 'dd - heading' stamp: 'F12 5/30/2025 08:33:54'!
headSouth
	head := MarsRoverHeadFacingSouth of: self.
		
	self notifyDirectionFollowers ! !

!MarsRover methodsFor: 'dd - heading' stamp: 'F12 5/30/2025 08:34:05'!
headWest
	head := MarsRoverHeadFacingWest of: self.
	
	self notifyDirectionFollowers ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !

!MarsRover class methodsFor: 'instance creation' stamp: 'F12 5/26/2025 00:03:47'!
startingAt: aPosition heading: aDirection with: aCollectionOfFollowers
	
	^self new initializeStartingAt: aPosition heading: aDirection;
		addFollowers: aCollectionOfFollowers;
		yourself
		! !


!classDefinition: #MarsRoverHead category: #'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'accessing' stamp: 'F12 5/25/2025 23:12:32'!
obtainCardinalPoint

	self subclassResponsibility ! !


!MarsRoverHead methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'updating' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'updating' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !


!MarsRoverHead methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !


!MarsRoverHead methodsFor: 'initialization' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: #'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: #'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'updating' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'updating' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !


!MarsRoverHeadFacingEast methodsFor: 'accessing' stamp: 'F12 5/25/2025 23:13:00'!
obtainCardinalPoint

	^'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: #'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: #'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'updating' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'updating' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !


!MarsRoverHeadFacingNorth methodsFor: 'accessing' stamp: 'F12 5/25/2025 23:13:13'!
obtainCardinalPoint

	^'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: #'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: #'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'updating' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'updating' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !


!MarsRoverHeadFacingSouth methodsFor: 'accessing' stamp: 'F12 5/25/2025 23:13:34'!
obtainCardinalPoint

	^'S'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: #'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: #'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'updating' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'updating' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'updating' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !


!MarsRoverHeadFacingWest methodsFor: 'accessing' stamp: 'F12 5/30/2025 11:21:56'!
obtainCardinalPoint

	^'W'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: #'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverRegisterFollowing category: #'MarsRover-Solucion'!
Object subclass: #MarsRoverRegisterFollowing
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverRegisterFollowing methodsFor: 'accessing' stamp: 'F12 5/30/2025 10:30:51'!
itsDirectionRegister

	self subclassResponsibility.! !

!MarsRoverRegisterFollowing methodsFor: 'accessing' stamp: 'F12 5/30/2025 10:30:42'!
itsPositionRegister

	self subclassResponsibility.! !

!MarsRoverRegisterFollowing methodsFor: 'accessing' stamp: 'ER 5/27/2025 16:15:51'!
report

	self subclassResponsibility ! !


!MarsRoverRegisterFollowing methodsFor: 'updating' stamp: 'F12 5/30/2025 10:29:54'!
updateDirection: currentDirection

	self subclassResponsibility.! !

!MarsRoverRegisterFollowing methodsFor: 'updating' stamp: 'F12 5/30/2025 10:30:12'!
updatePosition: currentPosition

	self subclassResponsibility.! !


!classDefinition: #MarsRoverLogRegister category: #'MarsRover-Solucion'!
MarsRoverRegisterFollowing subclass: #MarsRoverLogRegister
	instanceVariableNames: 'setOfStates changeHistory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogRegister methodsFor: 'initialization' stamp: 'F12 5/30/2025 09:27:21'!
initializeTracking: statesToFollow 
	
	setOfStates := statesToFollow new.
	changeHistory := OrderedCollection new.! !


!MarsRoverLogRegister methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:26:10'!
itsDirectionRegister

	^setOfStates itsDirection! !

!MarsRoverLogRegister methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:25:58'!
itsPositionRegister

	^setOfStates itsPosition! !

!MarsRoverLogRegister methodsFor: 'accessing' stamp: 'F12 5/30/2025 08:46:33'!
report
	^changeHistory ! !


!MarsRoverLogRegister methodsFor: 'updating' stamp: 'F12 5/30/2025 09:27:06'!
updateDirection: currentDirection

	changeHistory add: currentDirection! !

!MarsRoverLogRegister methodsFor: 'updating' stamp: 'F12 5/30/2025 09:26:57'!
updatePosition: currentPosition

	changeHistory add: currentPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLogRegister class' category: #'MarsRover-Solucion'!
MarsRoverLogRegister class
	instanceVariableNames: ''!

!MarsRoverLogRegister class methodsFor: 'error messages' stamp: 'F12 5/30/2025 08:45:07'!
invalidStateToFollowErrorMessage
	^'Invalid state to follow'! !


!MarsRoverLogRegister class methodsFor: 'instance creation' stamp: 'F12 5/30/2025 08:45:15'!
tracking: aSetOfStates 
	ObserverOfState subclasses asOrderedCollection detect: [ :aClass | aClass canCreateWith: aSetOfStates ]
		ifFound: [ :aClassToCreate | ^self new initializeTracking: aClassToCreate ]
		ifNone: [ ^self error: self invalidStateToFollowErrorMessage ]
	! !


!classDefinition: #MarsRoverWindowRegister category: #'MarsRover-Solucion'!
MarsRoverRegisterFollowing subclass: #MarsRoverWindowRegister
	instanceVariableNames: 'setOfStates lastPosition lastDirection lastState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindowRegister methodsFor: 'initialization' stamp: 'F12 5/30/2025 09:29:17'!
initializeTracking: statesToFollow 
	setOfStates := statesToFollow new.
	lastPosition := nil.
	lastDirection := String new.
	
	lastState := OrderedCollection new! !


!MarsRoverWindowRegister methodsFor: 'updating' stamp: 'F12 5/30/2025 10:41:46'!
updateDirection: currentDirection

	lastDirection := currentDirection.

	lastState := OrderedCollection with: lastDirection.
	
	setOfStates updateMoreThanOneStateOf: self


	! !

!MarsRoverWindowRegister methodsFor: 'updating' stamp: 'F12 5/30/2025 10:20:51'!
updateDirectionAndPosition

	lastState := OrderedCollection with: lastPosition with: lastDirection ! !

!MarsRoverWindowRegister methodsFor: 'updating' stamp: 'F12 5/30/2025 10:41:57'!
updatePosition: currentPosition

	lastPosition := currentPosition.

	lastState := OrderedCollection with: lastPosition.
	
	setOfStates updateMoreThanOneStateOf: self

	
	! !


!MarsRoverWindowRegister methodsFor: 'accessing' stamp: 'F12 5/30/2025 10:31:29'!
itsDirectionRegister

	^setOfStates itsDirection ! !

!MarsRoverWindowRegister methodsFor: 'accessing' stamp: 'F12 5/30/2025 10:31:15'!
itsPositionRegister

	^setOfStates itsPosition ! !

!MarsRoverWindowRegister methodsFor: 'accessing' stamp: 'F12 5/30/2025 10:45:05'!
report
		
	^lastState 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWindowRegister class' category: #'MarsRover-Solucion'!
MarsRoverWindowRegister class
	instanceVariableNames: ''!

!MarsRoverWindowRegister class methodsFor: 'instance creation' stamp: 'F12 5/30/2025 08:45:38'!
tracking: aSetOfStates 
	ObserverOfState subclasses asOrderedCollection detect: [ :aClass | aClass canCreateWith: aSetOfStates ]
		ifFound: [ :aClassToCreate | ^self new initializeTracking: aClassToCreate ]
		ifNone: [ ^self error: self invalidStateToFollowErrorMessage ]
	! !


!MarsRoverWindowRegister class methodsFor: 'error messages' stamp: 'F12 5/30/2025 08:45:27'!
invalidStateToFollowErrorMessage
	^'Invalid state to follow'! !


!classDefinition: #ObserverOfState category: #'MarsRover-Solucion'!
Object subclass: #ObserverOfState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObserverOfState methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:27:12'!
itsDirection

	self subclassResponsibility! !

!ObserverOfState methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:26:49'!
itsPosition

	self subclassResponsibility! !


!ObserverOfState methodsFor: 'operations' stamp: 'F12 5/30/2025 10:21:58'!
updateMoreThanOneStateOf: aMarsRoverFollower

	self subclassResponsibility.! !


!classDefinition: #ObserverOfDirection category: #'MarsRover-Solucion'!
ObserverOfState subclass: #ObserverOfDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObserverOfDirection methodsFor: 'operations' stamp: 'F12 5/30/2025 10:22:10'!
updateMoreThanOneStateOf: aMarsRoverFollower
! !


!ObserverOfDirection methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:27:31'!
itsDirection

	^true! !

!ObserverOfDirection methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:27:40'!
itsPosition

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObserverOfDirection class' category: #'MarsRover-Solucion'!
ObserverOfDirection class
	instanceVariableNames: ''!

!ObserverOfDirection class methodsFor: 'testing' stamp: 'F12 5/30/2025 09:16:48'!
canCreateWith: aStateToFollow
	^aStateToFollow = #Direction! !


!classDefinition: #ObserverOfDirectionAndPosition category: #'MarsRover-Solucion'!
ObserverOfState subclass: #ObserverOfDirectionAndPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObserverOfDirectionAndPosition methodsFor: 'operations' stamp: 'F12 5/30/2025 10:22:33'!
updateMoreThanOneStateOf: aMarsRoverFollower

	aMarsRoverFollower updateDirectionAndPosition ! !


!ObserverOfDirectionAndPosition methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:27:57'!
itsDirection

	^true! !

!ObserverOfDirectionAndPosition methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:28:01'!
itsPosition

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObserverOfDirectionAndPosition class' category: #'MarsRover-Solucion'!
ObserverOfDirectionAndPosition class
	instanceVariableNames: ''!

!ObserverOfDirectionAndPosition class methodsFor: 'testing' stamp: 'F12 5/30/2025 09:17:23'!
canCreateWith: aStateToFollow
	^aStateToFollow = #DirectionAndPosition! !


!classDefinition: #ObserverOfPosition category: #'MarsRover-Solucion'!
ObserverOfState subclass: #ObserverOfPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObserverOfPosition methodsFor: 'operations' stamp: 'F12 5/30/2025 10:22:17'!
updateMoreThanOneStateOf: aMarsRoverFollower
! !


!ObserverOfPosition methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:28:17'!
itsDirection

	^false! !

!ObserverOfPosition methodsFor: 'accessing' stamp: 'ER 5/27/2025 20:28:24'!
itsPosition

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObserverOfPosition class' category: #'MarsRover-Solucion'!
ObserverOfPosition class
	instanceVariableNames: ''!

!ObserverOfPosition class methodsFor: 'testing' stamp: 'F12 5/30/2025 09:17:58'!
canCreateWith: aStateToFollow
	^aStateToFollow = #Position! !
