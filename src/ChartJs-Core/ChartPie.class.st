"
I represent a pie chart
"
Class {
	#name : #ChartPie,
	#superclass : #ChartType,
	#category : #'ChartJs-Core-Types'
}

{ #category : #ChartJs }
ChartPie class >> dataFunction [
	^ 'segments'
]

{ #category : #ChartJs }
ChartPie class >> eventsCode [
	^ 'getSegmentsAtEvent(evt)'
]

{ #category : #ChartJs }
ChartPie class >> forChartJS [
	^ 'Pie'
]

{ #category : #ChartJs }
ChartPie class >> isFor1DValues [
	^ true
]
