Class {
	#name : #BaselineOfStylesheet,
	#superclass : #BaselineOf,
	#category : #BaselineOfStylesheet
}

{ #category : #baselines }
BaselineOfStylesheet >> baseline: spec [
	<baseline>
	
	spec
		for: #pharo
		do: [ 
			spec
				package: 'Stylesheet-Core'.
			spec
				package: 'Stylesheet-Tests'
				with: [ spec requires: #('Stylesheet-Core') ].
			]
]
