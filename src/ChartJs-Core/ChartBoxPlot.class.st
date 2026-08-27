"
I represent a chart box plot, I require ChartBoxPlotData in my datasets
"
Class {
	#name : 'ChartBoxPlot',
	#superclass : 'ChartType',
	#category : 'ChartJs-Core-Types',
	#package : 'ChartJs-Core',
	#tag : 'Types'
}

{ #category : 'ChartJs' }
ChartBoxPlot class >> dataFunction [
	^ 'bars'
]

{ #category : 'ChartJs' }
ChartBoxPlot class >> eventsCode [
	^ 'getBarsAtEvent(evt)'
]

{ #category : 'ChartJs' }
ChartBoxPlot class >> forChartJS [
	^ 'BoxPlot'
]

{ #category : 'testing' }
ChartBoxPlot class >> isMultiDataSet [
	^ true
]
