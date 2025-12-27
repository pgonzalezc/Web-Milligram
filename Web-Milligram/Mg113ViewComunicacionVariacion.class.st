Class {
	#name : 'Mg113ViewComunicacionVariacion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
Mg113ViewComunicacionVariacion class >> canBeRoot [ 

	^ true
]

{ #category : 'class initialization' }
Mg113ViewComunicacionVariacion class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: '/milligram/m113'
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> añadir [
	"Abre el comoponente para editar los datos de una nueva entidad"

	| answer |
	answer := self call: Mg113ViewEditComunicacionVariacion new.
	answer ifNotNil: [ model entidades add: answer ]
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> borrar: anIndex [

	model entidades removeAt: anIndex
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> enviar [ 

	Transcript show: model asString; cr
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> errors [

	^ OrderedCollection new
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> headings [

	^ #( 'Denominación de los valores'
	               '% de titularidad' 'Valor de mercado (art. 95 bis 2)'
	               'Valor de transmisión (art. 95 bis 6.b)'
	               'Valor de adquisición' 'Ganancia patrimonial' ).
]

{ #category : 'initialization' }
Mg113ViewComunicacionVariacion >> initialize [ 

	super initialize.
	model := Mg113ModelComunicacionVariacion new
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> model [

	^ model
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionA [

	^ model opcionA
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionA: aBoolean [

	model opcionA: aBoolean
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionB [

	^ model opcionB
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionB: aBoolean [

	model opcionB: aBoolean
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderButtonsOn: html [

	html div
		class: 'float-right';
		with: [ html submitButton on: #enviar of: self ]
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderCheckBoxFor: aSelector withLabel: aHtmlString on: html [

	html label
		class: 'label-inline';
		for: aSelector;
		with: [ html html: aHtmlString].
	html space.
	html checkbox
		id: aSelector;
		on: aSelector of: model.
	html break
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderCheckboxesOn: html [

	html fieldSet: [
			self
				renderCheckBoxFor: #opcionA
				withLabel:
				'a) <strong>COMUNICO</strong> el cambio de Estado de residencia'
				on: html.
			self
				renderCheckBoxFor: #opcionB
				withLabel: 'b) <strong>COMUNICO</strong> el cambio de domicilio'
				on: html.
			self
				renderCheckBoxFor: #opcionC
				withLabel:
				'c) <strong>COMUNICO</strong> la transmisión intervivos de los siguientes valores'
				on: html ]
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderContentOn: html [

	self renderCheckboxesOn: html.
	self renderEntidadesOn: html
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderEntidadesOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
							html heading
								level4;
								with: 'Entidades' ].
				html div
					class: 'column';
					with: [
							html button
								class: 'button button-outline float-right';
								on: #añadir of: self ] ].
	html table: [
			html tableHead: [
					html tableHeading.
					self headings do: [ :each | html tableHeading: each ] ].
			html tableBody: [
					model entidades doWithIndex: [ :each :idx |
							html tableRow: [
									html tableData: [
											html anchor
												callback: [ self borrar: idx ];
												with: [
													html image url: '/static-files/img/user-trash.png' ] ].
									each renderOn: html ] ] ].
			html tableFoot: [
					html tableRow: [
							html tableData
								colSpan: 6;
								with: 'Total ganancias patrimoniales'.
							html tableData:
								(self ppImp: model totalGananciasPatrimoniales) ] ] ]
]

{ #category : 'hooks' }
Mg113ViewComunicacionVariacion >> style [ 

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
