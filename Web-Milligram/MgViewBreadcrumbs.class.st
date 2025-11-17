Class {
	#name : 'MgViewBreadcrumbs',
	#superclass : 'WAComponent',
	#instVars : [
		'panels',
		'idx',
		'errors'
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
MgViewBreadcrumbs >> children [

	^ { (panels at: idx) view }
]

{ #category : 'hooks' }
MgViewBreadcrumbs >> initialRequest: aRequest [

	| sslInfo |
	sslInfo := MgSSLCertInfo from: aRequest.
	sslInfo isSuccess ifFalse: [ 
		self requestContext redirectTo: '/static-files/another.html'
		 ].
	self session authenticatedUser: sslInfo.
	self session inspect.
]

{ #category : 'initialization' }
MgViewBreadcrumbs >> initialize [

	super initialize.
	idx := 1.
	panels := OrderedCollection
		          with: (MgBreadcrumbInfo
				           withId: 'model-info'
				           description: 'Modelo 113'
				           view: (MgViewModelBanner new
						            setCode: '113';
						            setDescription:
							            #( 'Comunicación de datos relativos a las ganacias patrimoniales por cambio de residencia cuando se produzca a otro estado miembro de la Unión Europea o del Espacio Económico Europeo con efectivo intercambio de información tributaria'
							               '(Artículo 95 bis de la ley de IRPF)' )))
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

{ #category : 'actions' }
MgViewBreadcrumbs >> next [
	"Pasamos al siguiente paso del workflow, si no hay errores"

	errors := (panels at: idx) view errors.
	errors ifEmpty: [ idx := idx + 1 ]
]

{ #category : 'actions' }
MgViewBreadcrumbs >> previous [

	"previo paso del workflow"
	panels inspect.
	idx := idx - 1
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderAuthenticationUserOn: html [

	html div class: 'float-right'; with: [ 
		html text: self session authenticatedUser subject commonName
		 ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderBotoneraOn: html [

	| columnOffset |
	columnOffset := idx = 1
		                ifTrue: [ 'column-offset-90' ]
		                ifFalse: [ 'column-offset-80' ].
	idx > 1 ifTrue: [
			html div
				class: 'column column-10';
				with: [ self renderButtonPreviousOn: html ] ].
	idx < panels size ifTrue: [
			html div
				class: 'column column-10 ' , columnOffset;
				with: [ self renderButtonNextOn: html ] ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderBreadcrumbId: anInteger on: html [

	| classValue |
	classValue := anInteger = idx
		              ifTrue: [ 'active' ]
		              ifFalse: [ '' ].

	html anchor
		class: classValue;
		id: (panels at: anInteger) id;
		url: 'javascript:void(0)';
		onClick: (html jQuery ajax
				 callback: [ :value |
						 | panelsNames |
						 panelsNames := panels collect: [ :bcInfo | bcInfo id ].
						 idx := panelsNames indexOf: value ]
				 value: (html jQuery this attributeAt: 'id');
				 script: [ :s |
						 s << (s jQuery id: 'breadcrumb') load html: [ :r |
								 self renderBreadcrumbsOn: r ].
						 s << (s jQuery id: 'view') load html: [ :r |
								 r render: (panels at: idx) view ].
						 s << (s jQuery id: 'botonera') load html: [ :r |
								 self renderBotoneraOn: r ] ]);
		with: (panels at: anInteger) descripcion capitalized
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderBreadcrumbsOn: html [

	panels doWithIndex: [ :each :index |
		self renderBreadcrumbId: index on: html ]
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
MgViewBreadcrumbs >> renderContentOn: html [

	self renderAuthenticationUserOn: html.
	html form: [
			html div
				id: 'breadcrumb';
				class: 'breadcrumb flat';
				with: [ self renderBreadcrumbsOn: html ].
			self renderErrorsOn: html.
			html div
				id: 'view';
				class: 'view';
				with: [ html render: (panels at: idx) view ].
			html div
				id: 'botonera';
				class: 'row';
				with: [ self renderBotoneraOn: html ] ]
]

{ #category : 'rendering' }
MgViewBreadcrumbs >> renderErrorsOn: html [

	(errors isNil or: [errors isEmpty]) ifTrue: [ ^ self ].
	html div
		id: 'error-container';
		class: 'error-container';
		with: [
				self renderCabeceraErroresOn: html.
				html unorderedList
					id: 'lista-errores';
					class: 'lista-errores';
					with: [
							errors do: [ :each |
										html listItem: [
													html span
														class: 'error-text';
														with: [ html text: each descripcion ].
													html space.
													self renderLinkToWidget: each widgetId on: html ] ] ] ].
	errors removeAll
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

{ #category : 'hooks' }
MgViewBreadcrumbs >> style [ 

	^ '

.breadcrumb {
	/*centering*/
	text-align: center;
	display: inline-block;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.35);
	overflow: hidden;
	border-radius: 5px;
	/*Lets add the numbers for each link using CSS counters. flag is the name of the counter. to be defined using counter-reset in the parent element of the links*/
	counter-reset: flag; 
}

.breadcrumb a {
	text-decoration: none;
	outline: none;
	display: block;
	float: left;
	font-size: 12px;
	line-height: 36px;
	color: white;
	/*need more margin on the left of links to accomodate the numbers*/
	padding: 0 10px 0 60px;
	background: #666;
	background: linear-gradient(#666, #333);
	position: relative;
}
/*since the first link does not have a triangle before it we can reduce the left padding to make it look consistent with other links*/
.breadcrumb a:first-child {
	padding-left: 46px;
	border-radius: 5px 0 0 5px; /*to match with the parent''s radius*/
}
.breadcrumb a:first-child:before {
	left: 14px;
}
.breadcrumb a:last-child {
	border-radius: 0 5px 5px 0; /*this was to prevent glitches on hover*/
	padding-right: 20px;
}

/*hover/active styles*/
.breadcrumb a.active, .breadcrumb a:hover{
	background: #333;
	background: linear-gradient(#333, #000);
}
.breadcrumb a.active:after, .breadcrumb a:hover:after {
	background: #333;
	background: linear-gradient(135deg, #333, #000);
}

/*adding the arrows for the breadcrumbs using rotated pseudo elements*/
.breadcrumb a:after {
	content: '''';
	position: absolute;
	top: 0; 
	right: -18px; /*half of square''s length*/
	/*same dimension as the line-height of .breadcrumb a */
	width: 36px; 
	height: 36px;
	/*as you see the rotated square takes a larger height. which makes it tough to position it properly. So we are going to scale it down so that the diagonals become equal to the line-height of the link. We scale it to 70.7% because if square''s: 
	length = 1; diagonal = (1^2 + 1^2)^0.5 = 1.414 (pythagoras theorem)
	if diagonal required = 1; length = 1/1.414 = 0.707*/
	transform: scale(0.707) rotate(45deg);
	/*we need to prevent the arrows from getting buried under the next link*/
	z-index: 1;
	/*background same as links but the gradient will be rotated to compensate with the transform applied*/
	background: #666;
	background: linear-gradient(135deg, #666, #333);
	/*stylish arrow design using box shadow*/
	box-shadow: 
		2px -2px 0 2px rgba(0, 0, 0, 0.4), 
		3px -3px 0 2px rgba(255, 255, 255, 0.1);
	/*
		5px - for rounded arrows and 
		50px - to prevent hover glitches on the border created using shadows*/
	border-radius: 0 5px 0 50px;
}
/*we dont need an arrow after the last link*/
.breadcrumb a:last-child:after {
	content: none;
}
/*we will use the :before element to show numbers*/
.breadcrumb a:before {
	content: counter(flag);
	counter-increment: flag;
	/*some styles now*/
	border-radius: 100%;
	width: 20px;
	height: 20px;
	line-height: 20px;
	margin: 8px 0;
	position: absolute;
	top: 0;
	left: 30px;
	background: #444;
	background: linear-gradient(#444, #222);
	font-weight: bold;
}

.flat a, .flat a:after {
	background: white;
	color: black;
	transition: all 0.5s;
}
.flat a:before {
	background: white;
	box-shadow: 0 0 0 1px #ccc;
}
.flat a:hover, .flat a.active, 
.flat a:hover:after, .flat a.active:after{
	background: #9EEB62;
}







	'
]

{ #category : 'updating' }
MgViewBreadcrumbs >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url: '/static-files/css/milligram/milligram.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery/jquery.min.js'
]
