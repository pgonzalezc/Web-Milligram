Class {
	#name : 'Mg319ModelLiquidacion',
	#superclass : 'Object',
	#instVars : [
		'depositoFiscal',
		'productos',
		'announcer'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'adding' }
Mg319ModelLiquidacion >> addProducto: aM319ModelProducto [

	productos add: aM319ModelProducto.
	announcer announce: (Mg319ChangeResultadoAnnouncement with: self resultado)
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> cuotaTotal [

	^ productos inject: 0.0 into: [ :acc :p | acc + p cuotaIva round: 2]
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> depositoFiscal [

	^ depositoFiscal ifNil: [ depositoFiscal := '' ]
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> depositoFiscal: aString [

	depositoFiscal := aString
]

{ #category : 'as yet unclassified' }
Mg319ModelLiquidacion >> informChangeOnResultadoTo: anObject [

	announcer when: Mg319ChangeResultadoAnnouncement send: #newResultado: to: anObject
]

{ #category : 'initialization' }
Mg319ModelLiquidacion >> initialize [

	super initialize.
	announcer := Announcer new.
	productos := OrderedCollection new
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> productos [

	^ productos
]

{ #category : 'as yet unclassified' }
Mg319ModelLiquidacion >> resultado [

	^ self cuotaTotal * 1.10
]
