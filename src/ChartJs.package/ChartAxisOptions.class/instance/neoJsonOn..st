conversion
neoJsonOn: neoJSONWriter
	neoJSONWriter writeListStreamingDo: [ :jsonListWriter |
		jsonListWriter writeElement: { #display -> self visible . #type -> self scale } asDictionary ]