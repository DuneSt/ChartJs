instance creation
xObjects: aCollectionOfObjects function: aBlockClosure color: aColor 
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetFunction function: aBlockClosure color: aColor)};
		yourself