--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Certificados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Certificados" (
    id integer NOT NULL,
    "otherDetails" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "clienteId" integer,
    "equipamentoId" integer,
    "funcionarioId" integer
);


ALTER TABLE public."Certificados" OWNER TO postgres;

--
-- Name: Certificados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Certificados_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Certificados_id_seq" OWNER TO postgres;

--
-- Name: Certificados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Certificados_id_seq" OWNED BY public."Certificados".id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: Clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Clientes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Clientes_id_seq" OWNER TO postgres;

--
-- Name: Clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Clientes_id_seq" OWNED BY public.clientes.id;


--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionarios (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.funcionarios OWNER TO postgres;

--
-- Name: Funcionarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Funcionarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Funcionarios_id_seq" OWNER TO postgres;

--
-- Name: Funcionarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Funcionarios_id_seq" OWNED BY public.funcionarios.id;


--
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_id_seq" OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    password character varying(255) NOT NULL,
    "roleId" integer NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: certificados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificados (
    id integer NOT NULL,
    equipamento_id integer,
    cliente_id integer,
    funcionario_id integer,
    "otherDetails" text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.certificados OWNER TO postgres;

--
-- Name: certificados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certificados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificados_id_seq OWNER TO postgres;

--
-- Name: certificados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certificados_id_seq OWNED BY public.certificados.id;


--
-- Name: equipamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamentos (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    nome character varying(255),
    descricao character varying(1000),
    "clienteId" integer
);


ALTER TABLE public.equipamentos OWNER TO postgres;

--
-- Name: equipamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipamentos_id_seq OWNER TO postgres;

--
-- Name: equipamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipamentos_id_seq OWNED BY public.equipamentos.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: Certificados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Certificados" ALTER COLUMN id SET DEFAULT nextval('public."Certificados_id_seq"'::regclass);


--
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: certificados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificados ALTER COLUMN id SET DEFAULT nextval('public.certificados_id_seq'::regclass);


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public."Clientes_id_seq"'::regclass);


--
-- Name: equipamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamentos ALTER COLUMN id SET DEFAULT nextval('public.equipamentos_id_seq'::regclass);


--
-- Name: funcionarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios ALTER COLUMN id SET DEFAULT nextval('public."Funcionarios_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: Certificados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Certificados" (id, "otherDetails", "createdAt", "updatedAt", "clienteId", "equipamentoId", "funcionarioId") FROM stdin;
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Roles" (id, name, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240716170439-add-timestamps-to-certificados.js
20240911065913-create-users-roles.js
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, name, email, "createdAt", "updatedAt", password, "roleId") FROM stdin;
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, name, email, password) FROM stdin;
1	Wilker J C Pimenta	wiljcpimenta@gmail.com	$2a$06$y3hSnAQI/GxypactePHs8e8iU0fLc2B7Avwkx4gCYnEptgICSEyMC
\.


--
-- Data for Name: certificados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificados (id, equipamento_id, cliente_id, funcionario_id, "otherDetails", "createdAt", "updatedAt") FROM stdin;
38	142	9	5	Data da calibração: 17/07/2024	2024-07-17 23:25:07.644-03	2024-07-17 23:25:07.644-03
39	143	10	8	Data da calibração: 01/07/2024	2024-07-17 23:27:24.456-03	2024-07-17 23:27:24.456-03
40	144	11	11	Data da calibração: 15/07/2024	2024-07-17 23:29:11.564-03	2024-07-17 23:29:11.564-03
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, name, email, address, "createdAt", "updatedAt") FROM stdin;
9	ArcelorMittal	contact@arcelormittal.com	Avenida das Américas, 5000, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
10	Gerdau	contact@gerdau.com	Rua do Aço, 1000, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
11	Vale	contact@vale.com	Praia de Botafogo, 186, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
12	CSN	contact@csn.com	Avenida Brigadeiro Faria Lima, 3400, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
13	Usiminas	contact@usiminas.com	Avenida Pedro Linhares Gomes, 5431, Ipatinga, MG	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
14	Petrobras	contact@petrobras.com	Avenida República do Chile, 65, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
15	Shell	contact@shell.com	Avenida Paulista, 1337, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
16	Anglo American	contact@angloamerican.com	Rua Lauro Muller, 116, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
17	Companhia Siderúrgica Nacional	contact@csn.com.br	Rua Conselheiro Saraiva, 30, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
18	Votorantim	contact@votorantim.com	Avenida Paulista, 2300, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
19	Alcoa	contact@alcoa.com	Rua Vergueiro, 400, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
20	BHP	contact@bhp.com	Avenida Juscelino Kubitschek, 2041, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
21	ExxonMobil	contact@exxonmobil.com	Avenida das Nações Unidas, 12345, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
22	Chevron	contact@chevron.com	Avenida Paulista, 1578, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
23	BP	contact@bp.com	Avenida das Nações Unidas, 15001, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
24	Total	contact@total.com	Avenida Presidente Wilson, 231, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
25	Repsol	contact@repsol.com	Rua Candelária, 65, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
26	Suzano	contact@suzano.com	Avenida Professor Magalhães Neto, 1750, Salvador, BA	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
27	Eletrobras	contact@eletrobras.com	Avenida Presidente Vargas, 409, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
28	Samarco	contact@samarco.com	Rua José Alexandre Buaiz, 150, Vitória, ES	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
29	Vallourec	contact@vallourec.com	Rua João de Barros, 300, Belo Horizonte, MG	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
30	Tenaris	contact@tenaris.com	Rua Lobo Guará, 1010, Pindamonhangaba, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
31	Nippon Steel	contact@nipponsteel.com	Avenida Japonica, 2000, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
32	Hydro	contact@hydro.com	Rua da Noruega, 250, Belém, PA	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
33	SABIC	contact@sabic.com	Rua Árabe, 789, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
34	Embraer	contact@embraer.com	Avenida Brigadeiro Faria Lima, 2170, São José dos Campos, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
35	Braskem	contact@braskem.com	Avenida das Nações Unidas, 4777, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
36	Fibria	contact@fibria.com	Rua da Celulose, 123, Aracruz, ES	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
37	Klabin	contact@klabin.com	Avenida Paulista, 2555, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
38	Cemig	contact@cemig.com	Avenida Barbacena, 1200, Belo Horizonte, MG	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
39	Copel	contact@copel.com	Rua Coronel Dulcídio, 800, Curitiba, PR	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
40	Light	contact@light.com	Avenida Marechal Floriano, 168, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
41	Energisa	contact@energisa.com	Rua João Pessoa, 247, Cataguases, MG	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
42	Equinor	contact@equinor.com	Avenida Presidente Wilson, 231, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
43	Galp Energia	contact@galpenergia.com	Rua Tomas Ribeiro, 65, Lisboa, Portugal	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
44	Enel	contact@enel.com	Rua do Fogo, 345, Fortaleza, CE	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
45	EDP	contact@edp.com	Rua Gomes de Carvalho, 1996, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
46	Raízen	contact@raizen.com	Rua Jorge de Figueiredo Correa, 1632, Piracicaba, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
47	Copersucar	contact@copersucar.com	Avenida Paulista, 287, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
48	Petrogal	contact@petrogal.com	Rua General Firmino Miguel, 5, Lisboa, Portugal	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
49	Cosan	contact@cosan.com	Avenida Paulista, 1938, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
50	Ultragaz	contact@ultragaz.com	Avenida Brigadeiro Luiz Antônio, 1343, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
51	TBG	contact@tbg.com	Avenida Presidente Vargas, 309, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
52	Br Distribuidora	contact@brdistribuidora.com	Rua General Canabarro, 500, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
53	Comgas	contact@comgas.com	Rua Dr. Rafael de Barros, 66, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
54	Naturgy	contact@naturgy.com	Rua do Passeio, 38, Rio de Janeiro, RJ	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
55	AES Brasil	contact@aesbrasil.com	Avenida das Nações Unidas, 4777, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
56	Engie Brasil	contact@engiebrasil.com	Avenida Paulista, 726, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
57	Brookfield Energia	contact@brookfield.com	Avenida das Nações Unidas, 8501, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
58	CTG Brasil	contact@ctgbrasil.com	Rua Funchal, 418, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
59	Omega Energia	contact@omegaenergia.com	Rua do Rocio, 220, São Paulo, SP	2024-07-17 22:48:38.894605-03	2024-07-17 22:48:38.894605-03
\.


--
-- Data for Name: equipamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamentos (id, "createdAt", "updatedAt", nome, descricao, "clienteId") FROM stdin;
142	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Controle	TAG: VC-009, TAG DO VASO: VP-LT:009, Fabricante: Emerson, Modelo: E4321, Número de série: 432156789, Pressão de ajuste: 8.2 kgf/cm², Diâmetro: 2"x2", Diâmetro do orifício: N/C, Tipo: pilotada, Cor: alumínio, Fluido: água, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	9
143	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Segurança	TAG: PSV-010, TAG DO VASO: VP-LT:010, Fabricante: Lesser, Modelo: L8765, Número de série: 567890123, Pressão de ajuste: 7.8 kgf/cm², Diâmetro: 1"x1/2", Diâmetro do orifício: N/C, Tipo: convencional, Cor: laranja, Fluido: óleo, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	10
144	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Segurança	TAG: PSV-011, TAG DO VASO: VP-LT:011, Fabricante: Flowserve, Modelo: F1235, Número de série: 123498766, Pressão de ajuste: 8.6 kgf/cm², Diâmetro: 3/4"x1", Diâmetro do orifício: N/C, Tipo: convencional, Cor: vermelho, Fluido: ar comprimido, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	11
145	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	PSV	TAG: PSV-012, TAG DO VASO: VP-LT:012, Fabricante: Emerson, Modelo: E4322, Número de série: 432156790, Pressão de ajuste: 8.3 kgf/cm², Diâmetro: 2"x2", Diâmetro do orifício: N/C, Tipo: pilotada, Cor: alumínio, Fluido: água, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	12
146	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Alívio	TAG: VA-013, TAG DO VASO: VP-LT:013, Fabricante: Lesser, Modelo: L4323, Número de série: 123498767, Pressão de ajuste: 7.6 kgf/cm², Diâmetro: 1/2"x1", Diâmetro do orifício: N/C, Tipo: pilotada, Cor: preto, Fluido: água, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	13
147	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Controle	TAG: VC-014, TAG DO VASO: VP-LT:014, Fabricante: Flowserve, Modelo: F5679, Número de série: 987654322, Pressão de ajuste: 9.1 kgf/cm², Diâmetro: 1"x1 1/2", Diâmetro do orifício: N/C, Tipo: convencional, Cor: laranja, Fluido: ar comprimido, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	14
148	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Segurança	TAG: PSV-015, TAG DO VASO: VP-LT:015, Fabricante: Emerson, Modelo: E1236, Número de série: 678901235, Pressão de ajuste: 10.1 kgf/cm², Diâmetro: 2"x2 1/2", Diâmetro do orifício: N/C, Tipo: convencional, Cor: alumínio, Fluido: vapor, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	15
149	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Alívio	TAG: VA-016, TAG DO VASO: VP-LT:016, Fabricante: Lesser, Modelo: L4324, Número de série: 123498768, Pressão de ajuste: 7.7 kgf/cm², Diâmetro: 1/2"x1", Diâmetro do orifício: N/C, Tipo: pilotada, Cor: preto, Fluido: água, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	16
150	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Controle	TAG: VC-017, TAG DO VASO: VP-LT:017, Fabricante: Flowserve, Modelo: F5680, Número de série: 987654323, Pressão de ajuste: 9.2 kgf/cm², Diâmetro: 1"x1 1/2", Diâmetro do orifício: N/C, Tipo: convencional, Cor: laranja, Fluido: ar comprimido, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	17
151	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Segurança	TAG: PSV-018, TAG DO VASO: VP-LT:018, Fabricante: Emerson, Modelo: E1237, Número de série: 678901236, Pressão de ajuste: 10.2 kgf/cm², Diâmetro: 2"x2 1/2", Diâmetro do orifício: N/C, Tipo: convencional, Cor: alumínio, Fluido: vapor, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	18
152	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Alívio	TAG: VA-019, TAG DO VASO: VP-LT:019, Fabricante: Emerson, Modelo: E5679, Número de série: 876543211, Pressão de ajuste: 7.8 kgf/cm², Diâmetro: 1"x1", Diâmetro do orifício: N/C, Tipo: pilotada, Cor: azul, Fluido: vapor, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	19
153	2024-07-15 22:53:49.521-03	2024-07-16 01:19:03.774-03	Válvula de Controle	TAG: VC-020, TAG DO VASO: VP-LT:020, Fabricante: Flowserve, Modelo: F5681, Número de série: 987654324, Pressão de ajuste: 9.3 kgf/cm², Diâmetro: 1"x1 1/2", Diâmetro do orifício: N/C, Tipo: convencional, Cor: laranja, Fluido: ar comprimido, Vazão: N/C, Contra-pressão: 0, Temperatura de operação: 0	20
\.


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionarios (id, name, email, role, "createdAt", "updatedAt") FROM stdin;
5	Carlos Silva	carlos.silva@equipmanage.com	Técnico em Instrumentação	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
6	Maria Oliveira	maria.oliveira@equipmanage.com	Mecânica de Válvulas	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
7	João Souza	joao.souza@equipmanage.com	Técnico de Calibração	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
8	Ana Pereira	ana.pereira@equipmanage.com	Engenheira de Manutenção	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
9	Paulo Lima	paulo.lima@equipmanage.com	Técnico Mecânico	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
10	Juliana Alves	juliana.alves@equipmanage.com	Especialista em Válvulas	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
11	Roberto Costa	roberto.costa@equipmanage.com	Técnico em Automação	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
12	Patrícia Fernandes	patricia.fernandes@equipmanage.com	Engenheira de Processos	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
13	Fernando Santos	fernando.santos@equipmanage.com	Técnico de Processos	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
14	Luciana Melo	luciana.melo@equipmanage.com	Supervisora de Manutenção	2024-07-16 12:00:00-03	2024-07-16 12:00:00-03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, role, password) FROM stdin;
29	Usuario 1	usuario@teste.com	\N	\N
30	Test User	test@example.com	user_role	$2b$10$uDIHmb6oCuS1D3u6Vi7Lv.wdvlZC85k9nzI/bXnyuvMUggJ7V9ULy
\.


--
-- Name: Certificados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Certificados_id_seq"', 1, false);


--
-- Name: Clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clientes_id_seq"', 59, true);


--
-- Name: Funcionarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Funcionarios_id_seq"', 14, true);


--
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 1, false);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, false);


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: certificados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certificados_id_seq', 40, true);


--
-- Name: equipamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipamentos_id_seq', 153, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 30, true);


--
-- Name: Certificados Certificados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Certificados"
    ADD CONSTRAINT "Certificados_pkey" PRIMARY KEY (id);


--
-- Name: clientes Clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT "Clientes_pkey" PRIMARY KEY (id);


--
-- Name: funcionarios Funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT "Funcionarios_pkey" PRIMARY KEY (id);


--
-- Name: Roles Roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);


--
-- Name: Roles Roles_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key1" UNIQUE (name);


--
-- Name: Roles Roles_name_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key10" UNIQUE (name);


--
-- Name: Roles Roles_name_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key11" UNIQUE (name);


--
-- Name: Roles Roles_name_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key12" UNIQUE (name);


--
-- Name: Roles Roles_name_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key13" UNIQUE (name);


--
-- Name: Roles Roles_name_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key14" UNIQUE (name);


--
-- Name: Roles Roles_name_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key15" UNIQUE (name);


--
-- Name: Roles Roles_name_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key16" UNIQUE (name);


--
-- Name: Roles Roles_name_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key17" UNIQUE (name);


--
-- Name: Roles Roles_name_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key18" UNIQUE (name);


--
-- Name: Roles Roles_name_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key19" UNIQUE (name);


--
-- Name: Roles Roles_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key2" UNIQUE (name);


--
-- Name: Roles Roles_name_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key20" UNIQUE (name);


--
-- Name: Roles Roles_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key3" UNIQUE (name);


--
-- Name: Roles Roles_name_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key4" UNIQUE (name);


--
-- Name: Roles Roles_name_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key5" UNIQUE (name);


--
-- Name: Roles Roles_name_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key6" UNIQUE (name);


--
-- Name: Roles Roles_name_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key7" UNIQUE (name);


--
-- Name: Roles Roles_name_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key8" UNIQUE (name);


--
-- Name: Roles Roles_name_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key9" UNIQUE (name);


--
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key1" UNIQUE (email);


--
-- Name: Users Users_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key10" UNIQUE (email);


--
-- Name: Users Users_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key11" UNIQUE (email);


--
-- Name: Users Users_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key12" UNIQUE (email);


--
-- Name: Users Users_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key13" UNIQUE (email);


--
-- Name: Users Users_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key14" UNIQUE (email);


--
-- Name: Users Users_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key15" UNIQUE (email);


--
-- Name: Users Users_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key16" UNIQUE (email);


--
-- Name: Users Users_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key17" UNIQUE (email);


--
-- Name: Users Users_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key18" UNIQUE (email);


--
-- Name: Users Users_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key19" UNIQUE (email);


--
-- Name: Users Users_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key2" UNIQUE (email);


--
-- Name: Users Users_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key20" UNIQUE (email);


--
-- Name: Users Users_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key21" UNIQUE (email);


--
-- Name: Users Users_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key22" UNIQUE (email);


--
-- Name: Users Users_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key3" UNIQUE (email);


--
-- Name: Users Users_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key4" UNIQUE (email);


--
-- Name: Users Users_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key5" UNIQUE (email);


--
-- Name: Users Users_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key6" UNIQUE (email);


--
-- Name: Users Users_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key7" UNIQUE (email);


--
-- Name: Users Users_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key8" UNIQUE (email);


--
-- Name: Users Users_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key9" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- Name: admins admins_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key1 UNIQUE (email);


--
-- Name: admins admins_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key10 UNIQUE (email);


--
-- Name: admins admins_email_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key100 UNIQUE (email);


--
-- Name: admins admins_email_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key101 UNIQUE (email);


--
-- Name: admins admins_email_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key102 UNIQUE (email);


--
-- Name: admins admins_email_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key103 UNIQUE (email);


--
-- Name: admins admins_email_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key104 UNIQUE (email);


--
-- Name: admins admins_email_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key105 UNIQUE (email);


--
-- Name: admins admins_email_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key106 UNIQUE (email);


--
-- Name: admins admins_email_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key107 UNIQUE (email);


--
-- Name: admins admins_email_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key108 UNIQUE (email);


--
-- Name: admins admins_email_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key109 UNIQUE (email);


--
-- Name: admins admins_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key11 UNIQUE (email);


--
-- Name: admins admins_email_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key110 UNIQUE (email);


--
-- Name: admins admins_email_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key111 UNIQUE (email);


--
-- Name: admins admins_email_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key112 UNIQUE (email);


--
-- Name: admins admins_email_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key113 UNIQUE (email);


--
-- Name: admins admins_email_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key114 UNIQUE (email);


--
-- Name: admins admins_email_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key115 UNIQUE (email);


--
-- Name: admins admins_email_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key116 UNIQUE (email);


--
-- Name: admins admins_email_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key117 UNIQUE (email);


--
-- Name: admins admins_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key12 UNIQUE (email);


--
-- Name: admins admins_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key13 UNIQUE (email);


--
-- Name: admins admins_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key14 UNIQUE (email);


--
-- Name: admins admins_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key15 UNIQUE (email);


--
-- Name: admins admins_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key16 UNIQUE (email);


--
-- Name: admins admins_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key17 UNIQUE (email);


--
-- Name: admins admins_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key18 UNIQUE (email);


--
-- Name: admins admins_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key19 UNIQUE (email);


--
-- Name: admins admins_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key2 UNIQUE (email);


--
-- Name: admins admins_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key20 UNIQUE (email);


--
-- Name: admins admins_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key21 UNIQUE (email);


--
-- Name: admins admins_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key22 UNIQUE (email);


--
-- Name: admins admins_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key23 UNIQUE (email);


--
-- Name: admins admins_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key24 UNIQUE (email);


--
-- Name: admins admins_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key25 UNIQUE (email);


--
-- Name: admins admins_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key26 UNIQUE (email);


--
-- Name: admins admins_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key27 UNIQUE (email);


--
-- Name: admins admins_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key28 UNIQUE (email);


--
-- Name: admins admins_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key29 UNIQUE (email);


--
-- Name: admins admins_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key3 UNIQUE (email);


--
-- Name: admins admins_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key30 UNIQUE (email);


--
-- Name: admins admins_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key31 UNIQUE (email);


--
-- Name: admins admins_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key32 UNIQUE (email);


--
-- Name: admins admins_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key33 UNIQUE (email);


--
-- Name: admins admins_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key34 UNIQUE (email);


--
-- Name: admins admins_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key35 UNIQUE (email);


--
-- Name: admins admins_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key36 UNIQUE (email);


--
-- Name: admins admins_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key37 UNIQUE (email);


--
-- Name: admins admins_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key38 UNIQUE (email);


--
-- Name: admins admins_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key39 UNIQUE (email);


--
-- Name: admins admins_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key4 UNIQUE (email);


--
-- Name: admins admins_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key40 UNIQUE (email);


--
-- Name: admins admins_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key41 UNIQUE (email);


--
-- Name: admins admins_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key42 UNIQUE (email);


--
-- Name: admins admins_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key43 UNIQUE (email);


--
-- Name: admins admins_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key44 UNIQUE (email);


--
-- Name: admins admins_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key45 UNIQUE (email);


--
-- Name: admins admins_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key46 UNIQUE (email);


--
-- Name: admins admins_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key47 UNIQUE (email);


--
-- Name: admins admins_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key48 UNIQUE (email);


--
-- Name: admins admins_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key49 UNIQUE (email);


--
-- Name: admins admins_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key5 UNIQUE (email);


--
-- Name: admins admins_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key50 UNIQUE (email);


--
-- Name: admins admins_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key51 UNIQUE (email);


--
-- Name: admins admins_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key52 UNIQUE (email);


--
-- Name: admins admins_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key53 UNIQUE (email);


--
-- Name: admins admins_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key54 UNIQUE (email);


--
-- Name: admins admins_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key55 UNIQUE (email);


--
-- Name: admins admins_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key56 UNIQUE (email);


--
-- Name: admins admins_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key57 UNIQUE (email);


--
-- Name: admins admins_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key58 UNIQUE (email);


--
-- Name: admins admins_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key59 UNIQUE (email);


--
-- Name: admins admins_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key6 UNIQUE (email);


--
-- Name: admins admins_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key60 UNIQUE (email);


--
-- Name: admins admins_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key61 UNIQUE (email);


--
-- Name: admins admins_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key62 UNIQUE (email);


--
-- Name: admins admins_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key63 UNIQUE (email);


--
-- Name: admins admins_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key64 UNIQUE (email);


--
-- Name: admins admins_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key65 UNIQUE (email);


--
-- Name: admins admins_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key66 UNIQUE (email);


--
-- Name: admins admins_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key67 UNIQUE (email);


--
-- Name: admins admins_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key68 UNIQUE (email);


--
-- Name: admins admins_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key69 UNIQUE (email);


--
-- Name: admins admins_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key7 UNIQUE (email);


--
-- Name: admins admins_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key70 UNIQUE (email);


--
-- Name: admins admins_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key71 UNIQUE (email);


--
-- Name: admins admins_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key72 UNIQUE (email);


--
-- Name: admins admins_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key73 UNIQUE (email);


--
-- Name: admins admins_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key74 UNIQUE (email);


--
-- Name: admins admins_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key75 UNIQUE (email);


--
-- Name: admins admins_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key76 UNIQUE (email);


--
-- Name: admins admins_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key77 UNIQUE (email);


--
-- Name: admins admins_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key78 UNIQUE (email);


--
-- Name: admins admins_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key79 UNIQUE (email);


--
-- Name: admins admins_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key8 UNIQUE (email);


--
-- Name: admins admins_email_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key80 UNIQUE (email);


--
-- Name: admins admins_email_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key81 UNIQUE (email);


--
-- Name: admins admins_email_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key82 UNIQUE (email);


--
-- Name: admins admins_email_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key83 UNIQUE (email);


--
-- Name: admins admins_email_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key84 UNIQUE (email);


--
-- Name: admins admins_email_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key85 UNIQUE (email);


--
-- Name: admins admins_email_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key86 UNIQUE (email);


--
-- Name: admins admins_email_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key87 UNIQUE (email);


--
-- Name: admins admins_email_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key88 UNIQUE (email);


--
-- Name: admins admins_email_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key89 UNIQUE (email);


--
-- Name: admins admins_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key9 UNIQUE (email);


--
-- Name: admins admins_email_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key90 UNIQUE (email);


--
-- Name: admins admins_email_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key91 UNIQUE (email);


--
-- Name: admins admins_email_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key92 UNIQUE (email);


--
-- Name: admins admins_email_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key93 UNIQUE (email);


--
-- Name: admins admins_email_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key94 UNIQUE (email);


--
-- Name: admins admins_email_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key95 UNIQUE (email);


--
-- Name: admins admins_email_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key96 UNIQUE (email);


--
-- Name: admins admins_email_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key97 UNIQUE (email);


--
-- Name: admins admins_email_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key98 UNIQUE (email);


--
-- Name: admins admins_email_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key99 UNIQUE (email);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: certificados certificados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificados
    ADD CONSTRAINT certificados_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- Name: clientes clientes_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key1 UNIQUE (email);


--
-- Name: clientes clientes_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key10 UNIQUE (email);


--
-- Name: clientes clientes_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key11 UNIQUE (email);


--
-- Name: clientes clientes_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key12 UNIQUE (email);


--
-- Name: clientes clientes_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key13 UNIQUE (email);


--
-- Name: clientes clientes_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key14 UNIQUE (email);


--
-- Name: clientes clientes_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key15 UNIQUE (email);


--
-- Name: clientes clientes_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key16 UNIQUE (email);


--
-- Name: clientes clientes_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key17 UNIQUE (email);


--
-- Name: clientes clientes_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key18 UNIQUE (email);


--
-- Name: clientes clientes_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key19 UNIQUE (email);


--
-- Name: clientes clientes_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key2 UNIQUE (email);


--
-- Name: clientes clientes_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key20 UNIQUE (email);


--
-- Name: clientes clientes_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key21 UNIQUE (email);


--
-- Name: clientes clientes_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key22 UNIQUE (email);


--
-- Name: clientes clientes_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key23 UNIQUE (email);


--
-- Name: clientes clientes_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key24 UNIQUE (email);


--
-- Name: clientes clientes_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key25 UNIQUE (email);


--
-- Name: clientes clientes_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key26 UNIQUE (email);


--
-- Name: clientes clientes_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key27 UNIQUE (email);


--
-- Name: clientes clientes_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key28 UNIQUE (email);


--
-- Name: clientes clientes_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key29 UNIQUE (email);


--
-- Name: clientes clientes_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key3 UNIQUE (email);


--
-- Name: clientes clientes_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key30 UNIQUE (email);


--
-- Name: clientes clientes_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key31 UNIQUE (email);


--
-- Name: clientes clientes_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key32 UNIQUE (email);


--
-- Name: clientes clientes_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key33 UNIQUE (email);


--
-- Name: clientes clientes_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key34 UNIQUE (email);


--
-- Name: clientes clientes_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key35 UNIQUE (email);


--
-- Name: clientes clientes_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key36 UNIQUE (email);


--
-- Name: clientes clientes_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key37 UNIQUE (email);


--
-- Name: clientes clientes_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key38 UNIQUE (email);


--
-- Name: clientes clientes_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key39 UNIQUE (email);


--
-- Name: clientes clientes_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key4 UNIQUE (email);


--
-- Name: clientes clientes_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key40 UNIQUE (email);


--
-- Name: clientes clientes_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key41 UNIQUE (email);


--
-- Name: clientes clientes_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key42 UNIQUE (email);


--
-- Name: clientes clientes_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key43 UNIQUE (email);


--
-- Name: clientes clientes_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key44 UNIQUE (email);


--
-- Name: clientes clientes_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key45 UNIQUE (email);


--
-- Name: clientes clientes_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key5 UNIQUE (email);


--
-- Name: clientes clientes_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key6 UNIQUE (email);


--
-- Name: clientes clientes_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key7 UNIQUE (email);


--
-- Name: clientes clientes_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key8 UNIQUE (email);


--
-- Name: clientes clientes_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key9 UNIQUE (email);


--
-- Name: equipamentos equipamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamentos
    ADD CONSTRAINT equipamentos_pkey PRIMARY KEY (id);


--
-- Name: funcionarios funcionarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key1 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key10 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key100 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key101 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key102 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key103 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key104 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key105 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key106 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key107 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key108 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key109 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key11 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key110 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key111 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key112 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key113 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key114 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key115 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key116 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key117 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key118 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key119 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key12 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key120 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key121 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key122 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key123 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key124 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key125 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key126 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key127 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key128 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key129 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key13 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key130 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key131 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key132 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key14 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key15 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key16 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key17 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key18 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key19 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key2 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key20 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key21 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key22 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key23 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key24 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key25 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key26 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key27 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key28 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key29 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key3 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key30 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key31 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key32 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key33 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key34 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key35 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key36 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key37 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key38 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key39 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key4 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key40 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key41 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key42 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key43 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key44 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key45 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key46 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key47 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key48 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key49 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key5 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key50 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key51 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key52 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key53 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key54 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key55 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key56 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key57 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key58 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key59 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key6 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key60 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key61 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key62 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key63 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key64 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key65 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key66 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key67 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key68 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key69 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key7 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key70 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key71 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key72 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key73 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key74 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key75 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key76 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key77 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key78 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key79 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key8 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key80 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key81 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key82 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key83 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key84 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key85 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key86 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key87 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key88 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key89 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key9 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key90 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key91 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key92 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key93 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key94 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key95 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key96 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key97 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key98 UNIQUE (email);


--
-- Name: funcionarios funcionarios_email_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key99 UNIQUE (email);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- Name: users users_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);


--
-- Name: users users_email_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key100 UNIQUE (email);


--
-- Name: users users_email_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key101 UNIQUE (email);


--
-- Name: users users_email_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key102 UNIQUE (email);


--
-- Name: users users_email_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key103 UNIQUE (email);


--
-- Name: users users_email_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key104 UNIQUE (email);


--
-- Name: users users_email_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key105 UNIQUE (email);


--
-- Name: users users_email_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key106 UNIQUE (email);


--
-- Name: users users_email_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key107 UNIQUE (email);


--
-- Name: users users_email_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key108 UNIQUE (email);


--
-- Name: users users_email_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key109 UNIQUE (email);


--
-- Name: users users_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);


--
-- Name: users users_email_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key110 UNIQUE (email);


--
-- Name: users users_email_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key111 UNIQUE (email);


--
-- Name: users users_email_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key112 UNIQUE (email);


--
-- Name: users users_email_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key113 UNIQUE (email);


--
-- Name: users users_email_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key114 UNIQUE (email);


--
-- Name: users users_email_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key115 UNIQUE (email);


--
-- Name: users users_email_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key116 UNIQUE (email);


--
-- Name: users users_email_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key117 UNIQUE (email);


--
-- Name: users users_email_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key118 UNIQUE (email);


--
-- Name: users users_email_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key119 UNIQUE (email);


--
-- Name: users users_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);


--
-- Name: users users_email_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key120 UNIQUE (email);


--
-- Name: users users_email_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key121 UNIQUE (email);


--
-- Name: users users_email_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key122 UNIQUE (email);


--
-- Name: users users_email_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key123 UNIQUE (email);


--
-- Name: users users_email_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key124 UNIQUE (email);


--
-- Name: users users_email_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key125 UNIQUE (email);


--
-- Name: users users_email_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key126 UNIQUE (email);


--
-- Name: users users_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);


--
-- Name: users users_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);


--
-- Name: users users_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);


--
-- Name: users users_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);


--
-- Name: users users_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);


--
-- Name: users users_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);


--
-- Name: users users_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);


--
-- Name: users users_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);


--
-- Name: users users_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);


--
-- Name: users users_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);


--
-- Name: users users_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);


--
-- Name: users users_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);


--
-- Name: users users_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);


--
-- Name: users users_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);


--
-- Name: users users_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);


--
-- Name: users users_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);


--
-- Name: users users_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);


--
-- Name: users users_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);


--
-- Name: users users_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);


--
-- Name: users users_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);


--
-- Name: users users_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);


--
-- Name: users users_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);


--
-- Name: users users_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);


--
-- Name: users users_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);


--
-- Name: users users_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);


--
-- Name: users users_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);


--
-- Name: users users_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);


--
-- Name: users users_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);


--
-- Name: users users_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);


--
-- Name: users users_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);


--
-- Name: users users_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);


--
-- Name: users users_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);


--
-- Name: users users_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);


--
-- Name: users users_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);


--
-- Name: users users_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);


--
-- Name: users users_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);


--
-- Name: users users_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);


--
-- Name: users users_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);


--
-- Name: users users_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);


--
-- Name: users users_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);


--
-- Name: users users_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);


--
-- Name: users users_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);


--
-- Name: users users_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);


--
-- Name: users users_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);


--
-- Name: users users_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);


--
-- Name: users users_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);


--
-- Name: users users_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);


--
-- Name: users users_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);


--
-- Name: users users_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);


--
-- Name: users users_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);


--
-- Name: users users_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);


--
-- Name: users users_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);


--
-- Name: users users_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);


--
-- Name: users users_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);


--
-- Name: users users_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);


--
-- Name: users users_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);


--
-- Name: users users_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);


--
-- Name: users users_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);


--
-- Name: users users_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);


--
-- Name: users users_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);


--
-- Name: users users_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);


--
-- Name: users users_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);


--
-- Name: users users_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);


--
-- Name: users users_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);


--
-- Name: users users_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);


--
-- Name: users users_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);


--
-- Name: users users_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);


--
-- Name: users users_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);


--
-- Name: users users_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);


--
-- Name: users users_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);


--
-- Name: users users_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);


--
-- Name: users users_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);


--
-- Name: users users_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);


--
-- Name: users users_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);


--
-- Name: users users_email_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);


--
-- Name: users users_email_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);


--
-- Name: users users_email_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);


--
-- Name: users users_email_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);


--
-- Name: users users_email_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);


--
-- Name: users users_email_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);


--
-- Name: users users_email_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);


--
-- Name: users users_email_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);


--
-- Name: users users_email_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);


--
-- Name: users users_email_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);


--
-- Name: users users_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);


--
-- Name: users users_email_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);


--
-- Name: users users_email_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);


--
-- Name: users users_email_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);


--
-- Name: users users_email_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);


--
-- Name: users users_email_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);


--
-- Name: users users_email_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);


--
-- Name: users users_email_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);


--
-- Name: users users_email_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);


--
-- Name: users users_email_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);


--
-- Name: users users_email_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key99 UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: Certificados Certificados_clienteId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Certificados"
    ADD CONSTRAINT "Certificados_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES public.clientes(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Certificados Certificados_equipamentoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Certificados"
    ADD CONSTRAINT "Certificados_equipamentoId_fkey" FOREIGN KEY ("equipamentoId") REFERENCES public.equipamentos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Certificados Certificados_funcionarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Certificados"
    ADD CONSTRAINT "Certificados_funcionarioId_fkey" FOREIGN KEY ("funcionarioId") REFERENCES public.funcionarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Users Users_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE;


--
-- Name: certificados certificados_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificados
    ADD CONSTRAINT certificados_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: certificados certificados_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificados
    ADD CONSTRAINT certificados_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES public.equipamentos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: certificados certificados_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificados
    ADD CONSTRAINT certificados_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES public.funcionarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: equipamentos equipamentos_clienteId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamentos
    ADD CONSTRAINT "equipamentos_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES public.clientes(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

