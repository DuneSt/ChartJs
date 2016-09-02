helpers
globalSetColor: aColor
	self fillColor: (aColor copy alpha: 0.2).
	self pointColor: aColor.
	self pointHighlightFill: Color white.
	self pointHighlightStroke: aColor.
	self pointStrokeColor: Color white.
	self strokeColor: aColor