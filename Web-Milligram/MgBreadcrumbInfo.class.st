Class {
	#name : 'MgBreadcrumbInfo',
	#superclass : 'Object',
	#instVars : [
		'id',
		'descripcion',
		'view'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
MgBreadcrumbInfo class >> withId: aSymbolOrString description: aString view: aWAComponent [

	^ self basicNew
		setId: aSymbolOrString ;
		setDescripcion: aString ;
		setView: aWAComponent 
]

{ #category : 'accessing' }
MgBreadcrumbInfo >> descripcion [

	^ descripcion
]

{ #category : 'accessing' }
MgBreadcrumbInfo >> id [

	^ id
]

{ #category : 'private' }
MgBreadcrumbInfo >> setDescripcion: aString [

	descripcion := aString
]

{ #category : 'private' }
MgBreadcrumbInfo >> setId: aSymbolOrString [

	id := aSymbolOrString 
]

{ #category : 'private' }
MgBreadcrumbInfo >> setView: aWAComponent [

	view := aWAComponent
]

{ #category : 'accessing' }
MgBreadcrumbInfo >> view [

	^ view
]
