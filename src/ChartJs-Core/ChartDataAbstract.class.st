"
I am the abstract class for chart data; defining the charttype to represent me, title and style
"
Class {
	#name : #ChartDataAbstract,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'title',
		'valueDisplayBlock',
		'singleValueTooltip',
		'multiValueTooltip'
	],
	#category : #'ChartJs-Core-Model'
}

{ #category : #tooltip }
ChartDataAbstract >> adaptToolTip: aToolTipString [
	^ (Array with: '<label>' -> '<%= datasetLabel %>' with: '<value>' -> '<%= value %>' with: '<key>' -> '<%= label %>')
		inject: aToolTipString
		into: [ :tooltip :asso | tooltip copyReplaceAll: asso key with: asso value ]
]

{ #category : #accessing }
ChartDataAbstract >> at: anIndex ifPresent: aBlockClosure [ 
	"Used by callback to retrieve value"
	^ self subclassResponsibility 
]

{ #category : #chartType }
ChartDataAbstract >> chartType [
	^ self styleSheet chartType
]

{ #category : #chartType }
ChartDataAbstract >> chartType: aChartType [
	^ self styleSheet chartType: aChartType
]

{ #category : #options }
ChartDataAbstract >> enrichOptions: anOptionDictionary [
	self singleValueTooltip ifNotNil: [ anOptionDictionary at: #tooltipTemplate put: self singleValueTooltipJs ].
	self multiValueTooltip ifNotNil: [ anOptionDictionary at: #multiTooltipTemplate put: self multiValueTooltipJs ].
	
]

{ #category : #testing }
ChartDataAbstract >> hasData [
	^ self subclassResponsibility
]

{ #category : #testing }
ChartDataAbstract >> hasLegend [
	^ false
]

{ #category : #testing }
ChartDataAbstract >> hasTitle [
	^ self title notNil
]

{ #category : #initialization }
ChartDataAbstract >> initialize [
	self styleSheet: ChartStyleSheet default
]

{ #category : #accessing }
ChartDataAbstract >> multiValueTooltip [
	^ multiValueTooltip
]

{ #category : #accessing }
ChartDataAbstract >> multiValueTooltip: anObject [
	multiValueTooltip := anObject
]

{ #category : #accessing }
ChartDataAbstract >> multiValueTooltipJs [
	^ self adaptToolTip: self multiValueTooltip
]

{ #category : #accessing }
ChartDataAbstract >> singleValueTooltip [
	^ singleValueTooltip
]

{ #category : #accessing }
ChartDataAbstract >> singleValueTooltip: anObject [
	singleValueTooltip := anObject
]

{ #category : #accessing }
ChartDataAbstract >> singleValueTooltipJs [
	^ self adaptToolTip: self singleValueTooltip
]

{ #category : #accessing }
ChartDataAbstract >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
ChartDataAbstract >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #accessing }
ChartDataAbstract >> title [

	^ self subclassResponsibility 
]

{ #category : #accessing }
ChartDataAbstract >> title: aBlockOrTitle [
	"You can provide a title String or a block that will be executed with the collection of dataSets as parameter"
	title:= aBlockOrTitle
]

{ #category : #accessing }
ChartDataAbstract >> valueDisplayBlock [
	self flag: #TODO. "move this property at the dataset level to have different valueDisplayBlock for each dataset"
	^ valueDisplayBlock ifNil: [ #yourself ]
]

{ #category : #accessing }
ChartDataAbstract >> valueDisplayBlock: anObject [
	valueDisplayBlock := anObject
]
