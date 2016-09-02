tooltip
adaptToolTip: aToolTipString
	^ ((aToolTipString copyReplaceAll: '<label>' with: '<%if (datasetLabel){datasetLabel}%>')
		copyReplaceAll: '<value>'
		with: '<%= value %>') copyReplaceAll: '<key>' with: '<%= label %>'