ChartJs
forChartJS: writer displayBlock: aDisplayBlock
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #value value: (aDisplayBlock value: self value).
			jsonMapWriter writeKey: #color value: self color forChartJs.
			jsonMapWriter writeKey: #highlight value: self highlightColor forChartJs.
			jsonMapWriter writeKey: #label value: self name ]