CREATE TABLE public.sweets_types
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    name character varying NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.sweets_types;
	
COMMENT ON TABLE public.sweets_types
    IS 'Виды сладостей';
	
CREATE TABLE public.sweets
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    sweets_types_id integer,
    name character varying NOT NULL,
    cost character varying NOT NULL,
    weight character varying NOT NULL,
    manufacturer_id integer NOT NULL,
    with_sugar boolean,
    requires_freezing boolean,
    production_date date NOT NULL,
    expiration_date date NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.sweets;

COMMENT ON TABLE public.sweets
    IS 'Записи о сладостях';
	
CREATE TABLE public.manufacturers_storehouses
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    storehouses_id integer NOT NULL,
    manufacturers_id integer NOT NULL,
    PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.manufacturers_storehouses;

COMMENT ON TABLE public.manufacturers_storehouses
    IS 'Связь компании производителя и склада';
	
CREATE TABLE public.manufacturers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    name character varying NOT NULL,
	phone character varying,
	adress character varying,
	city character varying NOT NULL,
	country character varying NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.manufacturers;
	
COMMENT ON TABLE public.manufacturers
    IS 'Компании производители';
	
CREATE TABLE public.storehouses
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    name character varying NOT NULL,
    adress character varying,
    city character varying NOT NULL,
    country character varying NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.storehouses;

COMMENT ON TABLE public.storehouses
    IS 'Склады';