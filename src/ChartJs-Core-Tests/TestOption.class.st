Class {
	#name : #TestOption,
	#superclass : #TestCase,
	#instVars : [
		'composedOption1',
		'option1',
		'option2'
	],
	#category : #'ChartJs-Core-Tests'
}

{ #category : #running }
TestOption >> setUp [
	super setUp.
	option1 := SingleOption new
		name: 'ticks';
		value: 5.
	option2 := SingleOption new
		name: 'axeX';
		value: 4.
	composedOption1 := ComposableOption new
		name: 'options';
		addOption: option1;
		addOption: option2
]

{ #category : #tests }
TestOption >> testComposedOption1 [
	self
		assert: (String streamContents: [ :s | composedOption1 writeJsonOn: s ])
		equals:
			'options:{
ticks:"5",
axeX:"4"
}'
]

{ #category : #tests }
TestOption >> testComposedOption2 [
	| composedOption2 |
	composedOption2 := ComposableOption new
		name: 'scales';
		addOption: option1;
		addOption: composedOption1.
	self
		assert: (String streamContents: [ :s | composedOption2 writeJsonOn: s ])
		equals:
			'scales:{
ticks:"5",
options:{
ticks:"5",
axeX:"4"
}
}'
]

{ #category : #tests }
TestOption >> testSingleOption [
	| color |
	color := SingleOption new
		name: 'background-color';
		value: 'red'.
	self
		assert: (String streamContents: [ :s | color writeJsonOn: s ])
		equals: 'background-color:"red"'
]
