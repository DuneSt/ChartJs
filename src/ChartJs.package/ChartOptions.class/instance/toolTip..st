as yet unclassified
toolTip: aToolTipBlock
	self
		assert: (aToolTipBlock isBlock and: [ aToolTipBlock numArgs = 2 ])
		description: 'You must provide a two arguments block'.
	toolTip := aToolTipBlock