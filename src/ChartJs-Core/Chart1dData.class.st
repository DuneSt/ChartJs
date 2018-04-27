"
I am a one dimension representation of data for graph like Pie, Donut and Polar that present values with label.
"
Class {
	#name : #Chart1dData,
	#superclass : #ChartDataAbstract,
	#instVars : [
		'datas'
	],
	#category : #'ChartJs-Core-Model'
}

{ #category : #'instance-creation' }
Chart1dData class >> dictionary: aDictionary [
	^ self values: aDictionary associations 
]

{ #category : #'instance-creation' }
Chart1dData class >> dictionary: aDictionary valueDisplayBlock: aBlockOrSymbol [
	^ (self dictionary: aDictionary)
		valueDisplayBlock: aBlockOrSymbol;
		yourself
]

{ #category : #'instance-creation' }
Chart1dData class >> values: aCollectionOfAssociations [
	^ self new
		datas: (aCollectionOfAssociations collect: [ :asso | ChartDataValue value: asso value name: asso key ]);
		yourself
]

{ #category : #'instance-creation' }
Chart1dData class >> values: aCollectionOfAssociations valueDisplayBlock: aBlockOrSymbol [
	^ (self values: aCollectionOfAssociations)
		valueDisplayBlock: aBlockOrSymbol;
		yourself
]

{ #category : #callback }
Chart1dData >> at: anInteger ifPresent: aBlockClosure [
	^ aBlockClosure value: (self datas at: anInteger) name -> (self datas at: anInteger) value
]

{ #category : #chartType }
Chart1dData >> chartType: aChartType [
	self assert: aChartType isFor1DValues description: 'Chart accepted: Donut, Pie and Polar'.
	super chartType: aChartType
]

{ #category : #accessing }
Chart1dData >> datas [
	^ datas
]

{ #category : #accessing }
Chart1dData >> datas: anObject [
	datas := anObject asArray
]

{ #category : #testing }
Chart1dData >> hasData [
	^ self datas isNotEmpty
]

{ #category : #testing }
Chart1dData >> hasLegend [
	^ true
]

{ #category : #initialization }
Chart1dData >> initialize [
	super initialize.
	self chartType: ChartPie
]

{ #category : #ChartJs }
Chart1dData >> neoJsonOn: writer [
	writer writeListStreamingDo: [ :jsonListWriter |
		self datas do: [ :each | each forChartJS: writer displayBlock: self valueDisplayBlock] separatedBy: [ writer listElementSeparator ] ]
]

{ #category : #accessing }
Chart1dData >> title [

	^ title isBlock ifTrue: [ title value: self datas ] ifFalse: [ title ]
]
