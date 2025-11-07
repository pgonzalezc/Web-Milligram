Class {
	#name : 'MgSession',
	#superclass : 'WASession',
	#instVars : [
		'authenUser'
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
