accessing
extChartJs
	^ 'Chart.Type.Line.getPointAtEvent = function(e){
			//Travis2
			var pointsArray = [],
				eventPosition = helpers.getRelativePosition(e);
			helpers.each(this.datasets,function(dataset){
				helpers.each(dataset.points,function(point){
					if (point.inRange(eventPosition.x,eventPosition.y)) console.log(point);
				});
			},this);
			return pointsArray;
		};'