rendering
printOptionsOn: s inHtml: html canvas: canvas
	| ajax optionsDictionary |
	optionsDictionary := self options asDictionary.
	self options hasToolTip
		ifTrue: [ 
			ajax := html jQuery ajax
				respond: [ :stream | 
					stream nextPutAll:
					'Test text' ].
			optionsDictionary
				at: #tooltipTemplate
				put:
					'<% console.log($.ajax({
  url:"' , ajax fullUrl asString , '&label="+ label + "&value="+ value})); %>' ].
	(NeoJSONWriter on: s)
		nextPut: optionsDictionary;
		close