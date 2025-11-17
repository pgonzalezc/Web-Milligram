Class {
	#name : 'MgViewNavBarTest',
	#superclass : 'WAComponent',
	#instVars : [
		'panels',
		'activePanel'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
MgViewNavBarTest class >> canBeRoot [ 
	
	^ true
]

{ #category : 'class initialization' }
MgViewNavBarTest class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: '/web/navBar'
]

{ #category : 'accessing' }
MgViewNavBarTest >> actions [

	^ #( #primary #secondary )
]

{ #category : 'convenience' }
MgViewNavBarTest >> activeComponent [ 
	
	panels at: activePanel
]

{ #category : 'hooks' }
MgViewNavBarTest >> children [ 

	^ panels
]

{ #category : 'initialization' }
MgViewNavBarTest >> initialize [

	super initialize.
	panels := OrderedCollection
			with: (Mg113ViewIdentificacionContribuyente new)
			with: (Mg113ViewIdentificacionRepresentante new).
	activePanel := 1
]

{ #category : 'as yet unclassified' }
MgViewNavBarTest >> primary [

	activePanel := 1
]

{ #category : 'rendering' }
MgViewNavBarTest >> renderContentOn: html [

	html render: (WANavigationBar new owner: self).
	html render: (panels at: activePanel)
]

{ #category : 'as yet unclassified' }
MgViewNavBarTest >> secondary [

	activePanel := 2
]
