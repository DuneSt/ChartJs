options
enrichOptions: anOptionDictionary
	self singleValueTooltip ifNotNil: [ anOptionDictionary at: #tooltipTemplate put: self singleValueTooltipJs ].
	self multiValueTooltip ifNotNil: [ anOptionDictionary at: #multiTooltipTemplate put: self multiValueTooltipJs ].
	