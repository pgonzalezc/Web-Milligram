Class {
	#name : 'Mg113ViewIdentificacion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'initialization' }
Mg113ViewIdentificacion >> initialize [

	super initialize.
	
]

{ #category : 'rendering' }
Mg113ViewIdentificacion >> renderFieldApellidosOn: html [

	html div
		class: 'column column-40';
		with: [
				html label
					for: 'apellidos';
					with: [ self renderWithMandatoryMark: 'Apellidos' on: html ].
				html textInput
					id: 'apellidos';
					on: #apellidos of: model ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacion >> renderFieldNifOn: html [

	html div
		class: 'column column-20';
		with: [
				html label
					for: 'nif';
					with: [ self renderWithMandatoryMark: 'N.I.F.' on: html ].
				html textInput
					id: 'nif';
					maxLength: 9;
					on: #nif of: model ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacion >> renderFieldNombreOn: html [

	html div
		class: 'column column-40';
		with: [
				html label
					for: 'nombre';
					with: [ html span style: 'color: red'; with: ' * '. html text: 'Nombre' ].
				html textInput
					id: 'nombre';
					on: #nombre of: model ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacion >> renderIdentificacionContribuyenteOn: html [

	html fieldSet: [
			html div
				class: 'row';
				with: [
					self renderFieldNifOn: html.
					self renderFieldApellidosOn: html.
					self renderFieldNombreOn: html
						] ]
]
