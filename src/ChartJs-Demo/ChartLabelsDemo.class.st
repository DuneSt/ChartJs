Class {
	#name : #ChartLabelsDemo,
	#superclass : #ChartAbstractDemo,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
ChartLabelsDemo class >> description [
	^ 'It is possible to customize the labels of the values.'
]

{ #category : #accessing }
ChartLabelsDemo class >> title [
	^ 'Labels customizations'
]

{ #category : #rendering }
ChartLabelsDemo >> renderChartJsComponentOn: html [
	| chartData |
	chartData := ChartData
		xObjects: WADecoration allSubclasses
		function: #methods.
	chartData
		title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ];
		chartType: ChartLine;
		keyDisplayBlock: #printString;
		valueDisplayBlock: [ :methods | methods size ].
	html render: (ChartJsComponent data: chartData)
]
