"
I am the demos for charts components
"
Class {
	#name : #ChartsDemos,
	#superclass : #WAComponent,
	#instVars : [
		'selectedNode',
		'selectedValue'
	],
	#category : 'ChartJs-Demo'
}

{ #category : #'class initialization' }
ChartsDemos class >> initialize [
	(WAAdmin register: self asApplicationAt: 'ChartJsDemo')
		addLibrary: ChartJsLibrary;
		addLibrary: JQDeploymentLibrary
]

{ #category : #versions }
ChartsDemos class >> version [
	^ 'development - from v0.0.0'
]

{ #category : #rendering }
ChartsDemos >> barLineAndRadar: html [
	| chartData |
	chartData := Chart2dData
		xObjects:
			{'Eating'.
			'Drinking'.
			'Sleeping'.
			'Designing'.
			'Coding'.
			'Cycling'.
			'Running'}
		multiYObjects:
			{('Guillaume'
				->
					{65.
					59.
					90.
					81.
					56.
					55.
					40}).
			('Cyril'
				->
					{28.
					48.
					40.
					19.
					96.
					27.
					100})}.
	chartData title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ].
	chartData multiValueTooltip: '<label> spent <value> min in <key>'.
	selectedNode
		ifNotNil: [ 
			html heading
				level: 3;
				with: 'Selected node: ' , selectedNode asString ].
	{ChartBar.
	ChartLine.
	ChartRadar}
		do: [ :aCharType | 
			chartData chartType: aCharType.
			html render: (ChartJsComponent data: chartData callback: [ :node | selectedNode := node ]) ].
	html render: (ChartJsComponent data: (Chart2dData xObjects: (1 to: 10) function: [ :x | x * (x + 1) ]))
]

{ #category : #rendering }
ChartsDemos >> boxPlot: html [
	| chartData |
	chartData := Chart2dData
		xObjects: #(Guillaume Cyril)
		function: [ :aPlayer | ChartBoxPlotData lowest: 5 atRandom firstQuartile: (5 to: 10) atRandom median: (11 to: 15 ) atRandom thirdQuartile: (16 to: 20) atRandom highest: (21 to: 25) atRandom ].
	chartData chartType: ChartBoxPlot.
	html render: (ChartJsComponent data: chartData)
	
]

{ #category : #rendering }
ChartsDemos >> pieDonutAndPolar: html [
	| chartData options |
	chartData := Chart1dData
		values:
			{('Eating' -> 80).
			('Drinking' -> 100).
			('Sleeping' -> 70).
			('Designing' -> 50).
			('Coding' -> 40).
			('Cycling' -> 10).
			('Running' -> 25)}.
	chartData title: [ :datas | 'Priority of actions' ].
	chartData singleValueTooltip: '<key> has an importance of <value>%'.
	selectedValue
		ifNotNil: [ 
			html heading
				level: 3;
				with: 'Selected Value: ' , selectedValue asString ].
	options := ChartOptions new toolTip: [ :label :value | Halt now ].
	{ChartPie.
	ChartDonut.
	ChartPolar}
		do: [ :aCharType | 
			chartData chartType: aCharType.
			html render: (ChartJsComponent data: chartData "options: options" callback: [ :value | selectedValue := value ]) ]
]

{ #category : #rendering }
ChartsDemos >> renderContentOn: html [
	self boxPlot: html.
	self barLineAndRadar: html.
	self pieDonutAndPolar: html.
]
