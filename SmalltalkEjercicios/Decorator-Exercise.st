!classDefinition: #Shape category: #'Decorator-Exercise'!
Object subclass: #Shape
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Decorator-Exercise'!


!classDefinition: #Circle category: #'Decorator-Exercise'!
Shape subclass: #Circle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Decorator-Exercise'!

!Circle methodsFor: 'drawing' stamp: 'la 10/25/2018 06:36:17'!
draw

	^'soy un circulo'! !


!classDefinition: #ColoringShapeWithRed category: #'Decorator-Exercise'!
Shape subclass: #ColoringShapeWithRed
	instanceVariableNames: 'decoratee'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Decorator-Exercise'!

!ColoringShapeWithRed methodsFor: 'creation' stamp: 'la 10/25/2018 15:28:04'!
draw

	^ self NormalBoardingShape! !

!ColoringShapeWithRed methodsFor: 'creation' stamp: 'la 10/25/2018 14:45:58'!
initializeDecorator: aShape 
	
	decoratee := aShape! !


!ColoringShapeWithRed methodsFor: 'coloring' stamp: 'la 10/25/2018 15:28:04'!
NormalBoardingShape
	
	^ decoratee draw , ' de color rojo'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ColoringShapeWithRed class' category: #'Decorator-Exercise'!
ColoringShapeWithRed class
	instanceVariableNames: ''!

!ColoringShapeWithRed class methodsFor: 'creation' stamp: 'la 10/25/2018 14:45:49'!
decorating: aShape 
	
	^ self new initializeDecorator: aShape! !


!classDefinition: #NormalBorderShapeDecorator category: #'Decorator-Exercise'!
Shape subclass: #NormalBorderShapeDecorator
	instanceVariableNames: 'decoratee'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Decorator-Exercise'!

!NormalBorderShapeDecorator methodsFor: 'creation' stamp: 'la 10/25/2018 15:28:04'!
draw

	^ self NormalBoardingShape! !

!NormalBorderShapeDecorator methodsFor: 'creation' stamp: 'la 10/25/2018 15:25:24'!
initializeDecorator: aShape 
	
	decoratee := aShape! !


!NormalBorderShapeDecorator methodsFor: 'boarding' stamp: 'la 10/25/2018 15:28:16'!
CircularBoardingShape
	
	^ decoratee draw , ' con bordes circulares'! !

!NormalBorderShapeDecorator methodsFor: 'boarding' stamp: 'la 10/25/2018 15:28:04'!
NormalBoardingShape
	
	^ decoratee draw , ' con bordes normales'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NormalBorderShapeDecorator class' category: #'Decorator-Exercise'!
NormalBorderShapeDecorator class
	instanceVariableNames: ''!

!NormalBorderShapeDecorator class methodsFor: 'creation' stamp: 'la 10/25/2018 15:25:24'!
decorating: aShape 
	
	^ self new initializeDecorator: aShape! !


!classDefinition: #Rectangulo category: #'Decorator-Exercise'!
Shape subclass: #Rectangulo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Decorator-Exercise'!

!Rectangulo methodsFor: 'drawing' stamp: 'la 10/25/2018 06:33:24'!
draw
	
	^'soy un rectangulo'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rectangulo class' category: #'Decorator-Exercise'!
Rectangulo class
	instanceVariableNames: ''!

!Rectangulo class methodsFor: 'accessing' stamp: 'la 10/25/2018 06:32:05'!
draw
	
	^'soy un rectangulo'! !
