Class {
	#name : #ChartTypeTest,
	#superclass : #TestCase,
	#category : #'ChartJs-Core-Tests'
}

{ #category : #tests }
ChartTypeTest >> testNeoJsonOn2dData [
	| json chart stream colorConst |
	chart := 	ChartData
					xObjects: {'Eating' . 'Drinking'}
					multiYObjects: { 'Cyril' -> #(28 48 )}.
	chart dataSets do: [ :ds |
		ds styleSheet pointHighlightFill: Color red.
		ds styleSheet pointColor: Color red.
		ds styleSheet fillColor: Color red.
		ds styleSheet strokeColor: Color red.
		ds styleSheet pointHighlightStroke: Color red.
		ds styleSheet pointStrokeColor: Color red.
	].
	stream := '' writeStream.
	json := (NeoJSONWriter on: stream) nextPut: chart.
	colorConst := '"pointHighlightFill":"rgba(255,0,0,1.0)","pointColor":"rgba(255,0,0,1.0)","fillColor":"rgba(255,0,0,1.0)","strokeColor":"rgba(255,0,0,1.0)","pointHighlightStroke":"rgba(255,0,0,1.0)","pointStrokeColor":"rgba(255,0,0,1.0)"'.
		
	self
		assert: stream contents
		equals:
			'{"labels":["Eating","Drinking"],"datasets":[{',
			colorConst ,
		 	',"label":"Cyril","data":[28,48]}]}'
]

{ #category : #tests }
ChartTypeTest >> testNeoJsonOnOnlyType [
	| json chart stream |
	chart := ChartBar new.
	stream := '' writeStream.
	json := (NeoJSONWriter on: stream) nextPut: chart.
	
	self assert: stream contents equals: '{"type":"Bar"}'
]
