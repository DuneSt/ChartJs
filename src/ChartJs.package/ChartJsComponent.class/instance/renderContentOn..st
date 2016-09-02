as yet unclassified
renderContentOn: html
	| divId |
	divId := 'test'.
	html canvas
		id: divId;
		style: 'height: 250px, width: 350px'.
	html
		script:
			(String streamContents: [ :s|
				s nextPutAll: 'var myRadarChart = new Chart(document.getElementById("';
				nextPutAll: divId;
				nextPutAll: '").getContext("2d")).';
				nextPutAll: self data chartType forChartJS;
				nextPutAll: '('.
				(NeoJSONWriter on: s) nextPut: self data; close.
				s nextPutAll: ', {});'])