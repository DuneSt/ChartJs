"
A Chart1dDataTest is a test class for testing the behavior of Chart1dData
"
Class {
	#name : #Chart1dDataTest,
	#superclass : #ChartDataAbstractTest,
	#category : #'ChartJs-Core-Tests'
}

{ #category : #tests }
Chart1dDataTest >> testHasData [
	| datas |
	datas := ChartData
						xObjects: {'Eating' . 'Drinking' .'Sleeping' . 'Designing' . 'Coding' . 'Cycling' . 'Running' }
						yObjects: { 80 . 100 . 70 . 50 . 40 . 10 . 25}.
	self assert: datas hasData.
	datas := self actualClass values: {}.
	self deny: datas hasData
]
