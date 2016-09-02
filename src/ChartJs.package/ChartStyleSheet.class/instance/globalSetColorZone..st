helpers
globalSetColorZone: aColor
	self fillColor: (aColor copy alpha: 0.9).
	self strokeColor: aColor