Class {
	#name : #BaselineOfChartJs,
	#superclass : #BaselineOf,
	#category : 'BaselineOfChartJs'
}

{ #category : #baseline }
BaselineOfChartJs >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self
				seaside30: spec;
				stylesheet: spec;
				neoJSON: spec.
			spec package: #ChartJs with: [ spec requires: #('Seaside30' 'Stylesheet' 'NeoJSON') ] ]
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
	self flag: #clean.	"This is a hack that need to be remove after the default version of Metacello includes Cypress suport."
	^ [ #MetacelloCypressBaselineProject asClass ]
		on: NotFound
		do: [ Metacello new
				baseline: 'Metacello';
				repository: 'github://dalehenrich/metacello-work:master/repository';
				get.
			Metacello new
				baseline: 'Metacello';
				repository: 'github://dalehenrich/metacello-work:master/repository';
				onConflict: [ :ex | ex allow ];
				load.
			self projectClass ]
]

{ #category : #dependencies }
BaselineOfChartJs >> seaside30: spec [
	spec
		configuration: 'Seaside30'
		with: [ spec
				className: 'ConfigurationOfSeaside3';
				version: #'release3.2';
				repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ]
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
