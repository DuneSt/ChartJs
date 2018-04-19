"
I represent a homer donut chart
"
Class {
	#name : #ChartDonut,
	#superclass : #ChartType,
	#category : 'ChartJs-Types'
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
	^ 'Doughnut'
]

{ #category : #ChartJs }
ChartDonut class >> isFor1DValues [
	^ true
]
