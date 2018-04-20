"
I represent a Radar chart, also called Kiviat
"
Class {
	#name : #ChartRadar,
	#superclass : #ChartType,
	#category : #'ChartJs-Core-Types'
}

{ #category : #ChartJs }
ChartRadar class >> dataFunction [
	^ 'points'
]

{ #category : #ChartJs }
ChartRadar class >> eventsCode [
	^ 'getPointsAtEvent(evt)'
]

{ #category : #ChartJs }
ChartRadar class >> forChartJS [
	^ 'Radar'
]

{ #category : #testing }
ChartRadar class >> isMultiDataSet [
	^ true
]
