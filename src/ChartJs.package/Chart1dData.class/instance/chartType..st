chartType
chartType: aChartType
	self assert: aChartType isFor1DValues description: 'Chart accepted: Donut, Pie and Polar'.
	super chartType: aChartType