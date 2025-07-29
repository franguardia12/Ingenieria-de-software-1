!classDefinition: #StackTest category: #'Stack-Preludio'!
TestCase subclass: #StackTest
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Preludio'!

!StackTest methodsFor: 'tests' stamp: 'F12 4/13/2025 23:01:37'!
test01StackShouldBeEmptyWhenCreated
	
	self assert: stack isEmpty
	! !

!StackTest methodsFor: 'tests' stamp: 'F12 4/14/2025 00:44:44'!
test02StackCanAddElement
	
	stack push: 1.
	
	self assert: (stack getLastElement) equals: 1! !

!StackTest methodsFor: 'tests' stamp: 'F12 4/14/2025 00:37:51'!
test03StackCantRemoveElementIfEmpty
	
	[ stack pop. 
	self fail ]
		on: Error
		do: [ :anError | 
				self assert: Stack cantRemoveAnElementIfEmptyErrorDescription = anError messageText  ]
	
		
	
	! !

!StackTest methodsFor: 'tests' stamp: 'F12 4/13/2025 23:28:39'!
test04StackCanRemoveElementIfNotEmpty

	stack push: 1.
	
	self assert: stack pop equals: 1! !

!StackTest methodsFor: 'tests' stamp: 'F12 4/14/2025 00:17:02'!
test05StackReturnsLastElementOnPop

	stack push: 1.
	
	self assert: stack pop equals: 1.
	self assert: stack isEmpty ! !

!StackTest methodsFor: 'tests' stamp: 'F12 4/14/2025 00:18:07'!
test06StackHasLIFOStructure

	stack push: 1.
	stack push: 2.
	
	self assert: stack pop equals: 2! !

!StackTest methodsFor: 'tests' stamp: 'F12 4/14/2025 00:20:15'!
test07StackReturnsLastElementWithoutRemovingIt

	stack push: 1.
	
	self assert: stack getLastElement equals: 1.
	self deny: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'F12 4/14/2025 00:43:06'!
test08StackCantReturnLastElementIfEmpty

	[ stack getLastElement. 
	self fail ]
		on: Error
		do: [ :anError |
				self assert: Stack cantSeeLastElementIfEmptyErrorDescription = anError messageText ]
! !


!StackTest methodsFor: 'setup' stamp: 'F12 4/13/2025 23:01:26'!
setUp

	stack := Stack new.

! !


!classDefinition: #Stack category: #'Stack-Preludio'!
Object subclass: #Stack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Preludio'!

!Stack methodsFor: 'operations' stamp: 'F12 4/14/2025 00:42:32'!
getLastElement

	(elements size = 0) ifTrue: [ ^self signalStackCantReturnLastElementIfEmpty ].

	^elements at: elements size! !

!Stack methodsFor: 'operations' stamp: 'ER 4/11/2025 20:21:20'!
isEmpty

	^elements isEmpty! !

!Stack methodsFor: 'operations' stamp: 'F12 4/14/2025 00:36:33'!
pop

	(elements size = 0) ifTrue: [ ^self signalStackCantRemoveElementIfEmpty ].
	
	^elements removeLast! !

!Stack methodsFor: 'operations' stamp: 'ER 4/11/2025 20:23:07'!
push: anElement

	elements addLast: anElement! !


!Stack methodsFor: 'initialization' stamp: 'ER 4/11/2025 20:18:59'!
initialize

	elements := OrderedCollection new! !


!Stack methodsFor: 'stack management' stamp: 'F12 4/14/2025 00:35:46'!
signalStackCantRemoveElementIfEmpty

	self error: self class cantRemoveAnElementIfEmptyErrorDescription ! !

!Stack methodsFor: 'stack management' stamp: 'F12 4/14/2025 00:41:58'!
signalStackCantReturnLastElementIfEmpty

	self error: self class cantSeeLastElementIfEmptyErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: #'Stack-Preludio'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'error descriptions' stamp: 'F12 4/13/2025 23:10:05'!
cantRemoveAnElementIfEmptyErrorDescription

	^'No se puede remover un elemento si el Stack esta vacio'! !

!Stack class methodsFor: 'error descriptions' stamp: 'F12 4/14/2025 00:23:39'!
cantSeeLastElementIfEmptyErrorDescription

	^'No se puede ver el ultimo elemento si el Stack esta vacio'! !
