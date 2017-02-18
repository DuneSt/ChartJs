tooltip
adaptToolTip: aToolTipString
	^ (Array with: '<label>' -> '<%= datasetLabel %>' with: '<value>' -> '<%= value %>' with: '<key>' -> '<%= label %>')
		inject: aToolTipString
		into: [ :tooltip :asso | tooltip copyReplaceAll: asso key with: asso value ]