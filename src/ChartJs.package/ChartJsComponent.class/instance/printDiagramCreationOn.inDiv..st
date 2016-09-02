rendering
printDiagramCreationOn: s inDiv: divId
	s nextPutAll: 'var myChart'.
	s nextPutAll: divId.
	s
		nextPutAll: ' = new Chart(document.getElementById("';
		nextPutAll: #graph , divId;
		nextPutAll: '").getContext("2d")).';
		nextPutAll: self data chartType forChartJS