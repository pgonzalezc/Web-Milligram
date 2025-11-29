Class {
	#name : 'MgSession',
	#superclass : 'WASession',
	#instVars : [
		'authenUser',
		'contribuyente'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
MgSession >> authenticatedUser [

	^ authenUser 
]

{ #category : 'as yet unclassified' }
MgSession >> authenticatedUser: aSSLCertInfo [

	authenUser := aSSLCertInfo
]

{ #category : 'accessing' }
MgSession >> contribuyente [

	^ contribuyente
]

{ #category : 'accessing' }
MgSession >> contribuyente: anIdentification [

	contribuyente := anIdentification
]
