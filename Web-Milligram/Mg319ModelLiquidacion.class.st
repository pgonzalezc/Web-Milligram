Class {
	#name : 'Mg319ModelLiquidacion',
	#superclass : 'Object',
	#instVars : [
		'depositoFiscal',
		'productos'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'adding' }
Mg319ModelLiquidacion >> addProducto: aM319ModelProducto [

	productos add: aM319ModelProducto 
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> cuotaTotal [

	^ productos inject: 0.0 into: [ :acc :p | acc + p cuotaIva round: 2]
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> depositoFiscal [

	^ depositoFiscal
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> depositoFiscal: aString [

	depositoFiscal := aString
]

{ #category : 'initialization' }
Mg319ModelLiquidacion >> initialize [

	super initialize.
	productos := OrderedCollection
		             with: (Mg319ModelProducto
				              withTipo: 'Gasolina'
				              volumen: 123.23
				              precioLitro: 1.2343)
		             with: (Mg319ModelProducto
				              withTipo: 'Keroseno'
				              volumen: 1234.43
				              precioLitro: 1.1256)
]

{ #category : 'accessing' }
Mg319ModelLiquidacion >> productos [

	^ productos
]
