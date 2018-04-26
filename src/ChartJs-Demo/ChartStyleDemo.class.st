Class {
	#name : #ChartStyleDemo,
	#superclass : #ChartAbstractDemo,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
ChartStyleDemo class >> description [
	^ 'It is possible to customize the style of the chart.'
]

{ #category : #accessing }
ChartStyleDemo class >> title [
	^ 'Style'
]

{ #category : #rendering }
ChartStyleDemo >> renderChartJsComponentOn: html [
	| chartData |
	self flag: #todo. "This is not done."
	chartData := (Chart2dData
		xObjects: {'Eating' . 'Drinking' . 'Sleeping' . 'Designing' . 'Coding' . 'Cycling' . 'Running'}
		multiYObjects:
		{('Guillaume' -> {65 . 59 . 90 . 81 . 56 . 55 . 40}).
	('Cyril' -> {28 . 48 . 40 . 19 . 96 . 27 . 100})})
		title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ];
		chartType: ChartLine;
		yourself.
	chartData dataSets
		do: [ :set | 
			set styleSheet
				pointColor: [ :keys :values :label | 
					label = 'Guillaume'
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ];
				strokeColor: [ :keys :values :label | 
					label = 'Guillaume'
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ].
	html render: (ChartJsComponent data: chartData)
]
