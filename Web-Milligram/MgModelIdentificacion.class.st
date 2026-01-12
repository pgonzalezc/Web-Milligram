Class {
	#name : 'MgModelIdentificacion',
	#superclass : 'Object',
	#instVars : [
		'nif',
		'apellidos',
		'nombre',
		'checks'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'adding' }
MgModelIdentificacion >> addCheck: aOneParameterBlock for: aSymbol [

	| storedChecks |
	storedChecks := self checks at: aSymbol ifAbsent: OrderedCollection new.
	storedChecks add: aOneParameterBlock.
	self checks at: aSymbol put: storedChecks
]

{ #category : 'accessing' }
MgModelIdentificacion >> apellidos [

	^ apellidos ifNil: [ apellidos := '' ]
]

{ #category : 'accessing' }
MgModelIdentificacion >> apellidos: aString [

	apellidos := aString
]

{ #category : 'accessing' }
MgModelIdentificacion >> checks [

	^ checks ifNil: [ checks := Dictionary new  ]
]

{ #category : 'accessing' }
MgModelIdentificacion >> denominacion [

	^ (self apellidos ifNotEmpty: [ self apellidos, ', ']), self nombre
]

{ #category : 'accessing' }
MgModelIdentificacion >> nif [

	^ nif ifNil: [ nif := '' ]
]

{ #category : 'accessing' }
MgModelIdentificacion >> nif: aString [

	nif := aString
]

{ #category : 'accessing' }
MgModelIdentificacion >> nombre [

	^ nombre ifNil: [ nombre := '' ]
]

{ #category : 'accessing' }
MgModelIdentificacion >> nombre: aString [

	nombre := aString
]

{ #category : 'validation' }
MgModelIdentificacion >> valida [
	|errors|
	errors := (self checks at: #nif) collect: [ :each | each value: self nif ].
	self halt.
	^ errors
]
