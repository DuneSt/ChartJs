ChartJs
neoJsonOn: writer
	writer writeListStreamingDo: [ :jsonListWriter |
		self datas do: [ :each | each forChartJS: writer displayBlock: self valueDisplayBlock] separatedBy: [ writer listElementSeparator ] ]