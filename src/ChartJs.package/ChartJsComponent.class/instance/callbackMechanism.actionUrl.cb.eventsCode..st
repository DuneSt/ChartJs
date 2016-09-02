as yet unclassified
callbackMechanism: canvasId actionUrl: anUrl cb: cb eventsCode: eventsCode
	^ canvasId, '.onclick = function(evt){
	//add 1 because Pharo start at 1 and Js at 0
    var activePointIndex = 1 + myChart',canvasId ,'.datasets[0].points.indexOf(myChart',canvasId ,'.',eventsCode,'[0]);
	console.log(activePointIndex);
	post( ''',anUrl asString,''', { "',cb,'" : activePointIndex } );
};'