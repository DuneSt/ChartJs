Class {
	#name : #SingleOption,
	#superclass : #AbstractOption,
	#category : #'ChartJs-Core-Types'
}

{ #category : #'instance creation' }
SingleOption class >> name: aString value: aValue [
	self new
		name: aString;
		value: aValue
]

{ #category : #writing }
SingleOption >> writeJsonOn: aStream [
	aStream
		<< name;
		<< ':';
		<< '"'.
	self writeValueOn: aStream.
	aStream << '"'
]

{ #category : #writing }
SingleOption >> writeValueOn: aStream [
	aStream << value asString
]
