instance-creation
xObjects: aCollectionOfObjects yObjects: aSequenceableCollectionOfObjectsToMap
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets: {(ChartDataSetSequence sequence: aSequenceableCollectionOfObjectsToMap)};
		yourself