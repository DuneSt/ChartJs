as yet unclassified
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #labels value: (xObjects collect: [ :aXObject | self labelFor: aXObject ]).
			jsonMapWriter writeKey: #datasets value: (self dataSets collect: [ :aDataSet | aDataSet neoJsonObjectFor: self xObjects ]) ]