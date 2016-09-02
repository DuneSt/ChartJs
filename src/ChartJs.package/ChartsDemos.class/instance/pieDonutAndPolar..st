rendering
pieDonutAndPolar: html
	| chartData options |
	chartData := Chart1dData
		values:
			{('Eating' -> 80).
			('Drinking' -> 100).
			('Sleeping' -> 70).
			('Designing' -> 50).
			('Coding' -> 40).
			('Cycling' -> 10).
			('Running' -> 25)}.
	chartData title: [ :datas | 'Priority of actions' ].
	selectedValue
		ifNotNil: [ 
			html heading
				level: 3;
				with: 'Selected Value: ' , selectedValue asString ].
	options := ChartOptions new toolTip: [ :label :value | Halt now ].
	{ChartPie.
	ChartDonut.
	ChartPolar}
		do: [ :aCharType | 
			chartData chartType: aCharType.
			html render: (ChartJsComponent data: chartData "options: options" callback: [ :value | selectedValue := value ]) ]