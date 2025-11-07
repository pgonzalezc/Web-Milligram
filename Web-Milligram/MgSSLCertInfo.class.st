Class {
	#name : 'MgSSLCertInfo',
	#superclass : 'Object',
	#instVars : [
		'sslData',
		'emissor',
		'subject'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
MgSSLCertInfo class >> from: aRequest [

	^ self basicNew setSSLData:
		  (aRequest headers associationsSelect: [ :assoc |
			   assoc key beginsWith: 'ssl_' ])
]

{ #category : 'instance creation' }
MgSSLCertInfo class >> fromHeaders: aDictionary [

	^ self basicNew
		setSSLData: aDictionary
]

{ #category : 'as yet unclassified' }
MgSSLCertInfo >> emissor [

	emissor ifNil: [
			| dnStr |
			dnStr := sslData at: 'ssl_client_i_dn' ifAbsent: [ '' ].
			emissor := MgSSLEmisor new
				           commonName: (self fieldNamed: 'CN' from: dnStr);
				           organizationUnit: (self fieldNamed: 'OU' from: dnStr);
				           organization: (self fieldNamed: 'O' from: dnStr);
				           country: (self fieldNamed: 'C' from: dnStr) ].
	^ emissor
]

{ #category : 'private' }
MgSSLCertInfo >> fieldNamed: aString from: anotherString [

	| re |
	re := ('.*{1}=([A-Za-z0-9 \-]+),?.*' format: {  aString }) asRegex.
	^ (re matches: anotherString) ifTrue: [ re subexpression: 2 ] ifFalse: [ '' ]
]

{ #category : 'testing' }
MgSSLCertInfo >> isSuccess [

	^ sslData isNotEmpty and: [ (sslData at: 'ssl_client_verify' ifAbsent: ['']) = 'SUCCESS' ]
]

{ #category : 'private' }
MgSSLCertInfo >> setSSLData: aDictionary [

	sslData := aDictionary
]

{ #category : 'accessing' }
MgSSLCertInfo >> subject [

	self halt.
	subject ifNil: [
			| dnStr |
			dnStr := sslData at: 'ssl_client_s_dn' ifAbsent: [ '' ].
			subject := MgSSLSubject new
				           commonName: (self fieldNamed: 'CN' from: dnStr);
				           surname: (self fieldNamed: 'SN' from: dnStr);
				           givenName: (self fieldNamed: 'GN' from: dnStr);
				           serialNumber:
					           (self fieldNamed: 'serialNumber' from: dnStr);
				           country: (self fieldNamed: 'C' from: dnStr) ].
	^ subject
]

{ #category : 'as yet unclassified' }
MgSSLCertInfo >> validFrom [

	^ sslData at: 'ssl_client_v_start' ifAbsent: [ '' ].
]

{ #category : 'as yet unclassified' }
MgSSLCertInfo >> validUntil [

	^ sslData at: 'ssl_client_v_end' ifAbsent: [ '' ]
]
