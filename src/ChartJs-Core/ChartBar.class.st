"
I represent a bar chart
"
Class {
	#name : #ChartBar,
	#superclass : #ChartType,
	#category : #'ChartJs-Core-Types'
}

{ #category : #ChartJs }
ChartBar class >> dataFunction [
	^ 'bars'
]

{ #category : #ChartJs }
ChartBar class >> forChartJS [
	^ 'bar'
]

{ #category : #testing }
ChartBar class >> isMultiDataSet [
	^ true
]
