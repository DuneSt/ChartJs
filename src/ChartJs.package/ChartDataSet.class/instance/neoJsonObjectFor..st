exchange
neoJsonObjectFor: aCollectionOfXObjects
	| dico |
	dico := Dictionary new.
	dico at: #label put: self name.
	dico at: #data put: (self valuesFor: aCollectionOfXObjects ).
	dico addAll: self styleSheet charDataSetNeoJsonObject.
	^ dico