!classDefinition: #CartTest category: #'TusLibros-Tests'!
TestCase subclass: #CartTest
	instanceVariableNames: 'cart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!CartTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:11:46'!
raise: anError whenEvaluates: aClosureWithOperations andExecute: aClosureWithValidations

	[ aClosureWithOperations value.
		self fail ]
				on: anError
				do: aClosureWithValidations! !

!CartTest methodsFor: 'tests' stamp: 'F12 6/17/2025 19:35:17'!
setUp

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


!classDefinition: #CashierTest category: #'TusLibros-Tests'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'expiredCard validMerchantProcessor invalidMerchantProcessor validCard cart cashier invalidCard cardWithoutName cardWithoutNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!CashierTest methodsFor: 'tests' stamp: 'F12 6/15/2025 13:00:28'!
raise: anError whenEvaluates: aClosureWithOperations andExecute: aClosureWithValidations

	[ aClosureWithOperations value.
		self fail ]
				on: anError
				do: aClosureWithValidations ! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/15/2025 13:59:03'!
setUp

	| validExpirationDate validExpirationYear validExpirationMonth |
	validExpirationMonth := (December number) asString.
	validExpirationYear := ((FixedGregorianDate today year) number) asString.
		
	validExpirationDate := validExpirationMonth, validExpirationYear .
	
	validCard  := Card withNumber: 123456789 withExpirationDate: validExpirationDate withCardOwner: 'juan'.
	
	expiredCard := Card withNumber: 123456789 withExpirationDate: '081904' withCardOwner: 'juan'.
	
	invalidCard := Card withNumber: 12345678 withExpirationDate: '132025' withCardOwner: 'juan'.
	
	cardWithoutName := Card withNumber: 12345678 withExpirationDate: validExpirationDate withCardOwner: ''.
	
	cardWithoutNumber := Card withNumber: '' withExpirationDate: validExpirationDate withCardOwner: 'juan'.
		
	validMerchantProcessor := MerchantProcessorStub withResponseClosure: [true].
	
	invalidMerchantProcessor := MerchantProcessorStub withResponseClosure: [false].
	
	cart := Cart withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'}.
	
	cashier := Cashier new.! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/15/2025 13:26:55'!
test01CanNotCheckoutWithAnEmptyCart

	self raise: Error
		whenEvaluates: [cashier checkOut: cart Of: 'juan' using: validCard with: 1234 whichIsValidatedBy: validMerchantProcessor ]
		andExecute: [:anException |
			self assert: anException messageText equals: cashier canNotCheckOutWithAnEmptyCartErrorMessage.
			self assert: cart isEmpty

		].! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/15/2025 13:26:31'!
test02CanNotCheckoutWithAnExpiredCard
	
	cart addBook: '9780137314942' with: 1.

	self raise: Error
		whenEvaluates: [cashier checkOut: cart Of: 'juan' using: expiredCard with: 1234 whichIsValidatedBy: validMerchantProcessor]
		andExecute: [:anException |
			self assert: anException messageText equals: cashier canNotCheckOutWithAnExpiredCardErrorMessage.
			self deny: cart isEmpty

		].
	! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/15/2025 13:22:59'!
test03CanNotCheckoutWithAnInvalidExpirationDate
	
	cart addBook: '9780137314942' with: 1.

	self raise: Error
		whenEvaluates: [cashier checkOut: cart Of: 'juan' using: invalidCard with: 1234 whichIsValidatedBy: validMerchantProcessor]
		andExecute: [:anException |
			self assert: anException messageText equals: cashier invalidExpirationDateErrorMessage .
			self deny: cart isEmpty

		].
	
	
	! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/15/2025 13:30:49'!
test04CanCheckoutWithANonExpiredCard

	| idTransaction sellsBookResult |
	
	cart addBook: '9780137314942' with: 1.
	
	idTransaction := cashier checkOut: cart Of: 'juan' using: validCard with: 1234 whichIsValidatedBy: validMerchantProcessor.
	sellsBookResult := OrderedCollection with: idTransaction.
	
	self assert: idTransaction equals: 1234.
	self assert: sellsBookResult equals: (cashier sellsBook).
	self assert: cart isEmpty
	! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/15/2025 13:33:14'!
test05CanNotCheckoutWhenMerchantProcessorFails
	
	cart addBook: '9780137314942' with: 1.
	
	self raise: Error
		whenEvaluates: [ cashier checkOut: cart Of: 'juan' using: validCard with: 1234 whichIsValidatedBy: invalidMerchantProcessor ]
		andExecute: [:anException |
			self assert: anException messageText equals: cashier merchantProcessorFailedErrorMessage .
			self deny: cart isEmpty
		].
	! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/16/2025 20:39:17'!
test06CanCheckoutTwoDifferentPurchases

	| idTransaction1 idTransaction2 sellsBookResult |
	
	cart addBook: '9780137314942' with: 1.
	
	idTransaction1 := cashier checkOut: cart Of: 'juan' using: validCard with: 1234 whichIsValidatedBy: validMerchantProcessor.
	
	cart addBook: '9780321278654' with: 1.
	
	idTransaction2 := cashier checkOut: cart Of: 'juan' using: validCard with: 5678 whichIsValidatedBy: validMerchantProcessor.
	
	sellsBookResult := OrderedCollection with: idTransaction1 with: idTransaction2.
	
	self assert: idTransaction1 equals: 1234.
	self assert: idTransaction2 equals: 5678.
	self assert: sellsBookResult equals: (cashier sellsBook).
	self assert: cart isEmpty
	! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/16/2025 20:39:29'!
test07CanCheckoutAPurchaseOfDifferentBooks

	| idTransaction sellsBookResult |
	
	cart addBook: '9780137314942' with: 1.
	cart addBook: '9780321278654' with: 1.
	cart addBook: '9780201710915' with: 1.
	
	idTransaction := cashier checkOut: cart Of: 'juan' using: validCard with: 1234 whichIsValidatedBy: validMerchantProcessor.
		
	sellsBookResult := OrderedCollection with: idTransaction.
	
	self assert: idTransaction equals: 1234.
	self assert: sellsBookResult equals: (cashier sellsBook).
	self assert: cart isEmpty
	! !

!CashierTest methodsFor: 'tests' stamp: 'F12 6/16/2025 20:39:36'!
test08CanCheckoutAPurchaseOfMoreThanOneCopyOfTheSameBook

	| idTransaction sellsBookResult |
	
	cart addBook: '9780137314942' with: 3.
	
	idTransaction := cashier checkOut: cart Of: 'juan' using: validCard with: 1234 whichIsValidatedBy: validMerchantProcessor.
		
	sellsBookResult := OrderedCollection with: idTransaction.
	
	self assert: idTransaction equals: 1234.
	self assert: sellsBookResult equals: (cashier sellsBook).
	self assert: cart isEmpty
	! !


!classDefinition: #TestTusLibrosInnerFace category: #'TusLibros-Tests'!
TestCase subclass: #TestTusLibrosInnerFace
	instanceVariableNames: 'interfaz system'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'ER 6/26/2025 15:20:21'!
setUp

	"system := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} andAnAuthenticator: AuthenticatorSystemStub bypassingAllUsers."	|prices|
	prices := Dictionary new. 
	prices at:'9780321278654' put: 45305.
	prices at:'9780137314942' put: 31505.
	prices at:'9780201710915' put: 45180.
	prices at:'9780321125217' put: 41000.
	prices at:'9780735619654' put: 34900.
	prices at:'9780321146533' put: 29100.
	

	
	system := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} anAuthenticator: (AuthenticatorSystemStub bypassingAllUsers) andAMerchantProcessor: (MerchantProcessorStub withResponseClosure: [true]) withAClock: (ClockReal new) withPrices: prices.
	
	interfaz := TusLibrosInnerInterface for: system 

! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test01CanCreateACartWithAValidUserIdAndPassword

	| response |
	
	response := interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	self assert: (response at: #status) equals: 201.
	self assert: (response at: #body) equals: '0|OK' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test02CanAddABookToACartIfItHasAValidIsbnAndAValidNumberOfCopies

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'9780137314942'; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 200.
	self assert: (response at: #body) equals: '0|OK' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test03CanNotAddABookToACartIfItDoesntHaveAValidNumberOfCopies

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'9780137314942'; add: 'bookQuantity'->'x';yourself).


	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|Invalid parameters' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test04CanNotAddABookToACartIfItDoesntHaveAIsbnInTheCatalog

	| response isbnOfBookNotInCatalog |
	
	isbnOfBookNotInCatalog := '321'.
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->isbnOfBookNotInCatalog; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 422.
	self assert: (response at: #body) equals: '1|book is not in catalog' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test05CanNotCreateACartWithAnEmptyPassword

	| response |
	
	response := interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'';yourself).

	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|password cant be empty' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test06CanNotAddABookToACartIfItDoesntHaveAValidIsbn

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'isbn123'; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|bookIsbn cant contain letters' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test07CanNotAddABookToACartIfItHasAnEmptyIsbn

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->''; add: 'bookQuantity'->'1';yourself).


	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|bookIsbn cant be empty' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test08CanListAnEmptyCartPreviouslyCreatedWithAValidUserIdAndPassword

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	response := interfaz listCart: (Dictionary new add: 'userId'->'juan';yourself).

	self assert: (response at: #status) equals: 200.
	self assert: (response at: #body) equals: '0|' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/10/2025 20:53:22'!
test09CanListACartWithBooksPreviouslyCreatedWithAValidUserIdAndPassword

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).

	interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'9780137314942'; add: 'bookQuantity'->'1';yourself).

	response := interfaz listCart: (Dictionary new add: 'userId'->'juan';yourself).

	self assert: (response at: #status) equals: 200.
	self assert: (response at: #body) equals: '0|9780137314942|1' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/17/2025 15:32:34'!
test10CanCheckOutACartWithACardWithValidData

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).
	
	interfaz addToCart: (Dictionary new add: 'userId'->'juan'; add: 'bookIsbn'->'9780137314942'; add: 'bookQuantity'->'1';yourself).
	
	response := interfaz checkOutCart: (Dictionary new add: 'userId'->'juan'; add: 'ccn'->'123456789'; add: 'cced'->'122030'; add: 'cco'->'juan';yourself).

	self assert: (response at: #status) equals: 200.
	self assert: (response at: #body) equals: '0|1234' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/15/2025 21:57:50'!
test11CanNotCheckOutACartIfTheCardDoesNotHasAValidNumber

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).
	
	response := interfaz checkOutCart: (Dictionary new add: 'userId'->'juan'; add: 'ccn'->'x'; add: 'cced'->'121427'; add: 'cco'->'juan';yourself).

	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|the card does not have a valid number' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/17/2025 15:32:46'!
test12CanNotCheckOutACartIfTheCardDoesNotHasAValidExpirationDate

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).
	
	response := interfaz checkOutCart: (Dictionary new add: 'userId'->'juan'; add: 'ccn'->'123456789'; add: 'cced'->121427; add: 'cco'->'juan';yourself).

	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|the card does not have a valid expiration date' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/17/2025 15:32:55'!
test13CanNotCheckOutACartIfTheCardDoesNotHasAValidOwnerName

	| response |
	
	interfaz createCart: (Dictionary new add: 'userId'->'juan'; add: 'password'->'123';yourself).
	
	response := interfaz checkOutCart: (Dictionary new add: 'userId'->'juan'; add: 'ccn'->'123456789'; add: 'cced'->'121427'; add: 'cco'->1234;yourself).

	self assert: (response at: #status) equals: 400.
	self assert: (response at: #body) equals: '1|the card does not have a valid owner name' ! !

!TestTusLibrosInnerFace methodsFor: 'tests' stamp: 'F12 6/17/2025 15:33:04'!
test14CanNotCheckOutACartIfTheUserIsNotLoged

	| response |
		
	response := interfaz checkOutCart: (Dictionary new add: 'userId'->'juan'; add: 'ccn'->'123456789'; add: 'cced'->'121427'; add: 'cco'->'juan';yourself).

	self assert: (response at: #status) equals: 422.
	self assert: (response at: #body) equals: '1|can not check out if the user is not loged' ! !


!classDefinition: #TusLibrosSystemTest category: #'TusLibros-Tests'!
TestCase subclass: #TusLibrosSystemTest
	instanceVariableNames: 'tusLibrosSystemAcceptEveryone tusLibrosSystemAcceptNone validCard validMerchantProcessor clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Tests'!

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/2/2025 00:06:19'!
raise: anError whenEvaluates: aClosureWithOperations andExecute: aClosureWithValidations

	[ aClosureWithOperations value.
		self fail ]
				on: anError
				do: aClosureWithValidations ! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/26/2025 15:20:49'!
setUp
	|prices|	
	clock := ClockStub withResponseClosure: [false].
	prices := Dictionary new. 
	prices at:'9780321278654' put: 45305.
	prices at:'9780137314942' put: 31505.
	prices at:'9780201710915' put: 45180.
	prices at:'9780321125217' put: 41000.
	prices at:'9780735619654' put: 34900.
	prices at:'9780321146533' put: 29100.
	
	tusLibrosSystemAcceptEveryone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'}  anAuthenticator: (AuthenticatorSystemStub bypassingAllUsers) andAMerchantProcessor: (MerchantProcessorStub withResponseClosure: [true]) withAClock: clock withPrices: prices.

	tusLibrosSystemAcceptNone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} anAuthenticator: (AuthenticatorSystemStub behavingLike: [ :clientId :password | ^self error: 'An error message']) andAMerchantProcessor: (MerchantProcessorStub withResponseClosure: [true]) withAClock: clock withPrices: prices.! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 19:08:38'!
test01ANewCartTookForAUserIsEmpty
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	self assert: (tusLibrosSystemAcceptEveryone listCart: 'juan') isEmpty! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 19:09:35'!
test02ANewCartTookForAUserWithABookAddedIsNotEmpty
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'.
	
	tusLibrosSystemAcceptEveryone addBook: '9780137314942' with: 1 to: 'juan'.
	
	self deny: (tusLibrosSystemAcceptEveryone listCart: 'juan') isEmpty! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 19:10:35'!
test03TheCartOfAUserWithOneBookHasItInItsListWithTheCopies
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	tusLibrosSystemAcceptEveryone addBook: '9780137314942' with: 1 to: 'juan'.
	
	self deny: (tusLibrosSystemAcceptEveryone listCart: 'juan') isEmpty.
	self assert: (tusLibrosSystemAcceptEveryone listCart: 'juan') equals: (Dictionary with: ('9780137314942'->1))! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/15/2025 18:44:53'!
test04CanNotListAnNonExistsCart
	
	self raise: Error
		whenEvaluates: [ tusLibrosSystemAcceptEveryone listCart: 'juan' ]
		andExecute: [ :anError |
			self assert: anError messageText equals: tusLibrosSystemAcceptEveryone canNotListAnNonExistsCartErrorMessage
		]
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 19:11:36'!
test05TheCartOfAUserWithTwoBooksHasThemInItsListWithTheirCopies
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	tusLibrosSystemAcceptEveryone addBook: '9780137314942' with: 1 to: 'juan'.
	tusLibrosSystemAcceptEveryone addBook: '9780321146533' with: 1  to: 'juan'. 
	
	self deny: (tusLibrosSystemAcceptEveryone listCart: 'juan') isEmpty.
	self assert: (tusLibrosSystemAcceptEveryone listCart: 'juan') equals: (Dictionary with: ('9780137314942'->1) with: ('9780321146533'->1))! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/15/2025 18:45:02'!
test06CanNotAddABookToAnNonExistsCart
	
	self raise: Error
		whenEvaluates: [ tusLibrosSystemAcceptEveryone addBook: '9780137314942' with: 1  to: 'juan' ]
		andExecute: [ :anError |
			self assert: anError messageText equals: tusLibrosSystemAcceptEveryone canNotAddABookToAnNonExistsCartErrorMessage
		]
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 19:13:38'!
test07SystemCanListTheCartOfTwoUsers
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'.
	tusLibrosSystemAcceptEveryone createCartForUser: 'pedro' withPassword: '1234'. 
	
	tusLibrosSystemAcceptEveryone addBook: '9780137314942' with: 1  to: 'juan'.
	tusLibrosSystemAcceptEveryone addBook: '9780321146533' with: 1  to: 'pedro'. 
	
	self deny: (tusLibrosSystemAcceptEveryone listCart: 'juan') isEmpty.
	self deny: (tusLibrosSystemAcceptEveryone listCart: 'pedro') isEmpty.
	self assert: (tusLibrosSystemAcceptEveryone listCart: 'juan') equals: (Dictionary with: ('9780137314942'->1)).
	self assert: (tusLibrosSystemAcceptEveryone listCart: 'pedro') equals: (Dictionary with: ('9780321146533'->1))! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/10/2025 19:14:19'!
test08SystemCanListTheCartWithOneBookWithTwoCopies
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	tusLibrosSystemAcceptEveryone addBook: '9780137314942' with: 2  to: 'juan'.
	
	self deny: (tusLibrosSystemAcceptEveryone listCart: 'juan') isEmpty.
	self assert: (tusLibrosSystemAcceptEveryone listCart: 'juan') equals: (Dictionary with: ('9780137314942'->2)).
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/26/2025 15:21:10'!
test09canNotLogInWithAnUnregisteredUser
	|prices|
	prices := Dictionary new. 
	prices at:'9780321278654' put: 45305.
	prices at:'9780137314942' put: 31505.
	prices at:'9780201710915' put: 45180.
	prices at:'9780321125217' put: 41000.
	prices at:'9780735619654' put: 34900.
	prices at:'9780321146533' put: 29100.
	
	"tusLibrosSystemAcceptNone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'}                    andAnAuthenticator: (AuthenticatorSystemStub behavingLike: [ :clientId :password | ^self error:  'Can not log in with an unregistered user'])."
	
	tusLibrosSystemAcceptNone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} anAuthenticator: (AuthenticatorSystemStub behavingLike: [ :clientId :password | ^self error:  'Can not log in with an unregistered user']) andAMerchantProcessor: (MerchantProcessorStub withResponseClosure: [true]) withAClock: (ClockReal new) withPrices: prices.
	
	self raise: Error
		whenEvaluates: [tusLibrosSystemAcceptNone createCartForUser: 'carlos' withPassword: '123']
		andExecute: [:anError |
			self assert: anError messageText equals: 'Can not log in with an unregistered user'.
		].
	
! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/26/2025 15:21:25'!
test10canNotLogInWithAnIncorrectPassword
	|prices|
	
	prices := Dictionary new. 
	prices at:'9780321278654' put: 45305.
	prices at:'9780137314942' put: 31505.
	prices at:'9780201710915' put: 45180.
	prices at:'9780321125217' put: 41000.
	prices at:'9780735619654' put: 34900.
	prices at:'9780321146533' put: 29100.
	
	"tusLibrosSystemAcceptNone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'}                    andAnAuthenticator: (AuthenticatorSystemStub behavingLike: [ :clientId :password | ^self error:  'Incorrect password'])."
	
	tusLibrosSystemAcceptNone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} anAuthenticator: (AuthenticatorSystemStub behavingLike: [ :clientId :password | ^self error:  'Incorrect password']) andAMerchantProcessor: (MerchantProcessorStub withResponseClosure: [true]) withAClock: (ClockReal new) withPrices: prices.

	self raise: Error
		whenEvaluates: [tusLibrosSystemAcceptNone createCartForUser: 'juan' withPassword: 'password']
		andExecute: [:anError |
			self assert: anError messageText equals: 'Incorrect password'.
		].
	! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/24/2025 14:39:50'!
test11ALogedUserCanCheckOutItsCart

	| result |
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	tusLibrosSystemAcceptEveryone addBook: '9780137314942' with: 1 to: 'juan'.
	
	result := tusLibrosSystemAcceptEveryone checkOutCartOfUser: 'juan' usingCardWithNumber: 123456789 withExpirationDate: '122027' withOwner: 'juan'.
	
	self assert: (tusLibrosSystemAcceptEveryone listCart: 'juan') isEmpty.
	self assert: result equals: 1234! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/24/2025 14:39:51'!
test12CanNotCheckOutIfTheUserIsNotLoged

	self raise: Error
		whenEvaluates: [ tusLibrosSystemAcceptEveryone checkOutCartOfUser: 'juan' usingCardWithNumber: 123456789 withExpirationDate: '122027' withOwner: 'juan' ]
		andExecute: [ :anError |
			self assert: anError messageText equals: tusLibrosSystemAcceptEveryone canNotCheckOutIfTheUserIsNotLogedErrorMessage
		]! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/17/2025 20:18:41'!
test13CanNotListAnExpiredCart
	
	| result |
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	result := tusLibrosSystemAcceptEveryone listCart: 'juan'.
	
	clock passTime.
	
	self raise: Error
		 whenEvaluates: [ tusLibrosSystemAcceptEveryone listCart: 'juan']
		 andExecute: [ :anException |
			
			self assert: result equals: Dictionary new.
			self assert: anException messageText equals: tusLibrosSystemAcceptEveryone canNotListACartIfHisSessionExpiredErrorMessage.
			
		]! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'F12 6/17/2025 20:21:57'!
test14CanNotAddABookToAnExpiredCart

	| result |
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	tusLibrosSystemAcceptEveryone addBook: '9780321278654' with: 1 to: 'juan'.
	
	result := tusLibrosSystemAcceptEveryone listCart: 'juan'.
	
	clock passTime.
	
	self raise: Error
		 whenEvaluates: [ tusLibrosSystemAcceptEveryone addBook: '9780321278654' with: 1 to: 'juan' ]
		 andExecute: [ :anException |
			
			self assert: result equals: (Dictionary with: ('9780321278654'->1)).
			self assert: anException messageText equals: tusLibrosSystemAcceptEveryone canNotAddABookToAnExpiredCartErrorMessage.
			
		]! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/24/2025 14:39:51'!
test15CanNotCheckOutAnExpiredCart
	
	| result |
	
	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	tusLibrosSystemAcceptEveryone addBook: '9780321278654' with: 1 to: 'juan'.
	
	result := tusLibrosSystemAcceptEveryone listCart: 'juan'.
	
	clock passTime.
	
	self raise: Error
		 whenEvaluates: [ tusLibrosSystemAcceptEveryone checkOutCartOfUser: 'juan' usingCardWithNumber: 123456789 withExpirationDate: '102030' withOwner: 'juan' ]
		 andExecute: [ :anException |
			
			self assert: result equals: (Dictionary with: ('9780321278654'->1)).
			self assert: anException messageText equals: tusLibrosSystemAcceptEveryone canNotCheckOutAnExpiredCartErrorMessage.
			
		]! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/24/2025 16:14:21'!
test16ListOfPurchasesIsEmptyIfUserDidNotPurchaseAnyBook

	| listOfPurchases |

	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	
	listOfPurchases := tusLibrosSystemAcceptEveryone listPurchasesFromUser: 'juan' withPassword: 1234.
	
	self assert: listOfPurchases equals: Bag new! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/24/2025 16:15:38'!
test17ListOfPurchasesShowsPurchaseHistoryAfterTwoPurchases

	| listOfPurchases |

	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	tusLibrosSystemAcceptEveryone addBook: '9780201710915' with: 2 to: 'juan'. 
	tusLibrosSystemAcceptEveryone checkOutCartOfUser: 'juan' usingCardWithNumber: 123456789 withExpirationDate: '122027' withOwner: 'juan'. 
	

	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	tusLibrosSystemAcceptEveryone addBook: '9780321278654' with: 1 to: 'juan'. 
	tusLibrosSystemAcceptEveryone checkOutCartOfUser: 'juan' usingCardWithNumber: 123456789 withExpirationDate: '122027' withOwner: 'juan'. 

	tusLibrosSystemAcceptEveryone createCartForUser: 'juan' withPassword: '1234'. 
	tusLibrosSystemAcceptEveryone addBook: '9780735619654' with: 1 to: 'juan'. 
	tusLibrosSystemAcceptEveryone checkOutCartOfUser: 'juan' usingCardWithNumber: 123456789 withExpirationDate: '122027' withOwner: 'juan'. 
	
	
	listOfPurchases := tusLibrosSystemAcceptEveryone listPurchasesFromUser: 'juan' withPassword: '1234'.
	
	self assert: (listOfPurchases occurrencesOf: '9780201710915') = 2.
	self assert: (listOfPurchases occurrencesOf: '9780321278654') = 1.
	self assert: (listOfPurchases occurrencesOf: '9780735619654') = 1.
	self assert: listOfPurchases size = 4.

	
	"self assert: listOfPurchases equals: (OrderedCollection with:'9780201710915' with:'9780321278654' with:'9780735619654')"! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/26/2025 15:21:42'!
test18CanNotAccessAPurchaseHistoryOfAnUnregisteredUser
	
	|prices|
	
	prices := Dictionary new. 
	prices at:'9780321278654' put: 45305.
	prices at:'9780137314942' put: 31505.
	prices at:'9780201710915' put: 45180.
	prices at:'9780321125217' put: 41000.
	prices at:'9780735619654' put: 34900.
	prices at:'9780321146533' put: 29100.
	
	tusLibrosSystemAcceptNone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} anAuthenticator: (AuthenticatorSystemStub behavingLike: [ :clientId :password | ^self error:  'Can not log in with an unregistered user']) andAMerchantProcessor: (MerchantProcessorStub withResponseClosure: [true]) withAClock: (ClockReal new) withPrices: prices.
	
	self raise: Error
		whenEvaluates: [tusLibrosSystemAcceptNone listPurchasesFromUser: 'carlos' withPassword: '123']
		andExecute: [:anError |
			self assert: anError messageText equals: 'Can not log in with an unregistered user'.
		].

	! !

!TusLibrosSystemTest methodsFor: 'tests' stamp: 'ER 6/26/2025 15:21:56'!
test19CanNotAccessAPurchaseHistoryWithAnIncorrectPassword
	
	|prices|
	
	prices := Dictionary new. 
	prices at:'9780321278654' put: 45305.
	prices at:'9780137314942' put: 31505.
	prices at:'9780201710915' put: 45180.
	prices at:'9780321125217' put: 41000.
	prices at:'9780735619654' put: 34900.
	prices at:'9780321146533' put: 29100.
	
	tusLibrosSystemAcceptNone := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} anAuthenticator: (AuthenticatorSystemStub behavingLike: [ :clientId :password | ^self error:  'Incorrect password']) andAMerchantProcessor: (MerchantProcessorStub withResponseClosure: [true]) withAClock: (ClockReal new) withPrices: prices.
	
	
	self raise: Error
		whenEvaluates: [tusLibrosSystemAcceptNone listPurchasesFromUser: 'juan' withPassword: '123']
		andExecute: [:anError |
			self assert: anError messageText equals: 'Incorrect password'.
		].
	! !
!classDefinition: #AuthenticatorSystem category: #'TusLibros-Model'!
Object subclass: #AuthenticatorSystem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!AuthenticatorSystem methodsFor: 'authentication' stamp: 'F12 6/10/2025 19:51:49'!
authenticate: aUserId withPassword: aPassword

	self subclassResponsibility.! !


!classDefinition: #AuthenticatorSystemReal category: #'TusLibros-Model'!
AuthenticatorSystem subclass: #AuthenticatorSystemReal
	instanceVariableNames: 'registeredUsers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!AuthenticatorSystemReal methodsFor: 'initialization' stamp: 'F12 6/10/2025 19:55:34'!
initialize

	registeredUsers := (Dictionary new add: ('juan'->'1234'); add: ('pedro'->'123');yourself)! !


!AuthenticatorSystemReal methodsFor: 'authentication' stamp: 'F12 6/10/2025 19:59:59'!
authenticate: aUserId withPassword: aPassword

	(registeredUsers includesKey: aUserId) ifFalse: [ ^self error: self canNotLogInWithAnUnregisteredUserErrorMessage ].
	((registeredUsers at: aUserId) = aPassword) ifFalse: [ ^self error: self incorrectPasswordErrorMessage ].
! !

!AuthenticatorSystemReal methodsFor: 'authentication' stamp: 'F12 6/10/2025 19:58:38'!
canNotLogInWithAnUnregisteredUserErrorMessage

	^'Can not log in with an unregistered user'! !

!AuthenticatorSystemReal methodsFor: 'authentication' stamp: 'F12 6/10/2025 19:59:01'!
incorrectPasswordErrorMessage

	^'Incorrect password'! !


!classDefinition: #AuthenticatorSystemStub category: #'TusLibros-Model'!
AuthenticatorSystem subclass: #AuthenticatorSystemStub
	instanceVariableNames: 'authBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!AuthenticatorSystemStub methodsFor: 'authentication' stamp: 'F12 6/10/2025 19:31:53'!
authenticate: aUserId withPassword: aPassword

	^authBehaviour value: aUserId value: aPassword ! !

!AuthenticatorSystemStub methodsFor: 'authentication' stamp: 'F12 6/10/2025 16:50:03'!
behaveLike: aBehaviour

	authBehaviour := aBehaviour ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AuthenticatorSystemStub class' category: #'TusLibros-Model'!
AuthenticatorSystemStub class
	instanceVariableNames: ''!

!AuthenticatorSystemStub class methodsFor: 'instance creation' stamp: 'F12 6/10/2025 16:47:42'!
behavingLike: aBehaviour

	^self new behaveLike: aBehaviour ! !

!AuthenticatorSystemStub class methodsFor: 'instance creation' stamp: 'F12 6/10/2025 16:46:38'!
bypassingAllUsers

	^self behavingLike: [ :clientId :password | ]! !


!classDefinition: #Card category: #'TusLibros-Model'!
Object subclass: #Card
	instanceVariableNames: 'cardNumber expirationDate cardOwner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Card methodsFor: 'initialization' stamp: 'F12 6/15/2025 14:09:46'!
initializeWithNumber: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner

	cardNumber := aCardNumber.
	cardOwner := aCardOwner.
	expirationDate := anExpirationDate.! !


!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 23:01:27'!
cardNumber

	^cardNumber ! !

!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 23:02:03'!
cardOwner

	^cardOwner ! !

!Card methodsFor: 'accessing' stamp: 'ER 6/8/2025 23:02:09'!
expirationDate

	^expirationDate ! !

!Card methodsFor: 'accessing' stamp: 'F12 6/15/2025 14:05:43'!
hasAValidNumber

	^(cardNumber isNumber)! !

!Card methodsFor: 'accessing' stamp: 'F12 6/15/2025 13:43:21'!
hasAnEmptyName

	^(cardOwner isEmpty)! !

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

!classDefinition: 'Card class' category: #'TusLibros-Model'!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'instance creation' stamp: 'ER 6/8/2025 19:51:52'!
withNumber: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner

	^self new initializeWithNumber: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner.! !


!classDefinition: #Cart category: #'TusLibros-Model'!
Object subclass: #Cart
	instanceVariableNames: 'catalog contents totalAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

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

!Cart methodsFor: 'updating' stamp: 'F12 6/15/2025 13:29:20'!
emptyContents

	contents := Bag new! !


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

!classDefinition: 'Cart class' category: #'TusLibros-Model'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'F12 6/1/2025 20:00:43'!
withCatalog: aCatalog

	^self new initializeWith: aCatalog! !


!classDefinition: #Cashier category: #'TusLibros-Model'!
Object subclass: #Cashier
	instanceVariableNames: 'sellsBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Cashier methodsFor: 'checkOut' stamp: 'F12 6/17/2025 19:09:04'!
checkOut: aCart Of: aUserId using: aCard with: aTransactionNumber whichIsValidatedBy: aMerchantProcessor

	| transactionAmount validatedTransaction |

	(aCard hasValidExpirationDate) ifFalse: [^self error: self invalidExpirationDateErrorMessage].

	(aCard isExpired) ifTrue: [ ^self error: self canNotCheckOutWithAnExpiredCardErrorMessage ].
	
	(aCart isEmpty) ifTrue: [^self error: self canNotCheckOutWithAnEmptyCartErrorMessage ].
			
	transactionAmount := aCart totalAmount.
	
	validatedTransaction := aMerchantProcessor makeDebitForCard: (aCard cardNumber) withExpirationDate: (aCard expirationDate) withCardOwner:  (aCard cardOwner) withTransactionAmount: transactionAmount.
	
	(validatedTransaction) ifTrue: [
		aCart emptyContents.
		sellsBook add: aTransactionNumber.
		^aTransactionNumber.
	].

	^self error: self merchantProcessorFailedErrorMessage ! !


!Cashier methodsFor: 'error messages' stamp: 'F12 6/10/2025 18:48:24'!
canNotCheckOutWithAnEmptyCartErrorMessage
	
	^'can not checkout with an empty cart.'! !

!Cashier methodsFor: 'error messages' stamp: 'F12 6/10/2025 18:47:47'!
canNotCheckOutWithAnExpiredCardErrorMessage

	^'Can not checkout with an expired card.'! !

!Cashier methodsFor: 'error messages' stamp: 'F12 6/10/2025 18:47:13'!
invalidExpirationDateErrorMessage

	^'Invalid expiration date.'! !

!Cashier methodsFor: 'error messages' stamp: 'F12 6/15/2025 12:49:40'!
merchantProcessorFailedErrorMessage

	^'Can not complete transaction: Merchant Processor failed.'! !


!Cashier methodsFor: 'initialization' stamp: 'F12 6/16/2025 16:12:53'!
initialize

	sellsBook := OrderedCollection new.
	
	! !


!Cashier methodsFor: 'accessing' stamp: 'F12 6/10/2025 18:43:57'!
sellsBook

	^sellsBook copy! !


!classDefinition: #Clock category: #'TusLibros-Model'!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!Clock methodsFor: 'validations' stamp: 'F12 6/17/2025 20:35:59'!
isSessionExpiredOfACartCreatedAt: aTimeOfCreation

	self subclassResponsibility.! !


!classDefinition: #ClockReal category: #'TusLibros-Model'!
Clock subclass: #ClockReal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!ClockReal methodsFor: 'validations' stamp: 'ER 6/24/2025 12:54:17'!
isSessionExpiredOfACartCreatedAt: aTimeOfCreation
	|now|

	now  := GregorianDateTime now.


	^(aTimeOfCreation distanceTo: now) > (1800000 * millisecond)! !


!classDefinition: #ClockStub category: #'TusLibros-Model'!
Clock subclass: #ClockStub
	instanceVariableNames: 'closure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!ClockStub methodsFor: 'initialization' stamp: 'F12 6/17/2025 19:41:09'!
initializeWith: aClosure 
	
	closure := aClosure.! !


!ClockStub methodsFor: 'validation' stamp: 'F12 6/17/2025 20:34:44'!
isSessionExpiredOfACartCreatedAt: aTimeOfCreation

	^closure value! !


!ClockStub methodsFor: 'updating' stamp: 'F12 6/17/2025 20:13:10'!
passTime
	
	closure := [true]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ClockStub class' category: #'TusLibros-Model'!
ClockStub class
	instanceVariableNames: ''!

!ClockStub class methodsFor: 'instance creation' stamp: 'F12 6/17/2025 19:40:44'!
withResponseClosure: aClosure 
	
	^self new initializeWith: aClosure ! !


!classDefinition: #MerchantProcessor category: #'TusLibros-Model'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!MerchantProcessor methodsFor: 'validation' stamp: 'F12 6/16/2025 19:54:28'!
makeDebitForCard: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner withTransactionAmount: aTransactionAmount

	self subclassResponsibility.! !


!classDefinition: #MerchantProcessorReal category: #'TusLibros-Model'!
MerchantProcessor subclass: #MerchantProcessorReal
	instanceVariableNames: 'invalidNumberCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!MerchantProcessorReal methodsFor: 'initialization' stamp: 'F12 6/17/2025 18:44:45'!
initialize

	invalidNumberCard := 1111	
	 ! !


!MerchantProcessorReal methodsFor: 'operations' stamp: 'F12 6/17/2025 19:03:31'!
makeDebitForCard: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner withTransactionAmount: aTransactionAmount

	(aCardNumber = invalidNumberCard) ifTrue: [ ^self error: self theValidationOfCardFailedErrorMessage ].
	
	^true	! !


!MerchantProcessorReal methodsFor: 'error messages' stamp: 'F12 6/17/2025 18:47:41'!
theValidationOfCardFailedErrorMessage

	^'invalid card'! !


!classDefinition: #MerchantProcessorStub category: #'TusLibros-Model'!
MerchantProcessor subclass: #MerchantProcessorStub
	instanceVariableNames: 'responseClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!MerchantProcessorStub methodsFor: 'initialization' stamp: 'ER 6/8/2025 20:39:18'!
initializeWithResponseClosure: aClosure

	responseClosure := aClosure! !


!MerchantProcessorStub methodsFor: 'operations' stamp: 'ER 6/8/2025 22:57:40'!
makeDebitForCard: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner withTransactionAmount: aTransactionAmount

	^responseClosure value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorStub class' category: #'TusLibros-Model'!
MerchantProcessorStub class
	instanceVariableNames: ''!

!MerchantProcessorStub class methodsFor: 'initialization' stamp: 'ER 6/8/2025 20:38:29'!
withResponseClosure: aClosure

	^self new initializeWithResponseClosure: aClosure.! !


!classDefinition: #TusLibrosInnerInterface category: #'TusLibros-Model'!
Object subclass: #TusLibrosInnerInterface
	instanceVariableNames: 'system httpResponse'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosInnerInterface methodsFor: 'initialization' stamp: 'F12 6/10/2025 20:25:41'!
initializeWith: aTusLibrosSystem
	
	system := aTusLibrosSystem.
	
	httpResponse := (Dictionary new add: #status->nil; add: #body->nil;yourself)! !


!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/17/2025 15:25:04'!
sendResponseForACheckOutCartWithAnInvalidCardNumber

	^httpResponse at: #status put: 400;
				     at: #body put: '1|the card does not have a valid number';
				     yourself
! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/17/2025 15:20:46'!
sendResponseForACheckOutCartWithAnInvalidExpirationDate

	^httpResponse at: #status put: 400;
				     at: #body put: '1|the card does not have a valid expiration date';
				     yourself
! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/17/2025 15:19:09'!
sendResponseForACheckOutCartWithAnInvalidOwnerName

	^httpResponse at: #status put: 400;
				     at: #body put: '1|the card does not have a valid owner name';
				     yourself
! !

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

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'ER 6/26/2025 15:32:29'!
sendResponseForAListPurchases: aBagOfPurchases withAmount: anAmount
	| stream |

	stream := String new writeStream.
	stream nextPutAll: '0'.
	(aBagOfPurchases contents) keysAndValuesDo: [:key :value |
	    stream nextPut: $|.
	    stream nextPutAll: key asString.
	    stream nextPut: $|.
	    stream nextPutAll: value asString.
	].


	stream nextPut: $|.
	stream nextPutAll: anAmount asString .  
	

	^httpResponse at: #status put: 200;
				     at: #body put: (stream contents);
				     yourself.
				
				
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

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/17/2025 15:28:22'!
sendSuccessfulResponseForCheckOutCartWith: aTransactionId

	^httpResponse at: #status put: 200;
				     at: #body put: '0|', (aTransactionId asString);
				     yourself! !

!TusLibrosInnerInterface methodsFor: 'private - double dispatch' stamp: 'F12 6/10/2025 20:31:03'!
sendSuccessfulResponseForCreateCartFor: aUserId with: aPassword

	system createCartForUser: aUserId withPassword: aPassword. 

	^httpResponse at: #status put: 201;
				     at: #body put: '0|OK';
				     yourself! !


!TusLibrosInnerInterface methodsFor: 'validations' stamp: 'F12 6/15/2025 21:59:20'!
isACardNumberWithOnlyNumbers: aCardNumber

	| onlyDigits |
	
	onlyDigits := aCardNumber allSatisfy: [ :ch | ch isDigit ].
	
	^onlyDigits ! !

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

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'F12 6/17/2025 15:40:59'!
checkOutCart: aHttpRequest

	| userId cardNumberString cardNumber cardExpirationDate cardOwner |
	
	userId := aHttpRequest at: 'userId'.
	cardNumberString := aHttpRequest at: 'ccn'.
	cardExpirationDate := aHttpRequest at: 'cced'.
	cardOwner := aHttpRequest at: 'cco'.
	
	(self isACardNumberWithOnlyNumbers: cardNumberString) ifFalse: [ ^self sendResponseForACheckOutCartWithAnInvalidCardNumber ].
		
	(cardExpirationDate isString) ifFalse: [ ^self sendResponseForACheckOutCartWithAnInvalidExpirationDate ].
	
	(cardOwner isString) ifFalse: [ ^self sendResponseForACheckOutCartWithAnInvalidOwnerName ].
	
	cardNumber := (cardNumberString asNumber).
	
	^self tryToCheckOutACartWith: userId usingACardWith: cardNumber whichHas: cardExpirationDate and: cardOwner 
! !

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'F12 6/10/2025 20:31:35'!
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
	
	^self sendSuccessfulResponseForCreateCartFor: userId 	with: userPassword ! !

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'F12 6/6/2025 19:44:40'!
listCart: aHttpRequest 

	| userId userCart |
	
	userId := aHttpRequest at: 'userId'.
	
	[ userCart := system listCart: userId ]
	on: Error - MessageNotUnderstood 
	do: [ :anError | ^self sendResponseForAListCartWithAnNonExistsAccount ].
	
	(userCart isEmpty) ifTrue: [ ^self sendResponseForAListEmptyCart ].
	
	^self sendResponseForAListCartWithElements: userCart ! !

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'ER 6/24/2025 17:03:35'!
listPurchases: aHttpRequest 

	| userId userPassword bagOfPurchases anAmount|
	
	userId := aHttpRequest at: 'userId'.
	userPassword := aHttpRequest at: 'password'.
	
	(userId isEmpty) ifTrue: [ ^self sendResponseForAnOperationWithAnEmptyUserId ].
	(userPassword isEmpty) ifTrue: [ ^self sendResponseForAnOperationWithAnEmptyUserPassword ].
	
	[ bagOfPurchases := system listPurchasesFromUser: userId withPassword: userPassword]
	on: Error - MessageNotUnderstood 
	do: [ :anError | 
		
		^Dictionary new
		at: #status put: 422;
		at: #body put: ('1|', anError messageText);
		yourself
		
		].
	anAmount := system totalAmountOf: userId .
	^self sendResponseForAListPurchases: bagOfPurchases withAmount: anAmount! !

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

!TusLibrosInnerInterface methodsFor: 'operations' stamp: 'ER 6/24/2025 14:39:51'!
tryToCheckOutACartWith: aUserId usingACardWith: aCardNumber whichHas: anExpirationDate and: aCardOwner

	| transactionId |

	[ transactionId := system checkOutCartOfUser: aUserId usingCardWithNumber: aCardNumber withExpirationDate: anExpirationDate withOwner: aCardOwner ]
		on: Error  
		do: [ :anError | ^(Dictionary new add: 'status'->422; add: 'body'->('1|', (anError messageText));yourself)  ].
		
	^self sendSuccessfulResponseForCheckOutCartWith: transactionId ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosInnerInterface class' category: #'TusLibros-Model'!
TusLibrosInnerInterface class
	instanceVariableNames: ''!

!TusLibrosInnerInterface class methodsFor: 'instance creation' stamp: 'F12 6/10/2025 20:24:15'!
for: aTusLibrosSystem

	^self new initializeWith: aTusLibrosSystem ! !


!classDefinition: #TusLibrosOuterInterface category: #'TusLibros-Model'!
Object subclass: #TusLibrosOuterInterface
	instanceVariableNames: 'server innerInterface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosOuterInterface methodsFor: 'initialization' stamp: 'F12 6/10/2025 20:23:13'!
initializeListeningOn: aPort

	self startServerOn: aPort.
	innerInterface := TusLibrosInnerInterface for: (self configureSystem).
	self registerServices.! !


!TusLibrosOuterInterface methodsFor: 'operations' stamp: 'ER 6/26/2025 15:19:50'!
configureSystem

	| tusLibrosSystem prices |
	
	"tusLibrosSystem := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} andAnAuthenticator: (AuthenticatorSystemReal new)."
	prices := Dictionary new. 
	prices at:'9780321278654' put: 45305.
	prices at:'9780137314942' put: 31505.
	prices at:'9780201710915' put: 45180.
	prices at:'9780321125217' put: 41000.
	prices at:'9780735619654' put: 34900.
	prices at:'9780321146533' put: 29100.
	
	
	tusLibrosSystem := TusLibrosSystem withCatalog: {'9780321278654'. '9780137314942'. '9780201710915'. '9780321125217'. '9780321146533'. '9780735619654'} anAuthenticator: (AuthenticatorSystemReal new) andAMerchantProcessor: (MerchantProcessorReal new) withAClock: (ClockReal new) withPrices: prices.


	^tusLibrosSystem 

	

	! !

!TusLibrosOuterInterface methodsFor: 'operations' stamp: 'F12 6/17/2025 15:47:06'!
processRequestAnObtainHisParts: aRequest

	| request query queryElements |

	request := aRequest rawUrl.
		
	query := (request subStrings: '?')
              at: 2
              ifAbsent: [ '' ].

	queryElements := query subStrings: '&='.
	
	^queryElements ! !

!TusLibrosOuterInterface methodsFor: 'operations' stamp: 'ER 6/24/2025 16:26:55'!
registerServices

	| queryElements |
	
	server addService: '/createCart' action: [ : aRequest | 	
		
		queryElements := self processRequestAnObtainHisParts: aRequest.	
		
		self send: [ :aDictionary | innerInterface createCart: aDictionary ] using: (Dictionary new add: 'userId'->(queryElements at: 2); add: 'password'->(queryElements at: 4);yourself) withPartsOfRequestAndReturnResponseTo: aRequest 
		
	].

	server addService: '/addToCart' action: [ : aRequest | 	
		
		queryElements := self processRequestAnObtainHisParts: aRequest.	
		
		self send: [ :aDictionary | innerInterface addToCart: aDictionary ] using: (Dictionary new add: 'userId'->(queryElements at: 6); add: 'bookIsbn'->(queryElements at: 2); add: 'bookQuantity'->(queryElements at: 4);yourself) withPartsOfRequestAndReturnResponseTo: aRequest
		 
	].

	server addService: '/listCart' action: [ : aRequest |  	
		
		queryElements := self processRequestAnObtainHisParts: aRequest.		
		
		self send: [ :aDictionary | innerInterface listCart: aDictionary ] using: (Dictionary new add: 'userId'->(queryElements at: 2);yourself) withPartsOfRequestAndReturnResponseTo: aRequest 

	].

	server addService: '/checkOutCart' action: [ : aRequest |
		
		queryElements := self processRequestAnObtainHisParts: aRequest.		
		
		((queryElements size) = 4) ifTrue: [ aRequest sendResponseCode: 400 content: '1|can not check out with a card that does not have a name and a number'  type: 'text/plain; charset=utf-8' do: [ : aWebServerResponse | ] ].
		
		((queryElements size) = 6) ifTrue: [
			((queryElements at: 3) ~= 'ccn') ifTrue: [ aRequest sendResponseCode: 400 content: '1|can not check out with a card that does not have a number'  type: 'text/plain; charset=utf-8' do: [ : aWebServerResponse | ] ]  ifFalse: [ aRequest sendResponseCode: 400 content: '1|can not check out with a card that does not have a name'  type: 'text/plain; charset=utf-8' do: [ : aWebServerResponse | ]
			]
		].
		
		((queryElements size) = 8) ifTrue: [
			
			self send: [ :aDictionary | innerInterface checkOutCart: aDictionary ] using: (Dictionary new add: 'userId'->(queryElements at: 2); add: 'ccn'->(queryElements at: 4); add: 'cced'->(queryElements at: 6); add: 'cco'->(queryElements at: 8);yourself) withPartsOfRequestAndReturnResponseTo: aRequest 
			
		].
	
	].

	server addService: '/listPurchases' action: [ : aRequest |
		
		queryElements := self processRequestAnObtainHisParts: aRequest.		
		
		self send: [ :aDictionary | innerInterface listPurchases: aDictionary ] using: (Dictionary new add: 'userId'->(queryElements at: 2); add: 'password'->(queryElements at: 4);yourself) withPartsOfRequestAndReturnResponseTo: aRequest  
	]
! !

!TusLibrosOuterInterface methodsFor: 'operations' stamp: 'F12 6/17/2025 16:01:11'!
send: aClosureWithOperation using: aDictionary withPartsOfRequestAndReturnResponseTo: aRequest

	| response |

	response := aClosureWithOperation value: aDictionary.
	^aRequest sendResponseCode: (response at: #status) content: (response at: #body) type: 'text/plain; charset=utf-8' do: [ : aWebServerResponse | ].! !

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

!classDefinition: 'TusLibrosOuterInterface class' category: #'TusLibros-Model'!
TusLibrosOuterInterface class
	instanceVariableNames: ''!

!TusLibrosOuterInterface class methodsFor: 'instance creation' stamp: 'F12 6/4/2025 16:19:04'!
listeningOn: aPort
	^ self new initializeListeningOn: aPort! !


!classDefinition: #TusLibrosSystem category: #'TusLibros-Model'!
Object subclass: #TusLibrosSystem
	instanceVariableNames: 'usersCarts catalog authenticatorSystem cashier merchantProcessor clock cartsCreated usersPurchasesAmount sellsBook currentPurchase prices totalPaidPerUser currentAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Model'!

!TusLibrosSystem methodsFor: 'operations' stamp: 'ER 6/26/2025 15:17:40'!
checkOutCartOfUser: aUserId usingCardWithNumber: aCardNumber withExpirationDate: anExpirationDate withOwner: aCardOwner 

	| card result userCart cartTimeOfCreation |
	
	(usersCarts includesKey: aUserId) ifFalse: [ ^self error: self canNotCheckOutIfTheUserIsNotLogedErrorMessage ].
	
	card := Card withNumber: aCardNumber withExpirationDate: anExpirationDate withCardOwner: aCardOwner.
	
	userCart := (usersCarts at: aUserId).
	cartTimeOfCreation := cartsCreated at: userCart.
	(clock isSessionExpiredOfACartCreatedAt: cartTimeOfCreation ) ifTrue: [ ^self error: self canNotCheckOutAnExpiredCartErrorMessage ].
	
	result := cashier checkOut: userCart Of: aUserId using: card with: 1234 whichIsValidatedBy: merchantProcessor.

	
	(usersPurchasesAmount includesKey: aUserId) ifTrue: [usersPurchasesAmount at: aUserId put: ((usersPurchasesAmount at: aUserId)+1)].
	(usersPurchasesAmount includesKey: aUserId) ifFalse: [		usersPurchasesAmount add: (aUserId -> 1)].
	
	self addPurchaseToSellsBookFromUser: aUserId.
	
	self updatePaidPerUserFor: aUserId.
	
	"currentAmount := 0".

	^result

	! !

!TusLibrosSystem methodsFor: 'operations' stamp: 'ER 6/24/2025 12:40:09'!
listCart: aUserId

	| cart cartItems cartTimeOfCreation |
	
	(usersCarts includesKey: aUserId) ifFalse: [ ^self error: self canNotListAnNonExistsCartErrorMessage ].
	cart := usersCarts at: aUserId.
	cartItems := cart contents.
	cartTimeOfCreation := cartsCreated at: cart.
	
	(clock isSessionExpiredOfACartCreatedAt: cartTimeOfCreation ) ifTrue: [ ^self error: self canNotListACartIfHisSessionExpiredErrorMessage ].
	
	^cartItems contents! !


!TusLibrosSystem methodsFor: 'updating' stamp: 'ER 6/26/2025 15:28:38'!
addBook: aBook with: aNumberOfCopies to: aUserId 
	|cartTimeOfCreation selectedCart|		
	(usersCarts includesKey: aUserId) ifFalse: [ ^self error: self canNotAddABookToAnNonExistsCartErrorMessage ].
	selectedCart := usersCarts at: aUserId.
	
	cartTimeOfCreation := cartsCreated at: selectedCart.
	
	(clock isSessionExpiredOfACartCreatedAt: cartTimeOfCreation )  ifTrue: [ ^self error: self canNotAddABookToAnExpiredCartErrorMessage ].
	
	aNumberOfCopies timesRepeat: [currentPurchase add: aBook ].
	aNumberOfCopies timesRepeat: [currentAmount := currentAmount + (prices at: aBook) ].
	
	
	^selectedCart addBook: aBook with: aNumberOfCopies 
	
	! !


!TusLibrosSystem methodsFor: 'initialization' stamp: 'ER 6/24/2025 17:00:55'!
initializeWithCatalog: aCatalog anAuthenticator: anAuthenticator andAMerchantProcessor: aMerchantProcessor withAClock: aClock withPrices: aDictionaryOfPrices 
	
	currentAmount := 0.
		prices := aDictionaryOfPrices .
	
	catalog := aCatalog.
	usersCarts := Dictionary new.
	cashier := Cashier new.
	authenticatorSystem := anAuthenticator.
	merchantProcessor := aMerchantProcessor.
	clock := aClock.
	
	cartsCreated := Dictionary new.
	
	usersPurchasesAmount := Dictionary new.
	
	sellsBook := Dictionary new.
	
	currentPurchase := OrderedCollection new.
	
	totalPaidPerUser:= Dictionary new.! !


!TusLibrosSystem methodsFor: 'error messages' stamp: 'F12 6/17/2025 20:02:14'!
canNotAddABookToAnExpiredCartErrorMessage

	^'can not add a book to an expired cart'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 22:51:13'!
canNotAddABookToAnNonExistsCartErrorMessage
	
	^'Can not add a book to a non existent cart.'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'F12 6/17/2025 20:26:24'!
canNotCheckOutAnExpiredCartErrorMessage

	^'can not check out an expired card'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'F12 6/15/2025 18:41:24'!
canNotCheckOutIfTheUserIsNotLogedErrorMessage

	^'can not check out if the user is not loged'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'F12 6/17/2025 19:54:43'!
canNotListACartIfHisSessionExpiredErrorMessage

	^'can not list a cart if his session expired'! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'ER 6/8/2025 22:51:03'!
canNotListAnNonExistsCartErrorMessage
	
	^'Can not list a non existent cart.'! !


!TusLibrosSystem methodsFor: 'logIn' stamp: 'ER 6/24/2025 12:30:01'!
createCartForUser: aUserId withPassword: aPassword

	| newCart cartCreationTime |
	
	authenticatorSystem authenticate: aUserId withPassword: aPassword.
	
	newCart := Cart withCatalog: catalog.
	
	cartCreationTime := GregorianDateTime now.
	
	cartsCreated add: (newCart -> cartCreationTime).
	
	
	usersCarts at: aUserId put: newCart.
	
	! !


!TusLibrosSystem methodsFor: 'accessing' stamp: 'ER 6/24/2025 16:14:14'!
listPurchasesFromUser: aUserId withPassword: aPassword

	authenticatorSystem authenticate: aUserId withPassword: aPassword.
	(sellsBook includesKey: aUserId) ifTrue: [^sellsBook at: aUserId].
	
	^Bag new
! !

!TusLibrosSystem methodsFor: 'accessing' stamp: 'ER 6/24/2025 17:05:11'!
totalAmountOf: aUserId
	(totalPaidPerUser includesKey: aUserId) ifTrue: [^totalPaidPerUser at: aUserId ].
	
	^0! !

!TusLibrosSystem methodsFor: 'accessing' stamp: 'F12 6/10/2025 14:19:59'!
userCartOf: aUserId

	^(usersCarts at: aUserId) copy! !


!TusLibrosSystem methodsFor: 'private' stamp: 'ER 6/24/2025 17:00:05'!
addPurchaseToSellsBookFromUser: aUserId


	(sellsBook includesKey: aUserId) ifTrue: [
		
		currentPurchase do: [ :element | ( sellsBook at: aUserId ) add: element].
	
	].
	(sellsBook includesKey: aUserId) ifFalse: [
	
		sellsBook add: (aUserId -> (Bag new)).
		currentPurchase do: [ :element | ( sellsBook at: aUserId ) add: element].
	
	].
! !

!TusLibrosSystem methodsFor: 'private' stamp: 'ER 6/24/2025 17:08:11'!
updatePaidPerUserFor: aUserId

	(totalPaidPerUser includesKey: aUserId ) ifFalse: [
		totalPaidPerUser at: aUserId put: currentAmount 
	].

	(totalPaidPerUser includesKey: aUserId) ifFalse: [
		totalPaidPerUser at: aUserId put: ((totalPaidPerUser at: aUserId) + currentAmount  )
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystem class' category: #'TusLibros-Model'!
TusLibrosSystem class
	instanceVariableNames: ''!

!TusLibrosSystem class methodsFor: 'instance creation' stamp: 'ER 6/24/2025 16:55:53'!
withCatalog: aCatalog anAuthenticator: anAuthenticator andAMerchantProcessor: aMerchantProcessor withAClock: aClock withPrices: aDictionaryOfPrices

	^self new initializeWithCatalog: aCatalog anAuthenticator: anAuthenticator andAMerchantProcessor: aMerchantProcessor withAClock: aClock withPrices: aDictionaryOfPrices ! !
