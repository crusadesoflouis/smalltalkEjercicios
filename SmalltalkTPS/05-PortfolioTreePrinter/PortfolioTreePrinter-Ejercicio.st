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


!CertificateOfDeposit methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:47:53'!
accept: anInvestmentEarningsVisitor 
	
	anInvestmentEarningsVisitor AcceptCertificateOfDeposit: self! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'jml 10/18/2018 21:20:44'!
applyToBalance: currentBalance
	
	^ currentBalance - value! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:44:10'!
interestRate

	^interestRate! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:43:59'!
term
	
	^ term! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'jml 10/18/2018 21:23:01'!
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

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:48:12'!
AcceptCertificateOfDeposit: aCertificateOfDeposit 

	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:50:02'!
AcceptDeposit: aDeposit 

	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:50:15'!
AcceptWhitdraw: aWithdraw 
	
	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:50:23'!
acceptTransferDeposit: aTransferDeposit 

	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:50:31'!
acceptTransferWithdraw: aTransferWithdraw 
	
	self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:50:36'!
value
	
	self subclassResponsibility ! !


!classDefinition: #InverstMentNetVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #InverstMentNetVisitor
	instanceVariableNames: 'anAccount inverstmentNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InverstMentNetVisitor methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:26:08'!
value

	inverstmentNet := 0.
	anAccount visitTransactionsWith: self.
	^inverstmentNet .! !



!InverstMentNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 23:24:27'!
AcceptCertificateOfDeposit: aCertificateOfDeposit 
	
	inverstmentNet := inverstmentNet + aCertificateOfDeposit value! !

!InverstMentNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 23:23:11'!
AcceptDeposit: aDeposit 
	! !

!InverstMentNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 23:23:22'!
AcceptWhitdraw: aWithdraw 
	! !

!InverstMentNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 23:23:33'!
acceptTransferWithdraw: aTransferWithdraw 
	! !

!InverstMentNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 23:22:29'!
initializeWith: aReceptiveAccount 
	
	anAccount := aReceptiveAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InverstMentNetVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
InverstMentNetVisitor class
	instanceVariableNames: ''!

!InverstMentNetVisitor class methodsFor: 'as yet unclassified' stamp: 'LA 10/24/2018 23:21:40'!
with: aReceptiveAccount 
	
	^self new initializeWith: aReceptiveAccount ! !


!classDefinition: #InvestmentEarningsVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #InvestmentEarningsVisitor
	instanceVariableNames: 'anAccount InverstMentEarnings'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarningsVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:48:26'!
AcceptCertificateOfDeposit: aCertificateOfDeposit 

	InverstMentEarnings :=InverstMentEarnings + (aCertificateOfDeposit value * (aCertificateOfDeposit interestRate / 360) * aCertificateOfDeposit term)! !

!InvestmentEarningsVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:35:58'!
initializeWith: aReceptiveAccount 
	
	anAccount  := aReceptiveAccount ! !

!InvestmentEarningsVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:44:57'!
value

	InverstMentEarnings :=0.
	anAccount visitTransactionsWith: self.
	^InverstMentEarnings ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentEarningsVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentEarningsVisitor class
	instanceVariableNames: ''!

!InvestmentEarningsVisitor class methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:40:01'!
with: aReceptiveAccount 
	
	^self new initializeWith: aReceptiveAccount ! !


!classDefinition: #SumaryLinesVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #SumaryLinesVisitor
	instanceVariableNames: 'anAccount lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SumaryLinesVisitor methodsFor: 'accesing' stamp: 'LA 10/24/2018 22:59:43'!
AcceptCertificateOfDeposit: aCertificateOfDeposit 

	lines add: 'Plazo fijo por ', aCertificateOfDeposit value printString, ' durante ', aCertificateOfDeposit term printString ,' dias a una tna de ', (aCertificateOfDeposit  interestRate*100) printString, '%'.	
! !

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



!classDefinition: #TransferNetVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #TransferNetVisitor
	instanceVariableNames: 'anAccount transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 22:45:54'!
AcceptCertificateOfDeposit: aCertificateOfDeposit 
! !

!TransferNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 21:57:04'!
AcceptDeposit: aDeposit ! !

!TransferNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 21:57:13'!
AcceptWhitdraw: aWithdraw 
	! !

!TransferNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 21:58:23'!
acceptTransferDeposit: aTransferDeposit 

	transferNet  := transferNet + aTransferDeposit value! !

!TransferNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 21:58:34'!
acceptTransferWithdraw: aTransferWithdraw 
	
	transferNet  := transferNet - aTransferWithdraw value	! !

!TransferNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 21:41:44'!
initializeWith: aReceptiveAccount 
	
	
	anAccount  := aReceptiveAccount ! !

!TransferNetVisitor methodsFor: 'accessing' stamp: 'LA 10/24/2018 21:52:09'!
value

	transferNet:= 0.
	anAccount  visitTransactionsWith: self.
	^transferNet ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNetVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferNetVisitor class
	instanceVariableNames: ''!

!TransferNetVisitor class methodsFor: 'accessing' stamp: 'LA 10/24/2018 21:41:25'!
with: aReceptiveAccount 
	
	^ self new initializeWith:aReceptiveAccount ! !


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


!ReceptiveAccount methodsFor: 'accessing' stamp: 'jml 10/18/2018 21:00:00'!
balance
	
	^ transactions inject: 0 into: [ :balance :transaction | transaction applyToBalance: balance ]! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'LA 10/23/2018 04:32:31'!
visitTransactionsWith: aVisitor 
	
	transactions do: [:aTransacction | aTransacction accept: aVisitor]! !


!classDefinition: #SummarizingAccountVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccountVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!


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
