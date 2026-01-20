Class {
	#name : 'MgViewComplementaria',
	#superclass : 'MgViewBase',
	#instVars : [
		'model',
		'mostrarOpcionSustitutiva'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
MgViewComplementaria >> conOpcionSustitutiva [

	mostrarOpcionSustitutiva := true
]

{ #category : 'initialization' }
MgViewComplementaria >> initialize [

	super initialize.
	model := MgModelComplementaria new.
	mostrarOpcionSustitutiva := false "Por defecto, la vista sólo muestra el checkbox de complementaria"
]

{ #category : 'accessing' }
MgViewComplementaria >> model [

	^ model
]

{ #category : 'rendering' }
MgViewComplementaria >> renderCheckBoxSustitutivaOn: html [

	html checkbox
		id: #sustitutiva;
		onChange: (html jQuery ajax
				 callback: [ :value | model toggleSustitutiva ]
				 value: (html jQuery this propertyAt: 'checked' );
				 script: [ :s |
						 s << (html jQuery id: #'group-checkboxes') replaceWith: [ :r |
								 self renderCheckboxesOn: r ].
						 s << (html jQuery id: #nroJustificanteAnteriorField)
							 replaceWith: [ :r |
								 self renderFieldNroJustificanteAnterior: r ].
						 model hayMarcas ifTrue: [
								 s << (html jQuery id: #nroJustificanteAnterior) triggerFocus ] ]);
		on: #sustitutiva of: model.
	html label
		class: 'label-inline';
		for: #sustitutiva;
		with: 'Autoliquidación sustitutiva'
]

{ #category : 'rendering' }
MgViewComplementaria >> renderCheckboxComplementariaOn: html [

	html checkbox
		id: 'complementaria';
		onChange: (html jQuery ajax
				 callback: [ :value | model toggleComplementaria ]
				 value: (html jQuery this propertyAt: 'checked');
				 script: [ :s |
						 s << (html jQuery id: #'group-checkboxes') replaceWith: [ :r |
								 self renderCheckboxesOn: r ].
						 s << (html jQuery id: #nroJustificanteAnteriorField)
							 replaceWith: [ :r |
								 self renderFieldNroJustificanteAnterior: r ].
						 model hayMarcas ifTrue: [
								 s << (html jQuery id: #nroJustificanteAnterior) triggerFocus ] ]);
		on: #complementaria of: model.
	html label
		class: 'label-inline';
		for: 'complementaria';
		with: 'Autoliquidación complementaria'
]

{ #category : 'rendering' }
MgViewComplementaria >> renderCheckboxesOn: html [

	html div
		id: #'group-checkboxes';
		with: [
				self renderCheckboxComplementariaOn: html.
				mostrarOpcionSustitutiva ifTrue: [
							html break.
							self renderCheckBoxSustitutivaOn: html ] ]
]

{ #category : 'rendering' }
MgViewComplementaria >> renderContentOn: html [

	| radioBtnGroup |
	radioBtnGroup := html radioGroup.
	html fieldSet: [
			html paragraph: (mostrarOpcionSustitutiva ifFalse: [ self texto1 ] ifTrue: [ self texto3 ]).
			self renderCheckboxesOn: html.
			html paragraph: self texto2.
			self renderFieldNroJustificanteAnterior: html
			 ]
]

{ #category : 'rendering' }
MgViewComplementaria >> renderFieldNroJustificanteAnterior: html [

	html div
		id: #nroJustificanteAnteriorField;
		with: [
				html label
					for: #nroJustificanteAnterior;
					with: 'Número justificante anterior'.
				html textInput
					style: 'width: 25%';
					maxLength: 13;
					disabled: model hayMarcas not;
					onChange: (html jQuery ajax callback: [ :value | model nroJustificanteAnterior: value ] value: (html jQuery this value) );
					id: #nroJustificanteAnterior;
					on: #nroJustificanteAnterior of: model ]
]

{ #category : 'as yet unclassified' }
MgViewComplementaria >> texto1 [

	^ 'Si esta autoliquidación es complementaria de otra autoliquidación anterior correspondiente al mismo concepto, ejercicio y periodo, indíquelo marcando el siguiente checkbox'
]

{ #category : 'as yet unclassified' }
MgViewComplementaria >> texto2 [

	^ 'En este caso, consigne a continuación el número de justificante identificativo de la autoliquidación anterior'
]

{ #category : 'as yet unclassified' }
MgViewComplementaria >> texto3 [

	"incluir el texto para cuando el modelo admita declaraciones sustitutivas"
	^ '--- (texto3) Texto para las autoliquidaciones de los modelos que admiten sustitutivas. Modificar cuando se conozca ---'
]
