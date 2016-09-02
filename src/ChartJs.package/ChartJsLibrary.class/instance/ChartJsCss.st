accessing
ChartJsCss
	^ '.chartJsChart{
  width: 40%;
}
	
.chartJsLegend { 
  float: right;
  width: 20%;
  list-style: none;
  right: 8px;
  top: 0;
}

.chartJsGraph { 
	width: 79%;
}

.chartJsTitle {
	text-align: center;
} 

.radar-legend li, .bar-legend li, .line-legend li, .boxplot-legend li {
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

.bar-legend li span, .boxplot-legend li span {
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