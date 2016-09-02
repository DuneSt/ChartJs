accessing
title

	^ title isBlock ifTrue: [ title value: self datas ] ifFalse: [ title ]