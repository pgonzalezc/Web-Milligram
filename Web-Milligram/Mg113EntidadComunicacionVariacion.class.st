Class {
	#name : 'Mg113EntidadComunicacionVariacion',
	#superclass : 'Object',
	#instVars : [
		'denominacion',
		'porcentajeTitularidad',
		'valorMercado',
		'valorTransmision',
		'valorAdquisicion'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> denominacion [

	^ denominacion ifNil: [ denominacion := '' ]
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> denominacion: aString [

	denominacion := aString
]

{ #category : 'as yet unclassified' }
Mg113EntidadComunicacionVariacion >> gananciaPatrimonial [

	^ valorTransmision - valorAdquisicion * porcentajeTitularidad
	  / 100.00 round: 2
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> porcentajeTitularidad [

	^ porcentajeTitularidad ifNil: [ porcentajeTitularidad := 100.00 ]
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> porcentajeTitularidad: aNumberOrString [

	porcentajeTitularidad := aNumberOrString asNumber
]

{ #category : 'printing' }
Mg113EntidadComunicacionVariacion >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' denominacion: ';
		print: denominacion.
	aStream
		nextPutAll: ' porcentajeTitularidad: ';
		print: porcentajeTitularidad.
	aStream
		nextPutAll: ' valorMercado: ';
		print: valorMercado.
	aStream
		nextPutAll: ' valorTransmision: ';
		print: valorTransmision.
	aStream
		nextPutAll: ' valorAdquisicion: ';
		print: valorAdquisicion
]

{ #category : 'converting' }
Mg113EntidadComunicacionVariacion >> renderAsTableDataOn: html [

	html tableData: self denominacion.
	html tableData: (MgViewBase ppImp: self porcentajeTitularidad).
	html tableData: (MgViewBase ppImp: self valorMercado).
	html tableData: (MgViewBase ppImp: self valorTransmision).
	html tableData: (MgViewBase ppImp: self valorAdquisicion).
	html tableData: (MgViewBase ppImp: self gananciaPatrimonial)
]

{ #category : 'rendering' }
Mg113EntidadComunicacionVariacion >> renderOn: html [

	self renderAsTableDataOn: html
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> valorAdquisicion [

	^ valorAdquisicion ifNil: [ valorAdquisicion := 0.00 ]
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> valorAdquisicion: aNumberOrString [

	valorAdquisicion := aNumberOrString asNumber
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> valorMercado [

	^ valorMercado ifNil: [ valorMercado := 0.00 ]
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> valorMercado: aNumberOrString [

	valorMercado := aNumberOrString asNumber 
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> valorTransmision [

	^ valorTransmision ifNil: [ valorTransmision := 0.00 ]
]

{ #category : 'accessing' }
Mg113EntidadComunicacionVariacion >> valorTransmision: aNumberOrString [

	valorTransmision := aNumberOrString asNumber
]
