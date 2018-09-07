!classDefinition: #Amalia category: #Golondrina!
DenotativeObject subclass: #Amalia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Golondrina'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Amalia class' category: #Golondrina!
Amalia class
	instanceVariableNames: 'diasDeVida'!

!Amalia class methodsFor: 'as yet unclassified' stamp: 'asd 8/27/2018 21:24:05'!
comer: UnaCantidadDeGramosDeComida
	
	diasDeVida := diasDeVida  + (4*UnaCantidadDeGramosDeComida) ! !

!Amalia class methodsFor: 'as yet unclassified' stamp: 'asd 8/29/2018 22:43:18'!
energia
	^ diasDeVida ! !

!Amalia class methodsFor: 'as yet unclassified' stamp: 'asd 9/7/2018 14:30:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	diasDeVida := 79.! !

!Amalia class methodsFor: 'as yet unclassified' stamp: 'asd 9/7/2018 14:30:03'!
volar:unaCantidadDeKilometros
	
		self.diasDeVida > (unaCantidadDeKilometros  + 10)
		ifTrue: [	diasDeVida  := diasDeVida -10 - unaCantidadDeKilometros]
 		ifFalse: [self error: 'No puede volar, no tiene suficiente energia ' ]
		"ifFalse: [self removeFromSystem ]"! !

Amalia initializeAfterFileIn!