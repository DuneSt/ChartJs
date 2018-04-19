"
I represent a polar chart
"
Class {
	#name : #ChartPolar,
	#superclass : #ChartType,
	#category : 'ChartJs-Types'
}

{ #category : #ChartJs }
ChartPolar class >> dataFunction [
	^ 'segments'
]

{ #category : #ChartJs }
ChartPolar class >> eventsCode [
	^ 'getSegmentsAtEvent(evt)'
]

{ #category : #ChartJs }
ChartPolar class >> forChartJS [
	^ 'PolarArea'
]

{ #category : #ChartJs }
ChartPolar class >> isFor1DValues [
	^ true
]
