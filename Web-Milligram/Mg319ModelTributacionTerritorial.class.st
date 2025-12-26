Class {
	#name : 'Mg319ModelTributacionTerritorial',
	#superclass : 'Object',
	#instVars : [
		'porcentajes',
		'resultado'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> alava [ 

	^ 1
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> guipuzcoa [ 

	^ 2
]

{ #category : 'initialization' }
Mg319ModelTributacionTerritorial >> initialize [

	super initialize.
	porcentajes := OrderedCollection new: 4 withAll: 0.0
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> navarra [

	^ 4
]

{ #category : 'instance creation' }
Mg319ModelTributacionTerritorial >> newResultado: anAnnouncement [

	self setResultado: anAnnouncement  resultado
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> pagoACuentaAlava [

	^ (porcentajes at: self alava) * resultado / 100.0
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> pagoACuentaGuipuzcoa [

	^ (porcentajes at: self guipuzcoa) * resultado / 100.0
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> pagoACuentaNavarra [

	^ (porcentajes at: self navarra) * resultado / 100.0
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> pagoACuentaTerritorioComun [

	^ self porcentajeTerritorioComun * resultado / 100.0
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> pagoACuentaVizcaya [
	^ (porcentajes at: self vizcaya) * resultado / 100.0
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeAlava [

	^ porcentajes at: self alava
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeAlava: aNumber [

	porcentajes at: self alava put: aNumber
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeGuipuzcoa [

	^ porcentajes at: self guipuzcoa
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeGuipuzcoa: aNumber [

	porcentajes at: self guipuzcoa put: aNumber
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeNavarra [

	^ porcentajes at: self navarra
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeNavarra: aNumber [

	porcentajes at: self navarra put: aNumber
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeTerritorioComun [

	^ 100.0 - (porcentajes inject: 0.0 into: [ :sum :p | sum + p ])
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeVizcaya [

	^ porcentajes at: self vizcaya
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> porcentajeVizcaya: aNumber [

	porcentajes at: self vizcaya put: aNumber
]

{ #category : 'accessing' }
Mg319ModelTributacionTerritorial >> resultado [

	^ resultado
]

{ #category : 'initialization' }
Mg319ModelTributacionTerritorial >> setResultado: aNumber [

	resultado := aNumber
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> territorioComun [

	^ 5
]

{ #category : 'as yet unclassified' }
Mg319ModelTributacionTerritorial >> vizcaya [

	^ 3
]
