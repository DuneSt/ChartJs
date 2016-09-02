rendering
renderTitleId: divId on: html
	^ html div
		id: #title , divId;
		class: #chartJsTitle;
		with: [ 
					html heading
						level3;
						with: self data title ]