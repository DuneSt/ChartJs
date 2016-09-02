rendering
printLegendOn: s forDiv: divId
	^ self data hasLegend
		ifTrue: [ 
			s
				nextPutAll: 'document.getElementById("';
				nextPutAll: #legend , divId;
				nextPutAll: '").innerHTML=myChart';
				nextPutAll: divId;
				nextPutAll: '.generateLegend();' ]