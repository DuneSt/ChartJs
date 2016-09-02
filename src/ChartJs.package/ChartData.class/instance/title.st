accessing
title

	^ title isBlock ifTrue: [ title value: self dataSets ] ifFalse: [ title ]