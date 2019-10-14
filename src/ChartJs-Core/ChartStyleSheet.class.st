"
I am the styleSheet for a Chart
"
Class {
	#name : #ChartStyleSheet,
	#superclass : #StyleSheet,
	#category : #'ChartJs-Core-Style'
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
ChartStyleSheet >> charDataSetNeoJsonObjectForKeys: aCollectionOfXObjects values: values label: aLabel [
	self flag: 'Only works for color style. How to have other options?'.
	^ #(#fillColor #strokeColor #pointColor "#pointStrokeColor #pointHighlightFill #pointHighlightStroke")
		inject: Dictionary new
		into: [ :dico :aStyleSelector | 
			[ dico
				at: aStyleSelector
				put:
					(self
						obtainValue: aStyleSelector value
						forKeys: aCollectionOfXObjects
						andValues: values
						andLabel: aLabel) forChartJs ]
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

{ #category : #helpers }
ChartStyleSheet >> globalSetColor: aColor [
	self setOption: #pointBackgroundColor to: aColor.
	self setOption: #pointBorderColor to: Color white .
	self setOption: #pointHoverBackgroundColor to: Color white.
	self setOption: #pointHoverBorderColor to: aColor.
	self setOption: #borderColor to: aColor.
	self setOption: #backgroundColor to: (aColor copy alpha: 0.2) .

]

{ #category : #helpers }
ChartStyleSheet >> globalSetColorZone: aColor [
	self setOption: #borderColor to: aColor.
	self setOption: #backgroundColor to: (aColor copy alpha: 0.8) .

]

{ #category : #scale }
ChartStyleSheet >> logarithmicScale [
	self at: #scale put: #logarithmic
]

{ #category : #'as yet unclassified' }
ChartStyleSheet >> obtainValue: aPropertyOrValuable forKeys: aCollectionOfXObjects andValues: values [
	| result |
	result := aPropertyOrValuable cull: self.
	^ (result isBlock or: [ result isSymbol ])
		ifTrue: [ result cull: aCollectionOfXObjects cull: values ]
		ifFalse: [ result ]
]

{ #category : #'as yet unclassified' }
ChartStyleSheet >> obtainValue: aPropertyOrValuable forKeys: aCollectionOfXObjects andValues: values andLabel: aLabel [
	| result |
	result := aPropertyOrValuable cull: self.
	^ (result isBlock or: [ result isSymbol ])
		ifTrue: [ result chartJsCull: aCollectionOfXObjects cull: values cull: aLabel ]
		ifFalse: [ result ]
]

{ #category : #scale }
ChartStyleSheet >> scale [
	self get: #scale
]

{ #category : #points }
ChartStyleSheet >> setOption: aSymbol to: aValue [
	^ self at: aSymbol put: aValue
]
