!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/22/2018 19:43:01'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |

	customerBook := CustomerBook new.
	
	self evaluationOf: [ customerBook addCustomerNamed: 'John Lennon'. ] shouldNotTakeMoreThan: (50 * millisecond).
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/24/2018 01:02:10'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newBookWithSingleCustomerNamed: paulMcCartney.
	self evaluationOf: [customerBook removeCustomerNamed: paulMcCartney] shouldNotTakeMoreThan: (100 * millisecond)
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/22/2018 20:09:09'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self
		should: [ customerBook addCustomerNamed: '' ]
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/24/2018 01:02:10'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.
	
	customerBook := self newBookWithSingleCustomerNamed: johnLennon.
	
	self
		should: [ customerBook removeCustomerNamed: 'Paul McCartney' ]
		raise: NotFound
		withExceptionDo: [ :anError | self checkOnlyOneCustomerIn: customerBook named: johnLennon ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/24/2018 01:03:24'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self newBookWithSingleSuspendedCustomerNamed: paulMcCartney.
	
	self checkNumberOfCustomersIn: customerBook total: 1 active: 0 suspended: 1. 
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/24/2018 01:03:24'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self newBookWithSingleSuspendedCustomerNamed: paulMcCartney.
	
	customerBook removeCustomerNamed: paulMcCartney.
	
	self checkNumberOfCustomersIn: customerBook total: 0 active: 0 suspended: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/24/2018 01:02:10'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |

	johnLennon := 'John Lennon'.
	
	customerBook := self newBookWithSingleCustomerNamed: johnLennon.

	self
		should: [ customerBook suspendCustomerNamed: 'Paul McCartney' ]
		raise: CantSuspend
		withExceptionDo: [ :anError | self checkOnlyOneCustomerIn: customerBook named: johnLennon ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jml 9/24/2018 01:03:24'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.
			
	customerBook := self newBookWithSingleSuspendedCustomerNamed: johnLennon.
	
	self
		should: [ customerBook suspendCustomerNamed: johnLennon ]
		raise: CantSuspend
		withExceptionDo: [ :anError | self checkOnlyOneCustomerIn: customerBook named: johnLennon ]! !


!CustomerBookTest methodsFor: 'auxiliar' stamp: 'jml 9/22/2018 19:40:00'!
checkNumberOfCustomersIn: customerBook total: numberOfCustomers  active: numberOfActiveCustomers suspended: numberOfSuspendedCustomers
	self assert: numberOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: numberOfCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'jml 9/24/2018 00:56:53'!
checkOnlyOneCustomerIn: aCustomerBook named: aName
	
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aName)! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'jluini 9/20/2018 20:43:44'!
evaluationOf: aBlockClosure shouldNotTakeMoreThan: aTimeMeasure
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlockClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.

	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < aTimeMeasure
	
! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'jml 9/24/2018 01:02:10'!
newBookWithSingleCustomerNamed: customerName
	
	| customerBook |
	
	customerBook := CustomerBook  new.
	customerBook addCustomerNamed: customerName.
	
	^customerBook.
! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'jml 9/24/2018 01:03:24'!
newBookWithSingleSuspendedCustomerNamed: customerName
	
	| customerBook |
	
	customerBook := self newBookWithSingleCustomerNamed: customerName.
	customerBook suspendCustomerNamed: customerName.
	
	^ customerBook
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers suspended'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:28'!
includesCustomerNamed: aName

	^(customers includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:38'!
isEmpty
	
	^customers isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NicolasRinaldi 9/16/2018 21:55:33'!
initialize

	super initialize.
	customers := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'jml 9/22/2018 19:01:56'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:57'!
numberOfActiveCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'jml 9/22/2018 19:04:28'!
numberOfCustomers
	
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'jml 9/22/2018 19:16:33'!
removeCustomerNamed: aName 
	
	self removeCustomerNamed: aName from: customers ifNotFound: [
		self removeCustomerNamed: aName from: suspended ifNotFound: [
			^ NotFound signal
		]
	]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:27:55'!
suspendCustomerNamed: aName 
	
	(customers includes: aName) ifFalse: [^CantSuspend signal].
	
	customers remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'customer management - private' stamp: 'jml 9/22/2018 19:19:32'!
removeCustomerNamed: aName from: aCustomerList ifNotFound: notFoundClosure 
	
	1 to: aCustomerList size do: 
	[ :index |
		aName = (aCustomerList at: index)
			ifTrue: [
				aCustomerList removeAt: index.
				^ aName 
			] 
	].
	
	"this is executed only if the customer to remove was not found in list"
	notFoundClosure value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
