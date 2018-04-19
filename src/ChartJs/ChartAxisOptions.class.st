"
I am the options for an axis of the graph
"
Class {
	#name : #ChartAxisOptions,
	#superclass : #Object,
	#instVars : [
		'scale',
		'visible'
	],
	#category : 'ChartJs-Model'
}

{ #category : #initialization }
ChartAxisOptions >> initialize [
	self visible: true.
]

{ #category : #scale }
ChartAxisOptions >> logarithmicScale [
	self scale: #logarithmic
]

{ #category : #conversion }
ChartAxisOptions >> neoJsonOn: neoJSONWriter [
	neoJSONWriter writeListStreamingDo: [ :jsonListWriter |
		jsonListWriter writeElement: { #display -> self visible . #type -> self scale } asDictionary ]
]

{ #category : #accessing }
ChartAxisOptions >> scale [
	^ scale
]

{ #category : #accessing }
ChartAxisOptions >> scale: anObject [
	scale := anObject
]

{ #category : #accessing }
ChartAxisOptions >> visible [
	^ visible
]

{ #category : #accessing }
ChartAxisOptions >> visible: anObject [
	visible := anObject
]
