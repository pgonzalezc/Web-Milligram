Class {
	#name : 'Mg113ViewFirmaYEnvio',
	#superclass : 'MgViewBase',
	#instVars : [
		'modelo'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113ViewFirmaYEnvio >> modelo [

	^ modelo
]

{ #category : 'accessing' }
Mg113ViewFirmaYEnvio >> modelo: aString [

	modelo := aString
]

{ #category : 'rendering' }
Mg113ViewFirmaYEnvio >> renderContentOn: html [

	html div
		class: 'container';
		with: [
				html heading
					level: 3;
					with: [
							html span: 'Firmar y enviar. '.
							html span
								style: 'font-size: smaller';
								with: 'Confirmación presentación del modelo ' , modelo ].
				html div
					class: 'banner';
					with: [ html text: 'Not Implemented yet.....' ] ]
]
