"
I am the superclass for all chart types
"
Class {
	#name : #ChartType,
	#superclass : #Object,
	#instVars : [
		'data',
		'options'
	],
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

{ #category : #accessing }
ChartType >> data [
	^ data
]

{ #category : #accessing }
ChartType >> data: anObject [
	data := anObject
]

{ #category : #testing }
ChartType >> hasData [
	^ self data notNil
]

{ #category : #testing }
ChartType >> hasOptions [
	^ self options notNil
]

{ #category : #conversion }
ChartType >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #type value: self class forChartJS.
			self hasData ifTrue: [
				jsonMapWriter
						writeKey: #data
						value: (data neoJsonOn: writer)].
			self hasOptions ifTrue: [
				jsonMapWriter
						writeKey: #options
						value: (options neoJsonOn: writer)].
		]
]

{ #category : #accessing }
ChartType >> options [
	^ options
]

{ #category : #accessing }
ChartType >> options: anObject [
	options := anObject
]
