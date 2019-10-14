"
I am the abstract class for chart data; defining the charttype to represent me, title and style
"
Class {
	#name : #Chart2dData,
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
Chart2dData class >> xObjects: aCollectionOfObjects function: aBlock [
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetFunction function: aBlock)};
		yourself
]

{ #category : #'instance-creation' }
Chart2dData class >> xObjects: aCollectionOfObjects function: aBlockClosure color: aColor [ 
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetFunction function: aBlockClosure color: aColor)};
		yourself
]

{ #category : #'instance-creation' }
Chart2dData class >> xObjects: aCollectionOfObjects multiYObjects: aCollectionOfSequenceableCollectionOfObjectsToMap [
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets:
				(aCollectionOfSequenceableCollectionOfObjectsToMap
						collect: [ :anAssociation | ChartDataSetSequence name: anAssociation key sequence: anAssociation value ]);
		yourself
]

{ #category : #'instance-creation' }
Chart2dData class >> xObjects: aCollectionOfObjects yObjects: aSequenceableCollectionOfObjectsToMap [
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetSequence sequence: aSequenceableCollectionOfObjectsToMap)};
		yourself
]

{ #category : #tooltip }
Chart2dData >> adaptToolTip: aToolTipString [
	^ (Array with: '<label>' -> '<%= datasetLabel %>' with: '<value>' -> '<%= value %>' with: '<key>' -> '<%= label %>')
		inject: aToolTipString
		into: [ :tooltip :asso | tooltip copyReplaceAll: asso key with: asso value ]
]

{ #category : #'as yet unclassified' }
Chart2dData >> addFunction: aFunctionBlock color: aColor [
	self dataSets addLast: (ChartDataSetFunction function: aFunctionBlock color: aColor)
]

{ #category : #callback }
Chart2dData >> at: anIndex ifPresent: aBlockClosure [
	^ aBlockClosure
		value: (self xObjects at: anIndex) -> (self dataSets first atIndex: anIndex forValue: (self xObjects at: anIndex))
]

{ #category : #exchange }
Chart2dData >> callBackValues [
	^ self dataSets first sequence
]

{ #category : #chartType }
Chart2dData >> chartType [
	^ self styleSheet chartType
]

{ #category : #chartType }
Chart2dData >> chartType: aChartType [
	^ self styleSheet chartType: aChartType
]

{ #category : #accessing }
Chart2dData >> dataSets [
	^ dataSets
]

{ #category : #accessing }
Chart2dData >> dataSets: anObject [
	dataSets := anObject asOrderedCollection
]

{ #category : #colors }
Chart2dData >> dataSetsColors: aCollectionOfColors [
	self
		assert: aCollectionOfColors size = self dataSets size
		description: 'The provided collection of colors must have one color per dataset'.
	self dataSets doWithIndex: [ :aDataSet :anIndex | aDataSet color: (aCollectionOfColors at: anIndex) ]
]

{ #category : #presentation }
Chart2dData >> displayKeysAsPercent [
	self keyDisplayBlock: [ :percent | (percent * 100) rounded asString, '%' ]
]

{ #category : #options }
Chart2dData >> enrichOptions: anOptionDictionary [
	self singleValueTooltip ifNotNil: [ anOptionDictionary at: #tooltipTemplate put: self singleValueTooltipJs ].
	self multiValueTooltip ifNotNil: [ anOptionDictionary at: #multiTooltipTemplate put: self multiValueTooltipJs ].
	
]

{ #category : #testing }
Chart2dData >> hasData [
	^ self xObjects isNotEmpty
]

{ #category : #testing }
Chart2dData >> hasLegend [
	^ self dataSets anySatisfy: #hasName
]

{ #category : #testing }
Chart2dData >> hasTitle [
	^ self title notNil
]

{ #category : #initialization }
Chart2dData >> initialize [
	self styleSheet: ChartStyleSheet default.
	self chartType: ChartLine
]

{ #category : #accessing }
Chart2dData >> keyDisplayBlock [
	^ keyDisplayBlock ifNil: [ #yourself ]
]

{ #category : #accessing }
Chart2dData >> keyDisplayBlock: anObject [
	keyDisplayBlock := anObject
]

{ #category : #presentation }
Chart2dData >> labelFor: aString [ 
	^ (self keyDisplayBlock value: aString)
]

{ #category : #accessing }
Chart2dData >> multiValueTooltip [
	^ multiValueTooltip
]

{ #category : #accessing }
Chart2dData >> multiValueTooltip: anObject [
	multiValueTooltip := anObject
]

{ #category : #accessing }
Chart2dData >> multiValueTooltipJs [
	^ self adaptToolTip: self multiValueTooltip
]

{ #category : #exchange }
Chart2dData >> neoJsonOn: writer [
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
Chart2dData >> singleValueTooltip [
	^ singleValueTooltip
]

{ #category : #accessing }
Chart2dData >> singleValueTooltip: anObject [
	singleValueTooltip := anObject
]

{ #category : #accessing }
Chart2dData >> singleValueTooltipJs [
	^ self adaptToolTip: self singleValueTooltip
]

{ #category : #accessing }
Chart2dData >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
Chart2dData >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #accessing }
Chart2dData >> title [

	^ title isBlock ifTrue: [ title value: self dataSets ] ifFalse: [ title ]
]

{ #category : #accessing }
Chart2dData >> title: aBlockOrTitle [
	"You can provide a title String or a block that will be executed with the collection of dataSets as parameter"
	title:= aBlockOrTitle
]

{ #category : #accessing }
Chart2dData >> valueDisplayBlock [
	self flag: #TODO. "move this property at the dataset level to have different valueDisplayBlock for each dataset"
	^ valueDisplayBlock ifNil: [ #yourself ]
]

{ #category : #accessing }
Chart2dData >> valueDisplayBlock: anObject [
	valueDisplayBlock := anObject
]

{ #category : #accessing }
Chart2dData >> xObjects [
	^ xObjects
]

{ #category : #accessing }
Chart2dData >> xObjects: anObject [
	xObjects := anObject
]
