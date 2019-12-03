Class {
	#name : #ChartViolinPlotDemo,
	#superclass : #ChartAbstractDemo,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
ChartViolinPlotDemo class >> description [
	^ 'Violin implementation for ChartJs for Seaside.'
]

{ #category : #accessing }
ChartViolinPlotDemo class >> title [
	^ 'Violin'
]

{ #category : #rendering }
ChartViolinPlotDemo >> renderChartJsComponentOn: html [
	| chartData chartData2 |
	chartData := ChartData
		xObjects: #(Guillaume Cyril)
		function: [ :aPlayer | 
			ChartViolinData
				lowest: 5 atRandom
				firstQuartile: (5 to: 10) atRandom
				median: (11 to: 15) atRandom
				thirdQuartile: (16 to: 20) atRandom
				highest: (21 to: 25) atRandom ].
	chartData chartType: ChartViolin.
	html render: (ChartJsComponent data: chartData).
	chartData2 := ChartData
		xObjects:
			{Collection.
			TestCase}
		function: [ :class | 
			ChartViolinData
				for: class allSubclasses
				using: [ :c | c methods size ] ].
	chartData2
		chartType: ChartViolin;
		keyDisplayBlock: #printString.
	html render: (ChartJsComponent data: chartData2)
]
