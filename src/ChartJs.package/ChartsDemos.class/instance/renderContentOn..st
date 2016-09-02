rendering
renderContentOn: html
	| chartData |
	chartData := ChartData
		xObjects:
			{'Eating'.
			'Drinking'.
			'Sleeping'.
			'Designing'.
			'Coding'.
			'Cycling'.
			'Running'}
		multiYObjects:
			{{65.
			59.
			90.
			81.
			56.
			55.
			40}.
			{28.
			48.
			40.
			19.
			96.
			27.
			100}}.
	ChartType subclasses
		do: [ :aCharType | 
			aCharType isMultiDataSet
				ifTrue: [ 
					chartData chartType: aCharType.
					html render: (ChartJsComponent data: chartData) ] ]