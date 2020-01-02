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
	chartData := (ChartData
		xObjects:
		{'Eating' . 'Drinking' . 'Sleeping' . 'Designing' . 'Coding' . 'Cycling'.
	'Running'}
		multiYObjects:
		{('Guillaume' -> {65 . 59 . 90 . 81 . 56 . 55 . 40}).
			('Cyril' -> {28 . 48 . 40 . 19 . 96 . 27 . 100})})
		title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ];
		chartType: ChartLine;
		yourself.
	styleForPersons := Dictionary
		with:
			'Guillaume'
				->
					(Dictionary
						with: #pointBackgroundColor -> Color green
						with: #borderColor -> Color green
						with: #fillColor -> Color lightGreen)
		with:
			'Cyril'
				->
					(Dictionary
						with: #pointBackgroundColor -> Color blue
						with: #borderColor -> Color blue
						with: #fillColor -> Color lightBlue).
	chartData dataSets
		do: [ :set | 
			set styleSheet
				pointBackgroundColor:
						[ :keys :values :label | (styleForPersons at: label) at: #pointBackgroundColor ];
				borderColor:
						[ :keys :values :label | (styleForPersons at: label) at: #borderColor ];
				pointBorderColor: Color white;
				fillColor:
						[ :keys :values :label | ((styleForPersons at: label) at: #fillColor) alpha: 0.3 ];
				pointHoverBackgroundColor: Color pink;
				pointHoverBorderColor: Color red ].
	html render: (ChartJsComponent data: chartData)
]
