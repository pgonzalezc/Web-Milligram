Class {
	#name : 'MgViewM319',
	#superclass : 'MgAppBase',
	#instVars : [
		'models'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
MgViewM319 class >> canBeRoot [

	^ true
]

{ #category : 'class initialization' }
MgViewM319 class >> initialize [

	<script>
	(WAAdmin register: self asApplicationAt: 'milligram/m319')
		preferenceAt: #sessionClass put: MgSession
]

{ #category : 'as yet unclassified' }
MgViewM319 >> cargarProductosPrueba [
	"Inicializamos algunos productos en el modelo de la vista de liquidacion"

	(panels at: 4) view model addProducto: (Mg319ModelProducto
			 withTipo: (Mg319TipoProducto listaProductos second)
			 volumen: 123.23
			 precioLitro: 1.2343).
	(panels at: 4) view model addProducto: (Mg319ModelProducto
			 withTipo: (Mg319TipoProducto listaProductos fifth)
			 volumen: 1234.43
			 precioLitro: 1.1256)
]

{ #category : 'as yet unclassified' }
MgViewM319 >> createViewModelBanner [

	^ MgViewModelBanner new
		setCode: '319';
		setDescription:
			#( 'Impuesto sobre el valor añadido'
			   'Pago a cuenta del IVA correspondiente a las entregas de gasolinas, gasóleos y biocarburantes posteriores a la ultimación del régimen de depósito del aduanero' )
]

{ #category : 'initialization' }
MgViewM319 >> initialize [

	super initialize.
	idx := 1.
	"Paneles que contienen modelos"
	panels := OrderedCollection
		          with: (MgBreadcrumbInfo
				           withId: #identificacion
				           label: 'Identificación'
				           view: MgViewIdentificacion new)
		          with: (MgBreadcrumbInfo
				           withId: #devengo
				           label: 'Devengo'
				           view: MgViewDevengo new)
		          with: (MgBreadcrumbInfo
				           withId: #liquidacion
				           label: 'Liquidación'
				           view: Mg319ViewLiquidacion new)
		          with: (MgBreadcrumbInfo
				           withId: #tributacionTerritorial
				           label: 'Tributación territorial'
				           title:
				           'Información de la tributacion por razón de territorio'
				           subtitle:
				           '(sólo para sujetos pasivos que tributan en varias administraciones )'
				           view: Mg319ViewGridTributacionTerritorial new).
	models := panels collect: [ :panel | panel view model ].
	"Panel informativo"
	panels addFirst: (MgBreadcrumbInfo
			 withId: #modelInfo
			 label: 'Info del modelo'
			 title: 'Modelo 319'
			 view: self createViewModelBanner).
	"Panel de resumen"
	panels add: (MgBreadcrumbInfo
			 withId: #resumenYEnvio
			 label: 'Resúmen y envío'
			 title: 'Resumen de la declaración y envío'
			 view: (Mg319ViewResumen new models: models)).
	"announcements"
	(panels at: 4) view model informChangeOnResultadoTo:
		(panels at: 5) view model.
	self cargarProductosPrueba
]

{ #category : 'updating' }
MgViewM319 >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url: '/static-files/css/milligram/milligram.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery/jquery.min.js'
]
