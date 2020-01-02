Extension { #name : #Color }

{ #category : #'*ChartJs-Core' }
Color >> forChartJs [
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: 'rgba(';
				nextPutAll: (self red * 255) asInteger asString;
				nextPut: $,;
				nextPutAll: (self green * 255) asInteger asString;
				nextPut: $,;
				nextPutAll: (self blue * 255) asInteger asString;
				nextPut: $,;
				nextPutAll: self alpha asString;
				nextPut: $) ]
]

{ #category : #'*ChartJs-Core' }
Color >> neoJsonOn: neoJSonWriter [
	neoJSonWriter
		writeString:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: 'rgba(';
						nextPutAll: (self red * 255) asInteger asString;
						nextPut: $,;
						nextPutAll: (self green * 255) asInteger asString;
						nextPut: $,;
						nextPutAll: (self blue * 255) asInteger asString;
						nextPut: $,;
						nextPutAll: self alpha asString;
						nextPut: $) ])
]
