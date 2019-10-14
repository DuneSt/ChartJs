Class {
	#name : #Chart2dDemo,
	#superclass : #ChartAbstractChartTypeDemo,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
Chart2dDemo class >> description [
	^ 'Demo about two dimensions charts with ChartJs for Seaside.'
]

{ #category : #accessing }
Chart2dDemo class >> title [
	^ '2D demo'
]

{ #category : #accessing }
Chart2dDemo >> kinds [
	^ {ChartBar.
	ChartLine.
	ChartRadar}
]

{ #category : #rendering }
Chart2dDemo >> renderChartJsComponentOn: html [
	| renderingChartBlock id |
	
	renderingChartBlock := [ :canvas | 
	| chartData |
	chartData := (ChartData
		xObjects: {'Eating' . 'Drinking' . 'Sleeping' . 'Designing' . 'Coding' . 'Cycling' . 'Running'}
		multiYObjects: {('Guillaume' -> {65 . 59 . 90 . 81 . 56 . 55 . 40}). ('Cyril' -> {28 . 48 . 40 . 19 . 96 . 27 . 100})})
		title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ];
		multiValueTooltip: '<label> spent <value> min in <key>';
		chartType: self kind;
		yourself.
	selection
		ifNotNil: [ canvas heading
				level: 3;
				with: 'Selected value: ' , selection key asString , ' label: ' , selection value ].
	html render: (ChartJsComponent data: chartData callback: [ :value :label | selection := value -> label ]) ].

	id := html nextId.
	self renderPossibleKindsUpdating: id with: renderingChartBlock on: html.
	self renderDemoWithId: id with: renderingChartBlock on: html
]
