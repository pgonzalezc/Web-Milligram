Class {
	#name : 'MgCountingHandler',
	#superclass : 'SAX2ContentHandler',
	#instVars : [
		'nroDeclarados',
		'nroCabeceras'
	],
	#category : 'Web-Milligram-Utils',
	#package : 'Web-Milligram',
	#tag : 'Utils'
}

{ #category : 'handling - content' }
MgCountingHandler >> endElement: aQualifiedName [

	aQualifiedName = 'Declaracion' ifTrue: [ self parser parsingResult: nroDeclarados ]
]

{ #category : 'initialization' }
MgCountingHandler >> initialize [

	super initialize.
	nroDeclarados := 0.
	nroCabeceras := 0.
]

{ #category : 'handling - content' }
MgCountingHandler >> startElement: aQualifiedName prefix: aPrefix uri: aUri attributes: anAttributeDictionary [

	aQualifiedName = 'Cabecera' ifTrue: [
			nroCabeceras := nroCabeceras + 1.
			(nroCabeceras > 1) ifTrue:
				[ Error signal: 'Invalid XML. Sólo se admite una cabecera'] ].
	aQualifiedName = 'Declarado' ifTrue: [
		nroDeclarados := nroDeclarados + 1 ]
]
