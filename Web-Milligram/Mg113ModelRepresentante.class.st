Class {
	#name : 'Mg113ModelRepresentante',
	#superclass : 'Mg113ModelIdentificacion',
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113ModelRepresentante >> domicilio [

	^ domicilio ifNil: [ domicilio := Mg113ModelDomicilioTerritorioEspañol new ]
]
