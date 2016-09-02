instance-creation
xObjects: aCollectionOfObjects function: aBlock
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetFunction function: aBlock)};
		yourself