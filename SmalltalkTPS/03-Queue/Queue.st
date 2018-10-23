!classDefinition: #QueueTest category: #'Queue-Exercise'!
TestCase subclass: #QueueTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test01QueueShouldBeEmptyWhenCreated

	| queue |

	queue _ Queue new.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test02EnqueueAddElementsToTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.

	self deny: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test03DequeueRemovesElementsFromTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test04DequeueReturnsFirstEnqueuedObject

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'Something1'.
	secondQueued _ 'Something2'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.
	
	self assert: queue dequeue equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'CGCM 9/27/2018 16:34:58'!
test05QueueBehavesFIFO

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'First'.
	secondQueued _ 'Second'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.

	self assert: queue dequeue equals: firstQueued.
	self assert: queue dequeue equals: secondQueued.
	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test06NextReturnsFirstEnqueuedObject

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	self assert: queue next equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test07NextDoesNotRemoveObjectFromQueue

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	queue next.
	self assert: queue size equals: 1.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test08CanNotDequeueWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.
	
	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test09CanNotDequeueWhenThereAreNoObjectsInTheQueueAndTheQueueHadObjects

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test10CanNotNextWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.

	self
		should: [ queue next ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !


!classDefinition: #Queue category: #'Queue-Exercise'!
Object subclass: #Queue
	instanceVariableNames: 'head tail'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!Queue methodsFor: 'testing' stamp: 'jml 10/2/2018 16:11:25'!
isEmpty

	^ head next = tail! !


!Queue methodsFor: 'initialization' stamp: 'jml 10/3/2018 11:51:31'!
initialize

	head := HeadQueueNode basicNew.
	tail := TailQueueNode basicNew.
	
	head setNext: tail.
	tail setPrevious: head.! !


!Queue methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:30:55'!
next
	
	^ head next content! !

!Queue methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:31:04'!
size
	
	^ head size! !


!Queue methodsFor: 'removing' stamp: 'jml 10/2/2018 16:09:45'!
dequeue
	
	| firstNode |
	
	firstNode := head next.
	head setNext: firstNode next.
	
	^ firstNode content! !


!Queue methodsFor: 'adding' stamp: 'jml 10/3/2018 11:30:00'!
enqueue: anElement
	
	| newNode |
	
	newNode := ElementQueueNode newWith: anElement next: tail.
	
	tail previous setNext: newNode.
	tail setPrevious: newNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Queue class' category: #'Queue-Exercise'!
Queue class
	instanceVariableNames: ''!

!Queue class methodsFor: 'error descriptions'!
queueEmptyErrorDescription
	^ 'Queue is empty'.! !


!classDefinition: #QueueNode category: #'Queue-Exercise'!
Object subclass: #QueueNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:08:05'!
next
	
	self subclassResponsibility! !

!QueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:08:26'!
size
	
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'QueueNode class' category: #'Queue-Exercise'!
QueueNode class
	instanceVariableNames: ''!

!QueueNode class methodsFor: 'instance creation' stamp: 'jml 10/3/2018 11:50:46'!
new
	
	self error: 'Cannot create QueueNode`s manually'.! !


!classDefinition: #ElementQueueNode category: #'Queue-Exercise'!
QueueNode subclass: #ElementQueueNode
	instanceVariableNames: 'next content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!ElementQueueNode methodsFor: 'initialization' stamp: 'jml 9/28/2018 12:18:32'!
initializeWith: anElement next: aNode
	
	content := anElement.
	next := aNode.! !


!ElementQueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:31:25'!
content

	^ content! !

!ElementQueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:31:41'!
next
	
	^ next! !

!ElementQueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:32:11'!
size
	
	^ next size + 1! !


!ElementQueueNode methodsFor: 'linking' stamp: 'jml 9/28/2018 11:59:10'!
setNext: nextNode
	
	next := nextNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElementQueueNode class' category: #'Queue-Exercise'!
ElementQueueNode class
	instanceVariableNames: ''!

!ElementQueueNode class methodsFor: 'instance creation' stamp: 'jml 10/3/2018 11:52:07'!
newWith: anElement next: aNode
	
	^self basicNew initializeWith: anElement next: aNode! !


!classDefinition: #HeadQueueNode category: #'Queue-Exercise'!
QueueNode subclass: #HeadQueueNode
	instanceVariableNames: 'next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!HeadQueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:32:41'!
next
	
	^ next! !

!HeadQueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:32:48'!
size
	
	^ next size! !


!HeadQueueNode methodsFor: 'linking' stamp: 'jml 9/28/2018 11:57:04'!
setNext: nextNode

	next := nextNode.! !


!classDefinition: #TailQueueNode category: #'Queue-Exercise'!
QueueNode subclass: #TailQueueNode
	instanceVariableNames: 'previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!TailQueueNode methodsFor: 'accessing' stamp: 'jml 9/28/2018 12:27:21'!
content
	
	self error: Queue queueEmptyErrorDescription ! !

!TailQueueNode methodsFor: 'accessing' stamp: 'jml 9/28/2018 12:25:51'!
next
	
	self error: Queue queueEmptyErrorDescription ! !

!TailQueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:32:59'!
previous
	
	^ previous! !

!TailQueueNode methodsFor: 'accessing' stamp: 'jml 10/2/2018 16:33:02'!
size
	
	^ 0! !


!TailQueueNode methodsFor: 'linking' stamp: 'jml 9/28/2018 12:02:16'!
setPrevious: previousNode
	
	previous := previousNode.! !
