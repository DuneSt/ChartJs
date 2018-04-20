"
A ChartDataAbstractTest is a test class for testing the behavior of ChartDataAbstract
"
Class {
	#name : #ChartDataAbstractTest,
	#superclass : #TestCase,
	#category : #'ChartJs-Core-Tests'
}

{ #category : #testing }
ChartDataAbstractTest class >> isAbstract [
	^ self = ChartDataAbstractTest
]

{ #category : #helpers }
ChartDataAbstractTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #tests }
ChartDataAbstractTest >> testHasData [
	self subclassResponsibility
]
