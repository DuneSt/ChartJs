conversion
do: aBlockClosure 
	aBlockClosure value: self lowest.
	aBlockClosure value: self firstQuartile - self lowest .
	aBlockClosure value: self median - self firstQuartile.
	aBlockClosure value: self thirdQuartile - self median.
	aBlockClosure value: self highest - self thirdQuartile.