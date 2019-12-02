"
I represent a homer donut chart
"
Class {
	#name : #ChartDonut,
	#superclass : #ChartType,
	#category : #'ChartJs-Core-Types'
}

{ #category : #ChartJs }
ChartDonut class >> dataFunction [
	^ 'segments'
]

{ #category : #ChartJs }
ChartDonut class >> eventsCode [
	^ 'getSegmentsAtEvent(evt)'
]

{ #category : #ChartJs }
ChartDonut class >> forChartJS [
	^ 'doughnut'
]

{ #category : #ChartJs }
ChartDonut class >> isFor1DValues [
	^ true
]
