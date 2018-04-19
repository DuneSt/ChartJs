"
I represent a line chart
"
Class {
	#name : #ChartLine,
	#superclass : #ChartType,
	#category : 'ChartJs-Types'
}

{ #category : #ChartJs }
ChartLine class >> dataFunction [
	^ 'points'
]

{ #category : #ChartJs }
ChartLine class >> eventsCode [
	^ 'getPointsAtEvent(evt)'
]

{ #category : #ChartJs }
ChartLine class >> forChartJS [
	^ 'Line'
]

{ #category : #testing }
ChartLine class >> isMultiDataSet [
	^ true
]
