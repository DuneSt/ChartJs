as yet unclassified
for: aCollectionOfObjects using: aProperty
	| repartition firstQuartile lowest |
	repartition := (aCollectionOfObjects collect: aProperty) as: SortedCollection.
	firstQuartile := [ repartition at: (repartition size / 4) asInteger ]
		on: SubscriptOutOfBounds
		do: [ repartition median ].
	lowest := [ repartition at: (repartition size / 10) asInteger ]
		on: SubscriptOutOfBounds
		do: [ firstQuartile ].
	^ self
		lowest: lowest
		firstQuartile: firstQuartile
		median: repartition median
		thirdQuartile: (repartition at: (3 * (repartition size / 4)) asInteger)
		highest: (repartition at: (9 * (repartition size / 10)) asInteger)