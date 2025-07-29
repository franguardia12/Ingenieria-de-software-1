!classDefinition: #AccountSummaryTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/16/2025 11:02:48'!
test01AccountWithNoTransactionsHasAnEmptySummary

	| receptiveAccountWithNoTransactions accountSummary correctResponse |
	
	receptiveAccountWithNoTransactions := ReceptiveAccount new.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assert: (accountSummary reportOf: receptiveAccountWithNoTransactions) equals: correctResponse! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/14/2025 16:20:10'!
test02AccountWithOneDepositHasThatOperationInTheSummary

	| account accountSummary correctResponse |
	
	account := ReceptiveAccount new.
	Deposit register: 100*peso on: account.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: (accountSummary reportOf: account) equals: correctResponse.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/14/2025 16:31:10'!
test03AccountWithOneWithdrawHasThatOperationInTheSummary

	| account accountSummary correctResponse |
	
	account := ReceptiveAccount new.
	Withdraw register: 100*peso on: account.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Extracción por 100 * pesos' with: 'Balance = -100 * pesos'.
	
	self assert: (accountSummary reportOf: account) equals: correctResponse.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/14/2025 16:31:20'!
test04AccountWithOneTransferOutHasThatOperationInTheSummary

	| issuingAccount receptiveAccount accountSummary correctResponse |
	
	issuingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: issuingAccount to: receptiveAccount.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Salida por transferencia de 100 * pesos' with: 'Balance = -100 * pesos'.
	
	self assert: (accountSummary reportOf: issuingAccount) equals: correctResponse.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/14/2025 16:31:31'!
test05AccountWithOneTransferInHasThatOperationInTheSummary

	| issuingAccount receptiveAccount accountSummary correctResponse |
	
	issuingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: issuingAccount to: receptiveAccount.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Entrada por transferencia de 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: (accountSummary reportOf: receptiveAccount) equals: correctResponse.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/14/2025 16:31:45'!
test06AccountWithOneDepositAndOneWithdrawHasThatOperationsInTheSummary

	| account accountSummary correctResponse |
	
	account := ReceptiveAccount new.
	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account. 
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Balance = 50 * pesos'.
	
	self assert: (accountSummary reportOf: account) equals: correctResponse.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:03:59'!
test07AccountsInATransferHaveTheTransactionsInTheSummarys

	| issuingAccount receptiveAccount accountSummaryOfIssuingAccount accountSummaryOfReceivingAccount correctResponseInIssuingAccount correctResponseInReceptiveAccount |
	
	issuingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: issuingAccount to: receptiveAccount.
	Transfer amount: 100*peso from: receptiveAccount to: issuingAccount.
	accountSummaryOfIssuingAccount := AccountSummary new.
	accountSummaryOfReceivingAccount := AccountSummary new.
	correctResponseInIssuingAccount := OrderedCollection with: 'Salida por transferencia de 100 * pesos' with: 'Entrada por transferencia de 100 * pesos' with: 'Balance = 0 * pesos'.
	correctResponseInReceptiveAccount := OrderedCollection with: 'Entrada por transferencia de 100 * pesos' with: 'Salida por transferencia de 100 * pesos' with: 'Balance = 0 * pesos'.
	
	self assert: (accountSummaryOfIssuingAccount reportOf: issuingAccount ) equals: correctResponseInIssuingAccount.
	self assert: (accountSummaryOfReceivingAccount reportOf: receptiveAccount ) equals: correctResponseInReceptiveAccount.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/16/2025 10:30:41'!
test08AllTheTransactionsInAccountAreInSummary

	| issuingAccount receptiveAccount accountSummary correctResponse |
	
	issuingAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100*peso on: receptiveAccount.
	Withdraw register: 50*peso on: receptiveAccount.
	Transfer amount: 20*peso from: receptiveAccount to: issuingAccount.
	Transfer amount: 30*peso from: issuingAccount to: receptiveAccount.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Salida por transferencia de 20 * pesos' with: 'Entrada por transferencia de 30 * pesos' with: 'Balance = 60 * pesos'.
	
	self assert: (accountSummary reportOf: receptiveAccount) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/16/2025 13:53:55'!
test09PortfolioWithNoAccountsHasAnEmptySummary

	| portfolio accountSummary correctResponse |
	
	portfolio := Portfolio new.
		
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:17:11'!
test10PortfolioWithOneAccountWithOneDepositHasItInSummary

	| account portfolio accountSummary correctResponse |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
		
	Deposit register: 100*peso on: account.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:17:18'!
test11PortfolioWithOneAccountWithOneWithdrawHasItInSummary

	| account portfolio accountSummary correctResponse |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
		
	Withdraw register: 100*peso on: account.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Extracción por 100 * pesos' with: 'Balance = -100 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:17:26'!
test12PortfolioWithOneAccountWithOneTransferInHasItInSummary

	| issuingAccount receivingAccount portfolio accountSummary correctResponse |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	portfolio := Portfolio with: receivingAccount.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
			
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Entrada por transferencia de 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:17:34'!
test13PortfolioWithOneAccountWithOneTransferOutHasItInSummary

	| issuingAccount receivingAccount portfolio accountSummary correctResponse |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	portfolio := Portfolio with: issuingAccount.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
			
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Salida por transferencia de 100 * pesos' with: 'Balance = -100 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:17:44'!
test14PortfolioWithTwoAccountsWithTransactionsHasThemInSummary

	| firstAccount secondAccount portfolio accountSummary correctResponse |
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	portfolio := Portfolio with: firstAccount with: secondAccount.
		
	Deposit register: 100*peso on: firstAccount.
	Withdraw register: 50*peso on: secondAccount.
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Balance = 50 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:17:59'!
test15PortfolioWithTheTwoAccountsInATransferHasTheirTransactionsInItsSummary

	| issuingAccount receivingAccount portfolio accountSummary correctResponse |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	portfolio := Portfolio with: issuingAccount with: receivingAccount.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
			
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Salida por transferencia de 100 * pesos' with: 'Entrada por transferencia de 100 * pesos' with: 'Balance = 0 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:18:15'!
test16PortfolioHasAllTheTransactionsOfAnAccountInItsSummary

	| issuingAccount receivingAccount portfolio accountSummary correctResponse |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	portfolio := Portfolio with: issuingAccount.
	
	Deposit register: 100*peso on: issuingAccount.
	Withdraw register: 50*peso on: issuingAccount.
	Transfer amount: 20*peso from: issuingAccount to: receivingAccount.
	Transfer amount: 30*peso from: receivingAccount to: issuingAccount.
			
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Salida por transferencia de 20 * pesos' with: 'Entrada por transferencia de 30 * pesos' with: 'Balance = 60 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'F12 5/18/2025 22:18:22'!
test17PortfolioWithNAccountsHasAllTheirTransactionsInHisSummary

	| firstAccount secondAccount thirdAccount portfolio accountSummary correctResponse |
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	thirdAccount := ReceptiveAccount new.
	portfolio := Portfolio new.
		
	Deposit register: 100*peso on: firstAccount.
	Withdraw register: 50*peso on: secondAccount.
	Transfer amount: 50*peso from: thirdAccount to: secondAccount.
	
	portfolio add: firstAccount.
	portfolio add: secondAccount.
	portfolio add: thirdAccount.
	
	accountSummary := AccountSummary new.
	correctResponse := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Entrada por transferencia de 50 * pesos' with: 'Salida por transferencia de 50 * pesos' with: 'Balance = 50 * pesos'.
	
	self assert: (accountSummary reportOf: portfolio) equals: correctResponse.
! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/20/2025 13:35:11'!
test01PortfolioWithNoAccountsHasOnlyHisNameAndABalanceOfZero

	| portfolio portfolioDetailedTreePrinter correctResponse |
	
	portfolio := Portfolio named: 'Portfolio de la familia'.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Balance = 0 * pesos').
	
	self assert: (portfolioDetailedTreePrinter reportOf: portfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/20/2025 13:36:23'!
test02PortfolioWithOneAccountWithNoTransactionsHasHisNameIndentedAndABalanceOfZeroAfterMyName

	| portfolio account portfolioDetailedTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Cuenta mia') with: (Character tab asString, Character tab asString, 'Balance = 0 * pesos') with: (Character tab asString, 'Balance = 0 * pesos').
	
	self assert: (portfolioDetailedTreePrinter reportOf: portfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/19/2025 01:22:30'!
test03PortfolioWithOneAccountWithOneDepositHasHisNameTheTransactionAndTheBalanceIndentedAfterMyName

	| portfolio account portfolioDetailedTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Cuenta mia') with: (Character tab asString, Character tab asString, 'Depósito por 100 * pesos') with: (Character tab asString, Character tab asString, 'Balance = 100 * pesos') with: (Character tab asString, 'Balance = 100 * pesos').
	
	Deposit register: 100*peso on: account. 
	
	self assert: (portfolioDetailedTreePrinter reportOf: portfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/19/2025 01:26:48'!
test04PortfolioWithOneAccountWithOneWithdrawHasHisNameTheTransactionAndTheBalanceIndentedAfterMyName

	| portfolio account portfolioDetailedTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Cuenta mia') with: (Character tab asString, Character tab asString, 'Extracción por 100 * pesos') with: (Character tab asString, Character tab asString, 'Balance = -100 * pesos') with: (Character tab asString, 'Balance = -100 * pesos').
	
	Withdraw register: 100*peso on: account. 
	
	self assert: (portfolioDetailedTreePrinter reportOf: portfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/19/2025 01:33:41'!
test05PortfolioWithOneAccountWithOneTransferInHasHisNameTheTransactionAndTheBalanceIndentedAfterMyName

	| portfolio account anotherAccount portfolioDetailedTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	anotherAccount := ReceptiveAccount new.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Cuenta mia') with: (Character tab asString, Character tab asString, 'Entrada por transferencia de 100 * pesos') with: (Character tab asString, Character tab asString, 'Balance = 100 * pesos') with: (Character tab asString, 'Balance = 100 * pesos').
	
	Transfer amount: 100*peso from: anotherAccount to: account. 
	
	self assert: (portfolioDetailedTreePrinter reportOf: portfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/19/2025 01:37:32'!
test06PortfolioWithOneAccountWithOneTransferOutHasHisNameTheTransactionAndTheBalanceIndentedAfterMyName

	| portfolio account anotherAccount portfolioDetailedTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	anotherAccount := ReceptiveAccount new.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Cuenta mia') with: (Character tab asString, Character tab asString, 'Salida por transferencia de 100 * pesos') with: (Character tab asString, Character tab asString, 'Balance = -100 * pesos') with: (Character tab asString, 'Balance = -100 * pesos').
	
	Transfer amount: 100*peso from: account to: anotherAccount. 
	
	self assert: (portfolioDetailedTreePrinter reportOf: portfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/20/2025 14:51:33'!
test07PortfolioWithAnotherPortfolioWithNoAccountsHasHisNameIndentedWithABalanceOfZeroAfterMyName

	| mainPortfolio subPortfolio portfolioDetailedTreePrinter correctResponse |
	
	subPortfolio := Portfolio named: 'Portfolio de hijos'.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: subPortfolio.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Portfolio de hijos') with: (Character tab asString, Character tab asString, 'Balance = 0 * pesos') with: (Character tab asString, 'Balance = 0 * pesos').
		
	self assert: (portfolioDetailedTreePrinter reportOf: mainPortfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/20/2025 16:58:49'!
test08PortfolioWithTwoAccountsWithOneTransactionEachShowsAllTheInformationCorrectlyIndentedAfterMyName

	| mainPortfolio subAccount1 subAccount2 portfolioDetailedTreePrinter correctResponse |

	subAccount1 := ReceptiveAccount named: 'Cuenta de Juan'.
	subAccount2 := ReceptiveAccount named: 'Cuenta de Angeles'.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: subAccount1 with: subAccount2.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := (OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Cuenta de Juan') with: (Character tab asString, Character tab asString, 'Depósito por 100 * pesos') with: (Character tab asString, Character tab asString, 'Balance = 100 * pesos') with: (Character tab asString, 'Cuenta de Angeles') with: (Character tab asString, Character tab asString, 'Extracción por 50 * pesos')).
		
	correctResponse add: (Character tab asString, Character tab asString, 'Balance = -50 * pesos').
	correctResponse add: (Character tab asString, 'Balance = 50 * pesos').
	
	Deposit register: 100*peso on: subAccount1.
	Withdraw register: 50*peso on: subAccount2.
		
	self assert: (portfolioDetailedTreePrinter reportOf: mainPortfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'ER 5/20/2025 15:32:43'!
test09PortfolioWithAnotherPortfolioWhoHasAnAccountWithOneTransactionShowsHisNameTheTransactionAndTheBalanceAfterMyName

	| mainPortfolio subPortfolio 	subAccount portfolioDetailedTreePrinter correctResponse |

	subAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	subPortfolio := Portfolio named: 'Portfolio de hijos' with: subAccount.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: subPortfolio.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := (OrderedCollection 
				with: 'Portfolio de la familia' with: (Character tab asString, 'Portfolio de hijos') 
				with: (Character tab asString, Character tab asString, 'Cuenta de Juan') 
				with: (Character tab asString, Character tab asString, Character tab asString, 'Depósito por 100 * pesos') 
				with: (Character tab asString, Character tab asString, Character tab asString, 'Balance = 100 * pesos') 
				with: (Character tab asString, Character tab asString, 'Balance = 100 * pesos')).
	correctResponse add: (Character tab asString, 'Balance = 100 * pesos').
	Deposit register: 100*peso on: subAccount.
		
	self assert: (portfolioDetailedTreePrinter reportOf: mainPortfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'ER 5/20/2025 15:37:10'!
test10PortfolioWithTwoAnotherPortfoliosWithNoAccountsHasTheirNamesIndentedAfterMyName
	| mainPortfolio subPortfolio1 subPortfolio2 portfolioDetailedTreePrinter correctResponse |
	subPortfolio1 := Portfolio named: 'Portfolio de padres'.
	subPortfolio2 := Portfolio named: 'Portfolio de hijos'.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: subPortfolio1 with: subPortfolio2.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection 
						with: 'Portfolio de la familia' 
							with: (Character tab asString, 'Portfolio de padres') 
								with: (Character tab asString, Character tab asString, 'Balance = 0 * pesos') 
							with: (Character tab asString, 'Portfolio de hijos') 
								with: (Character tab asString, Character tab asString, 'Balance = 0 * pesos') 
							with: (Character tab asString, 'Balance = 0 * pesos').
						
						
	self assert: (portfolioDetailedTreePrinter reportOf: mainPortfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'ER 5/20/2025 15:37:34'!
test11PortfolioWithOneAccountWithNoTransactionsAndAnotherPortfolioWithNoAccountsHasTheirNamesIndentedAfterMyName

	| mainPortfolio subPortfolio account portfolioDetailedTreePrinter correctResponse |

	account := ReceptiveAccount named: 'Cuenta mia'.
	subPortfolio := Portfolio named: 'Portfolio de hijos'.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: account with: subPortfolio.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString, 'Cuenta mia') with: (Character tab asString, Character tab asString, 'Balance = 0 * pesos') with: (Character tab asString, 'Portfolio de hijos') with: (Character tab asString, Character tab asString, 'Balance = 0 * pesos') with: (Character tab asString, 'Balance = 0 * pesos').
	
		
	self assert: (portfolioDetailedTreePrinter reportOf: mainPortfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'ER 5/20/2025 15:51:20'!
test12PortfolioWithOneAccountWithOneTransactionAndAnotherPortfolioWithOneSubAccountWithOneTransactionHasTheirNamesAndTransactionsIndentedAfterMyName

	| mainPortfolio subPortfolio account subAccount portfolioDetailedTreePrinter correctResponse |

	account := ReceptiveAccount named: 'Cuenta mia'.
	subAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	subPortfolio := Portfolio named: 'Portfolio de hijos' with: subAccount.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: account with: subPortfolio.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := (OrderedCollection 
					with: 'Portfolio de la familia' 
						with: (Character tab asString, 'Cuenta mia') 
							with: (Character tab asString, Character tab asString, 'Depósito por 100 * pesos') 
							with: (Character tab asString, Character tab asString, 'Balance = 100 * pesos') 
						with: (Character tab asString, 'Portfolio de hijos') 
							with: (Character tab asString, Character tab asString, 'Cuenta de Juan')).		
	correctResponse 
								add: (Character tab asString , Character tab asString , Character tab asString , 'Extracción por 50 * pesos').
	correctResponse 
								add: (Character tab asString , Character tab asString , Character tab asString , 'Balance = -50 * pesos').
	correctResponse 
							add: (Character tab asString , Character tab asString , 'Balance = -50 * pesos').
	correctResponse 
						add: (Character tab asString , 'Balance = 50 * pesos').

	
	
	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: subAccount.
		
	self assert: (portfolioDetailedTreePrinter reportOf: mainPortfolio) equals: correctResponse 
	! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'ER 5/20/2025 15:47:49'!
test13PortfolioWithAccountsWithTransactionsAndSubPortfoliosDetailsAllNamesAndTransactionsCorrectlyIndentedAfterHisName

	| mainPortfolio subPortfolio account subAccount1 subAccount2 anotherAccount portfolioDetailedTreePrinter correctResponse |

	account := ReceptiveAccount named: 'Cuenta mia'.
	subAccount1 := ReceptiveAccount named: 'Cuenta de Juan'.
	subAccount2 := ReceptiveAccount named: 'Cuenta de Angeles'.
	anotherAccount := ReceptiveAccount new.
	subPortfolio := Portfolio named: 'Portfolio de hijos' with: subAccount1 with: subAccount2.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: account with: subPortfolio.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter new.
	correctResponse := ((OrderedCollection 
		with: 'Portfolio de la familia' 
		with: (Character tab asString, 'Cuenta mia') 
		with: (Character tab asString, Character tab asString, 'Depósito por 100 * pesos') 
		with: (Character tab asString, Character tab asString, 'Extracción por 50 * pesos') 
		with: (Character tab asString, Character tab asString, 'Balance = 50 * pesos') 
		with: (Character tab asString, 'Portfolio de hijos'))).
	correctResponse addAllLast: (OrderedCollection 
		with: (Character tab asString, Character tab asString, 'Cuenta de Juan') 
		with: (Character tab asString, Character tab asString, Character tab asString, 'Depósito por 100 * pesos') 
		with: (Character tab asString, Character tab asString, Character tab asString, 'Extracción por 50 * pesos') 
		with: (Character tab asString, Character tab asString, Character tab asString, 'Balance = 50 * pesos') 
		with: (Character tab asString, Character tab asString, 'Cuenta de Angeles') 
		with: (Character tab asString, Character tab asString, Character tab asString, 'Salida por transferencia de 100 * pesos')).
	correctResponse addAllLast: (OrderedCollection 
		with: (Character tab asString, Character tab asString, Character tab asString, 'Balance = -100 * pesos') 
		with: (Character tab asString, Character tab asString, 'Balance = -50 * pesos') 
		with: (Character tab asString, 'Balance = 0 * pesos')).
	
	
	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account. 
	Deposit register: 100*peso on: subAccount1.
	Withdraw register: 50*peso on: subAccount1.
	Transfer amount: 100*peso from: subAccount2 to: anotherAccount.
		
	self assert: (portfolioDetailedTreePrinter reportOf: mainPortfolio) equals: correctResponse 
	! !


!classDefinition: #PortfolioTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/20/2025 11:57:34'!
test01PortfolioWithNoAccountsOnlyHasHisNameInThePortfolioTreePrinter

	| portfolio portfolioTreePrinter correctResponse |
	
	portfolio := Portfolio named: 'Portfolio de la familia'.
	portfolioTreePrinter := PortfolioTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia'.
	
	self assert: (portfolioTreePrinter reportOf: portfolio) equals: correctResponse ! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/18/2025 23:07:14'!
test02PortfolioWithOneAccountHasHisNameIndentedAfterMyNameInThePortfolioTreePrinter

	| portfolio account portfolioTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta de Juan'.
	portfolio := Portfolio named: 'Portfolio de la familia'.
	portfolioTreePrinter := PortfolioTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString , 'Cuenta de Juan').
	
	portfolio add: account.
	
	self assert: (portfolioTreePrinter reportOf: portfolio) equals: correctResponse! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/18/2025 23:30:17'!
test03PortfolioWithTwoAccountsHasTheirNamesIndentedAfterMyNameInThePortfolioTreePrinter

	| portfolio firstAccount secondAccount portfolioTreePrinter correctResponse |
	
	firstAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	secondAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	portfolio := Portfolio named: 'Portfolio de la familia'.
	portfolioTreePrinter := PortfolioTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString , 'Cuenta de Juan') with: (Character tab asString , 'Cuenta de Angeles').
	
	portfolio add: firstAccount.
	portfolio add: secondAccount.
	
	self assert: (portfolioTreePrinter reportOf: portfolio) equals: correctResponse! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/18/2025 23:35:44'!
test04PortfolioWithAnotherPortfolioHasHisNameIndedtedAfterMyNameInThePortfolioTreePrinter

	| mainPortfolio subPortfolio portfolioTreePrinter correctResponse |
	
	mainPortfolio := Portfolio named: 'Portfolio de la familia'.
	subPortfolio := Portfolio named: 'Portfolio de los hijos'.
	portfolioTreePrinter := PortfolioTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString , 'Portfolio de los hijos').
	
	mainPortfolio add: subPortfolio.
	
	self assert: (portfolioTreePrinter reportOf: mainPortfolio) equals: correctResponse! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/18/2025 23:59:35'!
test05PortfolioWithAnotherPortfolioAndOneAccountHasTheirNamesIndedtedAfterMyNameInThePortfolioTreePrinter

	| mainPortfolio subPortfolio account portfolioTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: account.
	subPortfolio := Portfolio named: 'Portfolio de los hijos'.
	portfolioTreePrinter := PortfolioTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString , 'Cuenta mia') with: (Character tab asString , 'Portfolio de los hijos').
	
	mainPortfolio add: subPortfolio.
	
	self assert: (portfolioTreePrinter reportOf: mainPortfolio) equals: correctResponse! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/19/2025 00:15:49'!
test06PortfolioWithTwoAnotherPortfoliosHasTheirNamesIndedtedAfterMyNameInThePortfolioTreePrinter

	| mainPortfolio subPortfolio1 subPortfolio2 portfolioTreePrinter correctResponse |
	
	subPortfolio1 := Portfolio named: 'Portfolio de los padres'.
	subPortfolio2 := Portfolio named: 'Portfolio de los hijos'.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: subPortfolio1 with: subPortfolio2.
	portfolioTreePrinter := PortfolioTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString , 'Portfolio de los padres') with: (Character tab asString , 'Portfolio de los hijos').
		
	self assert: (portfolioTreePrinter reportOf: mainPortfolio) equals: correctResponse! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'F12 5/19/2025 00:29:12'!
test07PortfolioWithAccountsAndPortfoliosWhichAlsoHaveAnotherAccountsAreCorrectlyIndentedInThePortfolioTreePrinter

	| mainPortfolio subPortfolio account subAccount1 subAccount2 portfolioTreePrinter correctResponse |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	subAccount1 := ReceptiveAccount named: 'Cuenta de Juan'.
	subAccount2 := ReceptiveAccount named: 'Cuenta de Angeles'.
	subPortfolio := Portfolio named: 'Portfolio de los hijos' with: subAccount1 with: subAccount2.
	mainPortfolio := Portfolio named: 'Portfolio de la familia' with: account with: subPortfolio.
	portfolioTreePrinter := PortfolioTreePrinter new.
	correctResponse := OrderedCollection with: 'Portfolio de la familia' with: (Character tab asString , 'Cuenta mia') with: (Character tab asString , 'Portfolio de los hijos') with: (Character tab asString , Character tab asString , 'Cuenta de Juan') with: (Character tab asString , Character tab asString , 'Cuenta de Angeles').
		
	self assert: (portfolioTreePrinter reportOf: mainPortfolio) equals: correctResponse! !


!classDefinition: #ReceptiveAccountTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferNetTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:57:52'!
test01AccountWithNoTransfersHasAnEmptyTransferNetReport

	| account transferNet |
	
	account := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	self assert: (transferNet reportOf: account) equals: 0*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:19:27'!
test02AccountWithOneDepositHasAnEmptyTransferNetReport

	| account transferNet |
	
	account := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Deposit register: 100*peso on: account. 
	
	self assert: (transferNet reportOf: account) equals: 0! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:21:58'!
test03AccountWithOneWithdrawHasAnEmptyTransferNetReport

	| account transferNet |
	
	account := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Withdraw register: 100*peso on: account. 
	
	self assert: (transferNet reportOf: account) equals: 0! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:25:50'!
test04AccountWithOneTransferInHasTheirValueInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	
	self assert: (transferNet reportOf: receivingAccount) equals: 100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:28:36'!
test05AccountWithOneTransferOutHasTheirValueInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	
	self assert: (transferNet reportOf: issuingAccount) equals: -100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:32:33'!
test06AccountWithOneTransferInAndADepositHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Deposit register: 100*peso on: receivingAccount.
	
	self assert: (transferNet reportOf: receivingAccount) equals: 100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:35:01'!
test07AccountWithOneTransferOutAndADepositHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Deposit register: 100*peso on: issuingAccount.
	
	self assert: (transferNet reportOf: issuingAccount) equals: -100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:43:18'!
test08AccountWithOneTransferInAndAWithdrawHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Withdraw register: 100*peso on: receivingAccount.
	
	self assert: (transferNet reportOf: receivingAccount) equals: 100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:46:03'!
test09AccountWithOneTransferOutAndAWithdrawHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Withdraw register: 100*peso on: issuingAccount.
	
	self assert: (transferNet reportOf: issuingAccount) equals: -100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:56:43'!
test10AccountWithOneTransferInAndOneTransferOutHasTheirValuesInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Transfer amount: 100*peso from: receivingAccount to: issuingAccount.
	
	self assert: (transferNet reportOf: receivingAccount) equals: 0*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 19:58:59'!
test11AccountWithOneTransferOutAndOneTransferInHasTheirValuesInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Transfer amount: 100*peso from: receivingAccount to: issuingAccount.
	
	self assert: (transferNet reportOf: issuingAccount) equals: 0*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 20:42:58'!
test12AccountWithTransfersAndOtherOperationsOnlySumsTheValuesOfTheTransfersInTheTransferNetReport

	| issuingAccount receivingAccount transferNet |
	
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Transfer amount: 50*peso from: receivingAccount to: issuingAccount.
	Deposit register: 20*peso on: issuingAccount.
	Withdraw register: 30*peso on: issuingAccount.
	Transfer amount: 30*peso from: issuingAccount to: receivingAccount.
	
	self assert: (transferNet reportOf: issuingAccount) equals: -80*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 20:47:31'!
test13PortfolioWithNoAccountsHasAnEmptyTransferNetReport

	| portfolio transferNet |
	
	portfolio := Portfolio new.
	transferNet := TransferNet new.
	
	self assert: (transferNet reportOf: portfolio) equals: 0*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 20:53:36'!
test14PortfolioWithOneAccountWithOneDepositHasAnEmptyTransferNetReport

	| portfolio account transferNet |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Deposit register: 100*peso on: account. 
	portfolio add: account.
	
	self assert: (transferNet reportOf: portfolio) equals: 0*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 20:55:43'!
test15PortfolioWithOneAccountWithOneWithdrawHasAnEmptyTransferNetReport

	| portfolio account transferNet |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Withdraw register: 100*peso on: account. 
	portfolio add: account.
	
	self assert: (transferNet reportOf: portfolio) equals: 0*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:03:53'!
test16PortfolioWithOneAccountWithOneTransferInHasTheValueOfThatTransferInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	portfolio add: receivingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: 100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:05:46'!
test17PortfolioWithOneAccountWithOneTransferOutHasTheValueOfThatTransferInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	portfolio add: issuingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: -100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:14:55'!
test18PortfolioWithOneAccountWithOneTransferOutAndADepositHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Deposit register: 100*peso on: issuingAccount.
	portfolio add: issuingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: -100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:18:32'!
test19PortfolioWithOneAccountWithOneTransferInAndADepositHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Deposit register: 100*peso on: receivingAccount.
	portfolio add: receivingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: 100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:20:19'!
test20PortfolioWithOneAccountWithOneTransferOutAndAWithdrawHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Withdraw register: 100*peso on: issuingAccount.
	portfolio add: issuingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: -100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:21:49'!
test21PortfolioWithOneAccountWithOneTransferInAndAWithdrawHasOnlyTheValueOfTheTransferInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Withdraw register: 100*peso on: receivingAccount.
	portfolio add: receivingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: 100*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:41:25'!
test22PortfolioWithOneAccountWithOneTransferInAndOneTransferOutHasTheirValuesInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Transfer amount: 50*peso from: receivingAccount to: issuingAccount.
	portfolio add: receivingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: 50*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:41:32'!
test23PortfolioWithOneAccountWithOneTransferOutAndOneTransferInHasTheirValuesInTheTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	Transfer amount: 50*peso from: receivingAccount to: issuingAccount.
	portfolio add: issuingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: -50*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:41:38'!
test24PortfolioWithTwoAccountsThatTransfersToThemselvesHasAnEmptyTransferNetReport

	| portfolio issuingAccount receivingAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: receivingAccount.
	portfolio add: issuingAccount.
	portfolio add: receivingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: 0*peso! !

!TransferNetTest methodsFor: 'tests' stamp: 'F12 5/18/2025 21:51:53'!
test25PortfolioWithAccountsSumsTheValuesOfTheTransfersInThoseAccountsInTheTransferNetReport

	| portfolio issuingAccount receivingAccount otherAccount transferNet |
	
	portfolio := Portfolio new.
	issuingAccount := ReceptiveAccount new.
	receivingAccount := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	transferNet := TransferNet new.
	
	Transfer amount: 100*peso from: issuingAccount to: otherAccount.
	Deposit register: 100*peso on: receivingAccount.
	Transfer amount: 50*peso from: otherAccount to: receivingAccount.
	Withdraw register: 30*peso on: receivingAccount.
	Transfer amount: 10*peso from: issuingAccount to: receivingAccount.
	portfolio add: issuingAccount.
	portfolio add: receivingAccount.
	
	self assert: (transferNet reportOf: portfolio) equals: -50*peso! !


!classDefinition: #TransferTest category: #'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: #'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'operations' stamp: 'F12 5/20/2025 15:12:21'!
addMoreInformationToReport: aReport withAnIndentationLevelOf: indentationLevel

	self subclassResponsibility.! !

!Account methodsFor: 'operations' stamp: 'F12 5/20/2025 12:32:19'!
processReport: aReport withAnIndentationLevelOf: indentationLevel

	self subclassResponsibility.! !


!classDefinition: #Portfolio category: #'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'F12 5/18/2025 22:48:48'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := 'Un portfolio'! !


!Portfolio methodsFor: 'main protocol' stamp: 'F12 5/16/2025 13:52:57'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'updating' stamp: 'F12 5/18/2025 22:47:33'!
setName: aName 
	
	name := aName! !


!Portfolio methodsFor: 'inspecting' stamp: 'F12 5/19/2025 00:37:51'!
includesASubAccount

	((accounts at: 2) class = Portfolio) ifTrue: [
		
		((accounts at: 2) accountsSize = 2) ifTrue: [ ^true ]
		
	].
	
	^false! !

!Portfolio methodsFor: 'inspecting' stamp: 'F12 5/19/2025 00:22:24'!
includesAnAccount

	((accounts at: 1) class = ReceptiveAccount) ifTrue: [ ^true ].
	
	^false! !

!Portfolio methodsFor: 'inspecting' stamp: 'F12 5/19/2025 00:05:03'!
includesAnotherPorfolio

	(accounts size = 2) ifTrue: [
		
		((accounts at: 2) class = Portfolio) ifTrue: [ ^true ].
		
	].
	
	((accounts at: 1) class = Portfolio) ifTrue: [ ^true ].
	
	^false! !


!Portfolio methodsFor: 'operations' stamp: 'F12 5/20/2025 13:29:49'!
addMoreInformationToReport: aReport withAnIndentationLevelOf: indentationLevel

	aReport addMoreInformationOfPortfolio: self toReportWithAnIndentationLevelOf: indentationLevel ! !

!Portfolio methodsFor: 'operations' stamp: 'F12 5/20/2025 15:12:29'!
processReport: aReport withAnIndentationLevelOf: indentationLevel

	aReport addNameOfAccountToReport: name withAnIndentationLevelOf: indentationLevel.
	
	1 to: accounts size do: [ :index |
		
		(accounts at: index) processReport: aReport		 withAnIndentationLevelOf: (indentationLevel + 1).
		
		((accounts at: index) class = ReceptiveAccount) ifTrue: [
			
			(accounts at: index) addMoreInformationToReport: aReport withAnIndentationLevelOf: (indentationLevel + 1) 
			
		].
		
	].

	self addMoreInformationToReport: aReport withAnIndentationLevelOf: indentationLevel ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errors' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'F12 5/18/2025 22:45:21'!
named: aName
	
	^self new 
		setName: aName;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'F12 5/19/2025 00:00:42'!
named: aName with: anAccount 
	
	^self new 
		setName: aName;
		add: anAccount;
		yourself
! !

!Portfolio class methodsFor: 'instance creation' stamp: 'F12 5/19/2025 00:18:06'!
named: aName with: anAccount with: anotherAccount
	
	^self new 
		setName: aName;
		add: anAccount;
		add: anotherAccount;
		yourself
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'F12 5/19/2025 01:32:25'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	name := 'Una cuenta corriente'! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'F12 5/14/2025 16:36:00'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'updating' stamp: 'F12 5/18/2025 23:16:38'!
addName: aName 
	
	name := aName! !


!ReceptiveAccount methodsFor: 'operations' stamp: 'F12 5/20/2025 13:30:34'!
addMoreInformationToReport: aReport withAnIndentationLevelOf: indentationLevel

	aReport addMoreInformationOfReceptiveAccount: self toReportWithAnIndentationLevelOf: indentationLevel! !

!ReceptiveAccount methodsFor: 'operations' stamp: 'F12 5/20/2025 15:12:36'!
processReport: aReport withAnIndentationLevelOf: indentationLevel

	aReport addNameOfAccountToReport: name withAnIndentationLevelOf: indentationLevel.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: #'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'F12 5/18/2025 23:16:16'!
named: aName
	
	^self new 
		addName: aName;
		yourself ! !


!classDefinition: #AccountReport category: #'ServiciosFinancieros-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReport methodsFor: 'operations' stamp: 'F12 5/18/2025 22:21:34'!
addDepositWithAnAmountOf: amount

	self subclassResponsibility.! !

!AccountReport methodsFor: 'operations' stamp: 'F12 5/18/2025 22:21:51'!
addTransferInWithAnAmountOf: amount

	self subclassResponsibility.! !

!AccountReport methodsFor: 'operations' stamp: 'F12 5/18/2025 22:21:54'!
addTransferOutWithAnAmountOf: amount

	self subclassResponsibility.! !

!AccountReport methodsFor: 'operations' stamp: 'F12 5/18/2025 22:21:43'!
addWithdrawWithAnAmountOf: amount

	self subclassResponsibility.! !

!AccountReport methodsFor: 'operations' stamp: 'F12 5/18/2025 22:21:11'!
reportOf: account

	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: #'ServiciosFinancieros-Solucion'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: 'report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'operations' stamp: 'F12 5/18/2025 18:47:18'!
addDepositWithAnAmountOf: amount

	report addLast: 'Depósito por ', (amount asString)

	! !

!AccountSummary methodsFor: 'operations' stamp: 'F12 5/18/2025 18:48:49'!
addTransferInWithAnAmountOf: amount

	report addLast: 'Entrada por transferencia de ', (amount asString)

	! !

!AccountSummary methodsFor: 'operations' stamp: 'F12 5/18/2025 18:49:03'!
addTransferOutWithAnAmountOf: amount

	report addLast: 'Salida por transferencia de ', (amount asString)

	! !

!AccountSummary methodsFor: 'operations' stamp: 'F12 5/18/2025 18:47:37'!
addWithdrawWithAnAmountOf: amount

	report addLast: 'Extracción por ', (amount asString)

	! !

!AccountSummary methodsFor: 'operations' stamp: 'F12 5/18/2025 19:08:23'!
reportOf: account

	| currentBalance transactionsOfAccount |
	
	currentBalance := 'Balance = ', (account balance) asString.
		
	transactionsOfAccount := account transactions.
	
	1 to: transactionsOfAccount size do: [ :index |
						
		(transactionsOfAccount at: index) processReport: self
		
	].

	report addLast: currentBalance.

	^report! !


!AccountSummary methodsFor: 'initialization' stamp: 'F12 5/18/2025 18:43:03'!
initialize

	report := OrderedCollection new.! !


!classDefinition: #TransferNet category: #'ServiciosFinancieros-Solucion'!
AccountReport subclass: #TransferNet
	instanceVariableNames: 'sum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'operations' stamp: 'F12 5/18/2025 22:24:48'!
addDepositWithAnAmountOf: amount

	sum := sum + 0
	! !

!TransferNet methodsFor: 'operations' stamp: 'F12 5/18/2025 20:23:39'!
addTransferInWithAnAmountOf: amount

	sum := sum + amount! !

!TransferNet methodsFor: 'operations' stamp: 'F12 5/18/2025 20:24:12'!
addTransferOutWithAnAmountOf: amount

	sum := sum - amount! !

!TransferNet methodsFor: 'operations' stamp: 'F12 5/18/2025 22:24:58'!
addWithdrawWithAnAmountOf: amount

	sum := sum + 0

! !

!TransferNet methodsFor: 'operations' stamp: 'F12 5/18/2025 22:02:34'!
reportOf: account 

	| transactionsOfAccount |

	transactionsOfAccount := account transactions.
			
	1 to: transactionsOfAccount size do: [ :index|
		
		(transactionsOfAccount at: index) processReport: self
		
	].
	
	^sum! !


!TransferNet methodsFor: 'initialization' stamp: 'F12 5/18/2025 20:19:51'!
initialize

	sum := 0! !


!classDefinition: #AccountTransaction category: #'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'accessing' stamp: 'F12 5/16/2025 15:24:04'!
affectSumOfTransferNetReport: aSum

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'accessing' stamp: 'F12 5/16/2025 10:42:16'!
obtainOperation

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'operations' stamp: 'F12 5/18/2025 18:50:09'!
processReport: aReport

	self subclassResponsibility.! !


!classDefinition: #Deposit category: #'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'accessing' stamp: 'F12 5/16/2025 15:24:22'!
affectSumOfTransferNetReport: aSum

	^aSum! !


!Deposit methodsFor: 'operations' stamp: 'F12 5/18/2025 18:53:31'!
processReport: aReport

	aReport addDepositWithAnAmountOf: value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: #'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'accessing' stamp: 'F12 5/16/2025 15:24:39'!
affectSumOfTransferNetReport: aSum

	self subclassResponsibility.! !


!TransferLeg methodsFor: 'operations' stamp: 'F12 5/18/2025 18:54:24'!
processReport: aReport

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: #'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'F12 5/16/2025 15:25:07'!
affectSumOfTransferNetReport: aSum

	^aSum + (transfer value)! !

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'operations' stamp: 'F12 5/18/2025 18:54:56'!
processReport: aReport

	aReport addTransferInWithAnAmountOf: (transfer value)! !


!classDefinition: #TransferWithdrawLeg category: #'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'F12 5/16/2025 15:26:17'!
affectSumOfTransferNetReport: aSum

	^aSum - (transfer value)! !

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'operations' stamp: 'F12 5/18/2025 18:56:38'!
processReport: aReport

	aReport addTransferOutWithAnAmountOf: (transfer value)! !


!classDefinition: #Withdraw category: #'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'accessing' stamp: 'F12 5/16/2025 15:19:36'!
affectSumOfTransferNetReport: aSum

	^aSum! !


!Withdraw methodsFor: 'operations' stamp: 'F12 5/18/2025 18:54:00'!
processReport: aReport

	aReport addWithdrawWithAnAmountOf: value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #PortfolioReport category: #'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioReport methodsFor: 'operations' stamp: 'F12 5/20/2025 15:14:57'!
addNameOfAccountToReport: aName withAnIndentationLevelOf: indentationLevel

	self subclassResponsibility.! !

!PortfolioReport methodsFor: 'operations' stamp: 'F12 5/20/2025 15:14:41'!
reportOf: portfolio 

	self subclassResponsibility.! !


!classDefinition: #PortfolioDetailedTreePrinter category: #'ServiciosFinancieros-Solucion'!
PortfolioReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'tree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 14:31:27'!
addMoreInformationOfPortfolio: aPortfolio toReportWithAnIndentationLevelOf: indentationLevel

	| collectionOfSummary |
	
	collectionOfSummary := (AccountSummary new) reportOf: aPortfolio.
	
	tree add: 
        (String streamContents: [ :stream |
            1 to: (indentationLevel + 1) do: [ :i |
                stream nextPut: Character tab.
            ].
            stream nextPutAll: (collectionOfSummary at: (collectionOfSummary size))
        ]).! !

!PortfolioDetailedTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 14:35:39'!
addMoreInformationOfReceptiveAccount: aReceptiveAccount toReportWithAnIndentationLevelOf: indentationLevel

	| collectionOfSummary |
	
	collectionOfSummary := (AccountSummary new) reportOf: aReceptiveAccount.
	
	1 to: collectionOfSummary size do: [ :index |
		
		tree add: 
	        (String streamContents: [ :stream |
	            1 to: (indentationLevel + 1) do: [ :i |
	                stream nextPut: Character tab.
	            ].
	            stream nextPutAll: (collectionOfSummary at: index)
	        ]).
		
	]! !

!PortfolioDetailedTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 14:33:27'!
addNameOfAccountToReport: aName withAnIndentationLevelOf: indentationLevel

	tree add: 
        (String streamContents: [ :stream |
            1 to: indentationLevel do: [ :i |
                stream nextPut: Character tab.
            ].
            stream nextPutAll: aName.
        ]).! !

!PortfolioDetailedTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 15:13:00'!
reportOf: portfolio 
	
	portfolio processReport: self withAnIndentationLevelOf: 0.
	
	^tree! !


!PortfolioDetailedTreePrinter methodsFor: 'initialization' stamp: 'F12 5/20/2025 12:37:19'!
initialize

	tree := OrderedCollection new.! !


!classDefinition: #PortfolioTreePrinter category: #'ServiciosFinancieros-Solucion'!
PortfolioReport subclass: #PortfolioTreePrinter
	instanceVariableNames: 'tree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 17:04:34'!
addMoreInformationOfPortfolio: aPortfolio toReportWithAnIndentationLevelOf: indentationLevel
! !

!PortfolioTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 17:05:16'!
addMoreInformationOfReceptiveAccount: aReceptiveAccount toReportWithAnIndentationLevelOf: indentationLevel
! !

!PortfolioTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 12:30:33'!
addNameOfAccountToReport: aName withAnIndentationLevelOf: indentationLevel

	tree add: 
        (String streamContents: [ :stream |
            1 to: indentationLevel do: [ :i |
                stream nextPut: Character tab.
            ].
            stream nextPutAll: aName.
        ]).
! !

!PortfolioTreePrinter methodsFor: 'operations' stamp: 'F12 5/20/2025 12:26:09'!
reportOf: portfolio 
	
	portfolio processReport: self withAnIndentationLevelOf: 0.
	
	^tree! !


!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'F12 5/20/2025 12:25:39'!
initialize

	tree := OrderedCollection new.
	! !


!classDefinition: #Transfer category: #'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
