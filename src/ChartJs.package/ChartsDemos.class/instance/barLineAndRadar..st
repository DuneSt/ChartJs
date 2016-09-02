rendering
barLineAndRadar: html
	| chartData |
	chartData := Chart2dData
		xObjects:
			{'Eating'.
			'Drinking'.
			'Sleeping'.
			'Designing'.
			'Coding'.
			'Cycling'.
			'Running'}
		multiYObjects:
			{('Guillaume'
				->
					{65.
					59.
					90.
					81.
					56.
					55.
					40}).
			('Cyril'
				->
					{28.
					48.
					40.
					19.
					96.
					27.
					100})}.
	chartData title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ].
	selectedNode
		ifNotNil: [ 
			html heading
				level: 3;
				with: 'Selected node: ' , selectedNode asString ].
	{ChartBar.
	ChartLine.
	ChartRadar}
		do: [ :aCharType | 
			chartData chartType: aCharType.
			html render: (ChartJsComponent data: chartData callback: [ :node | selectedNode := node ]) ].
	html render: (ChartJsComponent data: (Chart2dData xObjects: (1 to: 10) function: [ :x | x * (x + 1) ]))