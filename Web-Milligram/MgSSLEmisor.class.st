Class {
	#name : 'MgSSLEmisor',
	#superclass : 'Object',
	#instVars : [
		'commonName',
		'organizationUnit',
		'organization',
		'country'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
MgSSLEmisor >> commonName [

	^ commonName
]

{ #category : 'accessing' }
MgSSLEmisor >> commonName: anObject [

	commonName := anObject
]

{ #category : 'accessing' }
MgSSLEmisor >> country [

	^ country
]

{ #category : 'accessing' }
MgSSLEmisor >> country: anObject [

	country := anObject
]

{ #category : 'accessing' }
MgSSLEmisor >> organization [

	^ organization
]

{ #category : 'accessing' }
MgSSLEmisor >> organization: anObject [

	organization := anObject
]

{ #category : 'accessing' }
MgSSLEmisor >> organizationUnit [

	^ organizationUnit
]

{ #category : 'accessing' }
MgSSLEmisor >> organizationUnit: anObject [

	organizationUnit := anObject
]

{ #category : 'printing' }
MgSSLEmisor >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	aStream
		print: commonName.
	aStream
		nextPutAll: ' - ';
		print: organizationUnit.
	aStream
		nextPutAll: ' - ';
		print: organization.
	aStream
		nextPutAll: ' - ';
		print: country
]
