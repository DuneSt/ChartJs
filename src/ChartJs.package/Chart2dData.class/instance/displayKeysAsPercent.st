presentation
displayKeysAsPercent
	self keyDisplayBlock: [ :percent | (percent * 100) rounded asString, '%' ]