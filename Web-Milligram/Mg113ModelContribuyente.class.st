Class {
	#name : 'Mg113ModelContribuyente',
	#superclass : 'Mg113ModelIdentificacion',
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113ModelContribuyente >> domicilio [ 

	^ domicilio ifNil: [ domicilio := Mg113ModelDomicilioPaisResidencia new ]
]
