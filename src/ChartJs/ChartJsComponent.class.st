"
I am a seaside component able to display a Chart with the Chart.js library.

Give me a ChartData to display and I will manage everything.

Don't forget to add ChartJsLibrary to your application
"
Class {
	#name : #ChartJsComponent,
	#superclass : #WAComponent,
	#instVars : [
		'data',
		'options',
		'value'
	],
	#category : 'ChartJs-Component'
}

{ #category : #'instance-creation' }
ChartJsComponent class >> data: aChartData [
	^ self new data: aChartData; yourself
]

{ #category : #'instance-creation' }
ChartJsComponent class >> data: aChartData callback: aBlockClosure [ 
	^ self new data: aChartData; callback: aBlockClosure; yourself
]

{ #category : #'instance-creation' }
ChartJsComponent class >> data: aChartData options: aChartOptions [
	^ self new data: aChartData; options: aChartOptions; yourself
]

{ #category : #'instance-creation' }
ChartJsComponent class >> data: aChartData options: aChartOptions callback: aBlockClosure [ 
	^ self new data: aChartData; options: aChartOptions; callback: aBlockClosure; yourself
]

{ #category : #accessing }
ChartJsComponent >> callback: aBlockClosure [ 
	self value: aBlockClosure 
]

{ #category : #callback }
ChartJsComponent >> callbackMechanism: canvasId actionUrl: anUrl cb: cb eventsCode: eventsCode [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'document.getElementById("graph';
				<< canvasId;
				<<
						'").onclick = function(evt){
	//add 1 because Pharo start at 1 and Js at 0
    var activePointIndex = 1 + myChart';
				<< canvasId;
				<<
						(self data chartType isMultiDataSet
								ifTrue: [ '.datasets[0].' ]
								ifFalse: [ '.' ]);
				<< self data chartType dataFunction;
				<< '.indexOf(myChart';
				<< canvasId;
				<< '.';
				<< eventsCode;
				<<
						'[0]);
	if(activePointIndex!=0){
	post( "';
				<< anUrl asString;
				<< '", { "';
				<< cb;
				<<
						'" : activePointIndex } );
}};' ]
]

{ #category : #rendering }
ChartJsComponent >> createIfNecessaryLegend: html inDiv: divId [
	self data hasLegend
		ifTrue: [ 
			html div
				id: #legend , divId;
				class: #chartJsLegend ]
]

{ #category : #accessing }
ChartJsComponent >> data [
	^ data
]

{ #category : #accessing }
ChartJsComponent >> data: anObject [
	data := anObject
]

{ #category : #testing }
ChartJsComponent >> hasCallBack [
	^ self value notNil
]

{ #category : #rendering }
ChartJsComponent >> manageCallBackIn: html canvas: canvas inDiv: divId [
	self hasCallBack
		ifTrue: [ 
			| cb |
			cb := canvas
				storeCallback:
					(WAValuesCallback
						on: [ :nodeOrAssociation | self value cull: nodeOrAssociation value cull: nodeOrAssociation key ]
						values: self data).
			html
				script:
					(self
						callbackMechanism: divId
						actionUrl: html actionUrl asString
						cb: cb
						eventsCode: self data chartType eventsCode) ]
]

{ #category : #accessing }
ChartJsComponent >> options [
	^ options ifNil: [ ChartOptions new ]
]

{ #category : #accessing }
ChartJsComponent >> options: anObject [
	options := anObject
]

{ #category : #rendering }
ChartJsComponent >> printDataOn: s [
	(NeoJSONWriter on: s)
		nextPut: self data;
		close
]

{ #category : #rendering }
ChartJsComponent >> printDiagramCreationOn: s inDiv: divId [
	s
		<< 'var myChart';
		<< divId;
		<< ' = new Chart(document.getElementById("';
		<< #graph;
		<< divId;
		<< '").getContext("2d")).';
		<< self data chartType forChartJS
]

{ #category : #rendering }
ChartJsComponent >> printLegendOn: s forDiv: divId [
	^ self data hasLegend
		ifTrue: [ 
			s
				nextPutAll: 'document.getElementById("';
				nextPutAll: #legend , divId;
				nextPutAll: '").innerHTML=myChart';
				nextPutAll: divId;
				nextPutAll: '.generateLegend();' ]
]

{ #category : #rendering }
ChartJsComponent >> printOptionsOn: s inHtml: html canvas: canvas [
	|  optionsDictionary |
	optionsDictionary := self options asDictionary.
	self data enrichOptions: optionsDictionary.
	(NeoJSONWriter on: s)
		nextPut: optionsDictionary;
		close
]

{ #category : #rendering }
ChartJsComponent >> renderContentOn: html [
	| divId canvas |
	divId := html nextId.
	html div
		class: #chartJsChart;
		class: self data chartType name;
		class: #hasLegend if: self data hasLegend;
		id: divId;
		with: [ 
					self data hasData
						ifTrue: [ 
							html div
								class: #chartJsGraph;
								with: [ 
											canvas := html canvas id: #graph , divId.
											self manageCallBackIn: html canvas: canvas inDiv: divId ].
							self createIfNecessaryLegend: html inDiv: divId.
							html
								script:
									(String
										streamContents: [ :s | 
											self printDiagramCreationOn: s inDiv: divId.
											s nextPutAll: '('.
											self printDataOn: s.
											s nextPutAll: ', '.
											self printOptionsOn: s inHtml: html canvas: canvas.
											s nextPutAll: ');'.
											self printLegendOn: s forDiv: divId.
											s
												<< 'charts.push(myChart';
												<< divId;
												<< ')' ]).
							self data hasTitle
								ifTrue: [ self renderTitleId: divId on: html ] ]
						ifFalse: [ 
							html div
								class: 'mdl-alert mdl-alert__danger';
								style: 'color: red; text-align: center; margin: auto;';
								with: [ html text: 'No data to display' ] ] ]
]

{ #category : #rendering }
ChartJsComponent >> renderTitleId: divId on: html [
	^ html div
		id: #title , divId;
		class: #chartJsTitle;
		with: [ 
					html heading
						level3;
						with: self data title ]
]

{ #category : #accessing }
ChartJsComponent >> value [
	^ value
]

{ #category : #accessing }
ChartJsComponent >> value: anObject [
	value := anObject
]
