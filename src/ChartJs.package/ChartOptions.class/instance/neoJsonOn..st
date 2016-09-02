as yet unclassified
neoJsonOn: neoJSONWriter
	neoJSONWriter writeMap:
		(Dictionary new at: #scales put: { #xAxes -> self xAxis . #yAxes -> self yAxis} asDictionary; yourself)