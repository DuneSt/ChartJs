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
	| chartData styleForPersons |
	chartData := (Chart2dData
		xObjects: {'Eating' . 'Drinking' . 'Sleeping' . 'Designing' . 'Coding' . 'Cycling' . 'Running'}
		multiYObjects:
		{('Guillaume' -> {65 . 59 . 90 . 81 . 56 . 55 . 40}).
	('Cyril' -> {28 . 48 . 40 . 19 . 96 . 27 . 100})})
		title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ];
		chartType: ChartLine;
		yourself.
		
	styleForPersons := Dictionary
		with: 'Guillaume' -> (Dictionary with: #pointColor -> Color green with: #strokeColor -> Color green with: #fillColor -> Color lightGreen)
		with: 'Cyril' -> (Dictionary with: #pointColor -> Color blue with: #strokeColor -> Color blue with: #fillColor -> Color lightBlue).
		
	chartData dataSets
		do: [ :set | 
			set styleSheet
				pointColor: [ :keys :values :label | (styleForPersons at: label) at: #pointColor ];
				strokeColor: [ :keys :values :label | (styleForPersons at: label) at: #strokeColor ];
				pointStrokeColor: Color white;
				fillColor: [ :keys :values :label | ((styleForPersons at: label) at: #fillColor) alpha: 0.3 ];
				pointHighlightFill: Color pink;
				pointHighlightStroke: Color red ].
			
	html render: (ChartJsComponent data: chartData)
]
