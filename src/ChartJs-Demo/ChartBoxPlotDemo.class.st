Class {
	#name : #ChartBoxPlotDemo,
	#superclass : #ChartAbstractDemo,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
ChartBoxPlotDemo class >> description [
	^ 'Boxplot implementation for ChartJs for Seaside.'
]

{ #category : #accessing }
ChartBoxPlotDemo class >> title [
	^ 'Box plot'
]

{ #category : #rendering }
ChartBoxPlotDemo >> renderChartJsComponentOn: html [
	| chartData chartData2 |
	chartData := Chart2dData
		xObjects: #(Guillaume Cyril)
		function: [ :aPlayer | 
			ChartBoxPlotData
				lowest: 5 atRandom
				firstQuartile: (5 to: 10) atRandom
				median: (11 to: 15) atRandom
				thirdQuartile: (16 to: 20) atRandom
				highest: (21 to: 25) atRandom ].
	chartData chartType: ChartBoxPlot.
	html render: (ChartJsComponent data: chartData).
	
	
	chartData2 := Chart2dData
		xObjects:
			{Collection.
			TestCase}
		function: [ :class | ChartBoxPlotData for: class allSubclasses using: [ :c | c methods size ] ].
	chartData2 chartType: ChartBoxPlot; keyDisplayBlock: #printString.
	html render: (ChartJsComponent data: chartData2)
]
