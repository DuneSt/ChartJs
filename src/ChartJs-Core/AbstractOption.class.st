Class {
	#name : #AbstractOption,
	#superclass : #Object,
	#instVars : [
		'name',
		'value'
	],
	#category : #'ChartJs-Core-Types'
}

{ #category : #accessing }
AbstractOption >> name [
	^ name
]

{ #category : #accessing }
AbstractOption >> name: anObject [
	name := anObject
]

{ #category : #evaluating }
AbstractOption >> value [
	^ value
]

{ #category : #accessing }
AbstractOption >> value: anObject [
	value := anObject
]

{ #category : #writing }
AbstractOption >> writeJsonOn: aStream [
	^ self subclassResponsibility
]

{ #category : #writing }
AbstractOption >> writeValueOn: aStream [
	^ self subclassResponsibility
]
