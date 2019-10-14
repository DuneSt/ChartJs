Class {
	#name : #ComposableOption,
	#superclass : #AbstractOption,
	#category : #'ChartJs-Core-Types'
}

{ #category : #'as yet unclassified' }
ComposableOption class >> beGlobal [
	^ self new name: 'options'
]

{ #category : #creation }
ComposableOption class >> name: aString options: aCollectionOfOptions [
	^ self new
		name: aString;
		addOptions: aCollectionOfOptions;
		yourself
]

{ #category : #adding }
ComposableOption >> addOption: anOption [
	value add: anOption
]

{ #category : #adding }
ComposableOption >> addOptions: aCollection [
	value addAll: aCollection
]

{ #category : #initialization }
ComposableOption >> initialize [
	value := OrderedCollection new
]

{ #category : #writing }
ComposableOption >> writeJsonOn: aStream [
	aStream
		<< name asString;
		<< ':{';
		cr.
	self writeValueOn: aStream.
	aStream
		cr;
		<< '}'
]

{ #category : #writing }
ComposableOption >> writeValueOn: aStream [
	1 to: value size - 1 do: [ :i | 
		(value at: i) writeJsonOn: aStream.
		aStream
			<< ',';
			cr ].
	value last writeJsonOn: aStream
]
