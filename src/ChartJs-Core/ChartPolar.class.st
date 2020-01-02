"
I represent a polar chart
"
Class {
	#name : #ChartPolar,
	#superclass : #ChartType,
	#category : #'ChartJs-Core-Types'
}

{ #category : #ChartJs }
ChartPolar class >> dataFunction [
	^ 'segments'
]

{ #category : #ChartJs }
ChartPolar class >> forChartJS [
	^ 'polarArea'
]

{ #category : #ChartJs }
ChartPolar class >> isFor1DValues [
	^ true
]
