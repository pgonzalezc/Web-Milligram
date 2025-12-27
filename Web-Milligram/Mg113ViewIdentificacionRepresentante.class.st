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

{ #category : 'accessing' }
Mg113ViewIdentificacionRepresentante >> errors [

	| errors |
	
	errors := model errores.
	model errores removeAll.
	^ errors
]

{ #category : 'initialization' }
Mg113ViewIdentificacionRepresentante >> initialize [

	| provincia municipio poblacion |
	super initialize.
	model := Mg113ModelRepresentante new.
	"Inicializaciones del modelo"
	provincia := MgConstantes listaProvincias at: 28.
	municipio := (MgConstantes listaMunicipiosProvincia:
		              provincia codigoProvincia) first.
	poblacion := (MgConstantes listaPoblacionesMunicipio:
		              municipio codigoIneMunicipio) first.
	model domicilio provincia: provincia.
	model domicilio municipio: municipio.
	model domicilio poblacion: poblacion.
	model domicilio tipoVia: MgConstantes tipoViaCalle
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderContentOn: html [

	self renderIdentificacionContribuyenteOn: html.
	self renderDomicilioEnTerritorioEspañolOn: html
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
Mg113ViewIdentificacionRepresentante >> renderFieldCodigoPostalOn: html [

	html label
		for: 'codigo-postal';
		with: [ self renderWithMandatoryMark: 'Código postal' on: html ].
	html textInput
		id: 'codigo-postal';
		maxLength: 5;
		value: model domicilio codigoPostal;
		callback: [ :value | model domicilio codigoPostal: value ]
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
Mg113ViewIdentificacionRepresentante >> renderFieldMunicipioOn: html [

	| provincia municipios |
	provincia := model domicilio provincia.
	municipios := MgConstantes listaMunicipiosProvincia:
		              provincia codigoProvincia.
	html label
		for: 'municipio';
		with: [ self renderWithMandatoryMark: 'Municipio'  on: html].
	html select
		id: 'municipio';
		list: municipios;
		labels: [ :municipio | municipio nombreMunicipio ];
		onChange: (html jQuery ajax
				 callback: [ :value | self trataNuevoMunicipio: (municipios at: value asInteger) ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'domicilio-fila-4') load html: [ :r |
								 self renderFieldsDomicilioFila4On: r ] ]);
		on: #municipio of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldNombreViaOn: html [

	html label
		for: #nombreVia;
		with: [ self renderWithMandatoryMark: 'Nombre de la vía pública' on: html ].
	html textInput
		id: #nombreVia;
		on: #nombreVia of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldNumeroOn: html [

	html label
		for: #numero;
		with: [ self renderWithMandatoryMark: 'Número' on: html ].
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

	| poblaciones municipio |
	municipio := model domicilio municipio.
	poblaciones := MgConstantes listaPoblacionesMunicipio:
		               municipio codigoIneMunicipio.
	html label
		for: #poblacion;
		with: [
				html text: 'Localidad/Poblacion'.
				html small: '(si es distinta del municipio)' ].
	html select
		id: #poblacion;
		list: poblaciones;
		labels: [ :poblacion | poblacion nombrePoblacion ];
		onChange: (html jQuery ajax
				 callback: [ :value |
					 model domicilio poblacion: (poblaciones at: value asInteger) ]
				 value: html jQuery this value);
		on: #poblacion of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldPortalOn: html [

	html label for: #portal; with: 'Portal'.
	html textInput id: #portal; on: #portal of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldProvinciaOn: html [

	html label
		for: 'provincia';
		with: [ self renderWithMandatoryMark: 'Provincia'  on: html ].
	html select
		id: 'provincia';
		list: MgConstantes listaProvincias;
		labels: [ :provincia | provincia nombreProvincia ];
		onChange: (html jQuery ajax
				 callback: [ :value |
						 | provincia municipio poblacion |
						 provincia := MgConstantes listaProvincias at: value asInteger.
						 municipio := (MgConstantes listaMunicipiosProvincia:
								               provincia codigoProvincia) first.
						 poblacion := (MgConstantes listaPoblacionesMunicipio:
								               municipio codigoIneMunicipio) first.
						 model domicilio provincia: provincia.
						 model domicilio municipio: municipio.
						 model domicilio poblacion: poblacion ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (s jQuery id: 'domicilio-fila-4') load html: [ :r |
								 self renderFieldsDomicilioFila4On: r ] ]);
		on: #provincia of: model domicilio
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldTelefonoOn: html [

	html label for: 'telefono'; with: 'Teléfono'.
	html textInput id: 'telefono'; maxLength: 9; on: #telefono of: model domicilio.
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldTipoNumeracionOn: html [

	html label
		for: #tipoNumeracion;
		with: [ self renderWithMandatoryMark: 'Tipo Núm.' on: html ].
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

	| tiposVias |
	tiposVias := MgConstantes listaTiposVias.
	html label
		for: #tipoVia;
		with: [ self renderWithMandatoryMark: 'Tipo de vía' on: html ].
	html select
		list: tiposVias;
		selected: model domicilio tipoVia;
		labels: [ :item | item nombre ];
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
					class: 'column';
					with: [ self renderFieldComplementoOn: html ].
				html div
					class: 'column column-20';
					with: [ self renderFieldCodigoPostalOn: html ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldsDomicilioFila4On: html [

	html div
		id: 'domicilio-fila-4';
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ self renderFieldProvinciaOn: html ].
				html div
					class: 'column';
					with: [ self renderFieldMunicipioOn: html ].
				html div class: 'column'; with: [ self renderFieldPoblacionOn: html ]]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionRepresentante >> renderFieldsDomicilioFila5On: html [

	html div
		id: 'domicilio-fila-4';
		class: 'row';
		with: [
				html div
					class: 'column column-20';
					with: [ self renderFieldTelefonoOn: html ] ]
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionRepresentante >> toggleNumeracionJs [

	^ JSStream on: '$(''#tipoNumeracion'').val() == ''3''?$(''#numero, #calificadorNumero'').each(function(){$(this).prop(''disabled'',true)}): $(''#numero, #calificadorNumero'').each(function(){$(this).prop(''disabled'',false)})'
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionRepresentante >> trataNuevoMunicipio: unMunicipio [

	| poblacion |
	poblacion := (MgConstantes listaPoblacionesMunicipio:
		              unMunicipio codigoIneMunicipio) first.
	model domicilio municipio: unMunicipio.
	model domicilio poblacion: poblacion
]
