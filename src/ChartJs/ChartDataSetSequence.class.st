"
I am the most basic char data set existing, i just answer a collection of value from my sequence
"
Class {
	#name : #ChartDataSetSequence,
	#superclass : #ChartDataSet,
	#instVars : [
		'sequence'
	],
	#category : 'ChartJs-Model'
}

{ #category : #'instance-creation' }
ChartDataSetSequence class >> name: aName sequence: aSequence [
	^ self new name: aName;sequence: aSequence; yourself
]

{ #category : #'instance-creation' }
ChartDataSetSequence class >> sequence: aSequence [
	^ self new sequence: aSequence; yourself
]

{ #category : #exchange }
ChartDataSetSequence >> atIndex: anInteger forValue: aValue [
	^ self sequence at: anInteger.
]

{ #category : #accessing }
ChartDataSetSequence >> sequence [
	^ sequence
]

{ #category : #accessing }
ChartDataSetSequence >> sequence: anObject [
	sequence := anObject
]

{ #category : #querying }
ChartDataSetSequence >> valuesFor: aCollectionOfXObjects block: aBlock [
	aCollectionOfXObjects size = self sequence size
		ifFalse: [ ChartDataWrongFormatException signal: 'Their must be as many values in the dataset that the data x objects' ].
	^ self sequence collect: aBlock
]
