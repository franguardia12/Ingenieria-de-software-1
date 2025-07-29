!classDefinition: #CartTest category: #'TusLibros-Solucion'!
TestCase subclass: #CartTest
	instanceVariableNames: 'cart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!CartTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:11:46'!
raise: anError whenEvaluates: aClosureWithOperations andExecute: aClosureWithValidations

	[ aClosureWithOperations value.
		self fail ]
				on: anError
				do: aClosureWithValidations! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/10/2025 12:50:42'!
setUp

	"| collectionOfBooks |
	
	collectionOfBooks := OrderedCollection new.
	
	collectionOfBooks add: (Dictionary new at: #isbn put: '9780137314942'; at: #titulo put: 'Modern Software Engineering'; at: #precio put: 31.505; yourself).
	collectionOfBooks add: (Dictionary new at: #isbn put: '9780321278654'; at: #titulo put: 'Extreme Programming Explained'; at: #precio put: 45.305; yourself).
	collectionOfBooks add: (Dictionary new at: #isbn put: '9780201710915'; at: #titulo put: 'Planning Extreme Programming'; at: #precio put: 45.180; yourself).
	collectionOfBooks add: (Dictionary new at: #isbn put: '9780321125217'; at: #titulo put: 'Domain-Driven Design'; at: #precio put: 41.000; yourself).
	collectionOfBooks add: (Dictionary new at: #isbn put: '9780735619654'; at: #titulo put: 'Object Thinking'; at: #precio put: 34.900; yourself).
	collectionOfBooks add: (Dictionary new at: #isbn put: '9780321146533'; at: #titulo put: 'Test Driven Development: By Example'; at: #precio put: 29.100; yourself).

	cart := Cart withCatalog: collectionOfBooks."


	cart := Cart withCatalog: {'Modern Software Engineering'. 'TDD by Example'. 'Design Patterns'}
	
	! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/1/2025 22:40:34'!
test01ANewCartHasAnEmptyListOfBooks
	
	self assert: (cart isEmpty)
! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/1/2025 22:40:42'!
test02ACartWithABookAddedHasItInItsList
		
	cart addBook: 'Modern Software Engineering' with: 1.
	
	self deny: (cart isEmpty).
	self assert: (cart includes: 'Modern Software Engineering')
! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/1/2025 22:40:51'!
test03ACartWithTwoBooksAddedHasThemInItsList
		
	cart addBook: 'Modern Software Engineering' with: 1.
	cart addBook: 'TDD by Example' with: 1.
	
	self deny: (cart isEmpty).
	self assert: (cart includes: 'Modern Software Engineering').
	self assert: (cart includes: 'TDD by Example')
	
! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/1/2025 22:40:58'!
test04ACartWithABookAddedTwiceHasItTwoTimesInItsList
	
	cart addBook: 'Modern Software Engineering' with: 2.
	
	self deny: (cart isEmpty).
	self assert: (cart includes: 'Modern Software Engineering')
! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/1/2025 22:41:07'!
test05ACartWithABookAddedThriceHasItThreeTimesInItsList
	
	cart addBook: 'Modern Software Engineering' with: 2.
	cart addBook: 'Modern Software Engineering' with: 1.
	
	self deny: (cart isEmpty).
	self assert: (cart includes: 'Modern Software Engineering')
! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:13:08'!
test06ACartCanNotAddABookWithZeroCopies
	
	self raise: Error
		 whenEvaluates: [ cart addBook: 'Modern Software Engineering' with: 0 ]
		 andExecute: [ :anErrorMessage |
			
			self assert: (cart isEmpty).
			self assert: (anErrorMessage messageText) equals: (cart canNotAddABookWithLessThanOneCopyErrorMessage)
			
		]
	! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:13:53'!
test07ACartCanNotAddABookWithNegativeCopies
	
	self raise: Error
		 whenEvaluates: [ cart addBook: 'Modern Software Engineering' with: -1 ]
		 andExecute: [ :anErrorMessage |
			
			self assert: (cart isEmpty).
			self assert: (anErrorMessage messageText) equals: (cart canNotAddABookWithLessThanOneCopyErrorMessage)
			
		]
	! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/1/2025 22:42:08'!
test08ACartWithTwoBooksAddedTwiceHasThemInItsList
	
	cart addBook: 'Modern Software Engineering' with: 2.
	cart addBook: 'TDD by Example' with: 2. 
	
	self deny: (cart isEmpty).
	self assert: (cart includes: 'Modern Software Engineering').
	self assert: (cart includes: 'TDD by Example')
	
	
	! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/1/2025 22:42:18'!
test09ACartHasAllTheCopiesOfTheBooksAddedInItsList
	
	cart addBook: 'Modern Software Engineering' with: 2.
	cart addBook: 'TDD by Example' with: 2.
	cart addBook: 'Design Patterns' with: 2. 
	
	self deny: (cart isEmpty).
	self assert: (cart includes: 'Modern Software Engineering').
	self assert: (cart includes: 'TDD by Example').
	self assert: (cart includes: 'Design Patterns')
	
	
	! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:14:42'!
test10CartCanNotAddABookThatIsNotInCatalog
	
	self raise: Error
		 whenEvaluates: [ cart addBook: 'Harry Potter' with: 1 ]
		 andExecute: [ :anException |
			
			self assert: cart isEmpty.
			self assert: anException messageText equals: cart bookIsNotInCatalogErrorMessage.
			
		]
	
	
	! !


!classDefinition: #TestTusLibrosInnerFace category: #'TusLibros-Solucion'!
TestCase subclass: #TestTusLibrosInnerFace
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:37:14'!
test01CanCreateACartWithAValidUserIdAndPassword

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	response := interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	self assert: (response at: #status) equals: 201.
	self assert: (response at: #body) equals: '0|OK' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:37:39'!
test02CanAddABookToACartIfItHasAValidIsbnAndAValidNumberOfCopies

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'9780137314942'; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 200.
	self assert: (response at: #body) equals: '0|OK' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:37:54'!
test03CanNotAddABookToACartIfItDoesntHaveAValidNumberOfCopies

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'9780137314942'; add: 'bookQuantity'->'x';yourself).


	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|Invalid parameters' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:39:38'!
test04CanNotAddABookToACartIfItDoesntHaveAIsbnInTheCatalog

	| interfaz response isbnOfBookNotInCatalog |

	interfaz := TusLibrosInnerInterface new.
	
	isbnOfBookNotInCatalog := '321'.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->isbnOfBookNotInCatalog; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 422.
	self assert: (response at: #body) equals: '1|book is not in catalog' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:39:53'!
test05CanNotCreateACartWithAnEmptyPassword

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	response := interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'';yourself).


	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|password cant be empty' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:40:11'!
test06CanNotAddABookToACartIfItDoesntHaveAValidIsbn

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'isbn123'; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|bookIsbn cant contain letters' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:40:27'!
test07CanNotAddABookToACartIfItHasAnEmptyIsbn

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->''; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|bookIsbn cant be empty' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:40:59'!
test08CanListAnEmptyCartPreviouslyCreatedWithAValidUserIdAndPassword

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz listCart: (Dictionary new add: 'userId'->'juan';yourself).


	self assert: (response at: #status) equals: 200.
	self assert: (response at: #body) equals: '0|' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/6/2025 20:41:17'!
test09CanListACartWithBooksPreviouslyCreatedWithAValidUserIdAndPassword

	| interfaz response |

	interfaz := TusLibrosInnerInterface new.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'9780137314942'; add: 'bookQuantity'->'1';yourself).

	response := interfaz listCart: (Dictionary new add: 'userId'->'juan';yourself).

	self assert: (response at: #status) equals: 200.
	self assert: (response at: #body) equals: '0|9780137314942|1' ! !


!classDefinition: #TusLibrosSystemTest category: #'TusLibros-Solucion'!
TestCase subclass: #TusLibrosSystemTest
	instanceVariableNames: 'tusLibrosSystem validCard expiredCard validMerchantProcessor invalidMerchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:06:19'!
raise: anError whenEvaluates: aClosureWithOperations andExecute: aClosureWithValidations

	[ aClosureWithOperations value.
		self fail ]
				on: anError
				do: aClosureWithValidations ! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/8/2025 21:15:19'!
setUp

	| validExpirationMonth validExpirationYear validExpirationDate |

	tusLibrosSystem := TusLibrosSystem new.
	
	validExpirationMonth := (December number) asString.
	validExpirationYear := ((FixedGregorianDate today year) number) asString.
		
	validExpirationDate := validExpirationMonth, validExpirationYear .
	
	validCard  := Card withNumber: 123456789 withExpirationDate: validExpirationDate withCardOwner: 'juan'.
	
	expiredCard := Card withNumber: 123456789 withExpirationDate: '081904' withCardOwner: 'juan'.
	

	validMerchantProcessor := MerchantProcessorStub withResponseClosure: [true].
	
	invalidMerchantProcessor := MerchantProcessorStub withResponseClosure: [false].! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/1/2025 23:32:36'!
test01ANewCartTookForAUserIsEmpty
	
	tusLibrosSystem takeCart: 'juan'.
	
	self assert: (tusLibrosSystem listCart: 'juan') isEmpty! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:19:13'!
test02ANewCartTookForAUserWithABookAddedIsNotEmpty
	
	tusLibrosSystem takeCart: 'juan'.
	
	tusLibrosSystem addBook: '9780137314942' with: 1 to: 'juan'.
	
	self deny: (tusLibrosSystem listCart: 'juan') isEmpty! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:19:45'!
test03TheCartOfAUserWithOneBookHasItInItsListWithTheCopies
	
	tusLibrosSystem takeCart: 'juan'.
	
	tusLibrosSystem addBook: '9780137314942' with: 1 to: 'juan'.
	
	self deny: (tusLibrosSystem listCart: 'juan') isEmpty.
	self assert: (tusLibrosSystem listCart: 'juan') equals: (Dictionary with: ('9780137314942'->1))! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:08:25'!
test04CanNotListAnNonExistsCart
	
	self raise: Error
		whenEvaluates: [ tusLibrosSystem listCart: 'juan' ]
		andExecute: [ :anErrorMessage |
			self assert: anErrorMessage messageText equals: tusLibrosSystem canNotListAnNonExistsCartErrorMessage
		]
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:20:39'!
test05TheCartOfAUserWithTwoBooksHasThemInItsListWithTheirCopies
	
	tusLibrosSystem takeCart: 'juan'.
	
	tusLibrosSystem addBook: '9780137314942' with: 1 to: 'juan'.
	tusLibrosSystem addBook: '9780321146533' with: 1  to: 'juan'. 
	
	self deny: (tusLibrosSystem listCart: 'juan') isEmpty.
	self assert: (tusLibrosSystem listCart: 'juan') equals: (Dictionary with: ('9780137314942'->1) with: ('9780321146533'->1))! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:20:52'!
test06CanNotListAnNonExistsCart
	
	self raise: Error
		whenEvaluates: [ tusLibrosSystem addBook: '9780137314942' with: 1  to: 'juan' ]
		andExecute: [ :anErrorMessage |
			self assert: anErrorMessage messageText equals: tusLibrosSystem canNotAddABookToAnNonExistsCartErrorMessage
		]
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:21:21'!
test07SystemCanListTheCartOfTwoUsers
	
	tusLibrosSystem takeCart: 'juan'.
	tusLibrosSystem takeCart: 'pedro'.
	
	tusLibrosSystem addBook: '9780137314942' with: 1  to: 'juan'.
	tusLibrosSystem addBook: '9780321146533' with: 1  to: 'pedro'. 
	
	self deny: (tusLibrosSystem listCart: 'juan') isEmpty.
	self deny: (tusLibrosSystem listCart: 'pedro') isEmpty.
	self assert: (tusLibrosSystem listCart: 'juan') equals: (Dictionary with: ('9780137314942'->1)).
	self assert: (tusLibrosSystem listCart: 'pedro') equals: (Dictionary with: ('9780321146533'->1))! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:21:34'!
test08SystemCanListTheCartWithOneBookWithTwoCopies
	
	tusLibrosSystem takeCart: 'juan'.
	
	tusLibrosSystem addBook: '9780137314942' with: 2  to: 'juan'.
	
	self deny: (tusLibrosSystem listCart: 'juan') isEmpty.
	self assert: (tusLibrosSystem listCart: 'juan') equals: (Dictionary with: ('9780137314942'->2)).
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/6/2025 20:33:51'!
test09canNotLogInWithAnUnregisteredUser
	
	
	self raise: Error
		whenEvaluates: [tusLibrosSystem logUser: 'carlos' withPassword: '123']
		andExecute: [:anException |
			self assert: tusLibrosSystem logedUsers equals: OrderedCollection new.
			self assert: anException messageText equals: tusLibrosSystem canNotLogInWithAnUnregisteredUserErrorMessage.
		].
	
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:13:35'!
test10validLogInWithCorrectUserAndPassword
	
	| result |
	
	tusLibrosSystem logUser: 'juan' withPassword: '123'. 
	
	result := OrderedCollection with: 'juan'.
	
	self assert: tusLibrosSystem logedUsers equals: result.! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/6/2025 14:15:38'!
test11canNotLogInWithAnIncorrectPassword

	self raise: Error
		whenEvaluates: [tusLibrosSystem logUser: 'juan' withPassword: 'password']
		andExecute: [:anException |
			self assert: tusLibrosSystem logedUsers equals: OrderedCollection new.
			self assert: anException messageText equals: tusLibrosSystem incorrectPasswordErrorMessage.
		].
	! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 14:26:36'!
test12CanNotCheckoutWithAnEmptyCart

	tusLibrosSystem takeCart: 'juan'.

	self raise: Error
		whenEvaluates: [tusLibrosSystem checkOutCartOf: 'juan' usingCard: validCard validateTransaction: 1234 withProcessor: validMerchantProcessor ]
		andExecute: [:anException |
			self assert: anException messageText equals: tusLibrosSystem canNotCheckOutWithAnEmptyCartErrorMessage.
			self assert: (tusLibrosSystem userCartOf: 'juan') isEmpty

		].
	

	
	! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 14:25:28'!
test13CanNotCheckoutWithAnExpiredCard

	tusLibrosSystem takeCart: 'juan'.
	tusLibrosSystem addBook: '9780137314942' with: 1 to: 'juan'.


	self raise: Error
		whenEvaluates: [tusLibrosSystem checkOutCartOf: 'juan' usingCard: expiredCard validateTransaction: 1234 withProcessor: validMerchantProcessor]
		andExecute: [:anException |
			self assert: anException messageText equals: tusLibrosSystem canNotCheckOutWithAnExpiredCardErrorMessage.
			self deny: (tusLibrosSystem userCartOf: 'juan') isEmpty

		].
	

	
	! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 14:24:48'!
test14CanNotCheckoutWithAnInvalidExpirationDate

	| invalidCard |

	invalidCard := Card withNumber: 12345678 withExpirationDate: '132025' withCardOwner: 'juan'.

	tusLibrosSystem takeCart: 'juan'.
	tusLibrosSystem addBook: '9780137314942' with: 1 to: 'juan'.
	

	self raise: Error
		whenEvaluates: [tusLibrosSystem checkOutCartOf: 'juan' usingCard: invalidCard validateTransaction: 1234 withProcessor: validMerchantProcessor]
		andExecute: [:anException |
			self assert: anException messageText equals: tusLibrosSystem invalidExpirationDateErrorMessage .
			self deny: (tusLibrosSystem userCartOf: 'juan') isEmpty

		].
	

	
	! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 14:20:59'!
test15CanCheckoutWithANonExpiredCard

	| idTransaction sellsBookResult |

	tusLibrosSystem takeCart: 'juan'.
	tusLibrosSystem addBook: '9780137314942' with: 1 to: 'juan'.
	
	idTransaction := tusLibrosSystem checkOutCartOf: 'juan' usingCard: validCard validateTransaction: 1234 withProcessor: validMerchantProcessor .
	sellsBookResult := OrderedCollection with: idTransaction.
	
	self assert: idTransaction equals: 1234.
	self assert: sellsBookResult equals: (tusLibrosSystem sellsBook).
	self assert: (tusLibrosSystem userCartOf: 'juan') isEmpty! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 14:23:28'!
test16CanNotCheckoutWhenMerchantProcessorFails

	tusLibrosSystem takeCart: 'juan'.
	tusLibrosSystem addBook: '9780137314942' with: 1 to: 'juan'.
	
	self raise: Error
		whenEvaluates: [tusLibrosSystem checkOutCartOf: 'juan' usingCard: validCard validateTransaction: 1234 withProcessor: invalidMerchantProcessor ]
		andExecute: [:anException |
			self assert: anException messageText equals: tusLibrosSystem merchantProcessorFailedErrorMessage .
			self deny: (tusLibrosSystem userCartOf: 'juan') isEmpty
		].! !


!classDefinition: #Card category: #'TusLibros-Solucion'!
Object subclass: #Card
	instanceVariableNames: 'cardNumber expirationDate cardOwner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!Card methodsFor: 'initialization' stamp: 'ER 6/8/2025 20:02:23'!
initializeWithNumber: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner

	cardNumber := aCardOwner .
	cardOwner := aCardOwner .
	expirationDate := anExpirationDate .! !


!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 23:01:27'!
cardNumber

	^cardNumber ! !

!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 23:02:03'!
cardOwner

	^cardOwner ! !

!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 23:02:09'!
expirationDate

	^expirationDate ! !

!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 22:49:33'!
hasValidExpirationDate

	| expirationMonth | 
	
	expirationMonth := (expirationDate copyFrom: 1 to: (expirationDate size - 4)) asNumber.
	
	(expirationDate size isEqualTo: 6) ifFalse: [^false].
	
	((expirationMonth<0) or: (expirationMonth>12))		 ifTrue: [^false].
	
	
	^true.! !

!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 20:12:32'!
isExpired

	| today todaysMonth todaysYear expirationMonth expirationYear | 
	
	expirationYear := (expirationDate copyFrom: (expirationDate size - 3) to: expirationDate size) asNumber.
	expirationMonth := (expirationDate copyFrom: 1 to: (expirationDate size - 4)) asNumber.

	today := FixedGregorianDate today.
	todaysMonth := today month number.
	todaysYear := today year number.
	
	(expirationYear < todaysYear ) ifTrue: [ ^true ].
	((expirationMonth < todaysMonth ) and: (expirationYear <= todaysYear )) ifTrue: [^true ].
	
	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: #'TusLibros-Solucion'!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'as yet unclassified' stamp: 'ER 6/8/2025 19:51:52'!
withNumber: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner

	^self new initializeWithNumber: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner.! !


!classDefinition: #Cart category: #'TusLibros-Solucion'!
Object subclass: #Cart
	instanceVariableNames: 'catalog contents totalAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!Cart methodsFor: 'accessing' stamp: 'F12 6/1/2025 20:52:06'!
contents
	
	^contents copy! !

!Cart methodsFor: 'accessing' stamp: 'F12 6/1/2025 21:02:21'!
includes: aBook 
	
	^contents includes: aBook! !

!Cart methodsFor: 'accessing' stamp: 'ER 6/8/2025 23:03:11'!
totalAmount

	^totalAmount! !


!Cart methodsFor: 'updating' stamp: 'F12 6/6/2025 20:42:00'!
addBook: aBook with: aNumberOfCopies

	(aNumberOfCopies < 1) ifTrue: [ ^self error: self canNotAddABookWithLessThanOneCopyErrorMessage ].
	
	(catalog includes: aBook) ifFalse: [ ^self error: self bookIsNotInCatalogErrorMessage ].
	
	contents add: aBook withOccurrences: aNumberOfCopies ! !


!Cart methodsFor: 'initialization' stamp: 'ER 6/8/2025 23:02:58'!
initializeWith: aCatalog 
	
	contents := Bag new.
	catalog := aCatalog.
	totalAmount := 0*peso.! !


!Cart methodsFor: 'error handling' stamp: 'F12 6/1/2025 20:02:41'!
bookIsNotInCatalogErrorMessage

	^'book is not in catalog'! !

!Cart methodsFor: 'error handling' stamp: 'F12 5/30/2025 22:54:52'!
canNotAddABookWithLessThanOneCopyErrorMessage

	^'Can not add a book with less than one copy'! !


!Cart methodsFor: 'evaluating' stamp: 'F12 6/1/2025 21:01:04'!
isEmpty
	
	^contents isEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Solucion'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'F12 6/1/2025 20:00:43'!
withCatalog: aCatalog

	^self new initializeWith: aCatalog! !


!classDefinition: #MerchantProcessorStub category: #'TusLibros-Solucion'!
Object subclass: #MerchantProcessorStub
	instanceVariableNames: 'responseClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!MerchantProcessorStub methodsFor: 'initialization' stamp: 'ER 6/8/2025 20:39:18'!
initializeWithResponseClosure: aClosure

	responseClosure := aClosure! !


!MerchantProcessorStub methodsFor: 'operations' stamp: 'ER 6/8/2025 22:57:40'!
makeDebitForCard: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner withTransactionAmount: aTransactionAmount

	^responseClosure value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorStub class' category: #'TusLibros-Solucion'!
MerchantProcessorStub class
	instanceVariableNames: ''!

!MerchantProcessorStub class methodsFor: 'initialization' stamp: 'ER 6/8/2025 20:38:29'!
withResponseClosure: aClosure

	^self new initializeWithResponseClosure: aClosure.! !


!classDefinition: #TusLibrosInnerInterface category: #'TusLibros-Solucion'!
Object subclass: #TusLibrosInnerInterface
	instanceVariableNames: 'system httpResponse'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!TusLibrosInnerInterface methodsFor: 'initialization' stamp: 'F12 6/5/2025 00:44:31'!
initialize

	system := TusLibrosSystem new.
	httpResponse := (Dictionary new add: #status->nil; add: #body->nil;yourself)! !


!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/6/2025 19:43:13'!
sendResponseForAListCartWithAnNonExistsAccount

	^httpResponse at: #status put: 422;
				     at: #body put: '1|The account does not exist';
				     yourself
	
	! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 21:25:01'!
sendResponseForAListCartWithElements: aUserCart

	| stream |
	
	stream := String new writeStream.
	stream nextPutAll: '0'.
	aUserCart keysAndValuesDo: [:isbn :cantidad |
	    stream nextPut: $|.
	    stream nextPutAll: isbn asString.
	    stream nextPut: $|.
	    stream nextPutAll: cantidad asString].

	
	^httpResponse at: #status put: 200;
				     at: #body put: (stream contents);
				     yourself! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/6/2025 20:11:32'!
sendResponseForAListEmptyCart

	^httpResponse at: #status put: 200;
				     at: #body put: '0|';
				     yourself
	
	! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/5/2025 00:34:39'!
sendResponseForAnAddToCartWithABookNotInCatalog

	^httpResponse at: #status put: 422;
				     at: #body put: '1|Book is not in the catalog';
				     yourself
! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 21:29:32'!
sendResponseForAnAddToCartWithEmptyISBN

	^httpResponse at: #status put: 400;
				     at: #body put: '1|bookIsbn cant be empty';
				     yourself
! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 23:28:34'!
sendResponseForAnAddToCartWithInvalidBookQuantity

	^httpResponse at: #status put: 400;
				     at: #body put: '1|Invalid parameters';
				     yourself
! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 23:27:24'!
sendResponseForAnAddToCartWithInvalidISBN

	^httpResponse at: #status put: 400;
				     at: #body put: '1|bookIsbn cant contain letters';
				     yourself
! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 19:44:06'!
sendResponseForAnOperationWithAnEmptyUserId

	^httpResponse at: #status put: 400;
				     at: #body put: '1|userId cant be empty';
				     yourself

	! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 19:45:08'!
sendResponseForAnOperationWithAnEmptyUserPassword

	^httpResponse at: #status put: 400;
				     at: #body put: '1|password cant be empty';
				     yourself! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 23:31:41'!
sendSuccessfulResponseForAddToCart

	^httpResponse at: #status put: 200;
				     at: #body put: '0|OK';
				     yourself! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/4/2025 19:53:43'!
sendSuccessfulResponseForCreateCartFor: aUserId

	system takeCart: aUserId.

	^httpResponse at: #status put: 201;
				     at: #body put: '0|OK';
				     yourself! !


!TusLibrosInnerInterface methodsFor: 'validations' stamp: 'F12 6/4/2025 22:49:28'!
isAValidBookQuantity: aBookQuantity

	| onlyDigits |
	
	onlyDigits := aBookQuantity allSatisfy: [ :ch | ch isDigit ].
	
	^onlyDigits ! !

!TusLibrosInnerInterface methodsFor: 'validations' stamp: 'F12 6/4/2025 21:54:34'!
isAnISBNWithOnlyNumbers: aBookISBN

	| onlyDigits |
	
	onlyDigits := aBookISBN allSatisfy: [ :ch | ch isDigit ].
	
	^onlyDigits ! !


!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'F12 6/5/2025 00:40:50'!
addToCart: aHttpRequest 

	| userId bookISBN bookQuantityString |
	
	userId := aHttpRequest at: 'userId'.
	bookISBN := aHttpRequest at: 'bookIsbn'. 
	bookQuantityString := aHttpRequest at: 'bookQuantity'.
	
	(bookISBN isEmpty) ifTrue: [ ^self sendResponseForAnAddToCartWithEmptyISBN ].

	(self isAnISBNWithOnlyNumbers: bookISBN) ifFalse: [ ^self sendResponseForAnAddToCartWithInvalidISBN ]. 
	
	(self isAValidBookQuantity: bookQuantityString) ifFalse: [ ^self sendResponseForAnAddToCartWithInvalidBookQuantity ].
	
	^self tryToAddABookWith: bookISBN with: bookQuantityString  to: userId ! !

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'F12 6/10/2025 14:42:44'!
createCart: aHttpRequest 

	| userId userPassword |
	
	userId := aHttpRequest at: 'userId'.
	userPassword := aHttpRequest at: 'password'.
	
	(userId isEmpty) ifTrue: [ ^self sendResponseForAnOperationWithAnEmptyUserId ].
	(userPassword isEmpty) ifTrue: [ ^self sendResponseForAnOperationWithAnEmptyUserPassword ].
	
	[ system createCartForUser: userId withPassword: userPassword ]
	on: Error - MessageNotUnderstood 
	do: [ :anError | 
		
		^Dictionary new
		at: #status put: 422;
		at: #body put: ('1|', anError messageText);
		yourself
		
		].
	
	^self sendSuccessfulResponseForCreateCartFor: userId 	! !

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'F12 6/6/2025 19:44:40'!
listCart: aHttpRequest 

	| userId userCart |
	
	userId := aHttpRequest at: 'userId'.
	
	[ userCart := system listCart: userId ]
	on: Error - MessageNotUnderstood 
	do: [ :anError | ^self sendResponseForAListCartWithAnNonExistsAccount ].
	
	(userCart isEmpty) ifTrue: [ ^self sendResponseForAListEmptyCart ].
	
	^self sendResponseForAListCartWithElements: userCart ! !

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'F12 6/6/2025 20:06:36'!
tryToAddABookWith: aBookIsbn with: aNumberOfCopies to: aUserId

	[ system addBook: aBookIsbn with: (aNumberOfCopies asNumber) to: aUserId ] 
		on: Error - MessageNotUnderstood  
		do: [ :anError |
		
		^Dictionary new
		at: #status put: 422;
		at: #body put: ('1|', anError messageText);
		yourself
		
	].

		
	^self sendSuccessfulResponseForAddToCart! !


!classDefinition: #TusLibrosOuterInterface category: #'TusLibros-Solucion'!
Object subclass: #TusLibrosOuterInterface
	instanceVariableNames: 'server innerInterface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!TusLibrosOuterInterface methodsFor: 'initialization' stamp: 'F12 6/5/2025 01:45:25'!
initializeListeningOn: aPort

	self startServerOn: aPort.
	innerInterface := TusLibrosInnerInterface new.
	self registerServices.! !


!TusLibrosOuterInterface methodsFor: 'operations' stamp: 'F12 6/6/2025 19:47:36'!
registerServices

	| response request query queryElements |
	
	server addService: '/createCart' action: [ : aRequest | 	
		
		request := aRequest rawUrl.
		
		query := (request subStrings: '?')
              at: 2
              ifAbsent: [ '' ].

		queryElements := query subStrings: '&='.	
				
		response := innerInterface createCart: (Dictionary new add: 'userId'->(queryElements at: 2); add: 'password'->(queryElements at: 4);yourself).
		aRequest sendResponseCode: (response at: #status) content: (response at: #body) type: 'text/plain; charset=utf-8' do: [ : aWebServerResponse | ].
	].

	server addService: '/addToCart' action: [ : aRequest | 	
		
		request := aRequest rawUrl.
		
		query := (request subStrings: '?')
              at: 2
              ifAbsent: [ '' ].

		queryElements := query subStrings: '&='.
		
		response := innerInterface addToCart: (Dictionary new add: 'userId'->(queryElements at: 6); add: 'bookIsbn'->(queryElements at: 2); add: 'bookQuantity'->(queryElements at: 4);yourself).
		aRequest sendResponseCode: (response at: #status) content: (response at: #body) type: 'text/plain; charset=utf-8' do: [ : aWebServerResponse | ].
	].

	server addService: '/listCart' action: [ : aRequest |  	
		
		request := aRequest rawUrl.
		
		query := (request subStrings: '?')
              at: 2
              ifAbsent: [ '' ].

		queryElements := query subStrings: '='.	

		response := innerInterface listCart: (Dictionary new add: 'userId'->(queryElements at: 2);yourself).
		
		aRequest sendResponseCode: (response at: #status) content: (response at: #body) type: 'text/plain; charset=utf-8' do: [ : aWebServerResponse | ].

	].
! !

!TusLibrosOuterInterface methodsFor: 'operations' stamp: 'F12 6/5/2025 01:46:00'!
startServerOn: aPort

	server := WebServer reset default.
	server listenOn: aPort.
	server useDebugErrorHandler
	! !

!TusLibrosOuterInterface methodsFor: 'operations' stamp: 'F12 6/4/2025 16:18:28'!
stop

	server destroy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosOuterInterface class' category: #'TusLibros-Solucion'!
TusLibrosOuterInterface class
	instanceVariableNames: ''!

!TusLibrosOuterInterface class methodsFor: 'instance creation' stamp: 'F12 6/4/2025 16:19:04'!
listeningOn: aPort
	^ self new initializeListeningOn: aPort! !


!classDefinition: #TusLibrosSystem category: #'TusLibros-Solucion'!
Object subclass: #TusLibrosSystem
	instanceVariableNames: 'usersCarts registeredUsers logedUsers sellsBook catalog authenticatorSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solucion'!

!TusLibrosSystem methodsFor: 'operations' stamp: 'F12 6/10/2025 14:15:56'!
checkOutCartOf: aUserId usingCard: aCard validateTransaction: aTransactionNumber withProcessor: aMerchantProcessor

	| transactionAmount validatedTransaction |

	(aCard hasValidExpirationDate) ifFalse: [^self error: self invalidExpirationDateErrorMessage].

	(aCard isExpired) ifTrue: [ ^self error: self canNotCheckOutWithAnExpiredCardErrorMessage ].
	
	((usersCarts at: aUserId) isEmpty) ifTrue: [^self error: self canNotCheckOutWithAnEmptyCartErrorMessage ].
	
	transactionAmount := (usersCarts at: aUserId) totalAmount.
	
	validatedTransaction := aMerchantProcessor makeDebitForCard: (aCard cardNumber) withExpirationDate: (aCard expirationDate) withCardOwner:  (aCard cardOwner) withTransactionAmount: transactionAmount.
	
	(validatedTransaction) ifTrue: [
		self takeCart: aUserId.
		sellsBook add: aTransactionNumber.
		^aTransactionNumber.
	].

	^self error: self merchantProcessorFailedErrorMessage.! !

!TusLibrosSystem methodsFor: 'operations' stamp: 'ER 6/6/2025 14:17:34'!
listCart: aUserId

	| cartItems |
	
	(usersCarts includesKey: aUserId) ifFalse: [ ^self error: self canNotListAnNonExistsCartErrorMessage ].
	
	cartItems := (usersCarts at: aUserId) contents.
	
	^cartItems contents! !

!TusLibrosSystem methodsFor: 'operations' stamp: 'F12 6/6/2025 19:59:09'!
takeCart: aUserId 

	| newCart |

	newCart := Cart withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'}.
	usersCarts at: aUserId put: newCart.
	! !


!TusLibrosSystem methodsFor: 'updating' stamp: 'F12 6/6/2025 20:03:49'!
addBook: aBook with: aNumberOfCopies to: aUserId 
		
	(usersCarts includesKey: aUserId) ifFalse: [ ^self error: self canNotAddABookToAnNonExistsCartErrorMessage ].
	
	^(usersCarts at: aUserId) addBook: aBook with: aNumberOfCopies 
	
	! !


!TusLibrosSystem methodsFor: 'initialization' stamp: 'ER 6/8/2025 21:22:47'!
initialize

	usersCarts := Dictionary new.
	
	registeredUsers := (Dictionary new add: 'juan'->'123'; add: 'pedro'-> '321';yourself).
	
	logedUsers := OrderedCollection new.
	
	sellsBook := OrderedCollection new.! !

!TusLibrosSystem methodsFor: 'initialization' stamp: 'F12 6/10/2025 14:37:17'!
initializeWithCatalog: aCatalog

	usersCarts := Dictionary new.
	
	registeredUsers := (Dictionary new add: 'juan'->'123'; add: 'pedro'-> '321';yourself).
	
	logedUsers := OrderedCollection new.
	
	sellsBook := OrderedCollection new.
	
	catalog := aCatalog ! !

!TusLibrosSystem methodsFor: 'initialization' stamp: 'F12 6/10/2025 14:48:09'!
initializeWithCatalog: aCatalog andAnAuthenticator: anAuthenticator

	usersCarts := Dictionary new.
			
	sellsBook := OrderedCollection new.
	
	catalog := aCatalog.
	
	authenticatorSystem := anAuthenticator ! !


!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 22:51:13'!
canNotAddABookToAnNonExistsCartErrorMessage
	
	^'Can not add a book to a non existent cart.'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 22:51:10'!
canNotCheckOutWithAnEmptyCartErrorMessage
	
	^'can not checkout with an empty cart.'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 22:51:06'!
canNotCheckOutWithAnExpiredCardErrorMessage

	^'Can not checkout with an expired card.'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 22:51:03'!
canNotListAnNonExistsCartErrorMessage
	
	^'Can not list a non existent cart.'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 22:50:59'!
canNotLogInWithAnUnregisteredUserErrorMessage

	^'Can not log in with an unregistered user.'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 23:13:44'!
invalidExpirationDateErrorMessage

	^'Invalid expiration date.'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 23:13:33'!
merchantProcessorFailedErrorMessage

	^'Can not complete transaction: Merchant Processor failed.'! !


!TusLibrosSystem methodsFor: 'logIn' stamp: 'F12 6/10/2025 14:37:41'!
createCartForUser: aUserId withPassword: aPassword


	(registeredUsers includesKey: aUserId) ifFalse: [^self error: self canNotLogInWithAnUnregisteredUserErrorMessage].
	
	((registeredUsers at: aUserId) = aPassword) ifFalse: [ ^self error: self incorrectPasswordErrorMessage ].
	
	(logedUsers includes: aUserId) ifTrue: [ ^self ].
	
	logedUsers add: aUserId.
	
	! !

!TusLibrosSystem methodsFor: 'logIn' stamp: 'ER 6/6/2025 14:16:38'!
incorrectPasswordErrorMessage

	^'Incorrect password'! !

!TusLibrosSystem methodsFor: 'logIn' stamp: 'ER 6/6/2025 14:12:30'!
logedUsers

	^logedUsers ! !


!TusLibrosSystem methodsFor: 'accessing' stamp: 'F12 6/10/2025 14:17:43'!
sellsBook

	^sellsBook copy! !

!TusLibrosSystem methodsFor: 'accessing' stamp: 'F12 6/10/2025 14:19:59'!
userCartOf: aUserId

	^(usersCarts at: aUserId) copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystem class' category: #'TusLibros-Solucion'!
TusLibrosSystem class
	instanceVariableNames: ''!

!TusLibrosSystem class methodsFor: 'instance creation' stamp: 'F12 6/10/2025 14:45:37'!
withCatalog: aCatalog andAnAuthenticator: anAuthenticator

	^self new initializeWithCatalog: aCatalog andAnAuthenticator: anAuthenticator ! !
