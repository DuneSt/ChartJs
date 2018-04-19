"
I am the styleSheet for a Chart
"
Class {
	#name : #ChartStyleSheet,
	#superclass : #StyleSheet,
	#category : 'ChartJs-Style'
}

{ #category : #'as yet unclassified' }
ChartStyleSheet class >> charDataSetDefault [
	^ self new
		globalSetColor: Color random;
		yourself
]

{ #category : #'as yet unclassified' }
ChartStyleSheet class >> default [
	^ self new
		chartType: ChartBar;
		yourself
]

{ #category : #'as yet unclassified' }
ChartStyleSheet >> charDataSetNeoJsonObject [
	^ #(#fillColor #strokeColor #pointColor #pointStrokeColor #pointHighlightFill #pointHighlightStroke)
		inject: Dictionary new
		into: [ :dico :aStyleSelector | 
			[ (dico at: aStyleSelector put: (self perform: aStyleSelector) forChartJs)  ]
				on: NotFound
				do: [  ].
			dico ]
]

{ #category : #points }
ChartStyleSheet >> chartType [
	^ self get: #chartType
]

{ #category : #points }
ChartStyleSheet >> chartType: aChartType [
	self at: #chartType put: aChartType
]

{ #category : #points }
ChartStyleSheet >> fillColor [
	^ self get: #fillColor
]

{ #category : #points }
ChartStyleSheet >> fillColor: aColor [
	^ self at: #fillColor put: aColor
]

{ #category : #helpers }
ChartStyleSheet >> globalSetColor: aColor [
	self fillColor: (aColor copy alpha: 0.2).
	self pointColor: aColor.
	self pointHighlightFill: Color white.
	self pointHighlightStroke: aColor.
	self pointStrokeColor: Color white.
	self strokeColor: aColor
]

{ #category : #helpers }
ChartStyleSheet >> globalSetColorZone: aColor [
	self fillColor: (aColor copy alpha: 0.8).
	self strokeColor: aColor
]

{ #category : #scale }
ChartStyleSheet >> logarithmicScale [
	self at: #scale put: #logarithmic
]

{ #category : #points }
ChartStyleSheet >> pointColor [
	^ self get: #pointColor
]

{ #category : #points }
ChartStyleSheet >> pointColor: aColor [
	^ self at: #pointColor put: aColor
]

{ #category : #points }
ChartStyleSheet >> pointHighlightFill [
	^ self get: #pointHighlightFill
]

{ #category : #points }
ChartStyleSheet >> pointHighlightFill: aColor [
	^ self at: #pointHighlightFill put: aColor
]

{ #category : #points }
ChartStyleSheet >> pointHighlightStroke [
	^ self get: #pointHighlightStroke
]

{ #category : #points }
ChartStyleSheet >> pointHighlightStroke: aColor [
	^ self at: #pointHighlightStroke put: aColor
]

{ #category : #points }
ChartStyleSheet >> pointStrokeColor [
	^ self get: #pointStrokeColor
]

{ #category : #points }
ChartStyleSheet >> pointStrokeColor: aColor [
	^ self at: #pointStrokeColor put: aColor
]

{ #category : #scale }
ChartStyleSheet >> scale [
	self get: #scale
]

{ #category : #points }
ChartStyleSheet >> strokeColor [
	^ self get: #strokeColor
]

{ #category : #points }
ChartStyleSheet >> strokeColor: aColor [
	^ self at: #strokeColor put: aColor
]
