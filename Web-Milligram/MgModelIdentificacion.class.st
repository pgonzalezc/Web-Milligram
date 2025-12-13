Class {
	#name : 'MgModelIdentificacion',
	#superclass : 'Object',
	#instVars : [
		'nif',
		'apellidos',
		'nombre'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
MgModelIdentificacion >> apellidos [

	^ apellidos
]

{ #category : 'accessing' }
MgModelIdentificacion >> apellidos: aString [

	apellidos := aString
]

{ #category : 'accessing' }
MgModelIdentificacion >> nif [

	^ nif
]

{ #category : 'accessing' }
MgModelIdentificacion >> nif: aString [

	nif := aString
]

{ #category : 'accessing' }
MgModelIdentificacion >> nombre [

	^ nombre
]

{ #category : 'accessing' }
MgModelIdentificacion >> nombre: aString [

	nombre := aString
]
