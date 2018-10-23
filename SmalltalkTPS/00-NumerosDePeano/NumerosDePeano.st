!classDefinition: #I category: #'Quinta Actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Quinta Actividad'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operaciones' stamp: 'jml 9/11/2018 04:01:22'!
* unNumeroDePeano

	^unNumeroDePeano! !

!I class methodsFor: 'operaciones' stamp: 'ARM 9/6/2018 21:44:20'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'operaciones' stamp: 'jml 9/11/2018 04:12:04'!
- unNumeroDePeano

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'operaciones' stamp: 'jml 9/11/2018 04:06:12'!
/ unNumeroDePeano

	unNumeroDePeano = I
	ifTrue:[^ self]
	ifFalse:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]! !

!I class methodsFor: 'operaciones' stamp: 'a 9/10/2018 03:29:08'!
< unNumeroDePeano
	self == unNumeroDePeano 
	ifTrue: [^false].
	self  == I 
	ifTrue: [^true]
	ifFalse:[
		(unNumeroDePeano == I)
			ifTrue: [^false]
			ifFalse:[((self-I) < (unNumeroDePeano - I))  ]
						]! !

!I class methodsFor: 'operaciones' stamp: 'ARM 9/6/2018 21:29:22'!
next

	^II! !


!I class methodsFor: 'auxiliar' stamp: 'jml 9/16/2018 19:24:20'!
sustraerDe: unNumeroDePeano
	"devuelve el resultado de restar este número al especificado"
	
	^ unNumeroDePeano previous! !

!I class methodsFor: 'auxiliar' stamp: 'a 9/10/2018 02:28:06'!
vecesDivideA: unNumeroDePeano

	^ unNumeroDePeano! !


!I class methodsFor: 'mensajes de error' stamp: 'jml 9/11/2018 04:05:35'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un número mayor'! !

!I class methodsFor: 'mensajes de error' stamp: 'jml 9/11/2018 04:11:07'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Números negativos no soportados'! !


!classDefinition: #II category: #'Quinta Actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Quinta Actividad'!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'operaciones' stamp: 'jml 9/12/2018 17:26:27'!
* unNumeroDePeano

	^ (prev * unNumeroDePeano) + unNumeroDePeano.
! !

!II class methodsFor: 'operaciones' stamp: 'jml 9/11/2018 04:03:23'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'operaciones' stamp: 'jml 9/16/2018 19:31:14'!
- unNumeroDePeano

	^ unNumeroDePeano sustraerDe: self! !

!II class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:14:12'!
/ unNumeroDePeano

	self = unNumeroDePeano 
	ifTrue:[^I]
	ifFalse:[
		self < unNumeroDePeano 
			ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
			^unNumeroDePeano vecesDivideA: self ]! !

!II class methodsFor: 'operaciones' stamp: 'a 9/10/2018 03:28:19'!
< unNumeroDePeano
	self == unNumeroDePeano 
	ifTrue: [^false].
	self  == I 
	ifTrue: [^true]
	ifFalse:[
		(unNumeroDePeano == I)
			ifTrue: [^false]
			ifFalse:[^ ((self-I) < (unNumeroDePeano - I))  ]
						]! !

!II class methodsFor: 'operaciones' stamp: 'jml 9/11/2018 04:03:04'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next setPrevious: self.
	].
	^next! !

!II class methodsFor: 'operaciones' stamp: 'jml 9/11/2018 04:03:23'!
previous

	^prev! !


!II class methodsFor: 'auxiliar' stamp: 'L.A 9/9/2018 18:17:05'!
removeAllNext

	next ifNotNil:  [
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'auxiliar' stamp: 'jml 9/11/2018 04:03:04'!
setPrevious: unNumeroDePeano

	prev _ unNumeroDePeano! !

!II class methodsFor: 'auxiliar' stamp: 'jml 9/16/2018 19:31:04'!
sustraerDe: unNumeroDePeano
	"devuelve el resultado de restar este número al especificado"
	
	^ unNumeroDePeano previous - self previous! !

!II class methodsFor: 'auxiliar' stamp: 'a 9/11/2018 05:30:02'!
vecesDivideA: unNumeroDePeano

	self = unNumeroDePeano 
	ifTrue:[^I]
	ifFalse:[
	self < unNumeroDePeano 
		ifFalse:[self error: 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'].
		^I + ( self vecesDivideA: (unNumeroDePeano -self)) 
		]! !


!II class methodsFor: 'mensajes de error' stamp: 'jml 9/11/2018 04:07:24'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un número mayor'! !


!II class methodsFor: 'as yet unclassified' stamp: 'asd 9/16/2018 20:17:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	prev := I.! !


!classDefinition: #III category: #'Quinta Actividad'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Quinta Actividad'!
III class
	instanceVariableNames: 'next prev'!

!III class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
* unNumeroDePeano

	^ (prev * unNumeroDePeano) + unNumeroDePeano.
! !

!III class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
- unNumeroDePeano

	^ unNumeroDePeano sustraerDe: self! !

!III class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
/ unNumeroDePeano

	self = unNumeroDePeano 
	ifTrue:[^I]
	ifFalse:[
		self < unNumeroDePeano 
			ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
			^unNumeroDePeano vecesDivideA: self ]! !

!III class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
< unNumeroDePeano
	self == unNumeroDePeano 
	ifTrue: [^false].
	self  == I 
	ifTrue: [^true]
	ifFalse:[
		(unNumeroDePeano == I)
			ifTrue: [^false]
			ifFalse:[^ ((self-I) < (unNumeroDePeano - I))  ]
						]! !

!III class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next setPrevious: self.
	].
	^next! !

!III class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
previous

	^prev! !


!III class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
removeAllNext

	next ifNotNil:  [
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
setPrevious: unNumeroDePeano

	prev _ unNumeroDePeano! !

!III class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
sustraerDe: unNumeroDePeano
	"devuelve el resultado de restar este número al especificado"
	
	^ unNumeroDePeano previous - self previous! !

!III class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
vecesDivideA: unNumeroDePeano

	self = unNumeroDePeano 
	ifTrue:[^I]
	ifFalse:[
	self < unNumeroDePeano 
		ifFalse:[self error: 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'].
		^I + ( self vecesDivideA: (unNumeroDePeano -self)) 
		]! !


!III class methodsFor: 'mensajes de error' stamp: 'asd 9/16/2018 20:15:46'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un número mayor'! !


!III class methodsFor: 'as yet unclassified' stamp: 'asd 9/16/2018 20:17:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	prev := II.! !


!classDefinition: #IIII category: #'Quinta Actividad'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Quinta Actividad'!
IIII class
	instanceVariableNames: 'next prev'!

!IIII class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
* unNumeroDePeano

	^ (prev * unNumeroDePeano) + unNumeroDePeano.
! !

!IIII class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
- unNumeroDePeano

	^ unNumeroDePeano sustraerDe: self! !

!IIII class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
/ unNumeroDePeano

	self = unNumeroDePeano 
	ifTrue:[^I]
	ifFalse:[
		self < unNumeroDePeano 
			ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
			^unNumeroDePeano vecesDivideA: self ]! !

!IIII class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
< unNumeroDePeano
	self == unNumeroDePeano 
	ifTrue: [^false].
	self  == I 
	ifTrue: [^true]
	ifFalse:[
		(unNumeroDePeano == I)
			ifTrue: [^false]
			ifFalse:[^ ((self-I) < (unNumeroDePeano - I))  ]
						]! !

!IIII class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next setPrevious: self.
	].
	^next! !

!IIII class methodsFor: 'operaciones' stamp: 'asd 9/16/2018 20:15:46'!
previous

	^prev! !


!IIII class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
removeAllNext

	next ifNotNil:  [
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
setPrevious: unNumeroDePeano

	prev _ unNumeroDePeano! !

!IIII class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
sustraerDe: unNumeroDePeano
	"devuelve el resultado de restar este número al especificado"
	
	^ unNumeroDePeano previous - self previous! !

!IIII class methodsFor: 'auxiliar' stamp: 'asd 9/16/2018 20:15:46'!
vecesDivideA: unNumeroDePeano

	self = unNumeroDePeano 
	ifTrue:[^I]
	ifFalse:[
	self < unNumeroDePeano 
		ifFalse:[self error: 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'].
		^I + ( self vecesDivideA: (unNumeroDePeano -self)) 
		]! !


!IIII class methodsFor: 'mensajes de error' stamp: 'asd 9/16/2018 20:15:46'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un número mayor'! !


!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 9/16/2018 20:17:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!