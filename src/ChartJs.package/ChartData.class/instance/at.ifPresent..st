callback
at: anIndex ifPresent: aBlockClosure 
	^ aBlockClosure value: (self dataSets first atIndex: anIndex forValue: (self xObjects at: anIndex))