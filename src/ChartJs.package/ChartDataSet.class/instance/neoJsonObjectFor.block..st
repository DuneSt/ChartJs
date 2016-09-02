exchange
neoJsonObjectFor: aCollectionOfXObjects block: aBlock
	| dico |
	dico := Dictionary new.
	dico at: #label put: self name.
	dico at: #data put: (self valuesFor: aCollectionOfXObjects block: aBlock).
	dico addAll: self styleSheet charDataSetNeoJsonObject.
	^ dico