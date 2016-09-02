ChartJs
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #value value: self value.
			jsonMapWriter writeKey: #color value: self color forChartJs.
			jsonMapWriter writeKey: #highlight value: self highlightColor forChartJs.
			jsonMapWriter writeKey: #label value: self name ]