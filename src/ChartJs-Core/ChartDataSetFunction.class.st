"
I am a dataSet based on a block. I will compute y values by providing x values to this block
"
Class {
	#name : #ChartDataSetFunction,
	#superclass : #ChartDataSet,
	#instVars : [
		'function'
	],
	#category : #'ChartJs-Core-Model'
}

{ #category : #accessing }
ChartDataSetFunction class >> function: aBlock [
	^ self new
		function: aBlock;
		yourself
]

{ #category : #'instance creation' }
ChartDataSetFunction class >> function: aBlockClosure color: aColor [
	^ (self function: aBlockClosure)
		color: aColor;
		yourself
]

{ #category : #exchange }
ChartDataSetFunction >> atIndex: anIndex forValue: aValue [
	^ self function value: aValue
]

{ #category : #style }
ChartDataSetFunction >> color: aColor [ 
	self styleSheet globalSetColor: aColor.
]

{ #category : #accessing }
ChartDataSetFunction >> function [
	^ function
]

{ #category : #accessing }
ChartDataSetFunction >> function: anObject [
	function := anObject
]

{ #category : #querying }
ChartDataSetFunction >> valuesFor: aCollectionOfXObjects block: aBlock [
	^ aCollectionOfXObjects collect: [ :anXValue | aBlock value: (self function value: anXValue) ]
]
