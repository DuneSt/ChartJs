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
			{'Guillaume' -> {65.
			59.
			90.
			81.
			56.
			55.
			40}.
			'Cyril'-> {28.
			48.
			40.
			19.
			96.
			27.
			100}}.
	chartData title: [ :sets | 'Spent time for ', (sets collect: #name) asCommaStringAnd ].
			
	selectedNode ifNotNil: [ html heading level: 3; with: 'Selected node: ', selectedNode asString ].
			
	ChartType subclasses
		do: [ :aCharType | 
			aCharType isMultiDataSet
				ifTrue: [ 
					chartData chartType: aCharType.
					html render: (ChartJsComponent data: chartData callback: [:node | selectedNode := node]) ] ]