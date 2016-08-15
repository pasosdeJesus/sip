--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: es_co_utf_8; Type: COLLATION; Schema: public; Owner: -
--

CREATE COLLATION es_co_utf_8 (lc_collate = 'es_CO.UTF-8', lc_ctype = 'es_CO.UTF-8');


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: soundexesp(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION soundexesp(input text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT COST 500
    AS $$
DECLARE
	-- Función tomada de http://wiki.postgresql.org/wiki/SoundexESP
	soundex text='';	
	-- para determinar la primera letra
	pri_letra text;
	resto text;
	sustituida text ='';
	-- para quitar adyacentes
	anterior text;
	actual text;
	corregido text;
BEGIN
       -- devolver null si recibi un string en blanco o con espacios en blanco
	IF length(trim(input))= 0 then
		RETURN NULL;
	end IF;
 
 
	-- 1: LIMPIEZA:
		-- pasar a mayuscula, eliminar la letra "H" inicial, los acentos y la enie
		-- 'holá coñó' => 'OLA CONO'
		input=translate(ltrim(trim(upper(input)),'H'),'ÑÁÉÍÓÚÀÈÌÒÙÜ','NAEIOUAEIOUU');
 
		-- eliminar caracteres no alfabéticos (números, símbolos como &,%,",*,!,+, etc.
		input=regexp_replace(input, '[^a-zA-Z]', '', 'g');
 
	-- 2: PRIMERA LETRA ES IMPORTANTE, DEBO ASOCIAR LAS SIMILARES
	--  'vaca' se convierte en 'baca'  y 'zapote' se convierte en 'sapote'
	-- un fenomeno importante es GE y GI se vuelven JE y JI; CA se vuelve KA, etc
	pri_letra =substr(input,1,1);
	resto =substr(input,2);
	CASE 
		when pri_letra IN ('V') then
			sustituida='B';
		when pri_letra IN ('Z','X') then
			sustituida='S';
		when pri_letra IN ('G') AND substr(input,2,1) IN ('E','I') then
			sustituida='J';
		when pri_letra IN('C') AND substr(input,2,1) NOT IN ('H','E','I') then
			sustituida='K';
		else
			sustituida=pri_letra;
 
	end case;
	--corregir el parametro con las consonantes sustituidas:
	input=sustituida || resto;		
 
	-- 3: corregir "letras compuestas" y volverlas una sola
	input=REPLACE(input,'CH','V');
	input=REPLACE(input,'QU','K');
	input=REPLACE(input,'LL','J');
	input=REPLACE(input,'CE','S');
	input=REPLACE(input,'CI','S');
	input=REPLACE(input,'YA','J');
	input=REPLACE(input,'YE','J');
	input=REPLACE(input,'YI','J');
	input=REPLACE(input,'YO','J');
	input=REPLACE(input,'YU','J');
	input=REPLACE(input,'GE','J');
	input=REPLACE(input,'GI','J');
	input=REPLACE(input,'NY','N');
	-- para debug:    --return input;
 
	-- EMPIEZA EL CALCULO DEL SOUNDEX
	-- 4: OBTENER PRIMERA letra
	pri_letra=substr(input,1,1);
 
	-- 5: retener el resto del string
	resto=substr(input,2);
 
	--6: en el resto del string, quitar vocales y vocales fonéticas
	resto=translate(resto,'@AEIOUHWY','@');
 
	--7: convertir las letras foneticamente equivalentes a numeros  (esto hace que B sea equivalente a V, C con S y Z, etc.)
	resto=translate(resto, 'BPFVCGKSXZDTLMNRQJ', '111122222233455677');
	-- así va quedando la cosa
	soundex=pri_letra || resto;
 
	--8: eliminar números iguales adyacentes (A11233 se vuelve A123)
	anterior=substr(soundex,1,1);
	corregido=anterior;
 
	FOR i IN 2 .. length(soundex) LOOP
		actual = substr(soundex, i, 1);
		IF actual <> anterior THEN
			corregido=corregido || actual;
			anterior=actual;			
		END IF;
	END LOOP;
	-- así va la cosa
	soundex=corregido;
 
	-- 9: siempre retornar un string de 4 posiciones
	soundex=rpad(soundex,4,'0');
	soundex=substr(soundex,1,4);		
 
	-- YA ESTUVO
	RETURN soundex;	
END;	
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: divipola; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE divipola (
    coddep character varying,
    codmun character varying,
    codcp character varying,
    nomdep character varying,
    nommun character varying,
    nomcp character varying,
    tipcp character varying,
    long character varying,
    lat character varying,
    distrito character varying,
    tipmun character varying,
    areamet character varying
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sip_anexo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_anexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_anexo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_anexo (
    id integer DEFAULT nextval('sip_anexo_id_seq'::regclass) NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(1500) COLLATE public.es_co_utf_8 NOT NULL,
    archivo character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    adjunto_file_name character varying(255),
    adjunto_content_type character varying(255),
    adjunto_file_size integer,
    adjunto_updated_at timestamp without time zone
);


--
-- Name: sip_clase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_clase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_clase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_clase (
    id integer DEFAULT nextval('sip_clase_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    id_municipio integer NOT NULL,
    id_clalocal integer,
    id_tclase character varying(10) DEFAULT 'CP'::character varying NOT NULL,
    latitud double precision,
    longitud double precision,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT clase_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_departamento (
    id integer DEFAULT nextval('sip_departamento_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    id_pais integer NOT NULL,
    id_deplocal integer,
    latitud double precision,
    longitud double precision,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT departamento_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_etiqueta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_etiqueta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_etiqueta (
    id integer DEFAULT nextval('sip_etiqueta_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT etiqueta_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_fuenteprensa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_fuenteprensa (
    id integer NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: sip_fuenteprensa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_fuenteprensa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_fuenteprensa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sip_fuenteprensa_id_seq OWNED BY sip_fuenteprensa.id;


--
-- Name: sip_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_municipio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_municipio (
    id integer DEFAULT nextval('sip_municipio_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    id_departamento integer NOT NULL,
    id_munlocal integer,
    latitud double precision,
    longitud double precision,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT municipio_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_mundep_sinorden; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW sip_mundep_sinorden AS
 SELECT ((sip_departamento.id_deplocal * 1000) + sip_municipio.id_munlocal) AS idlocal,
    (((sip_municipio.nombre)::text || ' / '::text) || (sip_departamento.nombre)::text) AS nombre
   FROM (sip_municipio
     JOIN sip_departamento ON ((sip_municipio.id_departamento = sip_departamento.id)))
  WHERE ((sip_departamento.id_pais = 170) AND (sip_municipio.fechadeshabilitacion IS NULL) AND (sip_departamento.fechadeshabilitacion IS NULL))
UNION
 SELECT sip_departamento.id_deplocal AS idlocal,
    sip_departamento.nombre
   FROM sip_departamento
  WHERE ((sip_departamento.id_pais = 170) AND (sip_departamento.fechadeshabilitacion IS NULL));


--
-- Name: sip_mundep; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW sip_mundep AS
 SELECT sip_mundep_sinorden.idlocal,
    sip_mundep_sinorden.nombre,
    to_tsvector('spanish'::regconfig, unaccent(sip_mundep_sinorden.nombre)) AS mundep
   FROM sip_mundep_sinorden
  ORDER BY (sip_mundep_sinorden.nombre COLLATE es_co_utf_8)
  WITH NO DATA;


--
-- Name: sip_oficina_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_oficina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_oficina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_oficina (
    id integer DEFAULT nextval('sip_oficina_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT regionsjr_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_pais; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_pais (
    id integer DEFAULT nextval('sip_pais_id_seq'::regclass) NOT NULL,
    nombre character varying(200) COLLATE public.es_co_utf_8,
    nombreiso character varying(200),
    latitud double precision,
    longitud double precision,
    alfa2 character varying(2),
    alfa3 character varying(3),
    codiso integer,
    div1 character varying(100),
    div2 character varying(100),
    div3 character varying(100),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8
);


--
-- Name: sip_persona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_persona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_persona (
    id integer DEFAULT nextval('sip_persona_id_seq'::regclass) NOT NULL,
    nombres character varying(100) COLLATE public.es_co_utf_8 NOT NULL,
    apellidos character varying(100) COLLATE public.es_co_utf_8 NOT NULL,
    anionac integer,
    mesnac integer,
    dianac integer,
    sexo character(1) NOT NULL,
    id_departamento integer,
    id_municipio integer,
    id_clase integer,
    numerodocumento character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_pais integer,
    nacionalde integer,
    tdocumento_id integer,
    CONSTRAINT persona_check CHECK (((dianac IS NULL) OR (((dianac >= 1) AND (((mesnac = 1) OR (mesnac = 3) OR (mesnac = 5) OR (mesnac = 7) OR (mesnac = 8) OR (mesnac = 10) OR (mesnac = 12)) AND (dianac <= 31))) OR (((mesnac = 4) OR (mesnac = 6) OR (mesnac = 9) OR (mesnac = 11)) AND (dianac <= 30)) OR ((mesnac = 2) AND (dianac <= 29))))),
    CONSTRAINT persona_mesnac_check CHECK (((mesnac IS NULL) OR ((mesnac >= 1) AND (mesnac <= 12)))),
    CONSTRAINT persona_sexo_check CHECK (((sexo = 'S'::bpchar) OR (sexo = 'F'::bpchar) OR (sexo = 'M'::bpchar)))
);


--
-- Name: sip_persona_trelacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_persona_trelacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_persona_trelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_persona_trelacion (
    persona1 integer NOT NULL,
    persona2 integer NOT NULL,
    id_trelacion character(2) DEFAULT 'SI'::bpchar NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer DEFAULT nextval('sip_persona_trelacion_id_seq'::regclass) NOT NULL
);


--
-- Name: sip_tclase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_tclase (
    id character varying(10) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT tclase_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_tdocumento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_tdocumento (
    id integer NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    sigla character varying(100),
    formatoregex character varying(500),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8
);


--
-- Name: sip_tdocumento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_tdocumento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_tdocumento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sip_tdocumento_id_seq OWNED BY sip_tdocumento.id;


--
-- Name: sip_trelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_trelacion (
    id character(2) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    inverso character varying(2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT trelacion_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_tsitio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_tsitio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_tsitio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_tsitio (
    id integer DEFAULT nextval('sip_tsitio_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT tsitio_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_ubicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_ubicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_ubicacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_ubicacion (
    id integer DEFAULT nextval('sip_ubicacion_id_seq'::regclass) NOT NULL,
    lugar character varying(500) COLLATE public.es_co_utf_8,
    sitio character varying(500) COLLATE public.es_co_utf_8,
    id_clase integer,
    id_municipio integer,
    id_departamento integer,
    id_tsitio integer DEFAULT 1 NOT NULL,
    latitud double precision,
    longitud double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_pais integer
);


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usuario (
    nusuario character varying(15) NOT NULL,
    password character varying(64) DEFAULT ''::character varying NOT NULL,
    nombre character varying(50) COLLATE public.es_co_utf_8,
    descripcion character varying(50),
    rol integer DEFAULT 4,
    idioma character varying(6) DEFAULT 'es_CO'::character varying NOT NULL,
    id integer DEFAULT nextval('usuario_id_seq'::regclass) NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer,
    unlock_token character varying(64),
    locked_at timestamp without time zone,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    regionsjr_id integer,
    CONSTRAINT usuario_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion))),
    CONSTRAINT usuario_rol_check CHECK ((rol >= 1))
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_fuenteprensa ALTER COLUMN id SET DEFAULT nextval('sip_fuenteprensa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tdocumento ALTER COLUMN id SET DEFAULT nextval('sip_tdocumento_id_seq'::regclass);


--
-- Name: anexo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_anexo
    ADD CONSTRAINT anexo_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: clase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT clase_pkey PRIMARY KEY (id);


--
-- Name: etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_etiqueta
    ADD CONSTRAINT etiqueta_pkey PRIMARY KEY (id);


--
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);


--
-- Name: oficina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_oficina
    ADD CONSTRAINT oficina_pkey PRIMARY KEY (id);


--
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: sip_departamento_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_key UNIQUE (id);


--
-- Name: sip_departamento_id_pais_id_deplocal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_key UNIQUE (id_pais, id_deplocal);


--
-- Name: sip_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_pkey PRIMARY KEY (id);


--
-- Name: sip_fuenteprensa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_fuenteprensa
    ADD CONSTRAINT sip_fuenteprensa_pkey PRIMARY KEY (id);


--
-- Name: sip_persona_trelacion_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_id_key UNIQUE (id);


--
-- Name: sip_persona_trelacion_persona1_persona2_id_trelacion_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_persona1_persona2_id_trelacion_key UNIQUE (persona1, persona2, id_trelacion);


--
-- Name: sip_persona_trelacion_persona1_persona2_id_trelacion_key1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_persona1_persona2_id_trelacion_key1 UNIQUE (persona1, persona2, id_trelacion);


--
-- Name: sip_persona_trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_pkey PRIMARY KEY (id);


--
-- Name: tclase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tclase
    ADD CONSTRAINT tclase_pkey PRIMARY KEY (id);


--
-- Name: tdocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tdocumento
    ADD CONSTRAINT tdocumento_pkey PRIMARY KEY (id);


--
-- Name: trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_trelacion
    ADD CONSTRAINT trelacion_pkey PRIMARY KEY (id);


--
-- Name: tsitio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tsitio
    ADD CONSTRAINT tsitio_pkey PRIMARY KEY (id);


--
-- Name: ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: index_usuario_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_usuario_on_email ON usuario USING btree (email);


--
-- Name: sip_busca_mundep; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sip_busca_mundep ON sip_mundep USING gin (mundep);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: clase_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT clase_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: clase_id_tclase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT clase_id_tclase_fkey FOREIGN KEY (id_tclase) REFERENCES sip_tclase(id);


--
-- Name: departamento_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT departamento_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: persona_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES sip_clase(id);


--
-- Name: persona_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: persona_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: persona_nacionalde_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_nacionalde_fkey FOREIGN KEY (nacionalde) REFERENCES sip_pais(id);


--
-- Name: persona_tdocumento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_tdocumento_id_fkey FOREIGN KEY (tdocumento_id) REFERENCES sip_tdocumento(id);


--
-- Name: persona_trelacion_id_trelacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_id_trelacion_fkey FOREIGN KEY (id_trelacion) REFERENCES sip_trelacion(id);


--
-- Name: persona_trelacion_persona1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona1_fkey FOREIGN KEY (persona1) REFERENCES sip_persona(id);


--
-- Name: persona_trelacion_persona2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona2_fkey FOREIGN KEY (persona2) REFERENCES sip_persona(id);


--
-- Name: sip_municipio_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: ubicacion_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES sip_clase(id);


--
-- Name: ubicacion_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: ubicacion_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: ubicacion_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: ubicacion_id_tsitio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_tsitio_fkey FOREIGN KEY (id_tsitio) REFERENCES sip_tsitio(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20150413160156'), ('20150413160157'), ('20150413160158'), ('20150413160159'), ('20150416074423'), ('20150503120915'), ('20150510125926'), ('20150521181918'), ('20150528100944'), ('20150707164448'), ('20150710114451'), ('20150717101243'), ('20150724003736'), ('20150803082520'), ('20150809032138'), ('20151020203421'), ('20160519195544');


