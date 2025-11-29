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
								with: 'Confirmación presentación del modelo ' , modelo.
							 ].
				html paragraph: 'Para finalizar el proceso marque "conforme" y pulse en "Firmar y enviar"'.
				html div
					class: 'banner';
					with: [ html text: 'Not Implemented yet.....' ].
				html div: [ 
					html text: self session authenticatedUser subject commonName . 
					html strong: ' en nombre de '.
					html text: self session contribuyente apellidos, ', ', self session contribuyente nombre.
					].
				html div
					class: 'disclaimer';
					with: [
						html strong: 'Información sobre el tratamiento de datos personales'.
						html paragraph: 'De acuerdo con el Art. 13 del Reglamento (UE) 2016/679 del Parlamento Europeo y del Consejo de 27 de abril de 2016 y el artículo 11 de la Ley Orgánica 3/2018 de 5 de diciembre, de protección de datos personales que va a facilitar serán tratados por a Agencia Estatal de Administración Tributaria con la finalidad efectiva del sistema tributario estatal y aduanero. Podrá encontrar más información sobre los posibles tratamientos, cesiones y el procedimiento para ejercer los derechos establecidos en los artículos 15 a 22 del citado Reglamento en el siguiente enlace' 
						 ] ]
]
