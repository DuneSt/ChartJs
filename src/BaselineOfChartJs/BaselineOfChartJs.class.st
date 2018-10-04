"
I am a baseline of ChartJs for Seaside. Read more at: https://github.com/DuneSt/ChartJs
"
Class {
	#name : #BaselineOfChartJs,
	#superclass : #BaselineOf,
	#category : #BaselineOfChartJs
}

{ #category : #baseline }
BaselineOfChartJs >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			
			"Dependencies"
			self
				seaside3: spec;
				stylesheet: spec;
				neoJSON: spec;
				prism: spec.

			"Packages"
			spec
				package: #'ChartJs-Core' with: [ spec requires: #('Seaside3' 'Stylesheet' 'NeoJSON') ];
				package: #'ChartJs-Library' with: [ spec requires: #('Seaside3') ];
				package: #'ChartJs-Demo' with: [ spec requires: #('ChartJs-Core' 'ChartJs-Library' 'PrismCodeDisplayer') ];
				package: #'ChartJs-Core-Tests' with: [ spec requires: #('ChartJs-Core') ].

			"Groups"
			spec
				group: 'all' with: #('default');
				group: 'core' with: #('ChartJs-Core' 'ChartJs-Library');
				group: 'core-without-library' with: #('ChartJs-Core');
				group: 'default' with: #('core' 'demo' 'tests');
				group: 'demo' with: #('ChartJs-Demo');
				group: 'tests' with: #('ChartJs-Core-Tests') ]
]

{ #category : #dependencies }
BaselineOfChartJs >> neoJSON: spec [
	spec
		configuration: 'NeoJSON'
		with: [ spec
				className: 'ConfigurationOfNeoJSON';
				version: #stable;
				repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ]
]

{ #category : #dependencies }
BaselineOfChartJs >> prism: spec [
	spec
		baseline: 'PrismCodeDisplayer'
		with: [ spec
				repository: 'github://DuneSt/PrismCodeDisplayer:v1.x.x/src';
				loads: 'core' ]
]

{ #category : #accessing }
BaselineOfChartJs >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]

{ #category : #dependencies }
BaselineOfChartJs >> seaside3: spec [
	spec baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside/repository' ]
]

{ #category : #dependencies }
BaselineOfChartJs >> stylesheet: spec [
	spec baseline: 'Stylesheet' with: [ spec repository: 'github://pharo-contributions/Stylesheet:v1.x.x/src' ]
]
