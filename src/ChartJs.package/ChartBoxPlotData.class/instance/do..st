conversion
do: aBlockClosure 
	aBlockClosure value: self lowest.
	aBlockClosure value: self firstQuartile .
	aBlockClosure value: self median.
	aBlockClosure value: self thirdQuartile .
	aBlockClosure value: self highest .