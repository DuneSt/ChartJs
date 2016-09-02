class initialization
initialize
	| app |
	app := WAAdmin register: self asApplicationAt: 'ChartJsDemo'.
	
	app
		addLibrary: ChartJsLibrary 