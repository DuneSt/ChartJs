accessing
ChartJsCss
	^ '.radar-legend, .bar-legend, .line-legend  {
  list-style: none;
  right: 8px;
  top: 0;
}
.radar-legend li, .bar-legend li, .line-legend li {
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

.bar-legend li span {
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