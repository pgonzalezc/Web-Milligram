Class {
	#name : 'MgViewM796',
	#superclass : 'MgAppBase',
	#instVars : [
		'models'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
MgViewM796 class >> canBeRoot [

	^ true
]

{ #category : 'class initialization' }
MgViewM796 class >> initialize [

	(WAAdmin register: self  asApplicationAt: '/milligram/m796')
		preferenceAt: #sessionClass put: MgSession
]

{ #category : 'as yet unclassified' }
MgViewM796 >> createViewModelBanner [

	^ MgViewModelBanner new
		setCode: '796';
		setDescription:
			#( 'Gravamen Temporal Energético'
			   'Pago anticipado' )
]

{ #category : 'initialization' }
MgViewM796 >> initialize [

	super initialize.
	idx := 1.
	"Paneles que contienen modelos"
	panels := OrderedCollection new.
	panels add: (MgBreadcrumbInfo
			 withId: #'bc-identificacion'
			 label: 'Identificación'
			 view: (MgViewIdentificacion new
					  addDecoration: Mg796DecorationIdentificacion new;
					  yourself)).
	panels add: (MgBreadcrumbInfo
			 withId: #'bc-devengo'
			 label: 'Devengo'
			 view: MgViewDevengo new).
	panels add: (MgBreadcrumbInfo
			 withId: #'bc-liquidacion'
			 label: 'Liquidación'
			 view: Mg796ViewLiquidacion new).
	panels add: (MgBreadcrumbInfo
			 withId: #'bc-resultado'
			 label: 'Resultado'
			 title: 'Resultado del pago anticipado'
			 view: (Mg796ViewResultado withModel: panels third view model)).
	panels add: (MgBreadcrumbInfo
			 withId: #'bc-complementaria'
			 label: 'Complementaria'
			 view: MgViewComplementaria new).
	models := panels collect: [ :panel | panel view model ].
	"Panel informativo"
	panels addFirst: (MgBreadcrumbInfo
			 withId: #'bc-modelInfo'
			 label: 'Info del modelo'
			 title: 'Modelo 796'
			 view: self createViewModelBanner).
	"Panel de resumen"
	panels add: (MgBreadcrumbInfo
			 withId: #'bc-resumenYEnvio'
			 label: 'Resúmen y envío'
			 title: 'Resumen de la declaración y envío'
			 view: MgViewBase new).
	"Aqui van los announcements"
	models fifth informChangeOnComplementariaTo: models fourth.
]

{ #category : 'updating' }
MgViewM796 >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url: '/static-files/css/milligram/milligram.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery/jquery.min.js'
]
