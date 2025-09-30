Class {
	#name : 'Mg113ViewIdentificacionRepresentante',
	#superclass : 'Mg113ViewIdentificacion',
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
Mg113ViewIdentificacionRepresentante class >> canBeRoot [ 
	
	^ true
]

{ #category : 'class initialization' }
Mg113ViewIdentificacionRepresentante class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: '/milligram/representante'
]

{ #category : 'initialization' }
Mg113ViewIdentificacionRepresentante >> initialize [

	super initialize.
	model := Mg113ModelRepresentante new
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderContentOn: html [

	html form: [
			html div
				class: 'container';
				with: [
						html heading level4 with: 'Representante del contribuyente'.
						model errores ifNotEmpty: [ self renderErroresOn: html ].
						self renderIdentificacionContribuyenteOn: html.
						self renderDomicilioEnTerritorioEspañolOn: html ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderDomicilioEnPaisResidenciaOn: html [

	html fieldSet: [
			html heading level5 with: 'Domicilio'.
			self renderFieldsDomicilioFila1On: html.
			self renderFieldsDomicilioFila2On: html.
			self renderFieldsDomicilioFila3On: html.
			self renderFieldsDomicilioFila4On: html.
			self renderFieldsDomicilioFila5On: html ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderDomicilioEnTerritorioEspañolOn: html [

	html fieldSet: [
			html heading level5 with: 'Domicilio'.
			self renderFieldsDomicilioFila1On: html.
			self renderFieldsDomicilioFila2On: html.
			self renderFieldsDomicilioFila3On: html.
			self renderFieldsDomicilioFila4On: html.
			self renderFieldsDomicilioFila5On: html ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldBloqueOn: html [

	html label for: 'bloque'; with: 'Bloque'.
	html textInput id: #bloque; on: #bloque of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldCalificadorNumeroOn: html [

	html label
		for: #calificadoNumero;
		with: 'Calificador Núm.'.
	html textInput
		id: #calificadorNumero;
		on: #calificadorNumero of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldComplementoOn: html [

	html label for: #complemento; with: 'Datos complemento del domicilio'.
	html textInput id: #complemento; on: #complemento of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldEscaleraOn: html [

	html label for: #escalera; with: 'Escalera'.
	html textInput id: #escalera; on: #escalera of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldNombreViaOn: html [

	html label
		for: #nombreVia;
		with: 'Nombre de la vía pública'.
	html textInput
		id: #nombreVia;
		on: #nombreVia of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldNumeroOn: html [

	html label
		for: #numero;
		with: 'Número'.
	html textInput
		id: #numero;
		on: #numero of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldPlantaOn: html [

	html label
		for: #planta;
		with: 'Planta'.
	html textInput
		id: #planta;
		on: #planta of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldPoblacionOn: html [

	html label
		for: #poblacion;
		with: [
				html text: 'Localidad/Poblacion'.
				html small: '(si es distinta del municipio)' ].
	html textInput
		id: #poblacion;
		on: #poblacion of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldPortalOn: html [

	html label for: #portal; with: 'Portal'.
	html textInput id: #portal; on: #portal of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldTipoNumeracionOn: html [

	html label
		for: #tipoNumeracion;
		with: 'Tipo Núm.'.
	html select
		id: #tipoNumeracion;
		beOptional;
		optionalLabel: '-- --';
		onChange: self toggleNumeracionJs;
		list: MgConstantes listaTiposNumeracion;
		on: #tipoNumeracion of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldTipoViaOn: html [

	html label
		for: #tipoVia;
		with: 'Tipo de via'.
	html select
		list: MgConstantes listaTiposVias;
		beOptional;
		optionalLabel: '-- --';
		labels: [ :item | item last ];
		on: #tipoVia of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldsDomicilioFila1On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column column-20';
					with: [ self renderFieldTipoViaOn: html ].
				html div
					class: 'column';
					with: [ self renderFieldNombreViaOn: html ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldsDomicilioFila2On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column column-10';
					with: [ self renderFieldTipoNumeracionOn: html ].
				html div
					class: 'column column-10';
					with: [ self renderFieldNumeroOn: html ].
				html div
					class: 'column';
					with: [ self renderFieldCalificadorNumeroOn: html ].
				html div
					class: 'column column-10';
					with: [ self renderFieldBloqueOn: html ].
				html div
					class: 'column column-10';
					with: [ self renderFieldPortalOn: html ].
				html div
					class: 'column column-10';
					with: [ self renderFieldEscaleraOn: html ].
				html div
					class: 'column column-10';
					with: [ self renderFieldPlantaOn: html ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldsDomicilioFila3On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column column-60';
					with: [ self renderFieldComplementoOn: html ].
				html div
					class: 'column';
					with: [ self renderFieldPoblacionOn: html ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldsDomicilioFila4On: html [

	
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldsDomicilioFila5On: html [

	
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionRepresentante >> toggleNumeracionJs [

	^ JSStream on: '$(''#tipoNumeracion'').val() == ''3''?$(''#numero, #calificadorNumero'').each(function(){$(this).prop(''disabled'',true)}): $(''#numero, #calificadorNumero'').each(function(){$(this).prop(''disabled'',false)})'
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionRepresentante >> toggleNumeracionSt [

	^ ((JSStream on: '$') apply: #( '#tipoNumeracion' ))
		  call: 'val';
		  equal: '3';
		  then:
			  (((JSStream on: '$') apply: #( '#numero, #calificadorNumero' ))
				   call: 'each'
				   with: (JSFunction new
						    add: ((JSStream on: '$')
								     apply: { JSStream this };
								     call: 'prop' withArguments: #( 'disabled' true ));
						    yourself))
		  else:
			  (((JSStream on: '$') apply: #('#numero, #calificadorNumero' ))
				   call: 'each'
				   with: (JSFunction new
						    add: ((JSStream on: '$')
								     apply: { JSStream this };
								     call: 'prop' withArguments: #( 'disabled' false ));
						    yourself))
]
