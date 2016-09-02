rendering
manageCallBackIn: html canvas: canvas inDiv: divId
	self hasCallBack
		ifTrue: [ 
			| cb |
			cb := canvas storeCallback: (WAValuesCallback on: [ :node | self value value: node ] values: self data).
			html
				script:
					(self
						callbackMechanism: divId
						actionUrl: html actionUrl asString
						cb: cb
						eventsCode: self data chartType eventsCode) ]