"
I represent a ChartDataValue with a style for this data representation and a value
"
Class {
	#name : #ChartDataValue,
	#superclass : #Object,
	#instVars : [
		'value',
		'styleSheet',
		'name'
	],
	#category : 'ChartJs-Model'
}

{ #category : #'instance-creation' }
ChartDataValue class >> value: aValue name: aName [
	^ self new
		value: aValue;
		name: aName;
		yourself
]

{ #category : #'instance-creation' }
ChartDataValue class >> value: aValue name: aName color: aColor [
	^ self new
		value: aValue;
		name: aName;
		globalColor: aColor;
		yourself
]

{ #category : #accessing }
ChartDataValue >> color [
	^ self styleSheet fillColor
]

{ #category : #ChartJs }
ChartDataValue >> forChartJS: writer displayBlock: aDisplayBlock [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #value value: (aDisplayBlock value: self value).
			jsonMapWriter writeKey: #color value: self color forChartJs.
			jsonMapWriter writeKey: #highlight value: self highlightColor forChartJs.
			jsonMapWriter writeKey: #label value: self name ]
]

{ #category : #accessing }
ChartDataValue >> globalColor: aColor [
	^ self styleSheet globalSetColorZone: aColor
]

{ #category : #accessing }
ChartDataValue >> highlightColor [
	^ self styleSheet strokeColor
]

{ #category : #initialization }
ChartDataValue >> initialize [
	super initialize.
	self styleSheet: ChartStyleSheet charDataSetDefault
]

{ #category : #accessing }
ChartDataValue >> name [
	^ name
]

{ #category : #accessing }
ChartDataValue >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ChartDataValue >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
ChartDataValue >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #accessing }
ChartDataValue >> value [
	^ value
]

{ #category : #accessing }
ChartDataValue >> value: anObject [
	value := anObject
]
