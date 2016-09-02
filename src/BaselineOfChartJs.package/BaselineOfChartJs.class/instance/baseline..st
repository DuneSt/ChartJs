baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self
				seaside30: spec;
				stylesheet: spec;
				neoJSON: spec.
			spec package: #ChartJs with: [ spec requires: #('Seaside30' 'Stylesheet' 'NeoJSON') ] ]