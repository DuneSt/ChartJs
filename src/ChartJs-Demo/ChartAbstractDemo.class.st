Class {
	#name : #ChartAbstractDemo,
	#superclass : #WAComponent,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
ChartAbstractDemo class >> demos [
	^ (self allSubclasses reject: #isAbstract) sorted: [ :a :b | a title < b title ]
]

{ #category : #accessing }
ChartAbstractDemo class >> description [
	^ self subclassResponsibility
]

{ #category : #testing }
ChartAbstractDemo class >> isAbstract [
	^ self = ChartAbstractDemo
]

{ #category : #accessing }
ChartAbstractDemo class >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
ChartAbstractDemo >> description [
	^ self class description
]

{ #category : #rendering }
ChartAbstractDemo >> renderChartJsComponentOn: html [
	^ self subclassResponsibility
]

{ #category : #rendering }
ChartAbstractDemo >> renderCodeOfDemoOn: html [
	html heading
		level3;
		with: 'Code:'.
	html div
		class: 'chartJs-demo-snippet-code';
		with: [ html
				render:
					(PrismComponent new
						sourceCode: [ (self class lookupSelector: #renderChartJsComponentOn:) sourceCode ];
						language: #smalltalk;
						enableCopyOnClick;
						yourself) ]
]

{ #category : #rendering }
ChartAbstractDemo >> renderContentOn: html [
	self renderTitleOn: html.
	html div
		class: 'chartJs-demo-snippet-group';
		with: [ self renderDemoOn: html.
			self renderCodeOfDemoOn: html ]
]

{ #category : #rendering }
ChartAbstractDemo >> renderDemoOn: html [
	html div
		class: 'chartJs-demo-snippet-demo';
		with: [ self renderChartJsComponentOn: html ]
]

{ #category : #rendering }
ChartAbstractDemo >> renderTitleOn: html [
	html div
		class: 'chartJs-demo-page-title';
		with: [ html heading
				level3;
				with: self title.
			html paragraph: self description.
			self warningDescription ifNotNil: [ :desc | html strong: desc ] ]
]

{ #category : #accessing }
ChartAbstractDemo >> title [
	^ self class title
]

{ #category : #accessing }
ChartAbstractDemo >> warningDescription [
	"If a demo needs a warning, override this method."

	^ nil
]
