"
I represent a line chart
"
Class {
	#name : #ChartLine,
	#superclass : #ChartType,
	#category : #'ChartJs-Core-Types'
}

{ #category : #ChartJs }
ChartLine class >> dataFunction [
	^ 'points'
]

{ #category : #options }
ChartLine class >> defaultOptions [ 
	^ { #fill -> false }
]

{ #category : #ChartJs }
ChartLine class >> forChartJS [
	^ 'line'
]

{ #category : #testing }
ChartLine class >> isMultiDataSet [
	^ true
]
