!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'ER 4/15/2025 13:28:54'!
test03PopRemovesElementsFromTheStack
	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'ER 4/15/2025 13:46:35'!
test04PopReturnsLastPushedObject
	| stack pushedObject |	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'ER 4/15/2025 17:25:46'!
test06TopReturnsLastPushedObject

	| stack pushedObject |	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'ER 4/17/2025 12:01:50'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	self
	
		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
		! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'ER 4/17/2025 13:40:10'!
test01prefixCanNotBeEmpty
	
	| stack browser |
	
	stack := OOStack new.
	
	browser := SentenceFinderByPrefix new.
	
	self 
		should: [ browser find: '' inTheElementsOf: stack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix canNotUseAnEmptyPrefixErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'ER 4/17/2025 13:40:42'!
test02prefixIsCaseSensitive

	| stack browser matches |
	
	stack := OOStack new.
	
	browser := SentenceFinderByPrefix new.
	
	stack push: 'winter'.
	
	matches := browser find: 'Winter' inTheElementsOf: stack.
	
	self assert: matches size equals: 0.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'F12 4/18/2025 16:11:55'!
test03prefixHasNoBlankSpaces

	| stack browser |
	
	stack := OOStack new.
	
	browser := SentenceFinderByPrefix new.
	
	self 
		should: [ browser find: 'winter is coming' inTheElementsOf: stack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix canNotUseBlankSpacesOnPrefixErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'ER 4/17/2025 16:24:19'!
test04originalStackKeepsItsOriginalItems

	| stack browser originalStackSize|
	
	stack := OOStack new.
	
	browser := SentenceFinderByPrefix new.
	
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	originalStackSize := stack size.
	
	browser find: 'Wint' inTheElementsOf: stack.
	
	self assert: stack size equals: originalStackSize.
	self assert: stack pop equals: 'Winter is here'.
	self assert: stack pop equals: 'The winds of Winter'.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'F12 4/18/2025 15:50:50'!
test05StackReturnsElementsWithAValidPrefix

	| stack browser matches |
	
	stack := OOStack new.
	
	browser := SentenceFinderByPrefix new.
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	matches := browser find: 'Wint' inTheElementsOf: stack.
	
	self assert: (matches at: matches size) equals: 'Winter is here'.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'F12 4/18/2025 15:57:41'!
test06StackDoesntReturnAnythingIfThereAreNoCoincidences

	| stack browser matches |
	
	stack := OOStack new.
	
	browser := SentenceFinderByPrefix new.
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'winter is here'.
	
	matches := browser find: 'Wint' inTheElementsOf: stack.
	
	self assert: (matches size) equals: 0.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'F12 4/18/2025 16:07:17'!
test07FinderCanBeUseByMoreThanOneStack

	| stack1 stack2 browser matches1 matches2 |
	
	stack1 := OOStack new.
	stack2 := OOStack new.
		
	browser := SentenceFinderByPrefix new.
	
	stack1 push: 'winter is coming'.
	stack1 push: 'winning is everything'.
	stack1 push: 'The winds of Winter'.
	stack1 push: 'Winter is here'.
	
	stack2 push: 'winter is coming'.
	stack2 push: 'winning is everything'.
	stack2 push: 'The winds of Winter'.
	stack2 push: 'Winter is here'.
	
	matches1 := browser find: 'Wint' inTheElementsOf: stack1.
	matches2 := browser find: 'The' inTheElementsOf: stack2.

	self assert: (matches1 at: matches1 size) equals: 'Winter is here'.
	self assert: (matches2 at: matches2	 size) equals: 'The winds of Winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'F12 4/18/2025 16:20:08'!
test08StackReturnsAllTheCoincidencesEvenIfTheElementIsRepeated

	| stack browser matches |
	
	stack := OOStack new.
	
	browser := SentenceFinderByPrefix new.
	
	stack push: 'Winter is here'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	matches := browser find: 'Wint' inTheElementsOf: stack.
	
	self assert: (matches size) equals: 2.
	self assert: (matches at: matches size) equals: 'Winter is here'.
	self assert: (matches at: matches size - 1) equals: 'Winter is here'.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'ER 4/15/2025 13:20:00'!
initialize

	state := StackEmpty new.

	elements := OrderedCollection new.! !


!OOStack methodsFor: 'operations' stamp: 'F12 4/14/2025 01:00:51'!
isEmpty

	^elements size = 0! !

!OOStack methodsFor: 'operations' stamp: 'ER 4/15/2025 14:14:37'!
pop

	^state popInStack: self
! !

!OOStack methodsFor: 'operations' stamp: 'ER 4/17/2025 11:56:42'!
push: anElement

	state updateStack: self with: anElement! !

!OOStack methodsFor: 'operations' stamp: 'F12 4/14/2025 01:17:23'!
size

	^elements size! !

!OOStack methodsFor: 'operations' stamp: 'ER 4/15/2025 17:27:00'!
top

	^state getLastElement: self
! !


!OOStack methodsFor: 'operations - private' stamp: 'ER 4/15/2025 13:41:15'!
addNew: anElement

	elements addLast: anElement! !

!OOStack methodsFor: 'operations - private' stamp: 'ER 4/17/2025 12:02:06'!
removeAndReturnLastElement

	| lastElement |

	lastElement := elements removeLast.
	
	state := (StackState updateStateOfStackWith: elements).
	
	^lastElement! !

!OOStack methodsFor: 'operations - private' stamp: 'ER 4/15/2025 17:27:14'!
returnLastElement

	^elements at: (elements size)! !

!OOStack methodsFor: 'operations - private' stamp: 'ER 4/17/2025 16:08:35'!
updateStateAndAdd: anElement
	
	elements addLast: anElement.
	state := (StackState updateStateOfStackWith: elements)	.! !


!OOStack methodsFor: 'error messages' stamp: 'ER 4/15/2025 13:21:52'!
errorCanNotPopWhenEmpty

	^self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'error messages' stamp: 'F12 4/18/2025 14:05:40'!
errorCanNotTopOnEmptyStack

	^self error: self class stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'auxiliarOrderedCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'F12 4/18/2025 16:35:08'!
find: aPrefix inTheElementsOf: aStack

	| resultsOrderedCollection originalStackElement |
	
	(aPrefix isEmpty) ifTrue: [ ^self error: SentenceFinderByPrefix canNotUseAnEmptyPrefixErrorDescription ]. 
	
	(aPrefix includes: Character space) ifTrue: [^self error: SentenceFinderByPrefix canNotUseBlankSpacesOnPrefixErrorDescription].
	
	resultsOrderedCollection := OrderedCollection new.
	
	[aStack isEmpty ] whileFalse: [ auxiliarOrderedCollection addFirst: (aStack pop) ]. 
	
	1 to: auxiliarOrderedCollection size do: [ :index |
	
		originalStackElement := auxiliarOrderedCollection at: index .
		
		(originalStackElement is: aPrefix substringAt: 1) ifTrue: [ resultsOrderedCollection addFirst: originalStackElement ].
		
		aStack push: originalStackElement.
		
	 ].

	auxiliarOrderedCollection removeAll.

	^resultsOrderedCollection! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'ER 4/15/2025 16:12:24'!
initialize

	auxiliarOrderedCollection := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'ER 4/17/2025 13:24:06'!
canNotUseAnEmptyPrefixErrorDescription
	^ ' El prefijo no puede ser vacío. '! !

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'ER 4/17/2025 16:11:20'!
canNotUseBlankSpacesOnPrefixErrorDescription

	^'No puede haber espacios vacíos en el prefijo.'! !


!classDefinition: #StackState category: #'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'operations' stamp: 'F12 4/18/2025 14:15:26'!
getLastElement: aStack

	self subclassResponsibility.! !

!StackState methodsFor: 'operations' stamp: 'ER 4/15/2025 13:25:27'!
popInStack: aStack

	self subclassResponsibility.! !

!StackState methodsFor: 'operations' stamp: 'ER 4/15/2025 13:41:48'!
updateStack: aStack with: anElement

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: #'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'testing' stamp: 'F12 4/18/2025 14:20:45'!
canCreateStackWith: elements

	self subclassResponsibility.! !

!StackState class methodsFor: 'testing' stamp: 'ER 4/17/2025 11:49:08'!
updateStateOfStackWith: elements

	StackState subclasses asOrderedCollection detect: [ :unaClase | unaClase canCreateStackWith: elements ]
		ifFound: [ :claseAInstanciar | ^claseAInstanciar new ]
		ifNone: [ Error signal ]! !


!classDefinition: #StackEmpty category: #'Stack-Exercise'!
StackState subclass: #StackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackEmpty methodsFor: 'operations' stamp: 'ER 4/15/2025 17:24:52'!
getLastElement: aStack

	^aStack errorCanNotTopOnEmptyStack ! !

!StackEmpty methodsFor: 'operations' stamp: 'ER 4/15/2025 13:27:47'!
popInStack: aStack

	^aStack errorCanNotPopWhenEmpty.! !

!StackEmpty methodsFor: 'operations' stamp: 'ER 4/15/2025 18:10:33'!
updateStack: aStack with: anElement

	aStack updateStateAndAdd: anElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackEmpty class' category: #'Stack-Exercise'!
StackEmpty class
	instanceVariableNames: ''!

!StackEmpty class methodsFor: 'testing' stamp: 'ER 4/17/2025 11:49:45'!
canCreateStackWith: elements

	^(elements size) = 0	! !


!classDefinition: #StackWithElements category: #'Stack-Exercise'!
StackState subclass: #StackWithElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackWithElements methodsFor: 'operations' stamp: 'ER 4/15/2025 17:24:40'!
getLastElement: aStack

	^aStack returnLastElement! !

!StackWithElements methodsFor: 'operations' stamp: 'ER 4/15/2025 13:27:39'!
popInStack: aStack

	^aStack removeAndReturnLastElement.! !

!StackWithElements methodsFor: 'operations' stamp: 'ER 4/15/2025 13:43:03'!
updateStack: aStack with: anElement

	aStack addNew: anElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackWithElements class' category: #'Stack-Exercise'!
StackWithElements class
	instanceVariableNames: ''!

!StackWithElements class methodsFor: 'testing' stamp: 'ER 4/17/2025 11:49:52'!
canCreateStackWith: elements

	^(elements size) > 0	! !
