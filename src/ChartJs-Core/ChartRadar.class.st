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
	^ 'segments'
]

{ #category : #ChartJs }
ChartRadar class >> forChartJS [
	^ 'radar'
]

{ #category : #testing }
ChartRadar class >> isMultiDataSet [
	^ true
]
