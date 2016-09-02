rendering
manageCallBackIn: html canvas: canvas inDiv: divId
	self hasCallBack
		ifTrue: [ 
			| cb |
			cb := canvas
				storeCallback:
					(WAValuesCallback
						on: [ :nodeOrAssociation | 
							[ self value cull: nodeOrAssociation key cull: nodeOrAssociation value ]
								on: MessageNotUnderstood
								do: [ 
									"If we have a message not understood, it's a 1DData that don't provide an association"
									self value value: nodeOrAssociation ] ]
						values: self data).
			html
				script:
					(self
						callbackMechanism: divId
						actionUrl: html actionUrl asString
						cb: cb
						eventsCode: self data chartType eventsCode) ]