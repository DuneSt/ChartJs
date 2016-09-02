rendering
createIfNecessaryLegend: html inDiv: divId
	self data hasLegend
		ifTrue: [ 
			html div
				id: #legend , divId;
				class: #chartJsLegend ]