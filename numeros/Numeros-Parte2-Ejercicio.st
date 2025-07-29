!classDefinition: #NumeroTest category: #'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'ER 4/5/2025 19:44:13'!
test11EnteroAddsFraccionCorrectly

"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:17:04'!
dividirAEntero: Dividendo

	self subclassResponsibility.! !

!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:17:21'!
dividirAFraccion: Dividendo

	self subclassResponsibility.! !

!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:19:09'!
multiplicarConEntero: Factor

	self subclassResponsibility.! !

!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:19:17'!
multiplicarConFraccion: Factor

	self subclassResponsibility.! !

!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:18:41'!
restarAEntero: Minuendo

	self subclassResponsibility.! !

!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:18:49'!
restarAFraccion: Minuendo

	self subclassResponsibility.! !

!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:18:13'!
sumarEntero: Sumando

	self subclassResponsibility.! !

!Numero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 11:18:24'!
sumarFraccion: Sumando

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: #'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 10:28:18'!
* aMultiplier 	

	^aMultiplier multiplicarConEntero: self.	 
		
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 09:46:19'!
+ anAdder 

	^anAdder sumarEntero: self.

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 09:52:13'!
- aSubtrahend

	^aSubtrahend restarAEntero: self.

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 10:31:21'!
/ aDivisor 

	^aDivisor dividirAEntero: self.	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FAG 4/8/2025 15:09:51'!
fibonacci

	self subclassResponsibility.

		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:51:51'!
isNegative
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:52:01'!
isOne
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:52:10'!
isZero
	
	self subclassResponsibility.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:31:38'!
dividirAEntero: Dividendo

	^ Fraccion with: Dividendo over: self ! !

!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:35:39'!
dividirAFraccion: Dividendo

	^ Fraccion with: Dividendo numerator over: (self * Dividendo denominator)! !

!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:28:31'!
multiplicarConEntero: Factor

	^self class with: value * Factor integerValue.! !

!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:29:28'!
multiplicarConFraccion: Factor

	^Fraccion with: (self * Factor numerator) over: Factor denominator! !

!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 09:52:39'!
restarAEntero: Minuendo

	^self class with: Minuendo integerValue - value! !

!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:25:51'!
restarAFraccion: Minuendo

	^ Fraccion with: ((Minuendo numerator) - ( self value * Minuendo denominator)) over: (Minuendo denominator)

! !

!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 09:48:57'!
sumarEntero: Sumando

	^self class with: value + Sumando integerValue! !

!Entero methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 09:48:47'!
sumarFraccion: Sumando
	
	^ Fraccion with: (self + Sumando denominator) over: Sumando denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'FAG 4/11/2025 14:25:45'!
with: aValue

	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	Entero subclasses asOrderedCollection detect: [ :unaClase | unaClase puedeCrearseConValor: aValue] 
		ifFound: [ :claseAInstanciar | ^claseAInstanciar new initializeWith: aValue ] 
		ifNone: [ ^Error signal ]
		
		
	! !


!classDefinition: #EnteroCero category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroCero methodsFor: 'arithmetic operations' stamp: 'FAG 4/8/2025 14:18:35'!
fibonacci
	^ Entero with: 1! !


!EnteroCero methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:50:11'!
isNegative

	^false! !

!EnteroCero methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:50:16'!
isOne

	^false! !

!EnteroCero methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:39:08'!
isZero
	
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroCero class' category: #'Numeros-Parte2-Ejercicio'!
EnteroCero class
	instanceVariableNames: ''!

!EnteroCero class methodsFor: 'testing' stamp: 'FAG 4/11/2025 13:38:12'!
puedeCrearseConValor: unValor

	^unValor = 0.! !


!classDefinition: #EnteroMayorAUno category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroMayorAUno methodsFor: 'arithmetic operations' stamp: 'FAG 4/8/2025 14:47:27'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	
	^ (self - one) fibonacci + (self - two) fibonacci! !


!EnteroMayorAUno methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:50:34'!
isNegative

	^false! !

!EnteroMayorAUno methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:50:44'!
isOne

	^false! !

!EnteroMayorAUno methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:50:40'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMayorAUno class' category: #'Numeros-Parte2-Ejercicio'!
EnteroMayorAUno class
	instanceVariableNames: ''!

!EnteroMayorAUno class methodsFor: 'testing' stamp: 'FAG 4/11/2025 13:38:54'!
puedeCrearseConValor: unValor

	^unValor > 1.! !


!classDefinition: #EnteroNegativo category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'FAG 4/8/2025 14:17:20'!
fibonacci
	^self error: Entero negativeFibonacciErrorDescription ! !


!EnteroNegativo methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:39:24'!
isNegative

	^true! !

!EnteroNegativo methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:51:13'!
isOne

	^false! !

!EnteroNegativo methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:51:07'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: #'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'testing' stamp: 'FAG 4/11/2025 13:40:06'!
puedeCrearseConValor: unValor

	^unValor < 0.! !


!classDefinition: #EnteroUno category: #'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroUno methodsFor: 'arithmetic operations' stamp: 'FAG 4/8/2025 14:22:30'!
fibonacci

	^ Entero with: 1! !


!EnteroUno methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:51:36'!
isNegative

	^false! !

!EnteroUno methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:39:40'!
isOne

	^true! !

!EnteroUno methodsFor: 'testing' stamp: 'FAG 4/8/2025 14:51:30'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroUno class' category: #'Numeros-Parte2-Ejercicio'!
EnteroUno class
	instanceVariableNames: ''!

!EnteroUno class methodsFor: 'testing' stamp: 'FAG 4/11/2025 13:40:36'!
puedeCrearseConValor: unValor

	^unValor = 1.! !


!classDefinition: #Fraccion category: #'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 10:45:27'!
* aMultiplier 

	^aMultiplier multiplicarConFraccion: self. 

	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 10:37:45'!
+ anAdder 

	^ anAdder sumarFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 10:40:30'!
- aSubtrahend 

	^aSubtrahend restarAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FAG 4/11/2025 10:48:45'!
/ aDivisor 
	
	^aDivisor dividirAFraccion: self.
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:47:04'!
dividirAEntero: Dividendo

	^ Fraccion with: (self denominator * Dividendo) over: self numerator! !

!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:49:05'!
dividirAFraccion: Dividendo

	 ^(denominator * Dividendo numerator) / (numerator * Dividendo denominator)  ! !

!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:44:17'!
multiplicarConEntero: Factor

	^Fraccion with: (self numerator * Factor value) over: self denominator! !

!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:46:02'!
multiplicarConFraccion: Factor

	^(numerator * Factor numerator) / (denominator * Factor denominator)! !

!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:40:00'!
restarAEntero: Minuendo

	^ Fraccion with: ((self denominator * Minuendo) - (self numerator)) over: self denominator
	
! !

!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:40:55'!
restarAFraccion: Minuendo

	| newNumerator newDenominator |
	
	newNumerator := (denominator * Minuendo numerator) - (numerator * Minuendo denominator).
		
	newDenominator := denominator * Minuendo denominator.
	
	^(newNumerator / newDenominator) 
		
	
	! !

!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:37:12'!
sumarEntero: Sumando

	 ^ Fraccion with: (self denominator + Sumando) over: self denominator! !

!Fraccion methodsFor: 'double dispatch' stamp: 'FAG 4/11/2025 10:38:08'!
sumarFraccion: Sumando

	| newNumerator newDenominator |

	newNumerator := (numerator * Sumando denominator) + (denominator * Sumando numerator).
			
	newDenominator := denominator * Sumando denominator.  	
	
	^(newNumerator / newDenominator)
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
