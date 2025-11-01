Class {
	#name : 'MgViewBreadcrumbs',
	#superclass : 'WAComponent',
	#instVars : [
		'views',
		'idx'
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
	WAAdmin register: self asApplicationAt: 'milligram/breadcrumbs'
]

{ #category : 'accessing' }
MgViewBreadcrumbs >> active: aBreadcrumbInfo [

	^ aBreadcrumbInfo id = (views at: idx) id
		  ifTrue: [ 'active' ]
		  ifFalse: [ '' ]
]

{ #category : 'as yet unclassified' }
MgViewBreadcrumbs >> children [

	^ { (views at: idx) view }
]

{ #category : 'initialization' }
MgViewBreadcrumbs >> initialize [

	super initialize.
	idx := 1.
	views := OrderedCollection
		         with: (MgBreadcrumbInfo
				          withId: 'contribuyente'
				          description: 'Contribuyente'
				          view: Mg113ViewIdentificacionContribuyente new)
		         with: (MgBreadcrumbInfo
				          withId: 'representante'
				          description: 'Representante'
				          view: Mg113ViewIdentificacionRepresentante new)
		         with: (MgBreadcrumbInfo
				          withId: 'comunicacion-opcion'
				          description: 'Comuniciación opción'
				          view: Mg113ViewComunicacionOpcion new)
		         with: (MgBreadcrumbInfo
				          withId: 'comunicacion-variacion'
				          description: 'Comunicación variación'
				          view: Mg113ViewComunicacionVariacion new)
		         with: (MgBreadcrumbInfo
				          withId: 'firma-envio'
				          description: 'Firma y Envío'
				          view: (Mg113ViewFirmaYEnvio new modelo: '113'))
]

{ #category : 'accessing' }
MgViewBreadcrumbs >> next [

	views inspect.
	idx := idx + 1.
	
]

{ #category : 'accessing' }
MgViewBreadcrumbs >> previous [

	views inspect.
	idx := idx - 1
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderBotoneraOn: html [

	| columnOffset |
	columnOffset := idx = 1 ifTrue: [ 'column-offset-90' ] ifFalse: [ 'column-offset-80' ].
	idx > 1 ifTrue: [ html div class: 'column column-10'; with: [self renderButtonPreviousOn: html ]].
	idx < views size ifTrue: [ html div class: 'column column-10 ', columnOffset; with: [self renderButtonNextOn: html ]]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderBreadcrumbId: aBreadcrumbInfo on: html [

	html anchor
		class: (self active: aBreadcrumbInfo);
		id: aBreadcrumbInfo id;
		url: 'javascript:void(0)';
		onClick: (html jQuery ajax
				 callback: [ :value | idx := (views collect: [ :bcInfo | bcInfo id ]) indexOf: value  ]
				 value: (html jQuery this attributeAt: 'id');
				 script: [ :s |
						 s << (s jQuery id: 'breadcrumb') load html: [ :r |
								 self renderBreadcrumbsOn: r ].
						 s << (s jQuery id: 'view') load html: [ :r | r render: (views at: idx) view ].
						 s << (s jQuery id: 'botonera') load html: [ :r | self renderBotoneraOn: r  ] ]);
		with: aBreadcrumbInfo descripcion capitalized.
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderBreadcrumbsOn: html [

	views do: [ :each | self renderBreadcrumbId: each on: html ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderButtonNextOn: html [

	html div
		class: 'float-right';
		with: [
				html submitButton
					class: 'button button-outline';
					on: #next of: self;
					value: 'Siguiente' ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderButtonPreviousOn: html [

	html div
		class: 'float-left';
		with: [
				html submitButton
					class: 'button button-outline';
					on: #previous of: self;
					value: 'Anterior' ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderContentOn: html [

	html form: [
			html div
				id: 'breadcrumb';
				class: 'breadcrumb flat';
				with: [ self renderBreadcrumbsOn: html ].
			html div
				id: 'view';
				class: 'view';
				with: [ html render: (views at: idx) view ].
			html div
				id: 'botonera';
				class: 'row';
				with: [ self renderBotoneraOn: html ] ]
]

{ #category : 'updating' }
MgViewBreadcrumbs >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url: '/static-files/css/milligram/milligram.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery/jquery.min.js'
]
