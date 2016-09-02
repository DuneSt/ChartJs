rendering
manageCallBackIn: html canvas: canvas inDiv: divId
	self hasCallBack
		ifTrue: [ 
			| cb |
			cb := canvas
				storeCallback:
					(WAValuesCallback
						on: [ :nodeOrAssociation | self value cull: nodeOrAssociation value cull: nodeOrAssociation key ]
						values: self data).
			html
				script:
					(self
						callbackMechanism: divId
						actionUrl: html actionUrl asString
						cb: cb
						eventsCode: self data chartType eventsCode) ]