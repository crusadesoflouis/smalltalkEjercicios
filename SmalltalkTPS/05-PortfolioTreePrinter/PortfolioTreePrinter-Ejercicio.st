!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'balance' stamp: 'jml 10/18/2018 20:56:46'!
applyToBalance: currentBalance
	
	self subclassResponsibility! !

!AccountTransaction methodsFor: 'balance' stamp: 'jml 10/18/2018 21:29:26'!
applyToInvestmentEarnings: currentEarnings
	
	^ currentEarnings! !

!AccountTransaction methodsFor: 'balance' stamp: 'jml 10/18/2018 21:26:12'!
applyToInvestmentNet: currentNet
	
	^ currentNet! !

!AccountTransaction methodsFor: 'balance' stamp: 'jml 10/18/2018 21:26:21'!
applyToTransferNet: currentNet
	
	^ currentNet! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'summary' stamp: 'jml 10/18/2018 20:52:42'!
summaryLine
	
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'jml 10/18/2018 09:40:04'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value term interestRate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'initialization' stamp: 'jml 10/18/2018 21:18:48'!
initializeFor: anAmount during: aTerm at: anInterestRate
	
	value := anAmount.
	term := aTerm.
	interestRate := anInterestRate.! !


!CertificateOfDeposit methodsFor: 'balance' stamp: 'jml 10/18/2018 21:20:44'!
applyToBalance: currentBalance
	
	^ currentBalance - value! !

!CertificateOfDeposit methodsFor: 'balance' stamp: 'jml 10/18/2018 21:34:02'!
applyToInvestmentEarnings: currentEarnings
	
	^ currentEarnings + (value * (interestRate / 360) * term)! !

!CertificateOfDeposit methodsFor: 'balance' stamp: 'jml 10/18/2018 21:25:51'!
applyToInvestmentNet: currentNet
	
	^ currentNet + value! !



!CertificateOfDeposit methodsFor: 'value' stamp: 'jml 10/18/2018 21:23:01'!
value
	
	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'jml 10/18/2018 21:17:16'!
register: anAmount during: aTerm at: anInterestRate on: anAccount
	
	| newCertificate |
	
	newCertificate := self new initializeFor: anAmount during: aTerm at: anInterestRate.
	
	anAccount register: newCertificate.
	
	^ newCertificate! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'jml 10/18/2018 19:57:05'!
initializeFor: aValue
	
	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'jml 10/22/2018 18:15:13'!
value
	
	^ value! !


!Deposit methodsFor: 'balance' stamp: 'jml 10/18/2018 20:57:01'!
applyToBalance: currentBalance
	
	^ currentBalance + value! !



!Deposit methodsFor: 'accessing' stamp: 'LA 10/23/2018 04:36:09'!
accept: aVisitor

	aVisitor AcceptDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'jml 10/18/2018 18:56:56'!
for: aValue
	"TODO subir a superclase?"
	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferLeg methodsFor: 'balance' stamp: 'jml 10/18/2018 21:06:01'!
applyToTransferNet: currentNet
	
	^ self applyToBalance: currentNet! !


!TransferLeg methodsFor: 'value' stamp: 'jml 10/18/2018 20:40:00'!
value
	
	^ transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'jml 10/18/2018 20:40:27'!
initializeFor: aTransfer
	
	transfer := aTransfer.! !


!TransferLeg methodsFor: 'accessing' stamp: 'jml 10/18/2018 20:39:54'!
transfer
	
	^ transfer! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'balance' stamp: 'jml 10/18/2018 20:58:38'!
applyToBalance: currentBalance
	
	^ currentBalance + self value! !


!TransferDeposit methodsFor: 'summary' stamp: 'LA 10/23/2018 05:08:45'!
accept: aVisitor

	aVisitor acceptTransferDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'jml 10/18/2018 20:01:28'!
for: aTransfer
	
	^ self new initializeFor: aTransfer! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'balance' stamp: 'jml 10/18/2018 20:59:02'!
applyToBalance: currentBalance
	
	^ currentBalance - self value! !



!TransferWithdraw methodsFor: 'accessing' stamp: 'LA 10/23/2018 04:48:00'!
accept: aVisitor

	aVisitor acceptTransferWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'jml 10/18/2018 20:01:39'!
for: aTransfer
	
	^ self new initializeFor: aTransfer! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'jml 10/18/2018 20:59:18'!
applyToBalance: currentBalance
	
	^ currentBalance - value! !


!Withdraw methodsFor: 'summary' stamp: 'jml 10/18/2018 20:22:50'!
summaryLine
	
	^ 'Extraccion por ', value printString! !


!Withdraw methodsFor: 'accessing' stamp: 'LA 10/23/2018 04:43:40'!
accept: aVisitor 
	
	aVisitor AcceptWhitdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransactionVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransactionVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!


!classDefinition: #SumaryLinesVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #SumaryLinesVisitor
	instanceVariableNames: 'anAccount lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SumaryLinesVisitor methodsFor: 'accesing' stamp: 'LA 10/23/2018 04:46:06'!
AcceptDeposit: aDeposit 
	
	lines add:  'Deposito por ', aDeposit value printString! !

!SumaryLinesVisitor methodsFor: 'accesing' stamp: 'LA 10/23/2018 04:46:28'!
AcceptWhitdraw: aWithdraw 
	
	lines add:  'Extraccion por ', aWithdraw value printString! !

!SumaryLinesVisitor methodsFor: 'accesing' stamp: 'LA 10/23/2018 05:09:50'!
acceptTransferDeposit: aTransferDeposit 
	
	lines add:  'Transferencia por ', aTransferDeposit value printString! !

!SumaryLinesVisitor methodsFor: 'accesing' stamp: 'LA 10/23/2018 05:09:55'!
acceptTransferWithdraw: aTransferWithdraw 
	
	lines add: 'Transferencia por -', aTransferWithdraw value printString! !

!SumaryLinesVisitor methodsFor: 'accesing' stamp: 'LA 10/23/2018 05:07:09'!
value

	lines := OrderedCollection new.
	anAccount visitTransactionsWith: self.
	^lines
	
	! !


!SumaryLinesVisitor methodsFor: 'initializing' stamp: 'LA 10/23/2018 05:06:52'!
initializeWith: aReceptiveAccount 

	anAccount  := aReceptiveAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SumaryLinesVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
SumaryLinesVisitor class
	instanceVariableNames: ''!

!SumaryLinesVisitor class methodsFor: 'as yet unclassified' stamp: 'LA 10/23/2018 04:14:26'!
with: anAccount

	^self new  initializeWith: anAccount ! !



!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:28'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'L A 10/18/2018 11:54:15'!
doesManageAnyPartOf: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'balance' stamp: 'jml 10/15/2018 13:12:53'!
balance

	self subclassResponsibility! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'jml 10/12/2018 14:48:18'!
doesManage: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :account | account doesManage: anAccount ] ]
! !

!Portfolio methodsFor: 'testing' stamp: 'jml 10/13/2018 01:58:46'!
doesManageAnyPartOf: anAccount

	^ (anAccount doesManage: self) or: [ accounts anySatisfy: [ :account | account doesManageAnyPartOf: anAccount ] ]
! !

!Portfolio methodsFor: 'testing' stamp: 'jml 10/12/2018 12:04:31'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [ :account | account hasRegistered: aTransaction ]! !


!Portfolio methodsFor: 'transactions' stamp: 'jml 10/18/2018 18:48:35'!
transactions 
	
	^ accounts inject: (OrderedCollection new) into: [ :transactions :account | transactions addAll: (account transactions); yourself ]! !

!Portfolio methodsFor: 'transactions' stamp: 'jml 10/15/2018 12:58:26'!
transactionsOf: anAccount 

	(self doesManage: anAccount)
		ifFalse: [ self error: self class accountNotManagedMessageDescription ].
	
	^ anAccount transactions! !


!Portfolio methodsFor: 'adding' stamp: 'jml 10/15/2018 12:46:55'!
addAccount: anAccount
	
	(self doesManageAnyPartOf: anAccount)
		ifTrue: [ self error: self class accountAlreadyManagedErrorMessage ].
	
	accounts add: anAccount.
! !


!Portfolio methodsFor: 'initialization' stamp: 'jml 10/12/2018 11:41:30'!
initialize
	
	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'jml 10/15/2018 12:44:07'!
balance
	
	^ accounts sum: [ :account | account balance ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'jml 10/15/2018 12:14:30'!
with: leftAccount with: rightAccount
	
	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'jml 10/15/2018 13:08:18'!
withAll: aCollectionOfAccounts

	| newPortfolio |
	
	aCollectionOfAccounts ifEmpty: [ self error: self emptyPortfolioErrorMessage ].
	
	newPortfolio := self new.
	aCollectionOfAccounts do: [ :account | newPortfolio addAccount: account ].
	
	^ newPortfolio! !


!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:43'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:53'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'jml 10/15/2018 13:09:25'!
emptyPortfolioErrorMessage
	
	^ 'Cannot create an empty portfolio'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'jml 10/22/2018 18:15:03'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:28'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'jml 10/13/2018 01:59:33'!
doesManageAnyPartOf: anAccount

	^ anAccount doesManage: self
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'jml 10/12/2018 10:50:23'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'jml 10/18/2018 21:00:00'!
balance
	
	^ transactions inject: 0 into: [ :balance :transaction | transaction applyToBalance: balance ]! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'jml 10/18/2018 21:29:09'!
investmentEarnings
	
	^ transactions inject: 0 into: [ :earnings :transaction | transaction applyToInvestmentEarnings: earnings ]! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'jml 10/18/2018 21:24:46'!
investmentNet
	
	^ transactions inject: 0 into: [ :net :transaction | transaction applyToInvestmentNet: net ]! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'jml 10/18/2018 21:03:17'!
transferNet
	
	^ transactions inject: 0 into: [ :net :transaction | transaction applyToTransferNet: net ]! !



!ReceptiveAccount methodsFor: 'accessing' stamp: 'LA 10/23/2018 04:32:31'!
visitTransactionsWith: aVisitor 
	
	transactions do: [:aTransacction | aTransacction accept: aVisitor]! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'jml 10/22/2018 18:24:29'!
initializeFor: aValue

	value := aValue.
	withdrawLeg := TransferWithdraw for: self.
	depositLeg := TransferDeposit for: self.
! !


!Transfer methodsFor: 'value' stamp: 'jml 10/18/2018 18:57:55'!
value
	
	^ value! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'jml 10/18/2018 20:02:34'!
depositLeg
	
	^ depositLeg! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'jml 10/18/2018 20:02:49'!
withdrawLeg
	
	^ withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'jml 10/18/2018 20:07:42'!
register: anAmount from: fromAccount to: toAccount
	
	| newTransfer |
	
	newTransfer := (self new initializeFor: anAmount).
	
	fromAccount register: newTransfer withdrawLeg.
	toAccount register: newTransfer depositLeg.
	
	^ newTransfer! !
