"
I represent all the options for a chart (scale, axis color...)
"
Class {
	#name : #ChartOptions,
	#superclass : #Object,
	#instVars : [
		'xAxis',
		'yAxis',
		'toolTip'
	],
	#category : #'ChartJs-Core-Model'
}

{ #category : #'as yet unclassified' }
ChartOptions >> asDictionary [
	| optionDictionary |
	optionDictionary := Dictionary new.
	optionDictionary
		at: #scales
		put:
			{(#xAxes -> self xAxis).
			(#yAxes -> self yAxis)} asDictionary.
	^ optionDictionary
]

{ #category : #testing }
ChartOptions >> hasToolTip [
	^ self toolTip notNil
]

{ #category : #'as yet unclassified' }
ChartOptions >> initialize [
	self xAxis: ChartAxisOptions new.
	self yAxis: ChartAxisOptions new
]

{ #category : #'as yet unclassified' }
ChartOptions >> neoJsonOn: neoJSONWriter [
	neoJSONWriter writeMap: self asDictionary
]

{ #category : #'as yet unclassified' }
ChartOptions >> toolTip [
	^ toolTip
]

{ #category : #'as yet unclassified' }
ChartOptions >> toolTip: aToolTipBlock [
	self
		assert: (aToolTipBlock isBlock and: [ aToolTipBlock numArgs = 2 ])
		description: 'You must provide a two arguments block'.
	toolTip := aToolTipBlock
]

{ #category : #accessing }
ChartOptions >> xAxis [
	^ xAxis
]

{ #category : #accessing }
ChartOptions >> xAxis: anObject [
	xAxis := anObject
]

{ #category : #accessing }
ChartOptions >> yAxis [
	^ yAxis
]

{ #category : #accessing }
ChartOptions >> yAxis: anObject [
	yAxis := anObject
]

{ #category : #axis }
ChartOptions >> yLogarithmicAxis [
	self yAxis logarithmicScale
]
