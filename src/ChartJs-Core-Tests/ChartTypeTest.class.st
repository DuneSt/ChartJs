Class {
	#name : #ChartTypeTest,
	#superclass : #TestCase,
	#category : #'ChartJs-Core-Tests'
}

{ #category : #tests }
ChartTypeTest >> testNeoJsonOnData [
	| json chart stream colorConst |
	chart := ChartData
		xObjects: {'Eating' . 'Drinking'}
		multiYObjects: {('Cyril' -> #(28 48))}.
	chart dataSets
		do: [ :ds | 
			ds styleSheet pointHoverBackgroundColor: Color red.
			ds styleSheet pointBackgroundColor: Color red.
			ds styleSheet fillColor: Color red.
			ds styleSheet borderColor: Color red.
			ds styleSheet pointHoverBorderColor: Color red.
			ds styleSheet pointBorderColor: Color red.
			ds styleSheet backgroundColor: Color red ].
	stream := '' writeStream.
	json := (NeoJSONWriter on: stream) nextPut: chart.
	colorConst := '"fill":false,"pointBackgroundColor":"rgba(255,0,0,1.0)","pointBorderColor":"rgba(255,0,0,1.0)","borderColor":"rgba(255,0,0,1.0)","pointHoverBorderColor":"rgba(255,0,0,1.0)","backgroundColor":"rgba(255,0,0,1.0)"'.
	self
		assert: stream contents
		equals:
			'{"labels":["Eating","Drinking"],"datasets":[{' , colorConst
				, ',"label":"Cyril","data":[28,48]}]}'
]

{ #category : #tests }
ChartTypeTest >> testNeoJsonOnOnlyType [
	| json chart stream |
	chart := ChartBar new.
	stream := '' writeStream.
	json := (NeoJSONWriter on: stream) nextPut: chart.
	
	self assert: stream contents equals: '{"type":"bar"}'
]
