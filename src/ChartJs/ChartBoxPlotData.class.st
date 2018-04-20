"
I am a specific data for a Box Plot
"
Class {
	#name : #ChartBoxPlotData,
	#superclass : #Object,
	#instVars : [
		'lowest',
		'firstQuartile',
		'median',
		'thirdQuartile',
		'highest'
	],
	#category : 'ChartJs-Model'
}

{ #category : #'instance creation' }
ChartBoxPlotData class >> for: aCollectionOfObjects using: aProperty [
	^ self forRepartition: (aCollectionOfObjects collect: aProperty as: SortedCollection)
]

{ #category : #'instance creation' }
ChartBoxPlotData class >> forRepartition: repartition [
	| firstQuartile lowest |
	firstQuartile := [ repartition at: (repartition size / 4) asInteger ]
		on: SubscriptOutOfBounds
		do: [ repartition median ].
	lowest := [ repartition at: (repartition size / 10) asInteger ]
		on: SubscriptOutOfBounds
		do: [ firstQuartile ].
	^ self
		lowest: lowest
		firstQuartile: firstQuartile
		median: repartition median
		thirdQuartile: (repartition at: (3 * (repartition size / 4)) asInteger)
		highest: (repartition at: (9 * (repartition size / 10)) asInteger)
]

{ #category : #'instance creation' }
ChartBoxPlotData class >> lowest: aLowestValue firstQuartile: aFirstQuartileValue median: aMedianValue thirdQuartile: aThirdQuartileValue highest: aHighestValue [
	^ self new
		lowest: aLowestValue;
		firstQuartile: aFirstQuartileValue;
		median: aMedianValue;
		thirdQuartile: aThirdQuartileValue;
		highest: aHighestValue;
		yourself
]

{ #category : #conversion }
ChartBoxPlotData >> do: aBlockClosure [ 
	aBlockClosure value: self lowest.
	aBlockClosure value: self firstQuartile - self lowest .
	aBlockClosure value: self median - self firstQuartile.
	aBlockClosure value: self thirdQuartile - self median.
	aBlockClosure value: self highest - self thirdQuartile.
]

{ #category : #accessing }
ChartBoxPlotData >> firstQuartile [
	^ firstQuartile
]

{ #category : #accessing }
ChartBoxPlotData >> firstQuartile: anObject [
	firstQuartile := anObject
]

{ #category : #accessing }
ChartBoxPlotData >> highest [
	^ highest
]

{ #category : #accessing }
ChartBoxPlotData >> highest: anObject [
	highest := anObject
]

{ #category : #accessing }
ChartBoxPlotData >> lowest [
	^ lowest
]

{ #category : #accessing }
ChartBoxPlotData >> lowest: anObject [
	lowest := anObject
]

{ #category : #accessing }
ChartBoxPlotData >> median [
	^ median
]

{ #category : #accessing }
ChartBoxPlotData >> median: anObject [
	median := anObject
]

{ #category : #'as yet unclassified' }
ChartBoxPlotData >> neoJsonOn: writer [
	writer writeList: self
]

{ #category : #accessing }
ChartBoxPlotData >> thirdQuartile [
	^ thirdQuartile
]

{ #category : #accessing }
ChartBoxPlotData >> thirdQuartile: anObject [
	thirdQuartile := anObject
]
