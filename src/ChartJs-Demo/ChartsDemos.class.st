"
I am the demos for charts components
"
Class {
	#name : #ChartsDemos,
	#superclass : #WAComponent,
	#instVars : [
		'selectedNode',
		'selectedValue',
		'currentDemo'
	],
	#category : #'ChartJs-Demo'
}

{ #category : #'class initialization' }
ChartsDemos class >> initialize [
	WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance.
	(WAAdmin register: self asApplicationAt: 'ChartJsDemo')
		addLibrary: PrismLibrary;
		addLibrary: ChartJsLibrary;
		addLibrary: JQDeploymentLibrary
]

{ #category : #versions }
ChartsDemos class >> version [
	^ 'development - from v0.0.0'
]

{ #category : #rendering }
ChartsDemos >> barLineAndRadar: html [
	| chartData |
	chartData := Chart2dData
		xObjects:
			{'Eating'.
			'Drinking'.
			'Sleeping'.
			'Designing'.
			'Coding'.
			'Cycling'.
			'Running'}
		multiYObjects:
			{('Guillaume'
				->
					{65.
					59.
					90.
					81.
					56.
					55.
					40}).
			('Cyril'
				->
					{28.
					48.
					40.
					19.
					96.
					27.
					100})}.
	chartData title: [ :sets | 'Spent time for ' , (sets collect: #name) asCommaStringAnd ].
	chartData multiValueTooltip: '<label> spent <value> min in <key>'.
	selectedNode
		ifNotNil: [ 
			html heading
				level: 3;
				with: 'Selected node: ' , selectedNode asString ].
	{ChartBar.
	ChartLine.
	ChartRadar}
		do: [ :aCharType | 
			chartData chartType: aCharType.
			html render: (ChartJsComponent data: chartData callback: [ :node | selectedNode := node ]) ].
	html render: (ChartJsComponent data: (Chart2dData xObjects: (1 to: 10) function: [ :x | x * (x + 1) ]))
]

{ #category : #rendering }
ChartsDemos >> boxPlot: html [
	| chartData |
	chartData := Chart2dData
		xObjects: #(Guillaume Cyril)
		function: [ :aPlayer | ChartBoxPlotData lowest: 5 atRandom firstQuartile: (5 to: 10) atRandom median: (11 to: 15 ) atRandom thirdQuartile: (16 to: 20) atRandom highest: (21 to: 25) atRandom ].
	chartData chartType: ChartBoxPlot.
	html render: (ChartJsComponent data: chartData)
	
]

{ #category : #accessing }
ChartsDemos >> currentDemo [
	^ currentDemo
]

{ #category : #accessing }
ChartsDemos >> currentDemo: anObject [
	currentDemo := anObject
]

{ #category : #initialization }
ChartsDemos >> initialize [
	super initialize.
	self currentDemo: Chart1dDemo new
]

{ #category : #rendering }
ChartsDemos >> pieDonutAndPolar: html [
	| chartData options |
	chartData := Chart1dData
		values:
			{('Eating' -> 80).
			('Drinking' -> 100).
			('Sleeping' -> 70).
			('Designing' -> 50).
			('Coding' -> 40).
			('Cycling' -> 10).
			('Running' -> 25)}.
	chartData title: [ :datas | 'Priority of actions' ].
	chartData singleValueTooltip: '<key> has an importance of <value>%'.
	selectedValue
		ifNotNil: [ 
			html heading
				level: 3;
				with: 'Selected Value: ' , selectedValue asString ].
	options := ChartOptions new toolTip: [ :label :value | Halt now ].
	{ChartPie.
	ChartDonut.
	ChartPolar}
		do: [ :aCharType | 
			chartData chartType: aCharType.
			html render: (ChartJsComponent data: chartData "options: options" callback: [ :value | selectedValue := value ]) ]
]

{ #category : #rendering }
ChartsDemos >> renderContentOn: html [
	html div
		class: 'chartJs-demo';
		with: [ self renderDemoListOn: html.
			(html tag: 'main')
				with: [ html div
						class: 'chartJs-demo-page';
						with: [ html render: self currentDemo ] ] ]
]

{ #category : #rendering }
ChartsDemos >> renderDemoListOn: html [
	html div
		class: 'chartJs-demo-list';
		with: [ html unorderedList: [ ChartAbstractDemo demos do: [ :aDemoClass | self renderDemosListItemFor: aDemoClass on: html ] ] ]
]

{ #category : #rendering }
ChartsDemos >> renderDemosListItemFor: aDemoClass on: html [
	html listItem
		class: 'chartJs-demo-list-item_active' if: aDemoClass = self currentDemo class;
		with: [ html anchor
				callback: [ self currentDemo: aDemoClass new ];
				with: [ html span: aDemoClass title ] ]
]

{ #category : #rendering }
ChartsDemos >> renderNewContentOn: html [
	html div
		class: 'chartJs-demo';
		with: [ self renderDemoListOn: html.
			(html tag: 'main')
				with: [ html div
						class: 'chartJs-demo-page';
						with: [ html render: self currentDemo ] ] ]
]

{ #category : #hooks }
ChartsDemos >> style [
	^ 'body, html{
	margin: 0;
	height: 100%;
	width: 100%;
	font-size: 14px;
	font-weight: 400;
	line-height: 20px;
	color: #757575;
	font-family: ''Roboto'',''Helvetica'',''Arial'', sans-serif;
}
	
.chartJs-demo{
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	background: #fafafa;
	height: 100%;
	width: 100%;
}

.chartJs-demo-list{
	width: 225px;
	height: 100%;
	background-color: #FFF;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
}

.chartJs-demo-list ul{
	padding-left: 0;
	font-size: 14px;
	line-height: 24px;
	font-weight: 400;
	letter-spacing: 0;
}

.chartJs-demo-list li{
	-webkit-transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	width: 100%;
	line-height: 0;
}

.chartJs-demo-list li a{
	padding-left: 15px;
	font-size: 16px;
	font-weight: inherit;
	display: -webkit-flex;
	color: rgba(0,0,0,0.87);
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
}

.chartJs-demo-list li a:hover{
	background-color: #eee;
}

.chartJs-demo-list li a span{
	line-height: 60px;
}

.chartJs-demo-list-item_active{
	background-color: rgba(206,147,216 ,1);
}

.chartJs-demo-list li.chartJs-demo-list-item_active a:hover{
	background-color: rgba(186,104,200 ,1);
}

.chartJs-demo-list li.chartJs-demo-list-item_active a{
	color: #FFF;
}

.chartJs-demo main{
	display: inline-block;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	overflow: auto;
}

.chartJs-demo-page{
	padding: 16px;
}

.chartJs-demo-page-title{
	margin-bottom: 60px;
	margin-left: 32px;
	text-align: justify;
}

.chartJs-demo-page-title h3{
	font-size: 16px;
	font-weight: 600;
	margin-top: 80px;
	text-transform: uppercase;
	color: rgba(0,0,0,.54);
	line-height: 40px;
}

.chartJs-demo-page-title p{	
	margin-top: 16px;
	margin-bottom: 16px;
	font-size: 13px;
	max-width: 640px;
}

.chartJs-demo-snippet-group{
	width: 100%;
	overflow: hidden;
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	flex-direction: column;
}

.chartJs-demo-snippet-demo pre, .chartJs-demo .minimap-container{
	height: 400px;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
	margin-bottom: 50px;
}

.chartJs-demo pre{
	margin-top: 0;
	margin-bottom: 0;
	padding-top: 0;
	padding-bottom: 0;
}

.chartJs-demo .minimap-container pre{
	width: initial;
}
'


]

{ #category : #updating }
ChartsDemos >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot link
		beStylesheet;
		url: 'https://fonts.googleapis.com/css?family=Roboto'.
	anHtmlRoot title: 'ChartJs Demo - ' , self class version
]
