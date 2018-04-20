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
		do: [ self
				seaside3: spec;
				stylesheet: spec;
				neoJSON: spec.
			spec package: #ChartJs with: [ spec requires: #('Seaside3' 'Stylesheet' 'NeoJSON') ] ]
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
	spec
		configuration: 'Stylesheet'
		with: [ spec
				className: 'ConfigurationOfStylesheet';
				version: #development;
				repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main' ]
]
