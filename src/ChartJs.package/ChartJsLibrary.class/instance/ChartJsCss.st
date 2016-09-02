accessing
ChartJsCss
	^ '.chartJsChart{
  width: 40%;
	position:relative;
}
	
.chartJsLegend { 
  width: 30%;
  list-style: none;
  right: 8px;
  top: 0;
	position: absolute;
}

.chartJsGraph { 
	width: 70%;
}

.chartJsTitle {
	text-align: center;
} 

.radar-legend li, .bar-legend li, .line-legend li, .boxplot-legend li, .pie-legend li, .doughnut-legend li, .polararea-legend li {
  display: block;
  padding-left: 30px;
  position: relative;
  margin-bottom: 4px;
}

.radar-legend li span {
  display: block;
  position: absolute;
  left: 0;
  top: 30%;
  width: 10px;
  height: 10px;
  border-radius: 5px;
}

.bar-legend li span, .boxplot-legend li span, .pie-legend li span, .doughnut-legend li span, .polararea-legend li span {
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  width: 20px;
  height: 100%;
  border-radius: 5px;
}

.line-legend li span {
  display: block;
  position: absolute;
  left: 0;
  top: 45%;
  width: 20px;
  height: 10%;
  border-radius: 0px;
}'.