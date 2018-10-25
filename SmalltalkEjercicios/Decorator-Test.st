!classDefinition: #DecoratorTest category: #'Decorator-Test'!
TestCase subclass: #DecoratorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Decorator-Test'!

!DecoratorTest methodsFor: 'as yet unclassified' stamp: 'la 10/25/2018 06:35:12'!
test01rectangleMustSayWhatIs

	self assert: (Rectangulo new draw) equals: 'soy un rectangulo' ! !

!DecoratorTest methodsFor: 'as yet unclassified' stamp: 'la 10/25/2018 06:36:30'!
test02CircleMustSayWhatIs

	self assert: (Circle new draw) equals: 'soy un circulo' ! !

!DecoratorTest methodsFor: 'as yet unclassified' stamp: 'la 10/25/2018 14:51:11'!
test03mustBeRedCircle

	self assert: ((ColoringShapeWithRed decorating: Circle new) draw) equals: 'soy un circulo de color rojo' ! !

!DecoratorTest methodsFor: 'as yet unclassified' stamp: 'la 10/25/2018 14:53:06'!
test04mustBeRedRectangle

	self assert: ((ColoringShapeWithRed decorating: Rectangulo new) draw) equals: 'soy un rectangulo de color rojo' ! !

!DecoratorTest methodsFor: 'as yet unclassified' stamp: 'la 10/25/2018 15:30:27'!
test05mustBeRedRectangleWithNormalBorder

	self assert: ((NormalBorderShapeDecorator decorating: (ColoringShapeWithRed decorating: Rectangulo new ) ) draw) equals: 'soy un rectangulo de color rojo con bordes normales' ! !
