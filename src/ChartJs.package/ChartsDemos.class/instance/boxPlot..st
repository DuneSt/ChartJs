rendering
boxPlot: html
	| chartData |
	chartData := ChartData
		xObjects: #(Guillaume Cyril)
		function: [ :aPlayer | ChartBoxPlotData lowest: 5 atRandom firstQuartile: (5 to: 10) atRandom median: (11 to: 15 ) atRandom thirdQuartile: (16 to: 20) atRandom highest: (21 to: 25) atRandom ].
	chartData chartType: ChartBoxPlot.
	html render: (ChartJsComponent data: chartData)
	