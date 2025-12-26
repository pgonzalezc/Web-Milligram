Class {
	#name : 'MgBreadcrumbInfo',
	#superclass : 'Object',
	#instVars : [
		'id',
		'label',
		'view'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
MgBreadcrumbInfo class >> withId: aSymbolOrString label: aString view: aWAComponent [

	^ self basicNew
		setId: aSymbolOrString ;
		setLabel: aString ;
		setView: aWAComponent
]

{ #category : 'accessing' }
MgBreadcrumbInfo >> id [

	^ id
]

{ #category : 'accessing' }
MgBreadcrumbInfo >> label [

	^ label
]

{ #category : 'private' }
MgBreadcrumbInfo >> setId: aSymbolOrString [

	id := aSymbolOrString 
]

{ #category : 'initialization' }
MgBreadcrumbInfo >> setLabel: aString [

	label := aString
]

{ #category : 'private' }
MgBreadcrumbInfo >> setView: aWAComponent [

	view := aWAComponent
]

{ #category : 'accessing' }
MgBreadcrumbInfo >> view [

	^ view
]
