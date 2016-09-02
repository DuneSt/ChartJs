callback
at: anIndex ifPresent: aBlockClosure
	^ aBlockClosure
		value: (self xObjects at: anIndex) -> (self dataSets first atIndex: anIndex forValue: (self xObjects at: anIndex))