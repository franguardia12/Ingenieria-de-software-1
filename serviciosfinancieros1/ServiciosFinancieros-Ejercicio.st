!classDefinition: #BankTransferTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #BankTransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankTransferTest methodsFor: 'tests' stamp: 'F12 5/7/2025 00:13:24'!
test01AccountCanRealizeTransferIfHasEnoughMoney

	| issuingAccount receivingAccount bankTransfer |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: issuingAccount.
	
	bankTransfer := BankTransfer createWithAn: issuingAccount and: receivingAccount withAValueOf: 50 * peso.
	bankTransfer doTransfer.
	
		
	self assert: (issuingAccount balance) equals: 0 * peso.
	self assert: (receivingAccount balance) equals: 50 * peso.
	self assert: (issuingAccount transactions size) equals: 2.
	self assert: (receivingAccount transactions size) equals: 1.! !

!BankTransferTest methodsFor: 'tests' stamp: 'F12 5/7/2025 00:13:47'!
test02CantCreateANewTranferIfIssuingAccountHasNotEnoughFounds

	| issuingAccount receivingAccount |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	
	self should: [ BankTransfer createWithAn: issuingAccount and: receivingAccount withAValueOf: 50 * peso ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Issuing account doesnt have enough founds to transfer' ]! !

!BankTransferTest methodsFor: 'tests' stamp: 'F12 5/7/2025 00:14:28'!
test03CanAccessToTheValueOfATransfer

	| issuingAccount receivingAccount bankTransfer |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: issuingAccount.
	
	bankTransfer := BankTransfer createWithAn: issuingAccount and: receivingAccount withAValueOf: 50 * peso.
	bankTransfer doTransfer.
	
	self assert: bankTransfer amountOfMoney equals: 50 * peso! !

!BankTransferTest methodsFor: 'tests' stamp: 'F12 5/7/2025 00:14:48'!
test04CanAccessToTransferCounterpartInEveryLeg

	| issuingAccount receivingAccount bankTransfer |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: issuingAccount.
	
	bankTransfer := BankTransfer createWithAn: issuingAccount and: receivingAccount withAValueOf: 50 * peso.
	bankTransfer doTransfer.
	
	self assert: (bankTransfer extractionLeg) counterpart == bankTransfer depositLeg.
	self assert: (bankTransfer depositLeg) counterpart == bankTransfer extractionLeg	! !

!BankTransferTest methodsFor: 'tests' stamp: 'F12 5/13/2025 12:58:01'!
test05CantTransferAnAmountOfZero

	| issuingAccount receivingAccount |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: issuingAccount.
	
	self should: [ BankTransfer createWithAn: issuingAccount and: receivingAccount withAValueOf: 0 * peso]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'can not transfer an amount of zero' ]
	
! !

!BankTransferTest methodsFor: 'tests' stamp: 'F12 5/13/2025 13:00:17'!
test06CantTransferANegativeAmountOfMoney

	| issuingAccount receivingAccount |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: issuingAccount.
	
	self should: [ BankTransfer createWithAn: issuingAccount and: receivingAccount withAValueOf: -10 * peso]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'can not transfer a negative amount of money' ]
	
! !

!BankTransferTest methodsFor: 'tests' stamp: 'F12 5/13/2025 13:08:27'!
test07CantTransferMoneyToTheSameAccount

	| issuingAccount |
	
	issuingAccount := ReceptiveAccount new.
	Deposit register: 50 * peso on: issuingAccount.
	
	self should: [ BankTransfer createWithAn: issuingAccount and: issuingAccount withAValueOf: 50 * peso]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'can not transfer money to the same account' ]
	
! !


!classDefinition: #PortfolioTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'ER 5/8/2025 11:10:11'!
test01PortfolioHasZeroAsBalanceWhenCreated
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0! !

!PortfolioTest methodsFor: 'tests' stamp: 'ER 5/8/2025 11:12:41'!
test02PortfolioIncreasesBalanceWhenHasAccounts

	| account1 account2 portfolio |
		
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	Deposit register: 50 * peso on: account2.
	
	portfolio addElement: account1.
	portfolio addElement: account2.
	
	self assert: portfolio balance equals: 100 * peso! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/9/2025 13:17:44'!
test03NoAccountOnPortfolioHasRegisteredATransaction

	| account1 account2 portfolio deposit withdraw |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio addElement: account1.
	
	deposit := Deposit register: 100 * peso on: account2.
	withdraw := Withdraw register: 50 * peso on: account2.
	
	
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/9/2025 13:18:06'!
test04AnAccountOnPortfolioHasRegisteredATransaction

	| account1 account2 portfolio deposit withdraw |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio addElement: account1.
	portfolio addElement: account2.
	
	deposit := Deposit register: 100 * peso on: account1.
	withdraw := Withdraw register: 50 * peso on: account2.
	
	
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/13/2025 10:35:31'!
test05AskTransactionsOnPortfoliosAccount

	| portfolio account accountTransactions |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio addElement: account.
	
	accountTransactions := account transactions.
		
	self assert: (portfolio transactions) = accountTransactions 
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'ER 5/8/2025 12:28:42'!
test06PortfolioIncreasesBalanceWhenHasPortfolios
	
	| account1 account2 portfolio1 portfolio2 |
		
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	Deposit register: 50 * peso on: account2.
	
	portfolio2 addElement: account1.
	portfolio2 addElement: account2.
	
	portfolio1 addElement: portfolio2.
	
	self assert: portfolio1 balance equals: 100 * peso! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/9/2025 13:20:21'!
test07APortfolioOnPortfolioHasAccountsWithRegisteredTransactions

	| portfolio1 portfolio2 account deposit withdraw |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
	
	portfolio2 addElement: account.
	portfolio1 addElement: portfolio2.
	
	self assert: (portfolio1 hasRegistered: deposit).
	self assert: (portfolio1 hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/13/2025 10:35:47'!
test08AskTransactionsOnAPortfolioAddedToAnotherPortfolio

	| mainPortfolio subPortfolio account subPortfolioTransactions |
	
	mainPortfolio := Portfolio new.
	subPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	subPortfolio addElement: account.
	mainPortfolio addElement: subPortfolio.
		
	subPortfolioTransactions := (subPortfolio transactions).	
		
	self assert: (mainPortfolio transactions) = subPortfolioTransactions ! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/9/2025 13:28:49'!
test09PortfolioCantAddTheSameAccountTwice

	| mainPortfolio account |
	
	mainPortfolio := Portfolio new.
	account := ReceptiveAccount new.

	mainPortfolio addElement: account.
	
	self should: [ mainPortfolio addElement: account ] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: 'portfolio cant add the same account twice' ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/9/2025 13:36:41'!
test10PortfolioCantAddHimselfToHisAccounts

	| mainPortfolio |
	
	mainPortfolio := Portfolio new.
	
	self should: [ mainPortfolio addElement: mainPortfolio ] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: 'portfolio cant add himself to his accounts' ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/9/2025 13:47:25'!
test11PortfolioCantAddAnAccountThatItsAlreadyAddedToASubPortfolio

	| mainPortfolio subportfolio account |
	
	mainPortfolio := Portfolio new.
	subportfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	subportfolio addElement: account.
	mainPortfolio addElement: subportfolio.
	
	self should: [ mainPortfolio addElement: account ] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: 'the account its already added to a subportfolio' ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/9/2025 14:55:29'!
test12PortfolioCantAddASubPortfolioWhoHasAnAccountThatItsAlreadyAdded

	| mainPortfolio subportfolio account |
	
	mainPortfolio := Portfolio new.
	subportfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	mainPortfolio addElement: account.
	subportfolio addElement: account.
	
	self should: [ mainPortfolio addElement: subportfolio ] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: 'the portfolio has an account that was already added' ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'F12 5/13/2025 10:55:44'!
test13CantAddAnAccountToASubPortfolioIfAnyOfHisFathersAlreadyHasThatAccount

	| mainPortfolio subportfolio account |
	
	mainPortfolio := Portfolio new.
	subportfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	mainPortfolio addElement: account.
	mainPortfolio addElement: subportfolio.
	
	self should: [ subportfolio addElement: account ] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: 'the portfolio has a father who already added this account' ]! !


!classDefinition: #ReceptiveAccountTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ER 5/8/2025 11:15:57'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |

	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ER 5/8/2025 11:06:36'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions
	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ER 5/8/2025 11:06:25'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	
	deposit := Deposit register: 50 * peso on: account.
	
		
		
	self assert: 1 equals: account transactions size.
	
	self assert: (account transactions includes: deposit).! !


!classDefinition: #Account category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'F12 5/9/2025 11:33:29'!
balance

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'F12 5/9/2025 11:34:18'!
hasRegistered: aTransaction

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'F12 5/9/2025 11:34:41'!
transactions

	self subclassResponsibility.! !


!classDefinition: #InvalidPortfolio category: #'ServiciosFinancieros-Ejercicio'!
Account subclass: #InvalidPortfolio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!InvalidPortfolio methodsFor: 'accesing' stamp: 'F12 5/13/2025 13:25:07'!
balance

	^0! !

!InvalidPortfolio methodsFor: 'accesing' stamp: 'F12 5/13/2025 13:25:31'!
hasRegistered: aTransaction

	^false! !

!InvalidPortfolio methodsFor: 'accesing' stamp: 'F12 5/13/2025 13:26:59'!
includesThisElement: anElement

	^false! !

!InvalidPortfolio methodsFor: 'accesing' stamp: 'F12 5/13/2025 13:25:56'!
transactions

	^OrderedCollection new! !


!classDefinition: #Portfolio category: #'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts father'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'F12 5/13/2025 13:29:41'!
initialize

	accounts := OrderedCollection new.
	
	father := InvalidPortfolio new.! !


!Portfolio methodsFor: 'accessing' stamp: 'F12 5/9/2025 14:01:30'!
alreadyHas: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accessing' stamp: 'F12 5/9/2025 14:01:20'!
anySubPortfolioIncludes: anElement

	| currentAccount |
	
	1 to: accounts size do: [ :index |
		
		currentAccount := accounts at: index.
		
		(currentAccount isMemberOf: Portfolio) ifTrue: [
			
			(currentAccount alreadyHas: anElement) ifTrue: [ ^true ]
			
		]			
		
	].

	^false! !

!Portfolio methodsFor: 'accessing' stamp: 'F12 5/13/2025 10:32:34'!
balance

	| result |
	
	result := 0.
	
	1 to: accounts size do: [ :index |
		
		result := result + ((accounts at: index) balance)
		
	].

	^result! !

!Portfolio methodsFor: 'accessing' stamp: 'F12 5/13/2025 10:32:43'!
hasRegistered: aTransaction

	1 to: accounts size do: [ :index |
		
		((accounts at: index) hasRegistered: aTransaction) ifTrue: [^true].
		
	].
	
	^false! !

!Portfolio methodsFor: 'accessing' stamp: 'F12 5/13/2025 10:30:27'!
includesAnElementOf: anAccount

	1 to: accounts size do: [ :index |
		
		(anAccount isMemberOf: Portfolio) ifTrue: [
		
			(anAccount alreadyHas: (accounts at: index)) ifTrue: [ ^true ]		
		
		]
		
	].

	^false! !

!Portfolio methodsFor: 'accessing' stamp: 'F12 5/13/2025 13:34:53'!
includesThisElement: anElement

	(father includesThisElement: anElement) ifTrue: [ ^true ].

	((accounts includes: anElement) or: (self anySubPortfolioIncludes: anElement)) ifTrue: [ ^true ].

	^false! !

!Portfolio methodsFor: 'accessing' stamp: 'F12 5/9/2025 13:14:39'!
transactions

	| result |
	
	result := OrderedCollection new.
	
	1 to: accounts size do: [ :index |
		
		result addAllLast: ((accounts at: index) transactions) 
		
	].

	^result! !


!Portfolio methodsFor: 'updating' stamp: 'F12 5/13/2025 12:16:12'!
addElement: anElement

	(accounts includes: anElement) ifTrue: [ ^self error: self class portfolioCantAddTheSameAccountTwiceErrorMessage ].
	
	(anElement == self) ifTrue: [ ^self error: self class portfolioCantAddHimselfToHisAccountsErrorMessage ].
	
	(self anySubPortfolioIncludes: anElement) ifTrue: [ ^self error: self class portfolioCantAddAnAccountThatItsAlreadyAddedToASubPortfolioErrorMessage ].
	
	(self includesAnElementOf: anElement) ifTrue: [ ^self error: self class portfolioCantAddASubPortfolioWhoHasAnAccountThatItsAlreadyAddedErrorMessage ].
	
	(self includesThisElement: anElement) ifTrue: [ ^self error: self class cantAddAnAccountToASubPortfolioIfAnyOfHisFathersAlreadyHasThatAccountErrorMessage ].

	accounts add: anElement.
	
	(anElement isMemberOf: Portfolio) ifTrue: [
		
		anElement setFather: self
		
	]! !


!Portfolio methodsFor: 'private' stamp: 'F12 5/13/2025 11:52:19'!
setFather: aPortfolio

	father := aPortfolio! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error handling' stamp: 'F12 5/13/2025 10:59:01'!
cantAddAnAccountToASubPortfolioIfAnyOfHisFathersAlreadyHasThatAccountErrorMessage

	^'the portfolio has a father who already added this account'! !

!Portfolio class methodsFor: 'error handling' stamp: 'F12 5/9/2025 15:00:01'!
portfolioCantAddASubPortfolioWhoHasAnAccountThatItsAlreadyAddedErrorMessage

	^'the portfolio has an account that was already added'! !

!Portfolio class methodsFor: 'error handling' stamp: 'F12 5/9/2025 13:49:24'!
portfolioCantAddAnAccountThatItsAlreadyAddedToASubPortfolioErrorMessage

	^'the account its already added to a subportfolio'! !

!Portfolio class methodsFor: 'error handling' stamp: 'F12 5/9/2025 13:38:00'!
portfolioCantAddHimselfToHisAccountsErrorMessage

	^'portfolio cant add himself to his accounts'! !

!Portfolio class methodsFor: 'error handling' stamp: 'F12 5/9/2025 13:31:54'!
portfolioCantAddTheSameAccountTwiceErrorMessage

	^'portfolio cant add the same account twice'! !


!classDefinition: #ReceptiveAccount category: #'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'F12 5/13/2025 12:47:15'!
balance

	| result currentTransaction|
	
	result := 0.
	
	1 to: transactions size do: [ :index |
		
		currentTransaction := transactions at: index.
	
		result := (currentTransaction affectBalance: result)
		
	].

	^result 

! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !



!classDefinition: #AccountTransaction category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'updating' stamp: 'F12 5/13/2025 12:42:34'!
affectBalance: aBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'updating' stamp: 'F12 5/13/2025 12:43:05'!
affectBalance: aBalance

	^aBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'updating' stamp: 'F12 5/13/2025 12:43:20'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #BankTransfer category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankTransfer
	instanceVariableNames: 'extractionLeg depositLeg amountOfMoney'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankTransfer methodsFor: 'initialization' stamp: 'F12 5/6/2025 12:03:42'!
initializeWithAn: issuingAccount and: receivingAccount withAValueOf: anAmounOfMoney 

	extractionLeg := BankTransferLeg new initializeWith: issuingAccount.
	depositLeg := BankTransferLeg new initializeWith: receivingAccount.
	extractionLeg addCounterpart: depositLeg.
	depositLeg addCounterpart: extractionLeg.
	amountOfMoney := anAmounOfMoney.! !


!BankTransfer methodsFor: 'updating' stamp: 'F12 5/9/2025 09:52:52'!
doTransfer
	
	extractionLeg makeWithdrawWith: amountOfMoney.
	depositLeg makeDepositWith: amountOfMoney 
	! !


!BankTransfer methodsFor: 'accessing' stamp: 'F12 5/6/2025 10:21:21'!
amountOfMoney
	
	^amountOfMoney ! !

!BankTransfer methodsFor: 'accessing' stamp: 'F12 5/6/2025 11:51:21'!
depositLeg

	^depositLeg ! !

!BankTransfer methodsFor: 'accessing' stamp: 'F12 5/6/2025 11:18:15'!
extractionLeg

	^extractionLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BankTransfer class' category: #'ServiciosFinancieros-Ejercicio'!
BankTransfer class
	instanceVariableNames: ''!

!BankTransfer class methodsFor: 'error handling' stamp: 'F12 5/13/2025 12:53:46'!
cantCreateANewTranferIfIssuingAccountHasNotEnoughFoundsErrorMessage

	^'Issuing account doesnt have enough founds to transfer'! !

!BankTransfer class methodsFor: 'error handling' stamp: 'F12 5/13/2025 13:01:10'!
cantTransferANegativeAmountOfMoneyErrorMessage

	^'can not transfer a negative amount of money'! !

!BankTransfer class methodsFor: 'error handling' stamp: 'F12 5/13/2025 12:54:29'!
cantTransferAnAmountOfZeroErrorMessage

	^'can not transfer an amount of zero'! !

!BankTransfer class methodsFor: 'error handling' stamp: 'F12 5/13/2025 13:08:50'!
cantTransferMoneyToTheSameAccountErrorMessage

	^'can not transfer money to the same account'! !


!BankTransfer class methodsFor: 'instance creation' stamp: 'F12 5/13/2025 13:12:59'!
createWithAn: issuingAccount and: receivingAccount withAValueOf: anAmountOfMoney

	(issuingAccount balance < anAmountOfMoney) ifTrue: [ ^self error: self cantCreateANewTranferIfIssuingAccountHasNotEnoughFoundsErrorMessage ].
	
	(anAmountOfMoney isZero) ifTrue: [ ^self error: self cantTransferAnAmountOfZeroErrorMessage ].
	
	(anAmountOfMoney negative) ifTrue: [ ^self error: self cantTransferANegativeAmountOfMoneyErrorMessage ].
	
	(issuingAccount == receivingAccount) ifTrue: [ ^self error: self cantTransferMoneyToTheSameAccountErrorMessage ].
	
	^self new initializeWithAn: issuingAccount and: receivingAccount withAValueOf: anAmountOfMoney ! !


!classDefinition: #BankTransferLeg category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankTransferLeg
	instanceVariableNames: 'counterpart mainAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankTransferLeg methodsFor: 'private' stamp: 'F12 5/6/2025 11:45:13'!
addCounterpart: anotherTransferLeg

	counterpart := anotherTransferLeg ! !


!BankTransferLeg methodsFor: 'initialization' stamp: 'F12 5/6/2025 11:44:24'!
initializeWith: account

	mainAccount := account.
	! !


!BankTransferLeg methodsFor: 'evaluating' stamp: 'F12 5/6/2025 12:00:30'!
makeDepositWith: anAmountOfMoney

	Deposit register: anAmountOfMoney on: mainAccount ! !

!BankTransferLeg methodsFor: 'evaluating' stamp: 'F12 5/6/2025 12:00:13'!
makeWithdrawWith: anAmountOfMoney

	Withdraw register: anAmountOfMoney on: mainAccount ! !


!BankTransferLeg methodsFor: 'accessing' stamp: 'F12 5/6/2025 11:53:29'!
counterpart

	^counterpart! !
