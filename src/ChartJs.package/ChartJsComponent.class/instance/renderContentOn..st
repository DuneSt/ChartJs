rendering
renderContentOn: html
	| divId canvas |
	divId := html nextId.
	html div
		class: #chartJsChart;
		class: self data chartType name;
		id: divId;
		with: [ 
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
									self printLegendOn: s forDiv: divId ]).
					self data hasTitle
						ifTrue: [ self renderTitleId: divId on: html ] ]