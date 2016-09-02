rendering
renderContentOn: html
	| divId canvas |
	divId := html nextId.
	html div
		class: #chartJsChart;
		id: divId;
		with: [ 
					canvas := html canvas
						id: #graph , divId;
						class: #chartJsGraph.
					self manageCallBackIn: html canvas: canvas inDiv: divId.
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
						ifTrue: [ 
							html div
								id: #title , divId;
								class: #chartJsTitle;
								with: [ html text: self data title ] ] ]