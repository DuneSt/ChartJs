as yet unclassified
renderContentOn: html
	| divId canvas cb |
	divId := html nextId.
	html div
		class: #chartJsChart;
		id: divId;
		with: [ 
					canvas := html canvas
						id: #graph , divId;
						class: #chartJsGraph.
					cb := canvas storeCallback: (WAValuesCallback on: [ :node | self value value: node ] values: self data).
					html
						script:
							(self
								callbackMechanism: divId
								actionUrl: html actionUrl asString
								cb: cb
								eventsCode: self data chartType eventsCode).
					self data hasLegend
						ifTrue: [ 
							html div
								id: #legend , divId;
								class: #chartJsLegend ].
					html
						script:
							(String
								streamContents: [ :s | 
									s nextPutAll: 'var myChart'.
									s nextPutAll: divId.
									s
										nextPutAll: ' = new Chart(document.getElementById("';
										nextPutAll: #graph , divId;
										nextPutAll: '").getContext("2d")).';
										nextPutAll: self data chartType forChartJS;
										nextPutAll: '('.
									(NeoJSONWriter on: s)
										nextPut: self data;
										close.
									s nextPutAll: ', {});'.
									self data hasLegend
										ifTrue: [ 
											s
												nextPutAll: 'document.getElementById("';
												nextPutAll: #legend , divId;
												nextPutAll: '").innerHTML=myChart';
												nextPutAll: divId;
												nextPutAll: '.generateLegend();' ] ]).
					self data hasTitle
						ifTrue: [ 
							html div
								id: #title , divId;
								class: #chartJsTitle;
								with: [ html text: self data title ] ] ]