rendering
printDataOn: s
	(NeoJSONWriter on: s)
		nextPut: self data;
		close