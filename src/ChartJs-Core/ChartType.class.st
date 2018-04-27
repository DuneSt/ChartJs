"
I am the superclass for all chart types
"
Class {
	#name : #ChartType,
	#superclass : #Object,
	#category : #'ChartJs-Core-Types'
}

{ #category : #ChartJs }
ChartType class >> dataFunction [
	^ self subclassResponsibility 
]

{ #category : #ChartJs }
ChartType class >> eventsCode [
	^ self subclassResponsibility 
]

{ #category : #ChartJs }
ChartType class >> forChartJS [
	^ self subclassResponsibility 
]

{ #category : #testing }
ChartType class >> isFor1DValues [
	^ false
]

{ #category : #testing }
ChartType class >> isMultiDataSet [
	^ false
]
