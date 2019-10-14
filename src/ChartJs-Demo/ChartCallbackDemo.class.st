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
		
	chartData := (Chart2dData
						xObjects: {'Eating' . 'Drinking' .'Sleeping' . 'Designing' . 'Coding' . 'Cycling' . 'Running' }
						yObjects: { 80 . 100 . 70 . 50 . 40 . 10 . 25})
		title: [ :datas | 'Priority of actions' ];
		singleValueTooltip: '<key> has an importance of <value>%';
		chartType: ChartPie;
		yourself.
		
	html render: (ChartJsComponent data: chartData callback: [ :value :label | selection := value -> label ])
]
