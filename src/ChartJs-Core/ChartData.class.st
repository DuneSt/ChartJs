"
I am the abstract class for chart data; defining the charttype to represent me, title and style
"
Class {
	#name : #ChartData,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'title',
		'valueDisplayBlock',
		'singleValueTooltip',
		'multiValueTooltip',
		'xObjects',
		'dataSets',
		'keyDisplayBlock',
		'colors'
	],
	#category : #'ChartJs-Core-Model'
}

{ #category : #'instance-creation' }
ChartData class >> xObjects: aCollectionOfObjects function: aBlock [
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetFunction function: aBlock)};
		yourself
]

{ #category : #'instance-creation' }
ChartData class >> xObjects: aCollectionOfObjects function: aBlockClosure color: aColor [ 
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetFunction function: aBlockClosure color: aColor)};
		yourself
]

{ #category : #'instance-creation' }
ChartData class >> xObjects: aCollectionOfObjects multiYObjects: aCollectionOfSequenceableCollectionOfObjectsToMap [
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets:
				(aCollectionOfSequenceableCollectionOfObjectsToMap
						collect: [ :anAssociation | ChartDataSetSequence name: anAssociation key sequence: anAssociation value ]);
		yourself
]

{ #category : #'instance-creation' }
ChartData class >> xObjects: aCollectionOfObjects yObjects: aSequenceableCollectionOfObjectsToMap [
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetSequence sequence: aSequenceableCollectionOfObjectsToMap)};
		yourself
]

{ #category : #tooltip }
ChartData >> adaptToolTip: aToolTipString [
	^ (Array with: '<label>' -> '<%= datasetLabel %>' with: '<value>' -> '<%= value %>' with: '<key>' -> '<%= label %>')
		inject: aToolTipString
		into: [ :tooltip :asso | tooltip copyReplaceAll: asso key with: asso value ]
]

{ #category : #'as yet unclassified' }
ChartData >> addFunction: aFunctionBlock color: aColor [
	self dataSets addLast: (ChartDataSetFunction function: aFunctionBlock color: aColor)
]

{ #category : #callback }
ChartData >> at: anIndex ifPresent: aBlockClosure [
	^ aBlockClosure
		value: (self xObjects at: anIndex) -> (self dataSets first atIndex: anIndex forValue: (self xObjects at: anIndex))
]

{ #category : #exchange }
ChartData >> callBackValues [
	^ self dataSets first sequence
]

{ #category : #chartType }
ChartData >> chartType [
	^ self styleSheet chartType
]

{ #category : #chartType }
ChartData >> chartType: aChartType [
	^ self styleSheet chartType: aChartType
]

{ #category : #accessing }
ChartData >> dataSets [
	^ dataSets
]

{ #category : #accessing }
ChartData >> dataSets: anObject [
	dataSets := anObject asOrderedCollection
]

{ #category : #colors }
ChartData >> dataSetsColors: aCollectionOfColors [
	self
		assert: aCollectionOfColors size = self dataSets size
		description: 'The provided collection of colors must have one color per dataset'.
	self dataSets doWithIndex: [ :aDataSet :anIndex | aDataSet color: (aCollectionOfColors at: anIndex) ]
]

{ #category : #presentation }
ChartData >> displayKeysAsPercent [
	self keyDisplayBlock: [ :percent | (percent * 100) rounded asString, '%' ]
]

{ #category : #options }
ChartData >> enrichOptions: anOptionDictionary [
	self singleValueTooltip ifNotNil: [ anOptionDictionary at: #tooltipTemplate put: self singleValueTooltipJs ].
	self multiValueTooltip ifNotNil: [ anOptionDictionary at: #multiTooltipTemplate put: self multiValueTooltipJs ].
	
]

{ #category : #testing }
ChartData >> hasData [
	^ self xObjects isNotEmpty
]

{ #category : #testing }
ChartData >> hasLegend [
	^ self dataSets anySatisfy: #hasName
]

{ #category : #testing }
ChartData >> hasTitle [
	^ self title notNil
]

{ #category : #initialization }
ChartData >> initialize [
	self styleSheet: ChartStyleSheet default.
	self chartType: ChartLine
]

{ #category : #accessing }
ChartData >> keyDisplayBlock [
	^ keyDisplayBlock ifNil: [ #yourself ]
]

{ #category : #accessing }
ChartData >> keyDisplayBlock: anObject [
	keyDisplayBlock := anObject
]

{ #category : #presentation }
ChartData >> labelFor: aString [ 
	^ (self keyDisplayBlock value: aString)
]

{ #category : #accessing }
ChartData >> multiValueTooltip [
	^ multiValueTooltip
]

{ #category : #accessing }
ChartData >> multiValueTooltip: anObject [
	multiValueTooltip := anObject
]

{ #category : #accessing }
ChartData >> multiValueTooltipJs [
	^ self adaptToolTip: self multiValueTooltip
]

{ #category : #exchange }
ChartData >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter
				writeKey: #labels
				value: (xObjects collect: [ :aXObject | self labelFor: aXObject ]).
			jsonMapWriter
				writeKey: #datasets
				value:
					(self dataSets
						collect:
							[ :aDataSet | aDataSet neoJsonObjectFor: self xObjects block: self valueDisplayBlock ]) ]
]

{ #category : #accessing }
ChartData >> singleValueTooltip [
	^ singleValueTooltip
]

{ #category : #accessing }
ChartData >> singleValueTooltip: anObject [
	singleValueTooltip := anObject
]

{ #category : #accessing }
ChartData >> singleValueTooltipJs [
	^ self adaptToolTip: self singleValueTooltip
]

{ #category : #accessing }
ChartData >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
ChartData >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #accessing }
ChartData >> title [

	^ title isBlock ifTrue: [ title value: self dataSets ] ifFalse: [ title ]
]

{ #category : #accessing }
ChartData >> title: aBlockOrTitle [
	"You can provide a title String or a block that will be executed with the collection of dataSets as parameter"
	title:= aBlockOrTitle
]

{ #category : #accessing }
ChartData >> valueDisplayBlock [
	self flag: #TODO. "move this property at the dataset level to have different valueDisplayBlock for each dataset"
	^ valueDisplayBlock ifNil: [ #yourself ]
]

{ #category : #accessing }
ChartData >> valueDisplayBlock: anObject [
	valueDisplayBlock := anObject
]

{ #category : #accessing }
ChartData >> xObjects [
	^ xObjects
]

{ #category : #accessing }
ChartData >> xObjects: anObject [
	xObjects := anObject
]
