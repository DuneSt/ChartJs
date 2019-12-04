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

{ #category : #accessing }
ChartStyleSheet >> backgroundColor [
	^ self get: #backgroundColor
]

{ #category : #accessing }
ChartStyleSheet >> backgroundColor: aColor [
	self at: #backgroundColor put: aColor
]

{ #category : #accessing }
ChartStyleSheet >> borderColor [
	^ self get: #borderColor
]

{ #category : #accessing }
ChartStyleSheet >> borderColor: aColor [
	self at: #borderColor put: aColor
]

{ #category : #'as yet unclassified' }
ChartStyleSheet >> charDataSetNeoJsonObjectForKeys: aCollectionOfXObjects values: values label: aLabel [
	self flag: 'Only works for color style. How to have other options?'.
	^ #(#fill #borderColor #backgroundColor #pointColor #pointBackgroundColor  #pointHoverBorderColor pointBorderColor #pointBackgroundColor)
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

{ #category : #initialization }
ChartStyleSheet >> chartType1d [
	^ #('Doughnut' 'Pie' 'PolarArea') asOrderedCollection
]

{ #category : #points }
ChartStyleSheet >> chartType: aChartType [
	self at: #chartType put: aChartType
]

{ #category : #attributes }
ChartStyleSheet >> fill [
	^ self get: #fill
]

{ #category : #accessing }
ChartStyleSheet >> fillColor: aColor [
	self at: #fillColor put: aColor
]

{ #category : #helpers }
ChartStyleSheet >> globalSetColor: aColor [
	self setOption: #pointBackgroundColor to: aColor.
	self setOption: #pointBorderColor to: Color white.
	self setOption: #pointHoverBackgroundColor to: Color white.
	self setOption: #pointHoverBorderColor to: aColor.
	self setOption: #borderColor to: aColor.
	self setOption: #fill to: false.
	self setOption: #backgroundColor to: (aColor copy alpha: 0.2)
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

{ #category : #accessing }
ChartStyleSheet >> pointBackgroundColor [
	^ self get: #pointBackgroundColor
]

{ #category : #'as yet unclassified' }
ChartStyleSheet >> pointBackgroundColor: aColor [
	self at:  #pointBackgroundColor put: aColor
]

{ #category : #accessing }
ChartStyleSheet >> pointBorderColor [
	^ self get: #pointBorderColor
]

{ #category : #accessing }
ChartStyleSheet >> pointBorderColor: aColor [
	self at: #pointBorderColor put: aColor
]

{ #category : #accessing }
ChartStyleSheet >> pointColor [
	^ self get: #pointColor
]

{ #category : #accessing }
ChartStyleSheet >> pointHoverBackgroundColor: aColor [
	self at:  #pointHoverBackgroundColor put: aColor
]

{ #category : #accessing }
ChartStyleSheet >> pointHoverBorderColor [
	^ self get: #pointHoverBorderColor
]

{ #category : #accessing }
ChartStyleSheet >> pointHoverBorderColor: aColorOrBlock [
	self at: #pointHoverBorderColor put: aColorOrBlock value
]

{ #category : #initialization }
ChartStyleSheet >> resetBackgroundwithDataSize: aNumber [
	(self chartType1d includes: self chartType forChartJS)
		ifTrue: [ self
				setOption: #backgroundColor
				to: (RTCPQualitative new colors: aNumber + 1) ]
]

{ #category : #scale }
ChartStyleSheet >> scale [
	self get: #scale
]

{ #category : #points }
ChartStyleSheet >> setOption: aSymbol to: aValue [
	^ self at: aSymbol put: aValue
]
