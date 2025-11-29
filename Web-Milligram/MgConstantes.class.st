Class {
	#name : 'MgConstantes',
	#superclass : 'Object',
	#classVars : [
		'Comunidades',
		'Municipios',
		'Poblaciones'
	],
	#category : 'Web-Milligram-Utils',
	#package : 'Web-Milligram',
	#tag : 'Utils'
}

{ #category : 'private - building' }
MgConstantes class >> cargaMunicipiosFrom: aFileName [

	| municipios |
	municipios := Dictionary new: 52.
	FileLocator home / aFileName readStreamDo: [ :stream |
			[ stream atEnd ] whileFalse: [
					| line parts codProvincia codIne codAeat nombre |
					line := stream nextLine.
					parts := Character space split: line trim.
					codProvincia := parts removeFirst.
					codIne := parts removeFirst.
					codAeat := parts removeFirst.
					nombre := Character space join: parts.
					municipios
						at: codProvincia
						ifPresent: [ :ary |
								ary add: (MgMunicipio from: {
										codProvincia.
										codIne.
										codAeat.
										nombre }) ]
						ifAbsentPut: [
								OrderedCollection with: (MgMunicipio from: {
										codProvincia.
										codIne.
										codAeat.
										nombre }) ] ] ].
	^ municipios
]

{ #category : 'private - building' }
MgConstantes class >> cargaPoblacionesFrom: aFileName [

	| poblaciones |
	poblaciones := Dictionary new: 8132.
	FileLocator home / aFileName readStreamDo: [ :stream |
			[ stream atEnd ] whileFalse: [
					| line codigoProvincia codMunIne codMunAeat poblacion municipio |
					line := stream nextLine.
					codigoProvincia := line copyFrom: 1 to: 2.
					codMunIne := line copyFrom: 4 to: 8.
					codMunAeat := line copyFrom: 10 to: 14.
					poblacion := (line copyFrom: 16 to: 66) trim.
					municipio := (line copyFrom: 67 to: 160) trim.
					poblaciones
						at: codMunIne
						ifPresent: [ :ary |
								ary add: (MgPoblacion from: {
										codigoProvincia.
										codMunIne.
										codMunAeat.
										poblacion.
										municipio }) ]
						ifAbsentPut: [
								OrderedCollection with: (MgPoblacion from: {
										codigoProvincia.
										codMunIne.
										codMunAeat.
										poblacion.
										municipio }) ] ] ].
	^ poblaciones
]

{ #category : 'class initialization' }
MgConstantes class >> initialize [

	Municipios := nil.
	Comunidades := nil.
	Poblaciones := nil.
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaComunidadesAutonomas [

	^ Comunidades ifNil: [
			  Comunidades := (self listaProvincias collect: [ :provincia |
					                  {
						                  provincia codigoComunidadAutonoma  .          provincia nombreComunidadAutonoma } ]) asSet
				                 asOrderedCollection sort: [ :a :b |
				                 a first asInteger < b first asInteger ] ]
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaMunicipiosProvincia: unCodigoProvincia [

	Municipios ifNil: [ Municipios := self cargaMunicipiosFrom: 'Descargas/TablaMunicipios.txt' ].
	^ Municipios at: unCodigoProvincia 
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaNombreProvincias [

	^ self listaProvincias collect: [ :provincia |
		  provincia nombreProvincia asSymbol ]
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaPoblacionesMunicipio: unCodigoMunicipio [

	Poblaciones ifNil: [
			Poblaciones := self cargaPoblacionesFrom:
				               'Descargas/Tabla_poblaciones.rb' ].
	^ Poblaciones at: unCodigoMunicipio ifAbsent: #()
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaProvincias [

	^ {
		  (MgProvincia from: #( '01' 'ARABA/ALAVA' '15' 'PAIS VASCO' )).
		  (MgProvincia from: #( '02' 'ALBACETE' '07' 'CASTILLA-LA M.' )).
		  (MgProvincia from: #( '03' 'ALICANTE' '17' 'VALENCIA' )).
		  (MgProvincia from: #( '04' 'ALMERIA' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '05' 'AVILA' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '06' 'BADAJOZ' '10' 'EXTREMADURA' )).
		  (MgProvincia from: #( '07' 'I. BALEARS' '04' 'ILLES BALEARS' )).
		  (MgProvincia from: #( '08' 'BARCELONA' '09' 'CATALUÑA' )).
		  (MgProvincia from: #( '09' 'BURGOS' '08' 'CASTILLA Y LEON' )). 
		  (MgProvincia from: #( '10' 'CACERES' '10' 'EXTREMADURA' )).
		  (MgProvincia from: #( '11' 'CADIZ' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '12' 'CASTELLON' '17' 'VALENCIA' )).
		  (MgProvincia from: #( '13' 'CIUDAD REAL' '07' 'CASTILLA-LA M.' )).
		  (MgProvincia from: #( '14' 'CORDOBA' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '15' 'A CORUÑA' '11' 'GALICIA' )).
		  (MgProvincia from: #( '16' 'CUENCA' '07' 'CASTILLA-LA M.' )).
		  (MgProvincia from: #( '17' 'GIRONA' '09' 'CATALUÑA' )).
		  (MgProvincia from: #( '18' 'GRANADA' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '19' 'GUADALAJARA' '07' 'CASTILLA-LA M.' )).
		  (MgProvincia from: #( '20' 'GIPUZKOA' '15' 'PAIS VASCO' )).
		  (MgProvincia from: #( '21' 'HUELVA' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '22' 'HUESCA' '02' 'ARAGON' )).
		  (MgProvincia from: #( '23' 'JAEN' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '24' 'LEON' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '25' 'LLEIDA' '09' 'CATALUÑA' )).
		  (MgProvincia from: #( '26' 'LA RIOJA' '16' 'LA RIOJA' )).
		  (MgProvincia from: #( '27' 'LUGO' '11' 'GALICIA' )).
		  (MgProvincia from: #( '28' 'MADRID' '12' 'MADRID' )).
		  (MgProvincia from: #( '29' 'MALAGA' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '30' 'MURCIA' '13' 'MURCIA' )).
		  (MgProvincia from: #( '31' 'NAVARRA' '14' 'NAVARRA' )).
		  (MgProvincia from: #( '32' 'OURENSE' '11' 'GALICIA' )).
		  (MgProvincia from: #( '33' 'ASTURIAS' '03' 'PDO. ASTURIAS' )).
		  (MgProvincia from: #( '34' 'PALENCIA' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '35' 'LAS PALMAS' '05' 'CANARIAS' )).
		  (MgProvincia from: #( '36' 'PONTEVEDRA' '11' 'GALICIA' )).
		  (MgProvincia from: #( '37' 'SALAMANCA' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '38' 'S.C.TENERIFE' '05' 'CANARIAS' )).
		  (MgProvincia from: #( '39' 'CANTABRIA' '06' 'CANTABRIA' )).
		  (MgProvincia from: #( '40' 'SEGOVIA' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '41' 'SEVILLA' '01' 'ANDALUCIA' )).
		  (MgProvincia from: #( '42' 'SORIA' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '43' 'TARRAGONA' '09' 'CATALUÑA' )).
		  (MgProvincia from: #( '44' 'TERUEL' '02' 'ARAGON' )).
		  (MgProvincia from: #( '45' 'TOLEDO' '07' 'CASTILLA-LA M.' )).
		  (MgProvincia from: #( '46' 'VALENCIA' '17' 'VALENCIA' )).
		  (MgProvincia from: #( '47' 'VALLADOLID' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '48' 'BIZKAIA' '15' 'PAIS VASCO' )).
		  (MgProvincia from: #( '49' 'ZAMORA' '08' 'CASTILLA Y LEON' )).
		  (MgProvincia from: #( '50' 'ZARAGOZA' '02' 'ARAGON' )).
		  (MgProvincia from: #( '51' 'CEUTA' '18' 'CEUTA' )).
		  (MgProvincia from: #( '52' 'MELILLA' '19' 'MELILLA' )) }
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaProvinciasComunidad: unCodigoComunidad [

	^ self listaProvincias select: [ :provincia |
		  provincia codigoComunidadAutonoma asInteger = unCodigoComunidad asInteger ]
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaTiposNumeracion [

	^ #(
		'NUM' 
		'S/N' 
		'OTR' 
		'KM'
	)
]

{ #category : 'as yet unclassified' }
MgConstantes class >> listaTiposVias [

^ { 
MgTipoVia from: #('ACCE' 'AC' 'ACCES').
MgTipoVia from: #('ACCES' 'AC' 'ACCESO').
MgTipoVia from: #('ACEQ' 'AE' 'ACEQUIA').
MgTipoVia from: #('ACERA' 'AA' 'ACERA').
MgTipoVia from: #('ALAM' 'AL' 'ALAMEDA').
MgTipoVia from: #('ALDAP' 'CT' 'ALDAPA').
MgTipoVia from: #('ALDEA' 'AD' 'ALDEA').
MgTipoVia from: #('ALQUE' 'AQ' 'ALQUERIA').
MgTipoVia from: #('ALTO' 'AT' 'ALTO').
MgTipoVia from: #('ANDAD' 'AN' 'ANDADOR').
MgTipoVia from: #('ANGTA' 'AG' 'ANGOSTA').
MgTipoVia from: #('APDRO' 'AO' 'APEADEIRO').
MgTipoVia from: #('APDRO' 'AO' 'APEADERO').
MgTipoVia from: #('APTES' 'AP' 'APARTAMENTS').
MgTipoVia from: #('APTOS' 'AP' 'APARTAMENTOS').
MgTipoVia from: #('ARB' 'AB' 'ARBOLEDA').
MgTipoVia from: #('ARRAL' 'AR' 'ARRABAL').
MgTipoVia from: #('ARREK' 'AY' 'ERREKA').
MgTipoVia from: #('ARRY' 'AY' 'ARROYO').
MgTipoVia from: #('ASSEG' 'AS' 'ASSEGADOR').
MgTipoVia from: #('ATAJO' 'AJ' 'ATAJO').
MgTipoVia from: #('ATAL' 'AJ' 'ATALL').
MgTipoVia from: #('ATALL' 'AJ' 'ATALLO').
MgTipoVia from: #('ATZUC' 'AZ' 'ATZUCAT').
MgTipoVia from: #('AUTO' 'AU' 'AUTOPISTA').
MgTipoVia from: #('AUTOV' 'AI' 'AUTOVIA').
MgTipoVia from: #('AUZO' 'BO' 'AUZO').
MgTipoVia from: #('AUZOT' 'BA' 'AUZOTEGI').
MgTipoVia from: #('AUZUN' 'BO' 'AUZUNEA').
MgTipoVia from: #('AV' 'AV' 'AV').
MgTipoVia from: #('AVDA' 'AV' 'AVENIDA').
MgTipoVia from: #('AVGDA' 'AV' 'AVINGUDA').
MgTipoVia from: #('AVIA' 'AI' 'AUTOVIA').
MgTipoVia from: #('BALNR' 'BN' 'BALNEARIO').
MgTipoVia from: #('BARDA' 'BA' 'BARRIADA').
MgTipoVia from: #('BARRI' 'BO' 'BARRI').
MgTipoVia from: #('BARRO' 'BO' 'BARRIO').
MgTipoVia from: #('BDA' 'BJ' 'BAIXADA').
MgTipoVia from: #('BELNA' 'BE' 'BELENA').
MgTipoVia from: #('BIDE' 'VI' 'BIDE').
MgTipoVia from: #('BIDEB' 'GL' 'BIDEBIETA').
MgTipoVia from: #('BJADA' 'BJ' 'BAJADA').
MgTipoVia from: #('BLOC' 'BL' 'BLOC').
MgTipoVia from: #('BLQUE' 'BL' 'BLOQUE').
MgTipoVia from: #('BQLLO' 'BQ' 'BARRANQUIL').
MgTipoVia from: #('BRANC' 'BR' 'BARRANCO').
MgTipoVia from: #('BRDLA' 'BD' 'BARREDUELA').
MgTipoVia from: #('BRZAL' 'BZ' 'BRAZAL').
MgTipoVia from: #('BSRIA' 'BS' 'BASERRIA').
MgTipoVia from: #('BULEV' 'BV' 'BULEVAR').
MgTipoVia from: #('BV' 'BV' 'BULEVAR').
MgTipoVia from: #('C' 'C' 'C').
MgTipoVia from: #('C.H.' 'KH' 'CMNO').
MgTipoVia from: #('C.N.' 'KN' 'CMNO').
MgTipoVia from: #('C.V.' 'KV' 'CMNO').
MgTipoVia from: #('C/' 'C/' 'C/').
MgTipoVia from: #('CALLE' 'CL' 'CALLE').
MgTipoVia from: #('CAMI' 'CM' 'CAMI').
MgTipoVia from: #('CAMIN' 'CM' 'CAMIN').
MgTipoVia from: #('CAMPA' 'CP' 'CAMPA').
MgTipoVia from: #('CAMPG' 'CG' 'CAMPING').
MgTipoVia from: #('CAMPO' 'CP' 'CAMPO').
MgTipoVia from: #('CANAL' 'CA' 'CANAL').
MgTipoVia from: #('CANT' 'CQ' 'CANTON').
MgTipoVia from: #('CANTI' 'QT' 'CANTINA').
MgTipoVia from: #('CANTO' 'CQ' 'CANTO').
MgTipoVia from: #('CANTR' 'QA' 'CANTERA').
MgTipoVia from: #('CANÑO' 'KÑ' 'CANTIÑO').
MgTipoVia from: #('CARRA' 'QD' 'CARRERADA').
MgTipoVia from: #('CARRE' 'CL' 'CARRER').
MgTipoVia from: #('CARRY' 'VR' 'CARRERANY').
MgTipoVia from: #('CASA' 'CS' 'CASA').
MgTipoVia from: #('CBTIZ' 'CB' 'COBERTIZO').
MgTipoVia from: #('CCVCN' 'CV' 'CIRCUNVALACION').
MgTipoVia from: #('CELLA' 'QN' 'CANELLA').
MgTipoVia from: #('CERRO' 'CE' 'CERRO').
MgTipoVia from: #('CHLET' 'CH' 'CHALET').
MgTipoVia from: #('CINT' 'CI' 'CINTURON').
MgTipoVia from: #('CINT' 'CI' 'CINTURO').
MgTipoVia from: #('CINY' 'CI' 'CINYELL').
MgTipoVia from: #('CIRCU' 'CV' 'CIRCUNVALACION').
MgTipoVia from: #('CJLA' 'CU' 'CALLEJUELA').
MgTipoVia from: #('CJTO' 'CN' 'CONJUNTO').
MgTipoVia from: #('CLEYA' 'CY' 'CALEYA').
MgTipoVia from: #('CLLJA' 'CJ' 'CALLEJA').
MgTipoVia from: #('CLLON' 'CK' 'CALLEJON').
MgTipoVia from: #('CLLZO' 'KZ' 'CALLIZO').
MgTipoVia from: #('CLYON' 'KY' 'CALEYON').
MgTipoVia from: #('CMNET' 'CM' 'CAMINET').
MgTipoVia from: #('CMNO' 'CM' 'CAMINO').
MgTipoVia from: #('CMÑO' 'CM' 'CAMIÑO').
MgTipoVia from: #('CNLLA' 'QN' 'CANELLA').
MgTipoVia from: #('CNVT' 'CW' 'CONVENT').
MgTipoVia from: #('CNVTO' 'CW' 'CONVENTO').
MgTipoVia from: #('COL' 'CO' 'COLONIA').
MgTipoVia from: #('COMPJ' 'QJ' 'COMPLEJO').
MgTipoVia from: #('COOP' 'KP' 'COOPERATIVA').
MgTipoVia from: #('COSTA' 'KO' 'COSTA').
MgTipoVia from: #('COSTE' 'KR' 'COSTERA').
MgTipoVia from: #('CRA' 'KA' 'CARRERA').
MgTipoVia from: #('CRCRO' 'CC' 'CRUCEIRO').
MgTipoVia from: #('CRLLO' 'RL' 'CORRILLO').
MgTipoVia from: #('CRO' 'QR' 'CARRERO').
MgTipoVia from: #('CRRAL' 'QL' 'CORRALO').
MgTipoVia from: #('CRRAL' 'QL' 'CORRAL').
MgTipoVia from: #('CRRCI' 'KD' 'CORREDORCILLO').
MgTipoVia from: #('CRRDA' 'KD' 'CORREDOIRA').
MgTipoVia from: #('CRRDE' 'KD' 'CORREDERA').
MgTipoVia from: #('CRRDO' 'KD' 'CORREDOR').
MgTipoVia from: #('CRRIL' 'KL' 'CARRIL').
MgTipoVia from: #('CRRLO' 'QO' 'CORRALILLO').
MgTipoVia from: #('CRROL' 'RR' 'CORRIOL').
MgTipoVia from: #('CRROL' 'SD' 'CORRIOL').
MgTipoVia from: #('CRTIL' 'QI' 'CARRETIL').
MgTipoVia from: #('CRTJO' 'KT' 'CORTIJO').
MgTipoVia from: #('CSRIO' 'CS' 'CASERIO').
MgTipoVia from: #('CSTAN' 'KS' 'COSTANILLA').
MgTipoVia from: #('CTRA' 'CR' 'CARRETERA').
MgTipoVia from: #('CTRIN' 'QE' 'CARRETERIN').
MgTipoVia from: #('CUADR' 'CD' 'CUADRA').
MgTipoVia from: #('CUEVA' 'QV' 'CUEVA/S').
MgTipoVia from: #('CUSTA' 'CT' 'CUESTA').
MgTipoVia from: #('CXON' 'CX' 'CALEXON').
MgTipoVia from: #('CZADA' 'CZ' 'CALZADA').
MgTipoVia from: #('CZADS' 'CÇ' 'CALZADAS').
MgTipoVia from: #('CÑADA' 'CÑ' 'CAÑADA').
MgTipoVia from: #('DEMAR' 'DM' 'DEMARCACION').
MgTipoVia from: #('DEMAR' 'DM' 'DEMARCAÇIO').
MgTipoVia from: #('DHSA' 'DH' 'DEHESA').
MgTipoVia from: #('DISEM' 'DS' 'DISEMINADO').
MgTipoVia from: #('DISSE' 'DS' 'DISSEMINAT').
MgTipoVia from: #('DRERA' 'DR' 'DREÇERA').
MgTipoVia from: #('EDIFC' 'ED' 'EDIFICIO/S').
MgTipoVia from: #('EIRAD' 'EI' 'EIRADO').
MgTipoVia from: #('EMPR' 'ER' 'EMPRESA').
MgTipoVia from: #('ENTD' 'EP' 'ENTRADA').
MgTipoVia from: #('EPTZA' 'PZ' 'ENPARANTZA').
MgTipoVia from: #('ERREB' 'AR' 'ERREBAL').
MgTipoVia from: #('ERREP' 'CR' 'ERREPIDE').
MgTipoVia from: #('ERRIB' 'VG' 'ERRIBERA').
MgTipoVia from: #('ESC' 'EC' 'ESCALA/S').
MgTipoVia from: #('ESCA' 'EC' 'ESCALERA/S').
MgTipoVia from: #('ESCAL' 'EW' 'ESCALINATA').
MgTipoVia from: #('ESLDA' 'ES' 'ESPALDA').
MgTipoVia from: #('ESPIG' 'EG' 'ESPIGO').
MgTipoVia from: #('ESTAC' 'EN' 'ESTACIO').
MgTipoVia from: #('ESTCN' 'EN' 'ESTACION').
MgTipoVia from: #('ESTDA' 'EX' 'ESTRADA').
MgTipoVia from: #('ETDEA' 'AV' 'ETORBIDEA').
MgTipoVia from: #('ETXAD' 'GR' 'ETXADI').
MgTipoVia from: #('ETXAR' 'CK' 'ETXARTE').
MgTipoVia from: #('EXPLA' 'EZ' 'EXPLANADA').
MgTipoVia from: #('EXTRM' 'EM' 'EXTRAMUROS').
MgTipoVia from: #('EXTRR' 'ET' 'EXTRARRADIO').
MgTipoVia from: #('FALDA' 'FD' 'FALDA').
MgTipoVia from: #('FBRCA' 'FC' 'FABRICA').
MgTipoVia from: #('FINCA' 'FN' 'FINCA').
MgTipoVia from: #('G.V.' 'GV' 'GRAN').
MgTipoVia from: #('GAIN' 'AT' 'GAIN').
MgTipoVia from: #('GALE' 'GA' 'GALERIA').
MgTipoVia from: #('GLLZO' 'GZ' 'GALLIZO').
MgTipoVia from: #('GORAB' 'SB' 'GORABIDE').
MgTipoVia from: #('GRANJ' 'GJ' 'GRANJA').
MgTipoVia from: #('GRUP' 'GR' 'GRUP').
MgTipoVia from: #('GRUPO' 'GR' 'GRUPO/S').
MgTipoVia from: #('GTA' 'GL' 'GLORIETA').
MgTipoVia from: #('HEGI' 'HG' 'HEGI').
MgTipoVia from: #('HIPOD' 'HP' 'HIPODROMO').
MgTipoVia from: #('HIRIB' 'AV' 'HIRIBIDEA').
MgTipoVia from: #('HONDA' 'PY' 'HONDARTZA').
MgTipoVia from: #('HOYA' 'HY' 'HOYA').
MgTipoVia from: #('ILLA' 'IL' 'ILLA').
MgTipoVia from: #('INDA' 'IN' 'INDA').
MgTipoVia from: #('JARD' 'JR' 'JARDI').
MgTipoVia from: #('JDIN' 'JR' 'JARDINS').
MgTipoVia from: #('JDIN' 'JR' 'JARDIN')..
MgTipoVia from: #('JDINS' 'JR' 'JARDINES').
MgTipoVia from: #('KAI' 'ML' 'KAI').
MgTipoVia from: #('KALE' 'CL' 'KALEA').
MgTipoVia from: #('KARIK' 'CJ' 'KARRIK').
MgTipoVia from: #('KARRE' 'KA' 'KARRERA').
MgTipoVia from: #('KARRI' 'CL' 'KARRIKA').
MgTipoVia from: #('KOSTA' 'KO' 'KOSTA').
MgTipoVia from: #('KRRIL' 'KL' 'KARRIL').
MgTipoVia from: #('LAGO' 'LA' 'LAGO').
MgTipoVia from: #('LASTE' 'AJ' 'LASTERBIDE').
MgTipoVia from: #('LDERA' 'LD' 'LADERA').
MgTipoVia from: #('LEKU' 'LG' 'LEKU').
MgTipoVia from: #('LLNRA' 'LL' 'LLANURA').
MgTipoVia from: #('LLOC' 'LG' 'LLOC').
MgTipoVia from: #('LOMA' 'LM' 'LOMA').
MgTipoVia from: #('LOMO' 'LO' 'LOMO').
MgTipoVia from: #('LORAK' 'JR' 'LORATEGIAK').
MgTipoVia from: #('LORAT' 'JR' 'LORATEGI').
MgTipoVia from: #('LUGAR' 'LG' 'LUGAR').
MgTipoVia from: #('MALEC' 'MA' 'MALECON').
MgTipoVia from: #('MASIA' 'MS' 'MASIA/S').
MgTipoVia from: #('MAZO' 'MZ' 'MAZO').
MgTipoVia from: #('MENDI' 'MT' 'MENDI').
MgTipoVia from: #('MERC' 'MC' 'MERCADO').
MgTipoVia from: #('MERCT' 'MC' 'MERCAT').
MgTipoVia from: #('MIRAD' 'MD' 'MIRADOR').
MgTipoVia from: #('MOLL' 'ML' 'MOLL').
MgTipoVia from: #('MONTE' 'MT' 'MONTE').
MgTipoVia from: #('MRDOR' 'MD' 'MIRADOR').
MgTipoVia from: #('MTRIO' 'MO' 'MONASTERIO').
MgTipoVia from: #('MUELL' 'ML' 'MUELLE').
MgTipoVia from: #('NAVE' 'NV' 'NAVE/S').
MgTipoVia from: #('NCLEO' 'UN' 'NUCLEO').
MgTipoVia from: #('NUDO' 'ND' 'NUDO').
MgTipoVia from: #('ONDA' 'PY' 'ONDARTZA').
MgTipoVia from: #('PAGO' 'PP' 'PAGO').
MgTipoVia from: #('PALAC' 'PC' 'PALACIO').
MgTipoVia from: #('PANT' 'P' 'PANTANO').
MgTipoVia from: #('PARC' 'PQ' 'PARC').
MgTipoVia from: #('PARKE' 'PQ' 'PARKE').
MgTipoVia from: #('PARTI' 'PF' 'PARTICULAR').
MgTipoVia from: #('PAS' 'PA' 'PAS').
MgTipoVia from: #('PASAI' 'PJ' 'PASAIA').
MgTipoVia from: #('PASEA' 'PS' 'PASEALEKUA').
MgTipoVia from: #('PASEA' 'PS' 'PASEABIDE').
MgTipoVia from: #('PASEO' 'PS' 'PASEO').
MgTipoVia from: #('PASEO' 'PS' 'PASEO').
MgTipoVia from: #('PASSE' 'PS' 'PASSEIG').
MgTipoVia from: #('PATIO' 'PK' 'PATIO').
MgTipoVia from: #('PBDO' 'PB' 'POBLADO').
MgTipoVia from: #('PBLO' 'PB' 'PUEBLO').
MgTipoVia from: #('PDA' 'PV' 'PUJADA').
MgTipoVia from: #('PDIS' 'PÇ' 'PASSADIS').
MgTipoVia from: #('PG' 'PG' 'PG').
MgTipoVia from: #('PGIND' 'PG' 'POLIGONO').
MgTipoVia from: #('PINAR' 'PN' 'PINAR').
MgTipoVia from: #('PISTA' 'PI' 'PISTA').
MgTipoVia from: #('PJDA' 'SU' 'PUJADA,').
MgTipoVia from: #('PL' 'PL' 'PL').
MgTipoVia from: #('PLA' 'PW' 'PLA').
MgTipoVia from: #('PLAYA' 'PY' 'PLAYA').
MgTipoVia from: #('PLAZA' 'PZ' 'PLAZA').
MgTipoVia from: #('PLAÇA' 'PZ' 'PLAÇA').
MgTipoVia from: #('PLCET' 'PL' 'PLACETA').
MgTipoVia from: #('PLLOP' 'PX' 'PASILLO').
MgTipoVia from: #('PLZLA' 'PL' 'PLAZUELA').
MgTipoVia from: #('PNTE' 'PT' 'PUENTE').
MgTipoVia from: #('POLIG' 'PG' 'POLIGONO').
MgTipoVia from: #('PONT' 'PT' 'PONT').
MgTipoVia from: #('PONTE' 'PT' 'PONTE').
MgTipoVia from: #('PORT' 'PO' 'PORT').
MgTipoVia from: #('PQUE' 'PQ' 'PARQUE').
MgTipoVia from: #('PRAGE' 'PE' 'PARATGE').
MgTipoVia from: #('PRAIA' 'PY' 'PRAIA').
MgTipoVia from: #('PRAJE' 'PE' 'PARAJE').
MgTipoVia from: #('PRAXE' 'PE' 'PARAXE').
MgTipoVia from: #('PRAZA' 'PZ' 'PRAZA').
MgTipoVia from: #('PRAÑA' 'PÑ' 'PRACIÑA').
MgTipoVia from: #('PROL' 'PR' 'PROLONGACIO').
MgTipoVia from: #('PROL' 'PR' 'PROLONGACION').
MgTipoVia from: #('PRTAL' 'PH' 'PORTAL').
MgTipoVia from: #('PRTCO' 'PH' 'PORTICO').
MgTipoVia from: #('PRZLA' 'PL' 'PRAZUELA').
MgTipoVia from: #('PSAJE' 'PJ' 'PASAJE').
MgTipoVia from: #('PSAXE' 'PJ' 'PASAXE').
MgTipoVia from: #('PSLLO' 'PX' 'PASILLO').
MgTipoVia from: #('PSMAR' 'PM' 'PASEO').
MgTipoVia from: #('PTA' 'PU' 'PUERTA').
MgTipoVia from: #('PTDA' 'PD' 'PARTIDA').
MgTipoVia from: #('PTGE' 'PJ' 'PASSATGE').
MgTipoVia from: #('PTILO' 'PO' 'PORTILLO').
MgTipoVia from: #('PTLLO' 'PO' 'PUERTILO').
MgTipoVia from: #('PTO' 'PO' 'PUERTO').
MgTipoVia from: #('PZO' 'PÇ' 'PASADIZO').
MgTipoVia from: #('PZTA' 'PL' 'PLAZOLETA').
MgTipoVia from: #('RABAL' 'AR' 'RABAL').
MgTipoVia from: #('RACDA' 'RA' 'RACONADA').
MgTipoVia from: #('RACO' 'RC' 'RACO').
MgTipoVia from: #('RAMAL' 'RM' 'RAMAL').
MgTipoVia from: #('RAMPA' 'RP' 'RAMPLA').
MgTipoVia from: #('RAMPA' 'RP' 'RAMPA').
MgTipoVia from: #('RAVAL' 'AR' 'RAVAL').
MgTipoVia from: #('RBLA' 'RB' 'RAMBLA').
MgTipoVia from: #('RBRA' 'RI' 'RIBERA').
MgTipoVia from: #('RCDA' 'RN' 'RINCONADA').
MgTipoVia from: #('RCON' 'RC' 'RINCON').
MgTipoVia from: #('RENTO' 'RT' 'RENTO').
MgTipoVia from: #('RESID' 'RS' 'RESIDENCIAL').
MgTipoVia from: #('RIERA' 'AY' 'RIERA').
MgTipoVia from: #('RONDA' 'RD' 'RONDA').
MgTipoVia from: #('RTDA' 'RO' 'ROTONDA').
MgTipoVia from: #('RUA' 'RU' 'RUA').
MgTipoVia from: #('RUELA' 'CU' 'RUELA').
MgTipoVia from: #('RUERO' 'RE' 'RUEIRO').
MgTipoVia from: #('SANAT' 'SA' 'SANATORIO').
MgTipoVia from: #('SANTU' 'ST' 'SANTUARIO').
MgTipoVia from: #('SARBI' 'AC' 'SARBIDE').
MgTipoVia from: #('SBIDA' 'SB' 'SUBIDA').
MgTipoVia from: #('SECT' 'SC' 'SECTOR').
MgTipoVia from: #('SEDER' 'SD' 'SENDER').
MgTipoVia from: #('SEDRA' 'SR' 'SENDERA').
MgTipoVia from: #('SEKT' 'SC' 'SEKTORE').
MgTipoVia from: #('SEND' 'SN' 'SENDERO').
MgTipoVia from: #('SENDA' 'SD' 'SENDA').
MgTipoVia from: #('SVTIA' 'CM' 'SERVENTIA').
MgTipoVia from: #('TALDE' 'GR' 'TALDE').
MgTipoVia from: #('TOKI' 'PE' 'TOKI').
MgTipoVia from: #('TRANS' 'TS' 'TRANSITO').
MgTipoVia from: #('TRAS' 'TA' 'TRASERA').
MgTipoVia from: #('TRAS' 'TA' 'TRASEIRA').
MgTipoVia from: #('TRAV' 'TR' 'TRAVESSERA').
MgTipoVia from: #('TRRNT' 'TO' 'TORRENTE').
MgTipoVia from: #('TRSSI' 'TR' 'TRAVESSIA').
MgTipoVia from: #('TRVA' 'TR' 'TRAVESIA').
MgTipoVia from: #('TRVAL' 'TV' 'TRANSVERSAL').
MgTipoVia from: #('URB' 'UR' 'URBANIZACION').
MgTipoVia from: #('URBAT' 'UR' 'URBANITZACIO').
MgTipoVia from: #('URBAZ' 'UR' 'URBANIZAZIO').
MgTipoVia from: #('VALLE' 'VA' 'VALLE').
MgTipoVia from: #('VCTE' 'VD' 'VIADUCTE').
MgTipoVia from: #('VCTO' 'VD' 'VIADUCTO').
MgTipoVia from: #('VECIN' 'VC' 'VECINDARIO').
MgTipoVia from: #('VEGA' 'VG' 'VEGA').
MgTipoVia from: #('VENAT' 'VE' 'VEINAT').
MgTipoVia from: #('VENLA' 'VN' 'VENELA').
MgTipoVia from: #('VIA' 'VI' 'VIA').
MgTipoVia from: #('VIAL' 'VL' 'VIAL').
MgTipoVia from: #('VIANY' 'SN' 'VIARANY').
MgTipoVia from: #('VILLA' 'V' 'VILLA').
MgTipoVia from: #('VREDA' 'VR' 'VEREDA').
MgTipoVia from: #('VVDAS' 'VV' 'VIVIENDAS').
MgTipoVia from: #('XDIN' 'JR' 'XARDIN').
MgTipoVia from: #('ZEHAR' 'ZE' 'ZEARKALETA').
MgTipoVia from: #('ZONA' 'ZO' 'ZONA').
MgTipoVia from: #('ZUBI' 'PT' 'ZUBI').
MgTipoVia from: #('ZUHAI' 'AB' 'ZUHAIZTI').
MgTipoVia from: #('ZUMAR' 'AL' 'ZUMARDI')
}
]

{ #category : 'as yet unclassified' }
MgConstantes class >> tipoViaCalle [

	^ self listaTiposVias at: 57
]
