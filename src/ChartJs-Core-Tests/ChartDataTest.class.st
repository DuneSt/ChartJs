"
A Chart2dDataTest is a test class for testing the behavior of Chart2dData
"
Class {
	#name : #ChartDataTest,
	#superclass : #ChartDataAbstractTest,
	#category : #'ChartJs-Core-Tests'
}

{ #category : #helpers }
ChartDataTest >> actualClass [
	^ ChartData
]

{ #category : #tests }
ChartDataTest >> testHasData [
	| datas |
	datas := self actualClass
		xObjects: {'Eating' . 'Drinking' . 'Sleeping' . 'Designing' . 'Coding' . 'Cycling' . 'Running'}
		multiYObjects:
			{('Guillaume' -> #(65 59 90 81 56 55 40)).
			('Cyril' -> #(28 48 40 19 96 27 100))}.
	self assert: datas hasData.
	datas xObjects: {}.
	self deny: datas hasData
]
