--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-01 11:09:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 17703)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5852 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 17667)
-- Name: amigos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amigos (
    user1_id integer NOT NULL,
    user2_id integer NOT NULL,
    status character varying(10),
    CONSTRAINT amigos_status_check CHECK (((status)::text = ANY ((ARRAY['pendiente'::character varying, 'aceptado'::character varying])::text[])))
);


ALTER TABLE public.amigos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17654)
-- Name: ecopuntos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecopuntos (
    id integer NOT NULL,
    user_id integer,
    tipo character varying(20),
    puntos integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ecopuntos_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['reciclaje'::character varying, 'reporte'::character varying])::text[])))
);


ALTER TABLE public.ecopuntos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17653)
-- Name: ecopuntos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ecopuntos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ecopuntos_id_seq OWNER TO postgres;

--
-- TOC entry 5853 (class 0 OID 0)
-- Dependencies: 225
-- Name: ecopuntos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ecopuntos_id_seq OWNED BY public.ecopuntos.id;


--
-- TOC entry 223 (class 1259 OID 17630)
-- Name: hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.hashtags OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17629)
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hashtags_id_seq OWNER TO postgres;

--
-- TOC entry 5854 (class 0 OID 0)
-- Dependencies: 222
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- TOC entry 229 (class 1259 OID 17684)
-- Name: mensajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajes (
    id integer NOT NULL,
    emisor_id integer,
    receptor_id integer,
    mensaje text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mensajes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17683)
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensajes_id_seq OWNER TO postgres;

--
-- TOC entry 5855 (class 0 OID 0)
-- Dependencies: 228
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes.id;


--
-- TOC entry 224 (class 1259 OID 17638)
-- Name: publicacion_hashtag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicacion_hashtag (
    publicacion_id integer NOT NULL,
    hashtag_id integer NOT NULL
);


ALTER TABLE public.publicacion_hashtag OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17615)
-- Name: publicaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicaciones (
    id integer NOT NULL,
    user_id integer,
    contenido text,
    imagen text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.publicaciones OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17614)
-- Name: publicaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publicaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publicaciones_id_seq OWNER TO postgres;

--
-- TOC entry 5856 (class 0 OID 0)
-- Dependencies: 220
-- Name: publicaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publicaciones_id_seq OWNED BY public.publicaciones.id;


--
-- TOC entry 236 (class 1259 OID 18776)
-- Name: reportes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reportes (
    id integer NOT NULL,
    user_id integer,
    descripcion text NOT NULL,
    ubicacion public.geography(Point,4326) NOT NULL,
    imagen text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reportes OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18775)
-- Name: reportes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reportes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reportes_id_seq OWNER TO postgres;

--
-- TOC entry 5857 (class 0 OID 0)
-- Dependencies: 235
-- Name: reportes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reportes_id_seq OWNED BY public.reportes.id;


--
-- TOC entry 219 (class 1259 OID 17601)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    distrito character varying(100),
    foto_perfil text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17600)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5858 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 5641 (class 2604 OID 17657)
-- Name: ecopuntos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecopuntos ALTER COLUMN id SET DEFAULT nextval('public.ecopuntos_id_seq'::regclass);


--
-- TOC entry 5640 (class 2604 OID 17633)
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- TOC entry 5643 (class 2604 OID 17687)
-- Name: mensajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- TOC entry 5638 (class 2604 OID 17618)
-- Name: publicaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicaciones ALTER COLUMN id SET DEFAULT nextval('public.publicaciones_id_seq'::regclass);


--
-- TOC entry 5645 (class 2604 OID 18779)
-- Name: reportes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes ALTER COLUMN id SET DEFAULT nextval('public.reportes_id_seq'::regclass);


--
-- TOC entry 5636 (class 2604 OID 17604)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5842 (class 0 OID 17667)
-- Dependencies: 227
-- Data for Name: amigos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amigos (user1_id, user2_id, status) FROM stdin;
\.


--
-- TOC entry 5841 (class 0 OID 17654)
-- Dependencies: 226
-- Data for Name: ecopuntos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecopuntos (id, user_id, tipo, puntos, created_at) FROM stdin;
\.


--
-- TOC entry 5838 (class 0 OID 17630)
-- Dependencies: 223
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashtags (id, nombre) FROM stdin;
\.


--
-- TOC entry 5844 (class 0 OID 17684)
-- Dependencies: 229
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensajes (id, emisor_id, receptor_id, mensaje, created_at) FROM stdin;
\.


--
-- TOC entry 5839 (class 0 OID 17638)
-- Dependencies: 224
-- Data for Name: publicacion_hashtag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publicacion_hashtag (publicacion_id, hashtag_id) FROM stdin;
\.


--
-- TOC entry 5836 (class 0 OID 17615)
-- Dependencies: 221
-- Data for Name: publicaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publicaciones (id, user_id, contenido, imagen, created_at) FROM stdin;
\.


--
-- TOC entry 5846 (class 0 OID 18776)
-- Dependencies: 236
-- Data for Name: reportes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reportes (id, user_id, descripcion, ubicacion, imagen, created_at) FROM stdin;
\.


--
-- TOC entry 5635 (class 0 OID 18025)
-- Dependencies: 231
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5834 (class 0 OID 17601)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nombre, apellido, username, email, password, distrito, foto_perfil, created_at) FROM stdin;
\.


--
-- TOC entry 5859 (class 0 OID 0)
-- Dependencies: 225
-- Name: ecopuntos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ecopuntos_id_seq', 1, false);


--
-- TOC entry 5860 (class 0 OID 0)
-- Dependencies: 222
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- TOC entry 5861 (class 0 OID 0)
-- Dependencies: 228
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 1, false);


--
-- TOC entry 5862 (class 0 OID 0)
-- Dependencies: 220
-- Name: publicaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publicaciones_id_seq', 1, false);


--
-- TOC entry 5863 (class 0 OID 0)
-- Dependencies: 235
-- Name: reportes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reportes_id_seq', 1, false);


--
-- TOC entry 5864 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 5667 (class 2606 OID 17672)
-- Name: amigos amigos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amigos
    ADD CONSTRAINT amigos_pkey PRIMARY KEY (user1_id, user2_id);


--
-- TOC entry 5665 (class 2606 OID 17661)
-- Name: ecopuntos ecopuntos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecopuntos
    ADD CONSTRAINT ecopuntos_pkey PRIMARY KEY (id);


--
-- TOC entry 5659 (class 2606 OID 17637)
-- Name: hashtags hashtags_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_nombre_key UNIQUE (nombre);


--
-- TOC entry 5661 (class 2606 OID 17635)
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- TOC entry 5669 (class 2606 OID 17692)
-- Name: mensajes mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- TOC entry 5663 (class 2606 OID 17642)
-- Name: publicacion_hashtag publicacion_hashtag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion_hashtag
    ADD CONSTRAINT publicacion_hashtag_pkey PRIMARY KEY (publicacion_id, hashtag_id);


--
-- TOC entry 5657 (class 2606 OID 17623)
-- Name: publicaciones publicaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicaciones
    ADD CONSTRAINT publicaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 5673 (class 2606 OID 18784)
-- Name: reportes reportes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_pkey PRIMARY KEY (id);


--
-- TOC entry 5651 (class 2606 OID 17613)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5653 (class 2606 OID 17609)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5655 (class 2606 OID 17611)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 5678 (class 2606 OID 17673)
-- Name: amigos amigos_user1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amigos
    ADD CONSTRAINT amigos_user1_id_fkey FOREIGN KEY (user1_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5679 (class 2606 OID 17678)
-- Name: amigos amigos_user2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amigos
    ADD CONSTRAINT amigos_user2_id_fkey FOREIGN KEY (user2_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5677 (class 2606 OID 17662)
-- Name: ecopuntos ecopuntos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecopuntos
    ADD CONSTRAINT ecopuntos_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5680 (class 2606 OID 17693)
-- Name: mensajes mensajes_emisor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_emisor_id_fkey FOREIGN KEY (emisor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5681 (class 2606 OID 17698)
-- Name: mensajes mensajes_receptor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_receptor_id_fkey FOREIGN KEY (receptor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5675 (class 2606 OID 17648)
-- Name: publicacion_hashtag publicacion_hashtag_hashtag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion_hashtag
    ADD CONSTRAINT publicacion_hashtag_hashtag_id_fkey FOREIGN KEY (hashtag_id) REFERENCES public.hashtags(id) ON DELETE CASCADE;


--
-- TOC entry 5676 (class 2606 OID 17643)
-- Name: publicacion_hashtag publicacion_hashtag_publicacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion_hashtag
    ADD CONSTRAINT publicacion_hashtag_publicacion_id_fkey FOREIGN KEY (publicacion_id) REFERENCES public.publicaciones(id) ON DELETE CASCADE;


--
-- TOC entry 5674 (class 2606 OID 17624)
-- Name: publicaciones publicaciones_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicaciones
    ADD CONSTRAINT publicaciones_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5682 (class 2606 OID 18785)
-- Name: reportes reportes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-02-01 11:09:13

--
-- PostgreSQL database dump complete
--

