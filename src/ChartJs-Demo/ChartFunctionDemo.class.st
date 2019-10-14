Class {
	#name : #ChartFunctionDemo,
	#superclass : #ChartAbstractDemo,
	#category : #'ChartJs-Demo'
}

{ #category : #accessing }
ChartFunctionDemo class >> description [
	^ 'ChartJs for Seaside allow the user to use a function to compute the values of the chart.'
]

{ #category : #accessing }
ChartFunctionDemo class >> title [
	^ 'Values by function'
]

{ #category : #rendering }
ChartFunctionDemo >> renderChartJsComponentOn: html [
	html render: (ChartJsComponent data: (ChartData xObjects: (1 to: 10) function: [ :x | x * (x + 1) ]))
]
