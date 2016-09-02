as yet unclassified
charDataSetNeoJsonObject
	^ #(#fillColor #strokeColor #pointColor #pointStrokeColor #pointHighlightFill #pointHighlightStroke)
		inject: Dictionary new
		into: [ :dico :aStyleSelector | 
			[ (dico at: aStyleSelector put: (self perform: aStyleSelector) forChartJs)  ]
				on: NotFound
				do: [  ].
			dico ]