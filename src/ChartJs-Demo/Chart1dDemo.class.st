Class {
	#name : #Chart1dDemo,
	#superclass : #ChartAbstractChartTypeDemo,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
Chart1dDemo class >> description [
	^ 'Demo about one dimension charts with ChartJs for Seaside.'
]

{ #category : #accessing }
Chart1dDemo class >> title [
	^ '1D demo'
]

{ #category : #accessing }
Chart1dDemo >> kinds [
	^ {ChartPie.
	ChartDonut.
	ChartPolar}
]

{ #category : #rendering }
Chart1dDemo >> renderChartJsComponentOn: html [
	| renderingChartBlock id |
	
	renderingChartBlock := [ :canvas | 
		
	| chartData |
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
	selection
		ifNotNil: [ canvas heading
				level: 3;
				with:
					'Selected value: ' , selection key asString , ' label: '
						, selection value ].
	"options := ChartOptions new toolTip: [ :label :value | Halt now ]."
	chartData chartType: self kind.
	canvas
		render:
			(ChartJsComponent
				data: chartData
				callback: [ :value :label | selection := value -> label ]) ].
			
	id := html nextId.
	self
		renderPossibleKindsUpdating: id
		with: renderingChartBlock
		on: html.
	self renderDemoWithId: id with: renderingChartBlock on: html
]
