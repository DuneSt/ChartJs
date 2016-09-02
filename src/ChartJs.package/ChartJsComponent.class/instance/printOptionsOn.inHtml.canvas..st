rendering
printOptionsOn: s inHtml: html canvas: canvas
	|  optionsDictionary |
	optionsDictionary := self options asDictionary.
	self data enrichOptions: optionsDictionary.
	(NeoJSONWriter on: s)
		nextPut: optionsDictionary;
		close