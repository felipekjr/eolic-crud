-- Adicionando tabelas referentes ao db_eolicapi

-- Table: public.usuario

-- DROP TABLE public.usuario;

  CREATE TABLE public.usuario
(
  id int NOT NULL,
  login character varying NOT NULL,
  senha character varying NOT NULL,  
  CONSTRAINT usuario_pkey PRIMARY KEY (id)  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.usuario
  OWNER TO postgres;  

-- Table: public.complexo_eolico

-- DROP TABLE public.complexo_eolico;

  CREATE TABLE public.complexo_eolico
(
  id int NOT NULL,
  nome character varying (45),
  uf character varying (45),
  identificador character varying (45),
  CONSTRAINT complexo_eolico_pkey PRIMARY KEY (id)  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.complexo_eolico
  OWNER TO postgres;
  
-- Table: public.parque_eolico

-- DROP TABLE public.parque_eolico;

  CREATE TABLE public.parque_eolico
(
  id int NOT NULL,
  nome character varying (45),
  latitude int,
  longitude int,
  potencia_instalada float,  
  complexo_eolico_id int NOT NULL,
  CONSTRAINT parque_eolico_pkey PRIMARY KEY (id),
  CONSTRAINT complexo_eolico_id_fkey FOREIGN KEY (complexo_eolico_id)
  	REFERENCES public.complexo_eolico (id) MATCH SIMPLE
 	ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.parque_eolico
  OWNER TO postgres;
  
-- Table: public.aerogerador

-- DROP TABLE public.aerogerador;

  CREATE TABLE public.aerogerador
(
  id int NOT NULL,
  nome character varying (45),
  latitude float,
  longitude float,
  altura_torre float,
  diametro_varredura float,
  modelo character varying (45),
  parque_eolico_id int NOT NULL,
  CONSTRAINT aerogerador_pkey PRIMARY KEY (id),
  CONSTRAINT parque_eolico_id_fkey FOREIGN KEY (parque_eolico_id)
  	REFERENCES public.parque_eolico (id) MATCH SIMPLE
 	ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.aerogerador
  OWNER TO postgres;

