querying
valuesFor: aCollectionOfXObjects block: aBlock
	^ aCollectionOfXObjects collect: [ :anXValue | aBlock value: (self function value: anXValue) ]