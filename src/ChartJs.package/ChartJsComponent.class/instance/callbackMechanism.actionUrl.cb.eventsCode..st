callback
callbackMechanism: canvasId actionUrl: anUrl cb: cb eventsCode: eventsCode
	^ 'document.getElementById("graph' , canvasId
		,
			'").onclick = function(evt){
	//add 1 because Pharo start at 1 and Js at 0
    var activePointIndex = 1 + myChart' , canvasId
		,
			(self data chartType isMultiDataSet
				ifTrue: [ '.datasets[0].' ]
				ifFalse: [ '.' ]) , self data chartType dataFunction , '.indexOf(myChart' , canvasId , '.' , eventsCode
		,
			'[0]);
	post( ''' , anUrl asString , ''', { "' , cb
		,
			'" : activePointIndex } );
};'