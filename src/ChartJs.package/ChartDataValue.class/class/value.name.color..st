instance-creation
value: aValue name: aName color: aColor
	^ self new
		value: aValue;
		name: aName;
		globalColor: aColor;
		yourself