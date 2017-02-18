accessing
valueDisplayBlock
	self flag: #TODO. "move this property at the dataset level to have different valueDisplayBlock for each dataset"
	^ valueDisplayBlock ifNil: [ #yourself ]