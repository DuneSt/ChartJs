colors
dataSetsColors: aCollectionOfColors
	self
		assert: aCollectionOfColors size = self dataSets size
		description: 'The provided collection of colors must have one color per dataset'.
	self dataSets doWithIndex: [ :aDataSet :anIndex | aDataSet color: (aCollectionOfColors at: anIndex) ]