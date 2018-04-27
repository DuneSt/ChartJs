Class {
	#name : #ChartCallbackDemo,
	#superclass : #ChartAbstractDemo,
	#instVars : [
		'selection'
	],
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
ChartCallbackDemo class >> description [
	^ 'It is possible to add an action to execute on the click of a value'
]

{ #category : #accessing }
ChartCallbackDemo class >> title [
	^ 'Callback'
]

{ #category : #rendering }
ChartCallbackDemo >> renderChartJsComponentOn: html [
	| chartData |
	html heading
		level: 3;
		with: (selection ifNotNil: [ 'Selected value: ' , selection key asString , ' label: ' , selection value ] ifNil: [ 'Click on a part of the pie to select it' ]).
		
	chartData := (Chart1dData
		values: {('Eating' -> 80). ('Drinking' -> 100). ('Sleeping' -> 70). ('Designing' -> 50). ('Coding' -> 40). ('Cycling' -> 10). ('Running' -> 25)})
		title: [ :datas | 'Priority of actions' ];
		singleValueTooltip: '<key> has an importance of <value>%';
		chartType: ChartPie;
		yourself.
		
	html render: (ChartJsComponent data: chartData callback: [ :value :label | selection := value -> label ])
]
