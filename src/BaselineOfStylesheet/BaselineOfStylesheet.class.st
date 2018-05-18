Class {
	#name : #BaselineOfStylesheet,
	#superclass : #BaselineOf,
	#category : #BaselineOfStylesheet
}

{ #category : #baselines }
BaselineOfStylesheet >> baseline: spec [
	<baseline>
	spec
		baseline: 'Stylesheet'
		with: [ spec repository: 'github://olivierauverlot/Stylesheet' ].
	spec
		for: #pharo
		do: [ 
			spec
				package: 'Stylesheet'.
			spec
				package: 'Stylesheet-Tests'
				with: [ spec requires: #('Stylesheet') ].
			]
]
