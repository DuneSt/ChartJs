helpers
globalSetColorZone: aColor
	self fillColor: (aColor copy alpha: 0.8).
	self strokeColor: aColor