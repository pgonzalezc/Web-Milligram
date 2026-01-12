Class {
	#name : 'MgViewBreadcrumbs',
	#superclass : 'MgAppBase',
	#instVars : [
		'models'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
MgViewBreadcrumbs class >> canBeRoot [

	^ true
]

{ #category : 'class initialization' }
MgViewBreadcrumbs class >> initialize [

	<script>
	| app |
	app := WAAdmin register: self asApplicationAt: 'milligram/breadcrumbs'.
	app preferenceAt: #sessionClass put: MgSession
  
]

{ #category : 'as yet unclassified' }
MgViewBreadcrumbs >> createViewModelBanner [

	| title subtitle |
	title := 'Comunicación de datos relativos a las ganacias patrimoniales por cambio de residencia cuando se produzca a otro estado miembro de la Unión Europea'
	         ,
	         ' o del Espacio Económico Europeo con efectivo intercambio de información tributaria'.
	subtitle := '(Artículo 95 bis de la ley de IRPF)'.
	^ MgViewModelBanner new
		  setCode: '113';
		  setDescription: {
				  title.
				  subtitle }
]

{ #category : 'initialization' }
MgViewBreadcrumbs >> initialize [

	super initialize.
	idx := 1.
	"paneles que contienen modelos"
	panels := OrderedCollection
		          with: (MgBreadcrumbInfo
				           withId: #contribuyente
				           label: 'Contribuyente'
				           view: Mg113ViewIdentificacionContribuyente new)
		          with: (MgBreadcrumbInfo
				           withId: #representante
				           label: 'Representante'
				           title:
				           'Representante del contribuyente, o en su caso, domicilio a efectos de notificaciones en territorio español'
				           view: Mg113ViewIdentificacionRepresentante new)
		          with: (MgBreadcrumbInfo
				           withId: #comunicacionOpcion
				           label: 'Comunicación opción'
				           title:
				           'Comunicación de la opción por las especialidades previstas en el apartado 6 del articulo 95 bis de la Ley del Impuesto sobre la Renta de las Personas Físicas'
				           view: Mg113ViewComunicacionOpcion new)
		          with: (MgBreadcrumbInfo
				           withId: #comunicacionVariacion
				           label: 'Comunicación variación'
				           title: 'Comunicación variación de circunstancias'
				           view: Mg113ViewComunicacionVariacion new).
	models := panels collect: [ :each | each view model ].
	panels addFirst: (MgBreadcrumbInfo
			 withId: #modelInfo
			 label: 'Modelo 113'
			 title: 'Información del modelo'
			 view: self createViewModelBanner).
	panels addLast: (MgBreadcrumbInfo
			 withId: #firmaYEnvio
			 label: 'Firma y Envío'
			 title: 'Firma y envío'
			 view: (Mg113ViewFirmaYEnvio new
					  modelo: '113';
					  models: models))
]

{ #category : 'actions' }
MgViewBreadcrumbs >> next [

	super next.
	"Guardamos en la sesión la identicación del contribuyente"
	(errors isEmpty and: [idx = 2]) ifTrue: [
		self session contribuyente: (panels at: 2) view model ]
]

{ #category : 'actions' }
MgViewBreadcrumbs >> previous [

	super previous
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderCabeceraErroresOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html strong id: 'title-cabecera-errores'; with: 'Corrija los siguientes errores:' ].
				html div
					class: 'column';
					with: [
							html div class: 'float-right'; with: [ 
							html anchor
								class: 'button button-clear';
								style: 'font-size: larger; margin: 0; padding: 0';
								onClick: (html jQuery id: 'error-container') hide;
								with: 'X' ] ] ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderLinkToWidget: aWidgetId on: html [

	html anchor
		url: 'javascript:void(0);';
		onClick: (html jQuery id: aWidgetId) triggerSelect scrollTop;
		with: [
				html image
					url: '/static-files/img/external-link-symbolic.svg';
					width: 13;
					height: 13 ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderModelBannerOn: html [

	html render: (MgViewModelBanner new
			 setCode: '113';
			 setDescription:
				 #( 'Comunicación de datos relativos a las ganacias patrimoniales por cambio de residencia cuando se produzca a otro estado miembro de la Unión uropea o del Espacio Económico Europeo con efectivo intercambio de información tributaria'
				    '(Artículo 95 bis de la ley de IRPF)' )).
				
	html break
]

{ #category : 'updating' }
MgViewBreadcrumbs >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url: '/static-files/css/milligram/milligram.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery/jquery.min.js'
]
