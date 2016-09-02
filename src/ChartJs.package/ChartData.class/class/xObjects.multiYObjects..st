instance-creation
xObjects: aCollectionOfObjects multiYObjects: aCollectionOfSequenceableCollectionOfObjectsToMap
	^ self new
		xObjects: aCollectionOfObjects;
		dataSets:
				(aCollectionOfSequenceableCollectionOfObjectsToMap
						collect: [ :aCollection | ChartDataSetSequence sequence: aCollection ]);
		yourself