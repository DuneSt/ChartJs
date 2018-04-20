"
A Chart1dDataTest is a test class for testing the behavior of Chart1dData
"
Class {
	#name : #Chart1dDataTest,
	#superclass : #ChartDataAbstractTest,
	#category : #'ChartJs-Core-Tests'
}

{ #category : #helpers }
Chart1dDataTest >> actualClass [
	^ Chart1dData
]

{ #category : #tests }
Chart1dDataTest >> testHasData [
	| datas |
	datas := self actualClass
		values:
			{('Eating' -> 80).
			('Drinking' -> 100).
			('Sleeping' -> 70).
			('Designing' -> 50).
			('Coding' -> 40).
			('Cycling' -> 10).
			('Running' -> 25)}.
	self assert: datas hasData.
	datas := self actualClass values: {}.
	self deny: datas hasData
]
