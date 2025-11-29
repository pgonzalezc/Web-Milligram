Class {
	#name : 'MgTestSelectProvincias',
	#superclass : 'MgViewBase',
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
MgTestSelectProvincias class >> canBeRoot [

	^ true
]

{ #category : 'class initialization' }
MgTestSelectProvincias class >> initialize [

	<script>
	WAAdmin register: self	 asApplicationAt: '/milligram/test'
]

{ #category : 'rendering' }
MgTestSelectProvincias >> renderContentOn: html [

	html form: [ 
		html div class: 'container'; with: [ 
			self renderSelectProvinciasOn: html
			 ]
		 ]
]

{ #category : 'as yet unclassified' }
MgTestSelectProvincias >> renderSelectProvinciasOn: html [

	html label
		for: 'provincias';
		with: 'Provincias'.
	html select
		id: 'provincias';
		list: MgConstantes listaProvincias;
		labels: [ :p | p nombreProvincia ];
		selected: (MgConstantes listaProvincias at: 15)
]
