Class {
	#name : #ChartAbstractChartTypeDemo,
	#superclass : #ChartAbstractDemo,
	#instVars : [
		'kind',
		'selection'
	],
	#category : #'ChartJs-Demo'
}

{ #category : #testing }
ChartAbstractChartTypeDemo class >> isAbstract [
	^ self = ChartAbstractChartTypeDemo
]

{ #category : #initialization }
ChartAbstractChartTypeDemo >> initialize [
	super initialize.
	self kind: self kinds anyOne
]

{ #category : #accessing }
ChartAbstractChartTypeDemo >> kind [
	^ kind
]

{ #category : #accessing }
ChartAbstractChartTypeDemo >> kind: anObject [
	kind := anObject
]

{ #category : #accessing }
ChartAbstractChartTypeDemo >> kinds [
	^ self subclassResponsibility
]

{ #category : #rendering }
ChartAbstractChartTypeDemo >> renderDemoWithId: id with: renderingChartBlock on: html [
	html div
		id: id;
		style: 'display: flex; flex-direction: column; align-items: center;';
		with: [ renderingChartBlock value: html ]
]

{ #category : #rendering }
ChartAbstractChartTypeDemo >> renderPossibleKindsUpdating: id with: renderingChartBlock on: html [
	html form
		style: 'display: flex; justify-content: space-around; margin-bottom: 20px;';
		with: [ html radioGroup
				selected: self kind;
				callback: [ :k | self kind: k ];
				with: [ :group | 
					self kinds
						do: [ :each | 
							html
								label: [ html radioButton
										group: group;
										value: each;
										onChange:
											(html jQuery ajax
												serializeThis;
												onComplete:
													((html jQuery id: id) load html: [ :r | renderingChartBlock value: r ])).
									html text: each displayName ] ] ] ]
]

{ #category : #accessing }
ChartAbstractChartTypeDemo >> selection [
	^ selection
]

{ #category : #accessing }
ChartAbstractChartTypeDemo >> selection: anObject [
	selection := anObject
]
