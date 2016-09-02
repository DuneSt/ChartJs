callback
at: anInteger ifPresent: aBlockClosure 
	^ aBlockClosure value: (self datas at: anInteger) value