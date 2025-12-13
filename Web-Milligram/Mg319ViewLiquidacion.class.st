Class {
	#name : 'Mg319ViewLiquidacion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg319ViewLiquidacion >> añadir [ 

	| answer |
	answer := self call: Mg319ViewEditProducto new.
	model addProducto: answer
]

{ #category : 'accessing' }
Mg319ViewLiquidacion >> errors [


	^ OrderedCollection new
]

{ #category : 'initialization' }
Mg319ViewLiquidacion >> initialize [ 

	super initialize.
	model := Mg319ModelLiquidacion new.
]

{ #category : 'rendering' }
Mg319ViewLiquidacion >> renderContentOn: html [

	html fieldSet: [ 
		self renderFieldDepositoFiscalOn: html.
		self renderTableProductos: model productos on: html.
		self renderFieldPagoACuentaOn: html
		 ]
]

{ #category : 'rendering' }
Mg319ViewLiquidacion >> renderFieldDepositoFiscalOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
							html label
								class: 'label-inline float-right';
								for: #depositoFiscal;
								with: 'Depósito fiscal (C.A.E.)' ].
					html div class: 'column'; with: [ 
							html textInput
								id: #depositoFiscal;
								on: #depositoFiscal of: model ] ]
]

{ #category : 'rendering' }
Mg319ViewLiquidacion >> renderFieldPagoACuentaOn: html [
]

{ #category : 'rendering' }
Mg319ViewLiquidacion >> renderRowsProductos: aCollectionOfProductos On: html [

	aCollectionOfProductos do: [ :producto |
			html tableRow: [
					html tableData: producto tipo.
					html tableData style: 'text-align: right'; with: (self ppImp: producto volumen).
					html tableData style: 'text-align: right'; with: (self ppPorc: producto precioLitro precision: 4 ).
					html tableData style: 'text-align: right'; with: (self ppImp: producto cuotaIva) ] ]
]

{ #category : 'rendering' }
Mg319ViewLiquidacion >> renderTableProductos: aCollectionOfProductos on: html [

	self renderTableTitleOn: html.
	html table
		id: #liquidacion319;
		with: [
				html tableHead with: [
							html tableHeading style: 'text-align: left'; with: 'Tipo'.
							html tableHeading style: 'text-align: right'; with: 'Volumen'.
							html tableHeading style: 'text-align: right'; with: 'Precio/Litro'.
							html tableHeading style: 'text-align: right'; with: 'Cuota IVA' ].
				html tableBody with: [
						self renderRowsProductos: aCollectionOfProductos On: html ].
				html tableFoot with: [ 
						html tableRow: [ 
							html tableHeading style: 'text-align: right'; colSpan: 3; with: [ html text: 'Cuota total de la operación asimilada a la importación:' ].
							html tableData style: 'text-align: right'; with: [ html strong: (self ppImp: model cuotaTotal) ]
							 ].
						html tableRow: [ 
							html tableHeading style: 'text-align: right'; colSpan: 3; with: [ html text: 'Resultado. '. html small: 'Pago a cuenta a ingresar (110% de la cuota total):' ]..
							html tableData style: 'text-align: right'; with: [ html strong: (self ppImp: model cuotaTotal * 1.10)  ]
							 ] ] ]
]

{ #category : 'rendering' }
Mg319ViewLiquidacion >> renderTableTitleOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
							html strong
								style: 'font-size: 18pt; font-weight: bold';
								with: 'Productos'.
							html space.
							html button id: 'button-añadir'; class: 'button button-clear'; style: 'background-image: url(/static-files/img/list-add-symbolic.svg);background-repeat: no-repeat'; callback: [self añadir].
							"html anchor
								id: 'button-añadir';
								callback: [ self añadir ];
								with: [
										html image
											style: 'border: 2px solid #fabada; border-radius: 50%';
											width: 24;
											height: 24;
											url: '/static-files/img/list-add-symbolic.svg' ]" ] ]
]
