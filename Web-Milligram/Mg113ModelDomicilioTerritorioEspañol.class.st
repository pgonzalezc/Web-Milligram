Class {
	#name : 'Mg113ModelDomicilioTerritorioEspañol',
	#superclass : 'Object',
	#instVars : [
		'tipoVia',
		'nombreVia',
		'tipoNumeracion',
		'numero',
		'calificadorNumero',
		'bloque',
		'portal',
		'escalera',
		'planta',
		'complemento',
		'poblacion',
		'codigoPostal',
		'municipio',
		'provincia',
		'telefono',
		'fax'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> bloque [

	^ bloque
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> bloque: anObject [

	bloque := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> calificadorNumero [

	^ calificadorNumero
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> calificadorNumero: anObject [

	calificadorNumero := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> codigoPostal [

	^ codigoPostal
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> codigoPostal: anObject [

	codigoPostal := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> complemento [

	^ complemento
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> complemento: anObject [

	complemento := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> errores [

	^ OrderedCollection new
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> escalera [

	^ escalera
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> escalera: anObject [

	escalera := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> fax [

	^ fax
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> fax: anObject [

	fax := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> municipio [

	^ municipio
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> municipio: anObject [

	municipio := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> nombreVia [

	^ nombreVia
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> nombreVia: anObject [

	nombreVia := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> numero [

	^ numero
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> numero: anObject [

	numero := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> planta [

	^ planta
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> planta: anObject [

	planta := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> poblacion [

	^ poblacion
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> poblacion: anObject [

	poblacion := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> portal [

	^ portal
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> portal: anObject [

	portal := anObject
]

{ #category : 'printing' }
Mg113ModelDomicilioTerritorioEspañol >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' tipoVia: ';
		print: tipoVia.
	aStream
		nextPutAll: ' nombreVia: ';
		print: nombreVia.
	aStream
		nextPutAll: ' tipoNumeracion: ';
		print: tipoNumeracion.
	aStream
		nextPutAll: ' numero: ';
		print: numero.
	aStream
		nextPutAll: ' calificadorNumero: ';
		print: calificadorNumero.
	aStream
		nextPutAll: ' bloque: ';
		print: bloque.
	aStream
		nextPutAll: ' portal: ';
		print: portal.
	aStream
		nextPutAll: ' escalera: ';
		print: escalera.
	aStream
		nextPutAll: ' planta: ';
		print: planta.
	aStream
		nextPutAll: ' complement: ';
		print: complemento.
	aStream
		nextPutAll: ' poblacion: ';
		print: poblacion.
	aStream
		nextPutAll: ' codigoPostal: ';
		print: codigoPostal.
	aStream
		nextPutAll: ' municipio: ';
		print: municipio.
	aStream
		nextPutAll: ' provincia: ';
		print: provincia.
	aStream
		nextPutAll: ' telefono: ';
		print: telefono.
	aStream
		nextPutAll: ' fax: ';
		print: fax
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> provincia [

	^ provincia
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> provincia: anObject [

	provincia := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> telefono [

	^ telefono
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> telefono: anObject [

	telefono := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> tipoNumeracion [

	^ tipoNumeracion
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> tipoNumeracion: anObject [

	tipoNumeracion := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> tipoVia [

	^ tipoVia
]

{ #category : 'accessing' }
Mg113ModelDomicilioTerritorioEspañol >> tipoVia: anObject [

	tipoVia := anObject
]

{ #category : 'validation' }
Mg113ModelDomicilioTerritorioEspañol >> valida [

	| errores |
	errores := OrderedCollection new.
	errores addAll: self validaNombreVia.
	errores addAll: self validaTipoNum.
	errores addAll: self validaNumero.
	errores addAll: self validaCodigoPostal.
	errores addAll: self validaTelefono.
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioTerritorioEspañol >> validaCodigoPostal [

	| errores |
	errores := OrderedCollection new.
	(codigoPostal isNil or: [ codigoPostal trim isEmpty ]) ifTrue: [ 
		^ errores add: (MgError
					 widgetId: #codigoPostal
					 descripcion: 'Código postal sin informar. Es obligatorio'); yourself
		 ].
	(codigoPostal trim size ~= 5) ifTrue: [ 
		errores add: (MgError widgetId: #codigoPostal descripcion: 'Codigo postal erróneo. Debe tener cinco dígitos')
		 ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioTerritorioEspañol >> validaNombreVia [

	(nombreVia isNil or: [ nombreVia trim isEmpty ]) ifTrue: [
			^ OrderedCollection
				  with: (MgError
						   widgetId: #nombreVia
						   descripcion: 'Nombre vía sin informar. Es obligatorio') ].
	^ #()
]

{ #category : 'as yet unclassified' }
Mg113ModelDomicilioTerritorioEspañol >> validaNumero [

	(numero isNil or: [numero trim isEmpty]) ifTrue: [ 
		^ OrderedCollection with: (MgError widgetId: #numero descripcion: 'Número sin informar. Es obligatorio' ) ].
	^ #()
]

{ #category : 'validation' }
Mg113ModelDomicilioTerritorioEspañol >> validaTelefono [

	^ #()
]

{ #category : 'validation' }
Mg113ModelDomicilioTerritorioEspañol >> validaTipoNum [

	^ #()
]
