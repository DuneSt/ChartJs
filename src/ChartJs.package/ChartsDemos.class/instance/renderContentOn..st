rendering
renderContentOn: html
	self boxPlot: html.
	self barLineAndRadar: html.
	self pieDonutAndPolar: html.