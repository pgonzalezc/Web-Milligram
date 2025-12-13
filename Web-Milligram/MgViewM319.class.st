Class {
	#name : 'MgViewM319',
	#superclass : 'MgAppBase',
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

{ #category : 'initialization' }
MgViewM319 >> initialize [

	super initialize.
	idx := 1.
	panels := OrderedCollection
		          with: (MgBreadcrumbInfo
				           withId: 'model-info'
				           description: #('Modelo 319')
				           view: (MgViewModelBanner new
						            setCode: '319';
						            setDescription:
							            #( 'Impuesto sobre el valor añadido'
							               'Pago a cuenta del IVA correspondiente a las entregas de gasolinas, gasóleos y biocarburantes posteriores a la ultimación del régimen de depósito del aduanero' )))
		          with: (MgBreadcrumbInfo
				           withId: 'identificacion'
				           description: #('Identificación (1)')
				           view: MgViewIdentificacion new)
		          with: (MgBreadcrumbInfo
				           withId: 'devengo'
				           description: #('Devengo (2)')
				           view: MgViewDevengo new)
		          with: (MgBreadcrumbInfo
				           withId: 'Liquidación (3)'
				           description: #('Liquidación (3)')
				           view: Mg319ViewLiquidacion new)
		          with: (MgBreadcrumbInfo
				           withId: 'Tributación Territorial (5)'
				           description:
					           #( 'Información de la tributacion por razón de territorio (5)'
					              '(sólo para sujetos pasivos que tributan en varias administraciones )' )
				           view: Mg319ViewTributacionTerritorial new)
]

{ #category : 'updating' }
MgViewM319 >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url: '/static-files/css/milligram/milligram.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery/jquery.min.js'
]
