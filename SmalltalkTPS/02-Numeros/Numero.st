!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:26'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

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


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:09:53'!
+ anAddend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:34:44'!
- aSubtrahend 
	
	^self + aSubtrahend negated! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

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


!Numero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:11:38'!
addEntero: anAddend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:11:51'!
addFraccion: anAddend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:12:29'!
divideEntero: aDividend
	
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:13:34'!
divideFraccion: aDividend
	
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:14:50'!
multiplyEntero: aMultiplier
	
	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:15:03'!
multiplyFraccion: aMultiplier
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:16:10'!
* aMultiplier 
	
	^aMultiplier multiplyEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:16:05'!
+ anAddend
	
	^anAddend addEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:17:12'!
/ aDivisor
	
	^aDivisor divideEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jml 9/30/2018 18:42:26'!
// aDivisor 
	
	^ Entero with: (self integerValue // aDivisor integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jml 9/29/2018 02:39:33'!
fibonacci
	
	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'jml 9/30/2018 18:40:28'!
greatestCommonDivisorWith: anEntero 
	
	^ Entero with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'jml 9/29/2018 02:01:47'!
= anObject

	^(anObject isKindOf: self class) and: [ self integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'jml 9/29/2018 02:03:22'!
hash

	^self integerValue hash! !


!Entero methodsFor: 'initialization' stamp: 'jml 9/30/2018 18:49:16'!
initializeWith: aValue
	
	self subclassResponsibility ! !


!Entero methodsFor: 'value' stamp: 'jml 9/29/2018 02:00:49'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	self subclassResponsibility ! !


!Entero methodsFor: 'printing' stamp: 'jml 9/29/2018 02:05:59'!
printOn: aStream

	aStream print: self integerValue.! !


!Entero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:25:41'!
ifNegative: aBlock
	
	self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:25:23'!
ifOne: aBlock
	
	self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:25:09'!
ifZero: aBlock
	
	self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:37:45'!
isNegative
	
	self ifNegative: [ ^ true].
	^ false.! !

!Entero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:37:15'!
isOne
	
	self ifOne: [ ^ true].
	^ false.! !

!Entero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:37:11'!
isZero
	
	self ifZero: [ ^ true].
	^ false.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/30/2018 18:44:05'!
addEntero: anAddend
	
	^ Entero with: (self integerValue + anAddend integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:19:52'!
addFraccion: anAddend

	^anAddend addEntero: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:20:36'!
divideEntero: aDividend
	
	^Fraccion with: aDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 14:32:58'!
divideFraccion: aDividend
	
	| newNumerator newDenominator |
	
	newNumerator := aDividend numerator.
	newDenominator := self * aDividend denominator.
	
	^Fraccion with: newNumerator over: newDenominator! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/30/2018 18:45:14'!
multiplyEntero: aMultiplier

	^ Entero with: (self integerValue * aMultiplier integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:23:04'!
multiplyFraccion: aMultiplier

	^aMultiplier multiplyEntero: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 9/23/2018 22:17:16'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para enteros negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'jml 9/30/2018 18:50:33'!
with: aValue 
	
	| enteroClass |
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	enteroClass := self subclasses detect: [ :aClass | aClass represents: aValue ].
	
	^ enteroClass new initializeWith: aValue.! !


!Entero class methodsFor: 'value' stamp: 'jml 9/30/2018 18:20:54'!
represents: aValue
	"Does this Entero's sublcass represent this integer value?"
	
	self subclassResponsibility! !


!classDefinition: #GreaterThanOneEntero category: #'Numero-Exercise'!
Entero subclass: #GreaterThanOneEntero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!GreaterThanOneEntero methodsFor: 'initialization' stamp: 'jml 10/1/2018 16:55:38'!
initializeWith: aValue
	
	value := aValue.! !


!GreaterThanOneEntero methodsFor: 'value' stamp: 'jml 9/29/2018 02:14:43'!
integerValue
	
	^ value! !


!GreaterThanOneEntero methodsFor: 'arithmetic operations' stamp: 'jml 9/29/2018 02:20:06'!
fibonacci
	
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !


!GreaterThanOneEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:26:42'!
ifNegative: aBlock
	! !

!GreaterThanOneEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:26:37'!
ifOne: aBlock
	! !

!GreaterThanOneEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:26:22'!
ifZero: aBlock
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GreaterThanOneEntero class' category: #'Numero-Exercise'!
GreaterThanOneEntero class
	instanceVariableNames: ''!

!GreaterThanOneEntero class methodsFor: 'value' stamp: 'jml 9/30/2018 18:31:45'!
represents: aValue
	
	^ aValue > 1! !


!classDefinition: #NegativeEntero category: #'Numero-Exercise'!
Entero subclass: #NegativeEntero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NegativeEntero methodsFor: 'initialization' stamp: 'jml 10/1/2018 16:55:28'!
initializeWith: aValue
	
	value := aValue.! !


!NegativeEntero methodsFor: 'value' stamp: 'jml 9/29/2018 02:14:57'!
integerValue
	
	^ value! !


!NegativeEntero methodsFor: 'arithmetic operations' stamp: 'jml 9/29/2018 02:17:10'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !


!NegativeEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:27:25'!
ifNegative: aBlock
	
	aBlock value.! !

!NegativeEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:27:04'!
ifOne: aBlock
	! !

!NegativeEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:26:59'!
ifZero: aBlock
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NegativeEntero class' category: #'Numero-Exercise'!
NegativeEntero class
	instanceVariableNames: ''!

!NegativeEntero class methodsFor: 'value' stamp: 'jml 9/30/2018 18:32:52'!
represents: aValue
	
	^ aValue < 0! !


!classDefinition: #OneEntero category: #'Numero-Exercise'!
Entero subclass: #OneEntero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!OneEntero methodsFor: 'value' stamp: 'jml 9/29/2018 02:15:12'!
integerValue
	
	^ 1! !


!OneEntero methodsFor: 'arithmetic operations' stamp: 'jml 9/29/2018 02:18:12'!
fibonacci
	
	^ self! !


!OneEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:28:06'!
ifNegative: aBlock
	! !

!OneEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:27:55'!
ifOne: aBlock
	
	aBlock value.! !

!OneEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:27:41'!
ifZero: aBlock! !


!OneEntero methodsFor: 'initialization' stamp: 'jml 9/30/2018 18:49:49'!
initializeWith: aValue
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OneEntero class' category: #'Numero-Exercise'!
OneEntero class
	instanceVariableNames: ''!

!OneEntero class methodsFor: 'value' stamp: 'jml 9/30/2018 18:33:15'!
represents: aValue
	
	^ aValue = 1! !


!classDefinition: #ZeroEntero category: #'Numero-Exercise'!
Entero subclass: #ZeroEntero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!ZeroEntero methodsFor: 'value' stamp: 'jml 9/29/2018 02:15:24'!
integerValue
	
	^ 0! !


!ZeroEntero methodsFor: 'arithmetic operations' stamp: 'jml 9/29/2018 02:18:39'!
fibonacci
	
	^ Entero with: 1! !


!ZeroEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:29:12'!
ifNegative: aBlock! !

!ZeroEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:29:06'!
ifOne: aBlock! !

!ZeroEntero methodsFor: 'testing' stamp: 'jml 9/29/2018 02:28:54'!
ifZero: aBlock
	
	aBlock value.! !


!ZeroEntero methodsFor: 'initialization' stamp: 'jml 9/30/2018 18:50:18'!
initializeWith: aValue
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ZeroEntero class' category: #'Numero-Exercise'!
ZeroEntero class
	instanceVariableNames: ''!

!ZeroEntero class methodsFor: 'value' stamp: 'jml 9/30/2018 18:33:39'!
represents: aValue
	
	^ aValue = 0! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:23:30'!
* aMultiplier 

	^aMultiplier multiplyFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:23:44'!
+ anAddend

	^anAddend addFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'jml 9/25/2018 01:24:08'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


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


!Fraccion methodsFor: 'initialization' stamp: 'jml 9/30/2018 18:56:05'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator ifZero: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator ifOne: [ self error: 'una fraccion no puede tener denominador 1 porque si no es un entero' ].
	aDenominator ifZero: [ self error: 'una fraccion no puede tener denominador cero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'jml 9/29/2018 02:35:41'!
isNegative
	
	^numerator isNegative! !

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


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:45:40'!
addEntero: anAddend
	
	| newNumerator newDenominator |
	
	newNumerator := numerator + (denominator * anAddend).
	newDenominator := denominator.
	
	^Fraccion with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:44:03'!
addFraccion: anAddend
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAddend denominator) + (denominator * anAddend numerator).
	newDenominator := denominator * anAddend denominator.
	
	^Fraccion with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:45:21'!
divideEntero: aDividend
	
	| newNumerator newDenominator |
	
	newNumerator := aDividend * denominator.
	newDenominator := numerator.
	
	^Fraccion with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:43:12'!
divideFraccion: aDividend

	| newNumerator newDenominator |
	
	newNumerator := denominator * aDividend numerator.
	newDenominator := numerator * aDividend denominator.
	
	^Fraccion with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:46:48'!
multiplyEntero: aMultiplier
	
	| newNumerator newDenominator |
	
	newNumerator := numerator * aMultiplier.
	newDenominator := denominator.
	
	^Fraccion with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'jml 9/25/2018 01:47:50'!
multiplyFraccion: aMultiplier
	
	| newNumerator newDenominator |
	
	newNumerator := numerator * aMultiplier numerator.
	newDenominator := denominator * aMultiplier denominator.
	
	^Fraccion with: newNumerator over: newDenominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'jml 9/29/2018 02:22:11'!
with: aNumerator over: aDenominator

	| greatestCommonDivisor newNumerator newDenominator |
	
	aDenominator ifZero: [ self error: self canNotDivideByZeroErrorDescription ].
	aNumerator ifZero: [ ^ aNumerator ].
	
	aDenominator ifNegative: [
		^self with: aNumerator negated over: aDenominator negated
	].
	
	greatestCommonDivisor := aNumerator greatestCommonDivisorWith: aDenominator. 
	newNumerator := aNumerator // greatestCommonDivisor.
	newDenominator := aDenominator // greatestCommonDivisor.
	
	newDenominator ifOne: [ ^ newNumerator ].

	^self new initializeWith: newNumerator over: newDenominator
	! !
