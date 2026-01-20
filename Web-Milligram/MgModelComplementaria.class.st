Class {
	#name : 'MgModelComplementaria',
	#superclass : 'MgModelBase',
	#instVars : [
		'complementaria',
		'sustitutiva',
		'nroJustificanteAnterior'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
MgModelComplementaria >> complementaria [

	^ complementaria
]

{ #category : 'accessing' }
MgModelComplementaria >> complementaria: aBoolean [

	complementaria := aBoolean.
	complementaria ifTrue: [ sustitutiva := false ].
	self hayMarcas ifFalse: [ nroJustificanteAnterior := '' ]
]

{ #category : 'as yet unclassified' }
MgModelComplementaria >> hayMarcas [

	^ complementaria or: [ sustitutiva ]
]

{ #category : 'as yet unclassified' }
MgModelComplementaria >> informChangeOnComplementariaTo: anObject [

	announcer when: MgChangeComplementariaAnnouncement send: #setComplementaria: to: anObject
]

{ #category : 'initialization' }
MgModelComplementaria >> initialize [

	super initialize.
	complementaria := false.
	sustitutiva := false.
	nroJustificanteAnterior := ''
]

{ #category : 'accessing' }
MgModelComplementaria >> nroJustificanteAnterior [

	^ nroJustificanteAnterior
]

{ #category : 'accessing' }
MgModelComplementaria >> nroJustificanteAnterior: aString [

	nroJustificanteAnterior := aString
]

{ #category : 'accessing' }
MgModelComplementaria >> sustitutiva [

	^ sustitutiva
]

{ #category : 'accessing' }
MgModelComplementaria >> sustitutiva: aBoolean [

	sustitutiva := aBoolean.
	sustitutiva ifTrue: [ complementaria := false ].
	self hayMarcas ifFalse: [ nroJustificanteAnterior := '' ]
]

{ #category : 'as yet unclassified' }
MgModelComplementaria >> toggleComplementaria [

	self complementaria: complementaria not.
	announcer announce: (MgChangeComplementariaAnnouncement new setComplementaria: self complementaria)
]

{ #category : 'as yet unclassified' }
MgModelComplementaria >> toggleSustitutiva [

	self sustitutiva: sustitutiva not

]
