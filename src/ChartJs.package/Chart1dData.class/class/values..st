instance-creation
values: aCollectionOfAssociations
	^ self new
		datas: (aCollectionOfAssociations collect: [ :asso | ChartDataValue value: asso value name: asso key ]);
		yourself