as yet unclassified
asDictionary
	| optionDictionary |
	optionDictionary := Dictionary new.
	optionDictionary
		at: #scales
		put:
			{(#xAxes -> self xAxis).
			(#yAxes -> self yAxis)} asDictionary.
	^ optionDictionary