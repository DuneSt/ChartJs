chartType
chartType: aChartType
	self assert: aChartType isMultiDataSet description: 'Chart accepted: Bar, Line, BoxPlot and Radar'.
	super chartType: aChartType