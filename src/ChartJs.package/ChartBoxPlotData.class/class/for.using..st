as yet unclassified
for: aCollectionOfObjects using: aProperty
	| repartition |
	repartition := (aCollectionOfObjects collect: aProperty) as: SortedCollection.
	^ self
		lowest: (repartition at: (repartition size / 10) asInteger)
		firstQuartile: (repartition at: (repartition size / 4) asInteger)
		median: repartition median
		thirdQuartile: (repartition at: (3 * (repartition size / 4)) asInteger)
		highest: (repartition at: (9 * (repartition size / 10)) asInteger)