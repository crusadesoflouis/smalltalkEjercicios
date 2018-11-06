!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 19:23:17'!
test01BoardIsInitiallyEmpty
	
	| game |
	
	game := TerniLapilli new.
	
	self assert: (self boardIsEmpty: game).! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test02XCanPlayAtSomePosition

	| game position restOfPositions |
	
	position := 1@1.
	restOfPositions := self allPositions.
	restOfPositions remove: position.

	game := TerniLapilli new.
	game placeAt: position.
	
	self assert: (game hasX: position).
	self deny: (game hasO: position).
	self deny: (game isEmpty: position).	
	self assert: (restOfPositions allSatisfy: [ :aPosition | game isEmpty: aPosition ]).
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test03OCanPlayAfterX

	| game xPosition oPosition |
	
	xPosition := 1@1.
	oPosition := 1@3.
	
	game := TerniLapilli new.
	game placeAt: xPosition.
	game placeAt: oPosition.

	self assert: (game hasO: oPosition).
	self deny: (game hasX: oPosition).
	self deny: (game isEmpty: oPosition).
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test07CannotPlayAtInvalidPosition
	|game anInvalidPosition |
	
	"TODO hacer cuatro tests separados"
	
	anInvalidPosition := 0@1.
	
	game := TerniLapilli new.
	
	self should: [game placeAt: anInvalidPosition ] raise: Exception withExceptionDo: [ :exception |
		self assert:  (exception messageText ) equals: (TerniLapilli invalidPositionErrorDescription).
		self assert: (self boardIsEmpty: game).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test08CannotPlayAtAnOccupiedPosition
	
	| aPosition game |
	
	game := TerniLapilli new.
	aPosition := 2@2.
	
	game placeAt: aPosition.
	
	self should: [ game placeAt: aPosition ] raise: Error withExceptionDo: [ :anException |
		self assert: anException messageText equals: TerniLapilli occupiedPositionErrorDescription.
		self assert: (game hasX: aPosition).
		self deny: (game hasO: aPosition).
		self deny: (game isEmpty: aPosition).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test09InitiallyWonGameForColumnsIsFinished
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 2@2.
	game placeAt: 1@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	
	self assert: game isFinished.
	self assert: game wonForX.
	self deny: game wonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test10InitiallyWonGameForRowIsFinished
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 2@2.
	game placeAt: 2@1.
	game placeAt: 3@3.
	game placeAt: 3@1.

	self assert: game isFinished.
	self assert: game wonForX.
	self deny: game wonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test11InitiallyWonGameForDiagonalIsFinished
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 1@3.
	game placeAt: 2@2.
	game placeAt: 3@1.
	game placeAt: 3@3.
	
	self assert: game isFinished.
	self assert: game wonForX.
	self deny: game wonForO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'la 11/6/2018 00:43:16'!
test12CannotPlayWhenGameIsFinished
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 2@1.
	game placeAt: 1@2.
	game placeAt: 2@2.
	game placeAt: 1@3.
	
	self should: [ game placeAt: 2@3 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli finishedGameErrorDescription.
		self assert: (game isEmpty: 2@3).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test13GameInitialPhaseFinishedWhitoutWinner
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 2@1.
	game placeAt: 1@2.
	game placeAt: 2@2.
	game placeAt: 2@3.
	game placeAt: 1@3.
	
	self deny: game isFinished.
	self deny: game inInitialPhase.
	
	self should: [ game placeAt: 3@3 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli cannotAddMorePieces.
		self assert: (game isEmpty: 3@3).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test14gameInitialPhaseNotFinished
	
	| game |
	
	game := TerniLapilli new.
	game placeAt: 1@1.
	
	self deny: game isFinished.
	self assert: game inInitialPhase.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test15InvalidMovementBecauseOfInvalidPositions
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 3@1.
	game placeAt: 1@2.
	game placeAt: 3@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	
	self should: [game moveFrom: 1@1 to: 0@0] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidPositionErrorDescription.
		self assert: (game hasX: 1@1).
	].
	
	self should: [game moveFrom: 4@3 to: 2@2] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidPositionErrorDescription.
		self assert: (game isEmpty: 2@2).	
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test16InvalidMovementBecauseOfMissingPiece
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 3@1.
	game placeAt: 1@2.
	game placeAt: 3@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	
	self should: [game moveFrom: 3@1 to: 2@1 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli missingPieceErrorDescription.
		self assert: (game hasO: 3@1).
		self assert: (game isEmpty: 2@1).
	].
	
	self should: [game moveFrom: 2@2 to: 2@1] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli missingPieceErrorDescription.
		self assert: (game isEmpty: 2@2).
		self assert: (game isEmpty: 2@1)
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test17InvalidMovementBecauseOfUnconnectedPositions
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 3@1.
	game placeAt: 1@2.
	game placeAt: 3@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	
	self should: [ game moveFrom: 1@2 to: 2@1 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidMoveErrorDescription.
		self assert: (game hasX: 1@2).
		self assert: (game isEmpty: 2@1)
	].
	
	self should: [ game moveFrom: 1@1 to: 2@3 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli invalidMoveErrorDescription.
		self assert: (game hasX: 1@1).
		self assert: (game isEmpty: 2@3)	
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test18CanMove
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 3@1.
	game placeAt: 1@2.
	game placeAt: 3@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	game moveFrom: 1@1 to: 2@2.

	self assert: (game isEmpty: 1@1).
	self assert: (game hasX: 2@2).
	self deny: game isFinished
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test19OCanMoveAfterX
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 3@1.
	game placeAt: 1@2.
	game placeAt: 3@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	game moveFrom: 1@1 to: 2@2.
	game moveFrom: 1@3 to: 2@3.

	self assert: (game isEmpty: 1@3).
	self assert: (game hasO: 2@3).
	self deny: game isFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test20WonAfterAMove
	
	| game |
	
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 3@1.
	game placeAt: 1@2.
	game placeAt: 3@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	game moveFrom: 1@2 to: 2@2.
	
	self assert: game isFinished
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test21CannotMoveWhenGameIsFinished
	| game |
	game := TerniLapilli new.
	
	game placeAt: 1@1.
	game placeAt: 3@1.
	game placeAt: 1@2.
	game placeAt: 3@2.
	game placeAt: 3@3.
	game placeAt: 1@3.
	game moveFrom: 1@2 to: 2@2.
	
	self should: [ game moveFrom: 3@1 to: 2@1 ] raise: Error withExceptionDo: [ : anException |
		self assert: anException messageText equals: TerniLapilli finishedGameErrorDescription.
		self assert: (game hasO: 3@1).
		self assert: (game isEmpty: 2@1).
	].! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'jml 11/5/2018 21:20:19'!
test22CannontMoveDuringInitialPhase

	| game |	
	game := TerniLapilli new.
	game placeAt: 1@1.
	game placeAt: 1@2.
	
	self should: [ game moveFrom: 1@1 to: 2@1. ] raise: Error withExceptionDo: [ :anException |
		self assert: anException messageText equals: TerniLapilli cannotMoveYetErrorDescription.
	].
	! !


!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'jml 11/5/2018 19:14:42'!
allPositions
	| positions |
	
	positions := Set new.
	
	(1 to: 3) do: [ :row |
		(1 to: 3) do: [ :col |
			positions add: (Point x: col y: row)
		]
	].
	
	^ positions! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'jml 11/5/2018 19:23:36'!
boardIsEmpty: aGame
	
	^ self allPositions allSatisfy: [ :aPosition | aGame isEmpty: aPosition ]! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'playing' stamp: 'jml 11/5/2018 21:20:38'!
moveFrom: fromPosition to: toPosition 
	
	self isFinished ifTrue: [
		self error: self class finishedGameErrorDescription 
	].
	
	self inInitialPhase ifTrue: [
		self error: self class cannotMoveYetErrorDescription 
	].
	
	((self isValidPosition: fromPosition) and: [ self isValidPosition: toPosition ]) ifFalse: [
		self error: self class invalidPositionErrorDescription
	].
	
	(self has: self currentPiece at: fromPosition) ifFalse: [
		self error: self class missingPieceErrorDescription
	].
	
	(self positionsAreConnected: fromPosition and: toPosition) ifFalse: [
		self error: self class invalidMoveErrorDescription
	].
	
	board removeKey: fromPosition.
	self place: self currentPiece at: toPosition 
! !

!TerniLapilli methodsFor: 'playing' stamp: 'la 11/5/2018 23:45:17'!
placeAt: aPosition
	
	(self isValidPosition: aPosition) ifFalse: [ self error: self class invalidPositionErrorDescription ].
	(self isEmpty: aPosition) ifFalse: [ self error: self class occupiedPositionErrorDescription ].
	self state place:aPosition ! !


!TerniLapilli methodsFor: 'testing' stamp: 'jml 11/5/2018 17:38:14'!
hasO: aPosition

	^ self has: $O at: aPosition! !

!TerniLapilli methodsFor: 'testing' stamp: 'jml 11/5/2018 17:38:02'!
hasX: aPosition
	
	^ self has: $X at: aPosition! !

!TerniLapilli methodsFor: 'testing' stamp: 'jml 11/5/2018 17:05:43'!
inInitialPhase
	
	^ board size < 6! !

!TerniLapilli methodsFor: 'testing' stamp: 'la 11/1/2018 19:57:05'!
isEmpty: aPosition 

	^(board includesKey: aPosition) not! !

!TerniLapilli methodsFor: 'testing' stamp: 'la 11/6/2018 00:34:40'!
isFinished
	
	^state isFinished ! !

!TerniLapilli methodsFor: 'testing' stamp: 'la 11/1/2018 20:54:37'!
wonForO
	
	^ (self anyRowIsFullOf: $O) or: [ (self anyColumnIsFullOf: $O) or: [ self anyDiagonalIsFullOf: $O ] ]! !

!TerniLapilli methodsFor: 'testing' stamp: 'la 11/1/2018 20:54:01'!
wonForX
	
	^ (self anyRowIsFullOf: $X) or: [ (self anyColumnIsFullOf: $X) or: [ self anyDiagonalIsFullOf: $X ] ]! !


!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 20:55:39'!
anyColumnIsFullOf: aPiece
	
	 ^ #(1 2 3) anySatisfy: [ :col | self col: col isFullOf: aPiece ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 21:02:02'!
anyDiagonalIsFullOf: aPiece
	
	^ (self leftDiagonalIsFullOf: aPiece) or: [ self rightDiagonalIsFullOf: aPiece ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 20:51:52'!
anyRowIsFullOf: aPiece
	
	^ #(1 2 3) anySatisfy: [ :row | self row: row isFullOf: aPiece ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'jml 11/5/2018 20:55:48'!
checkFinished
	
	^ self wonForX or: [ self wonForO]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 20:56:05'!
col: col isFullOf: aPiece
	
	^ #(1 2 3) allSatisfy: [ :row | self has: aPiece at: col@row ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 20:52:31'!
has: aPiece at: aPosition
	
	^ (board includesKey: aPosition) and: [ (board at: aPosition) = aPiece ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'jml 11/5/2018 18:09:25'!
horizontalDistanceBetween: fromPosition and: toPosition
	
	^ (fromPosition x - toPosition x) abs! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'jml 11/5/2018 18:13:37'!
isNotDiamondPosition: aPosition
	
	^ (aPosition x + aPosition y) even! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 20:16:41'!
isValidCoordinate: aCoordinate
	
	^ aCoordinate between: 1 and: 3! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 20:17:49'!
isValidPosition: aPosition
	
	^ (self isValidCoordinate: aPosition x) and: [ self isValidCoordinate: aPosition y ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 21:07:34'!
leftDiagonalIsFullOf: aPiece
	
	^ (Array with: 1@1 with: 2@2 with: 3@3) allSatisfy: [ :pos | self has: aPiece at: pos ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'jml 11/5/2018 18:09:43'!
positionsAreAdjacent: fromPosition and: toPosition
	
	| horizontalDistance verticalDistance |
	
	horizontalDistance := self horizontalDistanceBetween: fromPosition and: toPosition.
	verticalDistance := self verticalDistanceBetween: fromPosition and: toPosition.
	
	^ horizontalDistance + verticalDistance = 1! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'jml 11/5/2018 18:05:54'!
positionsAreConnected: fromPosition and: toPosition
	
	^ (self positionsAreAdjacent: fromPosition and: toPosition) or: [ self positionsAreDiagonallyConnected: fromPosition and: toPosition ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'jml 11/5/2018 18:11:01'!
positionsAreDiagonallyConnected: fromPosition and: toPosition
	
	| horizontalDistance verticalDistance |
	
	horizontalDistance := self horizontalDistanceBetween: fromPosition and: toPosition.
	verticalDistance := self verticalDistanceBetween: fromPosition and: toPosition.
	
	^ (horizontalDistance = 1) and: [ verticalDistance = 1 and: [ self isNotDiamondPosition: fromPosition ] ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 21:08:09'!
rightDiagonalIsFullOf: aPiece
	
	^ (Array with: 1@3 with: 2@2 with: 3@1) allSatisfy: [ :pos | self has: aPiece at: pos ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'la 11/1/2018 20:48:18'!
row: row isFullOf: aPiece
	
	^ #(1 2 3) allSatisfy: [ :col | self has: aPiece at: col@row ]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'jml 11/5/2018 18:09:34'!
verticalDistanceBetween: fromPosition and: toPosition
	
	^ (fromPosition y - toPosition y) abs! !


!TerniLapilli methodsFor: 'initialization' stamp: 'la 11/5/2018 23:18:51'!
initialize

	board := Dictionary new.	
	state := XIsPlacingState initializeWith: self.! !


!TerniLapilli methodsFor: 'playing - private' stamp: 'la 11/6/2018 00:37:12'!
place: aPiece at: aPosition

	self isFinished ifTrue: [ self error: self class finishedGameErrorDescription ].
	self inInitialPhase ifFalse: [ self error: self class cannotAddMorePieces ].
	(self isValidPosition: aPosition) ifFalse: [ self error: self class invalidPositionErrorDescription ].	
	(self isEmpty: aPosition) ifFalse: [ self error: self class occupiedPositionErrorDescription ].
	
	board at: aPosition put: aPiece.! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'la 11/6/2018 00:33:26'!
placeOAt: aPosition 

	board at: aPosition put: $O.
	(self checkFinished )
	ifTrue: [state := OHasWonState initializeWith: self.].
	(self checkEndInitialPhase)
	ifTrue: [state := XIsMovingState initializeWith: self.]
	ifFalse: [state := XIsPlacingState initializeWith: self.].! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'la 11/6/2018 00:22:23'!
placeXAt: aPosition

	board at: aPosition put: $X.
	(self checkFinished )
	ifTrue: [state := XHasWonState initializeWith: self.]
	ifFalse: [state := OIsPlacingState initializeWith: self.]! !


!TerniLapilli methodsFor: 'accessing - private' stamp: 'la 11/6/2018 00:29:16'!
checkEndInitialPhase

	^board size  = 6! !

!TerniLapilli methodsFor: 'accessing - private' stamp: 'jml 11/5/2018 18:59:53'!
currentPiece
	
	^ isXturn ifTrue: [ $X ] ifFalse: [ $O ]! !

!TerniLapilli methodsFor: 'accessing - private' stamp: 'la 11/5/2018 23:12:18'!
state

	^state! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:26:23'!
cannotAddMorePieces
	
	^ 'cannot add more than 6 pieces'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 20:33:44'!
cannotMoveYetErrorDescription

	^ 'cannot move'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'la 11/1/2018 20:34:33'!
finishedGameErrorDescription
	
	^ 'game is finished'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:25:45'!
invalidMoveErrorDescription

	^ 'invalid move'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'la 11/1/2018 20:09:56'!
invalidPositionErrorDescription

	^ 'invalid position'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:26:04'!
invalidTurnErrorDescription

	^ 'invalid turn'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'jml 11/5/2018 17:35:19'!
missingPieceErrorDescription
	
	^ 'piece not found'! !

!TerniLapilli class methodsFor: 'error descriptions' stamp: 'la 11/1/2018 20:24:14'!
occupiedPositionErrorDescription
	
	^ 'occupied position'! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'TerniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'la 11/5/2018 23:11:34'!
initializeWith: aTerniLapilli

	TerniLapilli := aTerniLapilli ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'la 11/5/2018 23:10:54'!
initializeWith: aTerniLapilli

	^ self new initializeWith: aTerniLapilli ! !


!classDefinition: #GameOverState category: #TerniLapilli!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #OHasWonState category: #TerniLapilli!
GameOverState subclass: #OHasWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OHasWonState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:35:38'!
isFinished
	
	^ true! !

!OHasWonState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:44:15'!
place: aPoint 

	^self error: TerniLapilli class finishedGameErrorDescription ! !


!classDefinition: #XHasWonState category: #TerniLapilli!
GameOverState subclass: #XHasWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XHasWonState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:35:31'!
isFinished
	
	^ true! !

!XHasWonState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:44:08'!
place: aPoint 

	^self error: TerniLapilli class finishedGameErrorDescription ! !


!classDefinition: #PlayingState category: #TerniLapilli!
TerniLapilliState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!


!classDefinition: #OIsMovingState category: #TerniLapilli!
PlayingState subclass: #OIsMovingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OIsMovingState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:35:10'!
isFinished
	
	^ false! !

!OIsMovingState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:49:45'!
place: aPoint 

	^self error: TerniLapilli class cannotAddMorePieces ! !


!classDefinition: #OIsPlacingState category: #TerniLapilli!
PlayingState subclass: #OIsPlacingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OIsPlacingState methodsFor: 'accessing' stamp: 'la 11/6/2018 00:35:17'!
isFinished
	
	^ false! !

!OIsPlacingState methodsFor: 'accessing' stamp: 'la 11/5/2018 23:35:29'!
place: aPoint 

	TerniLapilli  placeOAt: aPoint ! !


!classDefinition: #XIsMovingState category: #TerniLapilli!
PlayingState subclass: #XIsMovingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XIsMovingState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:35:19'!
isFinished
	
	^ false! !

!XIsMovingState methodsFor: 'as yet unclassified' stamp: 'la 11/6/2018 00:49:40'!
place: aPoint 

	^self error: TerniLapilli class cannotAddMorePieces ! !


!classDefinition: #XIsPlacingState category: #TerniLapilli!
PlayingState subclass: #XIsPlacingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XIsPlacingState methodsFor: 'accessing' stamp: 'la 11/6/2018 00:35:22'!
isFinished
	
	^ false! !

!XIsPlacingState methodsFor: 'accessing' stamp: 'la 11/6/2018 00:49:09'!
place: aPoint 
	
	TerniLapilli  placeXAt: aPoint 
! !
