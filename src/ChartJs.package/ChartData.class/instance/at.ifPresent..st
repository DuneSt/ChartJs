callback
at: anIndex ifPresent: aBlockClosure 
	^ aBlockClosure value: (self dataSets first atIndex: anIndex forValue: (self dataSets first at: anIndex))