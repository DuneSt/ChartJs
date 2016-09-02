as yet unclassified
renderContentOn: html
	| divId canvas cb |
	divId := html nextId.
	canvas := html canvas id: divId.
	cb := canvas storeCallback: (WAValuesCallback on: [ :node | self value value: node ] values: self data).
	html script:
				(self
						callbackMechanism: divId
						actionUrl: html actionUrl asString
						cb: cb
						eventsCode: self data chartType eventsCode).
	html div id: #legend,divId.
	html
		script:
			(String
				streamContents: [ :s | 
					s nextPutAll: 'var myChart'.
					s nextPutAll: divId.
					s
						nextPutAll: ' = new Chart(document.getElementById("';
						nextPutAll: divId;
						nextPutAll: '").getContext("2d")).';
						nextPutAll: self data chartType forChartJS;
						nextPutAll: '('.
					(NeoJSONWriter on: s)
						nextPut: self data;
						close.
					s nextPutAll: ', {});'.
					
					s nextPutAll: 'document.getElementById("';
						nextPutAll: #legend,divId;
						nextPutAll: '").innerHTML=myChart';
						nextPutAll: divId;
						nextPutAll: '.generateLegend();' ])