--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO postgres;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_comment_flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO postgres;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_comment_flags_id_seq OWNED BY public.django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_comments (
    id integer NOT NULL,
    object_pk text NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.django_comments OWNER TO postgres;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO postgres;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_comments_id_seq OWNED BY public.django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: targi_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_article (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    created timestamp with time zone NOT NULL,
    published timestamp with time zone,
    slug character varying(200) NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.targi_article OWNER TO postgres;

--
-- Name: targi_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_article_id_seq OWNER TO postgres;

--
-- Name: targi_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_article_id_seq OWNED BY public.targi_article.id;


--
-- Name: targi_market; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_market (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    slug character varying(64) NOT NULL,
    type integer NOT NULL,
    administrator character varying(255) NOT NULL,
    address character varying(128) NOT NULL,
    geolocation character varying(64) NOT NULL,
    is_active boolean NOT NULL,
    cured_area integer NOT NULL,
    is_indoor integer NOT NULL,
    handicaps integer NOT NULL,
    is_toilet boolean NOT NULL,
    public_transport boolean NOT NULL,
    taxi_range boolean NOT NULL,
    parking integer NOT NULL,
    cycle_places boolean NOT NULL,
    radio_info boolean NOT NULL,
    atm_nearby boolean NOT NULL,
    date_added timestamp with time zone NOT NULL,
    description text NOT NULL,
    town_city_id integer NOT NULL,
    photo_1 character varying(100)
);


ALTER TABLE public.targi_market OWNER TO postgres;

--
-- Name: targi_market_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_market_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_market_id_seq OWNER TO postgres;

--
-- Name: targi_market_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_market_id_seq OWNED BY public.targi_market.id;


--
-- Name: targi_market_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_market_products (
    id integer NOT NULL,
    market_id integer NOT NULL,
    products_id integer NOT NULL
);


ALTER TABLE public.targi_market_products OWNER TO postgres;

--
-- Name: targi_market_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_market_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_market_products_id_seq OWNER TO postgres;

--
-- Name: targi_market_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_market_products_id_seq OWNED BY public.targi_market_products.id;


--
-- Name: targi_photoalbum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_photoalbum (
    id integer NOT NULL,
    photo character varying(100),
    uploaded timestamp with time zone NOT NULL,
    market_id integer NOT NULL
);


ALTER TABLE public.targi_photoalbum OWNER TO postgres;

--
-- Name: targi_photoalbum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_photoalbum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_photoalbum_id_seq OWNER TO postgres;

--
-- Name: targi_photoalbum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_photoalbum_id_seq OWNED BY public.targi_photoalbum.id;


--
-- Name: targi_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_products (
    id integer NOT NULL,
    category character varying(32) NOT NULL,
    icon character varying(100)
);


ALTER TABLE public.targi_products OWNER TO postgres;

--
-- Name: targi_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_products_id_seq OWNER TO postgres;

--
-- Name: targi_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_products_id_seq OWNED BY public.targi_products.id;


--
-- Name: targi_townandcities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_townandcities (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    province character varying(2) NOT NULL
);


ALTER TABLE public.targi_townandcities OWNER TO postgres;

--
-- Name: targi_townandcities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_townandcities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_townandcities_id_seq OWNER TO postgres;

--
-- Name: targi_townandcities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_townandcities_id_seq OWNED BY public.targi_townandcities.id;


--
-- Name: targi_uploadfile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_uploadfile (
    id integer NOT NULL,
    file character varying(100),
    uploaded timestamp with time zone NOT NULL
);


ALTER TABLE public.targi_uploadfile OWNER TO postgres;

--
-- Name: targi_uploadfile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_uploadfile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_uploadfile_id_seq OWNER TO postgres;

--
-- Name: targi_uploadfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_uploadfile_id_seq OWNED BY public.targi_uploadfile.id;


--
-- Name: targi_userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targi_userprofile (
    id integer NOT NULL,
    date_of_birth date,
    description character varying(255) NOT NULL,
    photo character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE public.targi_userprofile OWNER TO postgres;

--
-- Name: targi_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targi_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targi_userprofile_id_seq OWNER TO postgres;

--
-- Name: targi_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targi_userprofile_id_seq OWNED BY public.targi_userprofile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_comment_flags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comment_flags ALTER COLUMN id SET DEFAULT nextval('public.django_comment_flags_id_seq'::regclass);


--
-- Name: django_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comments ALTER COLUMN id SET DEFAULT nextval('public.django_comments_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: targi_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_article ALTER COLUMN id SET DEFAULT nextval('public.targi_article_id_seq'::regclass);


--
-- Name: targi_market id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market ALTER COLUMN id SET DEFAULT nextval('public.targi_market_id_seq'::regclass);


--
-- Name: targi_market_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market_products ALTER COLUMN id SET DEFAULT nextval('public.targi_market_products_id_seq'::regclass);


--
-- Name: targi_photoalbum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_photoalbum ALTER COLUMN id SET DEFAULT nextval('public.targi_photoalbum_id_seq'::regclass);


--
-- Name: targi_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_products ALTER COLUMN id SET DEFAULT nextval('public.targi_products_id_seq'::regclass);


--
-- Name: targi_townandcities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_townandcities ALTER COLUMN id SET DEFAULT nextval('public.targi_townandcities_id_seq'::regclass);


--
-- Name: targi_uploadfile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_uploadfile ALTER COLUMN id SET DEFAULT nextval('public.targi_uploadfile_id_seq'::regclass);


--
-- Name: targi_userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_userprofile ALTER COLUMN id SET DEFAULT nextval('public.targi_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add comment	8	add_comment
30	Can change comment	8	change_comment
31	Can delete comment	8	delete_comment
32	Can view comment	8	view_comment
33	Can moderate comments	8	can_moderate
34	Can add comment flag	9	add_commentflag
35	Can change comment flag	9	change_commentflag
36	Can delete comment flag	9	delete_commentflag
37	Can view comment flag	9	view_commentflag
38	Can add town and cities	10	add_townandcities
39	Can change town and cities	10	change_townandcities
40	Can delete town and cities	10	delete_townandcities
41	Can view town and cities	10	view_townandcities
42	Can add products	11	add_products
43	Can change products	11	change_products
44	Can delete products	11	delete_products
45	Can view products	11	view_products
46	Can add photo album	12	add_photoalbum
47	Can change photo album	12	change_photoalbum
48	Can delete photo album	12	delete_photoalbum
49	Can view photo album	12	view_photoalbum
50	Can add market	13	add_market
51	Can change market	13	change_market
52	Can delete market	13	delete_market
53	Can view market	13	view_market
54	Can add article	14	add_article
55	Can change article	14	change_article
56	Can delete article	14	delete_article
57	Can view article	14	view_article
58	Can add upload file	15	add_uploadfile
59	Can change upload file	15	change_uploadfile
60	Can delete upload file	15	delete_uploadfile
61	Can view upload file	15	view_uploadfile
62	Can add user profile	16	add_userprofile
63	Can change user profile	16	change_userprofile
64	Can delete user profile	16	delete_userprofile
65	Can view user profile	16	view_userprofile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$8BJJN9Y8w2Sp$kfSDgWtlKh5S34HVnfnoLORalQ7yxJ05t+1L3cjrGQU=	2019-02-12 00:33:04.970725+01	t	grzegorz	Grzegorz	Sałaciński	salacinski.grzegorz@gmail.com	t	t	2019-01-31 18:34:00.33153+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-01-31 18:37:44.872289+01	1	Białystok	1	[{"added": {}}]	10	1
2	2019-01-31 18:37:56.659195+01	2	Dzierżoniów	1	[{"added": {}}]	10	1
3	2019-01-31 18:38:08.320495+01	3	Warszawa	1	[{"added": {}}]	10	1
4	2019-01-31 18:38:20.700063+01	4	Lublin	1	[{"added": {}}]	10	1
5	2019-01-31 18:39:24.743486+01	1	Article object (1)	1	[{"added": {}}]	14	1
6	2019-01-31 18:39:49.775102+01	2	Article object (2)	1	[{"added": {}}]	14	1
7	2019-01-31 18:40:51.329986+01	3	Article object (3)	1	[{"added": {}}]	14	1
8	2019-01-31 18:41:21.720337+01	4	Article object (4)	1	[{"added": {}}]	14	1
9	2019-01-31 18:41:57.925359+01	1	Tekstylia	1	[{"added": {}}]	11	1
10	2019-01-31 18:42:02.888812+01	2	Obuwie	1	[{"added": {}}]	11	1
11	2019-01-31 18:42:08.04397+01	3	Usługi	1	[{"added": {}}]	11	1
12	2019-01-31 18:42:14.209685+01	4	Owoce i warzywa	1	[{"added": {}}]	11	1
13	2019-01-31 18:42:21.968543+01	5	Nabiał	1	[{"added": {}}]	11	1
14	2019-01-31 18:42:26.809794+01	6	Mięso	1	[{"added": {}}]	11	1
15	2019-01-31 18:42:32.359718+01	7	Ryby	1	[{"added": {}}]	11	1
16	2019-01-31 18:42:38.879798+01	8	Artykuły spożywcze	1	[{"added": {}}]	11	1
17	2019-01-31 18:42:43.168985+01	9	Artykuły budowlane	1	[{"added": {}}]	11	1
18	2019-01-31 18:48:33.765543+01	1	Bazar Kawaleryjska, Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok	1	[{"added": {}}]	13	1
19	2019-01-31 18:49:57.93954+01	2	Bazar Jurowiecka, Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko n	1	[{"added": {}}]	13	1
20	2019-01-31 19:02:25.046139+01	3	Galeria Biała, Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku	2	[{"changed": {"fields": ["geolocation", "photo_1"]}}]	13	1
21	2019-02-01 17:28:43.320663+01	6	Galeria Zielone Wzgórza	2	[{"changed": {"fields": ["geolocation", "photo_1"]}}]	13	1
22	2019-02-01 17:29:31.944599+01	5	MADRO Centrum Handlowe	2	[{"changed": {"fields": ["geolocation", "photo_1"]}}]	13	1
23	2019-02-01 17:29:49.168213+01	4	Galeria Alfa	2	[{"changed": {"fields": ["geolocation", "photo_1"]}}]	13	1
24	2019-02-02 02:08:15.097639+01	6	Galeria Zielone Wzgórza	2	[{"changed": {"fields": ["address", "geolocation"]}}]	13	1
25	2019-02-08 12:27:49.925759+01	5	Bielsk Podlaski	1	[{"added": {}}]	10	1
26	2019-02-08 12:43:32.543763+01	20	UploadFile object (20)	3		15	1
27	2019-02-08 12:43:32.548138+01	19	UploadFile object (19)	3		15	1
28	2019-02-08 12:43:32.553437+01	18	UploadFile object (18)	3		15	1
29	2019-02-08 12:43:32.556403+01	17	UploadFile object (17)	3		15	1
30	2019-02-08 12:43:32.559344+01	16	UploadFile object (16)	3		15	1
31	2019-02-08 12:43:32.562204+01	15	UploadFile object (15)	3		15	1
32	2019-02-08 12:43:32.565069+01	14	UploadFile object (14)	3		15	1
33	2019-02-08 12:43:32.567901+01	13	UploadFile object (13)	3		15	1
34	2019-02-08 12:43:32.570866+01	12	UploadFile object (12)	3		15	1
35	2019-02-08 12:43:32.574174+01	11	UploadFile object (11)	3		15	1
36	2019-02-08 12:43:32.577357+01	10	UploadFile object (10)	3		15	1
37	2019-02-08 12:43:32.580021+01	9	UploadFile object (9)	3		15	1
38	2019-02-08 12:43:32.582712+01	8	UploadFile object (8)	3		15	1
39	2019-02-08 12:43:32.585382+01	7	UploadFile object (7)	3		15	1
40	2019-02-08 12:43:32.588096+01	6	UploadFile object (6)	3		15	1
41	2019-02-08 12:43:32.590798+01	5	UploadFile object (5)	3		15	1
42	2019-02-08 12:43:32.593921+01	4	UploadFile object (4)	3		15	1
43	2019-02-08 12:43:32.597008+01	3	UploadFile object (3)	3		15	1
44	2019-02-08 12:43:32.599635+01	2	UploadFile object (2)	3		15	1
45	2019-02-08 12:43:32.60239+01	1	UploadFile object (1)	3		15	1
46	2019-02-08 12:46:02.348145+01	21	forms/Formularz-targowisk-na-strone-bielsk-podlaski_V0iNqtf.docx	3		15	1
47	2019-02-08 18:11:58.438456+01	7	Targowisko Bielsk Podlaski	3		13	1
48	2019-02-08 18:14:29.227662+01	8	Targowisko Bielsk Podlaski	3		13	1
49	2019-02-08 20:02:00.423413+01	33	forms/Formularz-targowisk-na-strone-bielsk-podlaski_FREkx4e.docx	3		15	1
50	2019-02-08 20:02:00.42789+01	32	forms/Formularz-targowisk-na-strone-bielsk-podlaski_cBU2Gzo.docx	3		15	1
51	2019-02-08 20:02:00.431662+01	31	forms/Formularz-targowisk-na-strone-bielsk-podlaski_usb82IS.docx	3		15	1
52	2019-02-08 20:02:00.437272+01	30	forms/Formularz-targowisk-na-strone-bielsk-podlaski_n41vRdO.docx	3		15	1
53	2019-02-08 20:02:00.441114+01	29	forms/Formularz-targowisk-na-strone-bielsk-podlaski_TlP1qAv.docx	3		15	1
54	2019-02-08 20:02:00.444009+01	28	forms/Formularz-targowisk-na-strone-bielsk-podlaski_5FwkYoP.docx	3		15	1
55	2019-02-08 20:02:00.44677+01	27	forms/Formularz-targowisk-na-strone-bielsk-podlaski_AfsRkqQ.docx	3		15	1
56	2019-02-08 20:02:00.44958+01	26	forms/Formularz-targowisk-na-strone-bielsk-podlaski_oMZMj77.docx	3		15	1
57	2019-02-08 20:02:00.452405+01	25	forms/Formularz-targowisk-na-strone-bielsk-podlaski_PEMRXco.docx	3		15	1
58	2019-02-08 20:02:00.455264+01	24	forms/Formularz-targowisk-na-strone-bielsk-podlaski_2DNWFie.docx	3		15	1
59	2019-02-08 20:02:00.457996+01	23	forms/Formularz-targowisk-na-strone-bielsk-podlaski_HgLWDVZ.docx	3		15	1
60	2019-02-08 20:02:00.460803+01	22	forms/Formularz-targowisk-na-strone-bielsk-podlaski.docx	3		15	1
61	2019-02-11 21:59:23.57089+01	2	Klemson	3		4	1
62	2019-02-11 21:59:23.57573+01	3	Urszula2002	3		4	1
63	2019-02-11 22:01:45.257408+01	1	grzegorz	1	[{"added": {}}]	16	1
64	2019-02-12 00:33:22.904579+01	36	forms/Formularz-targowisk-na-strone-bielsk-podlaski_JeQpL86.docx	3		15	1
65	2019-02-12 00:33:22.909215+01	35		3		15	1
66	2019-02-12 00:33:22.913118+01	34	forms/Formularz-targowisk-na-strone-bielsk-podlaski_u1vOmOK.docx	3		15	1
\.


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_comment_flags (id, flag, flag_date, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_comments (id, object_pk, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed, content_type_id, site_id, user_id) FROM stdin;
1	4	Dominikson	salacinska.dominika2002@gmail.com		Ale zarąbiste	2019-02-06 21:53:31.961941+01	127.0.0.1	t	f	14	1	\N
2	1	Grzegorz	grz3q0rz@gmail.cpom		komentarz	2019-02-09 00:35:41.898333+01	127.0.0.1	t	f	14	1	\N
3	1	marcin	marcinmiller@o2.pl		Fajny artykuł	2019-02-09 22:46:31.10723+01	127.0.0.1	t	f	14	1	\N
4	9	MonikaS	zakrzeska_m@gmail.com		Już jest dawno nieczynne. Warto zaktualizować	2019-02-09 23:11:48.48532+01	127.0.0.1	t	f	13	1	\N
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	sites	site
6	contenttypes	contenttype
7	sessions	session
8	django_comments	comment
9	django_comments	commentflag
10	targi	townandcities
11	targi	products
12	targi	photoalbum
13	targi	market
14	targi	article
15	targi	uploadfile
16	targi	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-01-31 18:32:04.478816+01
2	auth	0001_initial	2019-01-31 18:32:04.619396+01
3	admin	0001_initial	2019-01-31 18:32:04.660702+01
4	admin	0002_logentry_remove_auto_add	2019-01-31 18:32:04.68147+01
5	admin	0003_logentry_add_action_flag_choices	2019-01-31 18:32:04.696134+01
6	contenttypes	0002_remove_content_type_name	2019-01-31 18:32:04.736725+01
7	auth	0002_alter_permission_name_max_length	2019-01-31 18:32:04.74815+01
8	auth	0003_alter_user_email_max_length	2019-01-31 18:32:04.772806+01
9	auth	0004_alter_user_username_opts	2019-01-31 18:32:04.786908+01
10	auth	0005_alter_user_last_login_null	2019-01-31 18:32:04.811697+01
11	auth	0006_require_contenttypes_0002	2019-01-31 18:32:04.81642+01
12	auth	0007_alter_validators_add_error_messages	2019-01-31 18:32:04.834389+01
13	auth	0008_alter_user_username_max_length	2019-01-31 18:32:04.855298+01
14	auth	0009_alter_user_last_name_max_length	2019-01-31 18:32:04.873939+01
15	sites	0001_initial	2019-01-31 18:32:04.89127+01
16	django_comments	0001_initial	2019-01-31 18:32:05.00409+01
17	django_comments	0002_update_user_email_field_length	2019-01-31 18:32:05.029693+01
18	django_comments	0003_add_submit_date_index	2019-01-31 18:32:05.055741+01
19	sessions	0001_initial	2019-01-31 18:32:05.080462+01
20	sites	0002_alter_domain_unique	2019-01-31 18:32:05.104422+01
21	targi	0001_initial	2019-01-31 18:37:07.106271+01
22	targi	0002_auto_20190201_1420	2019-02-01 15:21:20.046387+01
23	targi	0003_market_photo_1	2019-02-01 17:17:03.598647+01
24	targi	0004_uploadfile	2019-02-05 18:16:42.032416+01
25	targi	0005_auto_20190205_1715	2019-02-05 18:16:42.049466+01
26	targi	0006_auto_20190210_2208	2019-02-10 23:08:31.449758+01
27	targi	0007_userprofile	2019-02-11 20:36:30.288912+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ibn3ntr6uc6d2yttv5orh7fe6ondy96g	Mjc3OTBhZDc3OTA2ZThjNDljNjRmMDg2ZmM5YWIxZTRkNGI4ODI0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZDBlOTI3OTkzODU4NmVjZmE1MGJmODY2ZGYwZTIxOGUwNWZlYjc4In0=	2019-02-25 02:27:18.149507+01
j9r89783hy918rraa8q186ha4r5kz2ig	OTg1NmM2NGI3OTQ2ZmMwNTBkMzdhZTk2NzU4YzY2M2M1NGMxMWU1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NDhmZjdlZGJlMjU0M2YyNjYxMzhlZmY3MTUyZDRhZTE1OWI5N2IzIn0=	2019-02-26 00:33:04.974492+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: targi_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_article (id, title, text, created, published, slug, author_id) FROM stdin;
1	Nowe promocje na targowisku w Dzierżoniowie	Dostałem info, że poszły wszystkie deplojmenty, więc fakapu tym razem nie będzie. Generalnie wszystko okej, ale będziemy robić nowy iwent, także potrzebny będzie brejnstorm. Jesteśmy w dupie, bo mejle znowu padły, więc nie ma się co śmiać - musisz zrobić mały risercz. Chcesz urlop? W sezonie? O nie… wyłącz te głupie gify z kotami, ale wiesz, zawsze możesz złożyć wymówienie. Może wszystkich zwolnimy.\r\n\r\nCi informersi nigdy nic nie rozumieją. Niestety znowu zmienili hasła do drukarek, także będziemy jeszcze kombinować z suportem. Fakap. Brancz?\r\n\r\nFaken szit! Wiem, że jesteśmy wszyscy zawaleni robotą, ale ten tim nie daje sobie rady z tak prostymi czelendżami, dlatego musimy wyrobić plan na ten miesiąc. Ten dizajn jest jak kotlet schabowy po odgrzaniu w naszej mikrofali. Zapomnij o przerwie na lancz – serwer się zaciął, a Marta jest na urlopie, także nie ma co łejtować. Obczaj, że nie ma już żadnych bagów, dlatego będzie git.	2019-01-31 18:39:24.741392+01	2019-01-31 18:38:30+01	slug	1
2	Zmiana regulaminu wstawiania targowisk	Dostałem info, że apdejt bazy się powiódł, także piłeczka jest teraz po ich stronie. Mam dla ciebie czelendż: zapomnij o urlopach i podwyżkach, ale jak coś to wiesz, dalej mamy statusy poniżej rikłestowanego planu. Sfołarduj mi tego meila, bo musimy acziwnąć ten czelendż, dlatego musisz zrobić risercz. Czas na szybki fokus, czlendż jest taki pasjonujący, także musisz lecieć w delegację.\r\n\r\nNajwyżej zwolnimy cały tim. Chyba ostatnio mieliście spadek formy, dlatego musicie ogarnąć się i to jeszcze dzisiaj. Zresztą chyba czytałeś w njusleterze: trzeba to ASAP.\r\n\r\nDizajn musi urywać dupę, ale zostało tylko pół akceptu do dedlajnu, więc czekać nas będą ostre konsekwencje. Tak myślę, że słabo wam ostatnio czelendże wychodzą, także potrzeba wam porządnego kołczowania. Mimo, że mamy zwrotkę z testów, to fiksnęliśmy wszystkie defekty, więc będzie git.	2019-01-31 18:39:49.774059+01	2019-01-31 18:39:44+01	slug2	1
3	Nowe promocje na rynku w Białymstoku	Ciężka sprawa, bo serwer się zaciął, więc nie ma się co śmiać - ktoś się będzie musiał tym zająć. Chyba wylecisz na ulicę jak zwykły szczur. Uwaga, szybki fokus! Dizajn musi urywać dupę, ale kończy nam się czas, dlatego trzeba obrać nowy target. O, jaki… zapomnij o urlopach i podwyżkach, ale wiesz, jak się dobrze sfokusujesz, to może się uda. Nie podoba mi się.\r\n\r\nMoże nie będzie premii. Mamy badżety do ogarnięcia. Wiem, że jesteśmy wszyscy zawaleni robotą, ale nadszedł czas na mini brejnstorm, więc musimy wyrobić plan na ten miesiąc.\r\n\r\nKtoś dzisiaj idzie na burgera? I właśnie dlatego menedżment jest naszą najmocniejszą stroną, także jest dobrze. To będzie wyzwanie, bo musimy zrobić nowy dizajn, także nie jesteśmy w stanie tego ogarnąć bez szybkiego fokusa.	2019-01-31 18:40:51.328714+01	2019-01-31 18:40:46+01	burger	1
4	Wszysto poszło w piii..	Obczaj, że poszły wszystkie deplojmenty, więc sprawa jest jasna: jest jeszcze szansa na premie. Zbakapuj te pliki, bo jak na to zginie, to będzie fakap. Dostałem info, że fakap był po stronie drugiego timu, dlatego przeniosą mnie pewnie do innego projektu.\r\n\r\nSzejm, szejm, szejm. Sfołarduj mi tego meila, bo wszystkie gajdlajnsy szlag trafił, dlatego nie musi to być ASAP. Wyglądasz na zagubionego, zapomnij o urlopach i podwyżkach, ale jak coś to wiesz, może helpdesk ci pomoże. Miting odpada. Mamy info od koordynatora – fiksnęliśmy wszystkie defekty, więc będzie git. I właśnie dlatego to będzie lekkie jak czilałt w sobotę, więc fakap.\r\n\r\nMoże wszystkich zwolnimy. Zróbmy spontaniczny miting. Potrzebny będzie refresz dizajnu i to ASAP, bo żaden dizajn się nie spodobał, także potrzebny będzie brejnstorm. Fakap na całej linii: znowu zmienili hasła do drukarek, ale co tam – nie płacą nam za nadgodziny. Tak czy inaczej, mamy kola z biznesem o 15:00. Czelendż jak czelendż, każdy ma co robić, także odpalaj kompa i nie marudź, ale wiesz, musimy działać loł badżetowo. Ciężka sprawa, bo dostaliśmy zwrotkę od testingu, więc musicie zostać after ałers.	2019-01-31 18:41:21.71909+01	2019-01-31 18:41:16+01	omg	1
\.


--
-- Data for Name: targi_market; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_market (id, name, slug, type, administrator, address, geolocation, is_active, cured_area, is_indoor, handicaps, is_toilet, public_transport, taxi_range, parking, cycle_places, radio_info, atm_nearby, date_added, description, town_city_id, photo_1) FROM stdin;
1	Bazar Kawaleryjska	bazar-kawaleryjska	1	UM Białystok	Ul. Kawaleryjska 19/23	53.1363583,23.1623934	t	1	1	2	t	t	t	2	t	t	t	2019-01-31 18:48:33.75541+01	Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok Bazar Kawaleryjska białystok	1	\N
2	Bazar Jurowiecka	bazar-jurowiecka	1	UM Białystok	Jurowiecka 4	53.135777,23.1336078	f	3	3	3	f	t	t	1	t	f	t	2019-01-31 18:49:57.931052+01	Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku Targowisko nieczynne od 2008 roku	1	\N
3	Galeria Biała	galeria-biaa	7	UM Białystok	Czesława Miłosza 2	53.1056708,23.1415572	t	1	1	1	t	t	t	4	t	t	t	2019-01-31 18:51:41.40075+01	Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku Pierwsza galeria w Białymstoku	1	\N
5	MADRO Centrum Handlowe	madro-centrum-handlowe	7	UM Białystok	Ul. Kolejowa 14	53.135777,23.1336078	t	1	1	1	t	t	t	3	t	t	f	2019-02-01 12:36:40.855651+01	Test	1	photos/madro.jpg
4	Galeria Alfa	galeria-alfa	7	UM Białystok	ul. Świętojańska 15	53.1056708,23.1415572	t	1	1	1	t	t	t	3	t	t	t	2019-01-31 19:04:43.27474+01	Galeria Alfa Białystok Galeria Alfa Białystok Galeria Alfa Białystok Galeria Alfa Białystok Galeria Alfa Białystok Galeria Alfa Białystok	1	photos/indeks_nRAnvMU_h9dRLoh.jpeg
6	Galeria Zielone Wzgórza	galeria-zielone-wzgorza	7	UM Białystok	ul. Wrocławska 20, 15-660 Białystok	53.1239078,23.0964535	t	1	1	1	t	t	t	4	t	t	t	2019-02-01 15:58:37.269278+01	Galeria Zielone Wzgórza Białystok	1	photos/z21391991VGaleria-Zielone-Wzgorza.jpg
9	Targowisko Bielsk Podlaski	targowisko-bielsk-podlaski	2	Gmina Bielsk Podlaski	Ul. Mickiewicza 45	52.455,22.333	t	1	1	1	t	t	t	1	f	f	t	2019-02-08 18:15:17.719201+01	Targowisko w Bielsku podlaskim jest największym miejscem tego typu w południowej części województwa podlaskiego	5	photos/targowisko-dzierzoniow_6nI7kyy.jpg
\.


--
-- Data for Name: targi_market_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_market_products (id, market_id, products_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	8
6	2	1
7	2	2
8	2	4
9	3	1
10	3	2
11	3	3
12	3	4
13	4	3
14	5	3
15	6	2
16	6	3
25	9	2
26	9	3
27	9	4
28	9	5
\.


--
-- Data for Name: targi_photoalbum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_photoalbum (id, photo, uploaded, market_id) FROM stdin;
1	add_photos/zielone-wzgorza1.jpg	2019-02-01 15:58:37.285574+01	6
2	add_photos/zielone-wzgorza2.jpg	2019-02-01 15:58:37.291248+01	6
\.


--
-- Data for Name: targi_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_products (id, category, icon) FROM stdin;
1	Tekstylia	
2	Obuwie	
3	Usługi	
4	Owoce i warzywa	
5	Nabiał	
6	Mięso	
7	Ryby	
8	Artykuły spożywcze	
9	Artykuły budowlane	
\.


--
-- Data for Name: targi_townandcities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_townandcities (id, name, province) FROM stdin;
1	Białystok	PL
2	Dzierżoniów	DS
3	Warszawa	MZ
4	Lublin	LB
5	Bielsk Podlaski	PL
\.


--
-- Data for Name: targi_uploadfile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_uploadfile (id, file, uploaded) FROM stdin;
\.


--
-- Data for Name: targi_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targi_userprofile (id, date_of_birth, description, photo, user_id) FROM stdin;
1	1990-02-16	Opis		1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 65, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 66, true);


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_comment_flags_id_seq', 1, false);


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_comments_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: targi_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_article_id_seq', 4, true);


--
-- Name: targi_market_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_market_id_seq', 9, true);


--
-- Name: targi_market_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_market_products_id_seq', 28, true);


--
-- Name: targi_photoalbum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_photoalbum_id_seq', 2, true);


--
-- Name: targi_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_products_id_seq', 9, true);


--
-- Name: targi_townandcities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_townandcities_id_seq', 5, true);


--
-- Name: targi_uploadfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_uploadfile_id_seq', 36, true);


--
-- Name: targi_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targi_userprofile_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags django_comment_flags_user_id_comment_id_flag_537f77a7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_comment_id_flag_537f77a7_uniq UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: targi_article targi_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_article
    ADD CONSTRAINT targi_article_pkey PRIMARY KEY (id);


--
-- Name: targi_article targi_article_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_article
    ADD CONSTRAINT targi_article_slug_key UNIQUE (slug);


--
-- Name: targi_market targi_market_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market
    ADD CONSTRAINT targi_market_pkey PRIMARY KEY (id);


--
-- Name: targi_market_products targi_market_products_market_id_products_id_76ea73d1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market_products
    ADD CONSTRAINT targi_market_products_market_id_products_id_76ea73d1_uniq UNIQUE (market_id, products_id);


--
-- Name: targi_market_products targi_market_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market_products
    ADD CONSTRAINT targi_market_products_pkey PRIMARY KEY (id);


--
-- Name: targi_market targi_market_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market
    ADD CONSTRAINT targi_market_slug_key UNIQUE (slug);


--
-- Name: targi_photoalbum targi_photoalbum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_photoalbum
    ADD CONSTRAINT targi_photoalbum_pkey PRIMARY KEY (id);


--
-- Name: targi_products targi_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_products
    ADD CONSTRAINT targi_products_pkey PRIMARY KEY (id);


--
-- Name: targi_townandcities targi_townandcities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_townandcities
    ADD CONSTRAINT targi_townandcities_pkey PRIMARY KEY (id);


--
-- Name: targi_uploadfile targi_uploadfile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_uploadfile
    ADD CONSTRAINT targi_uploadfile_pkey PRIMARY KEY (id);


--
-- Name: targi_userprofile targi_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_userprofile
    ADD CONSTRAINT targi_userprofile_pkey PRIMARY KEY (id);


--
-- Name: targi_userprofile targi_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_userprofile
    ADD CONSTRAINT targi_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_comment_id_d8054933; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comment_flags_comment_id_d8054933 ON public.django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_flag_8b141fcb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comment_flags_flag_8b141fcb ON public.django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_flag_8b141fcb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comment_flags_flag_8b141fcb_like ON public.django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comment_flags_user_id_f3f81f0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comment_flags_user_id_f3f81f0a ON public.django_comment_flags USING btree (user_id);


--
-- Name: django_comments_content_type_id_c4afe962; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comments_content_type_id_c4afe962 ON public.django_comments USING btree (content_type_id);


--
-- Name: django_comments_site_id_9dcf666e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comments_site_id_9dcf666e ON public.django_comments USING btree (site_id);


--
-- Name: django_comments_submit_date_514ed2d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comments_submit_date_514ed2d9 ON public.django_comments USING btree (submit_date);


--
-- Name: django_comments_user_id_a0a440a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_comments_user_id_a0a440a1 ON public.django_comments USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: targi_article_author_id_065ceb6a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targi_article_author_id_065ceb6a ON public.targi_article USING btree (author_id);


--
-- Name: targi_article_slug_efab4368_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targi_article_slug_efab4368_like ON public.targi_article USING btree (slug varchar_pattern_ops);


--
-- Name: targi_market_products_market_id_dde8e53f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targi_market_products_market_id_dde8e53f ON public.targi_market_products USING btree (market_id);


--
-- Name: targi_market_products_products_id_245e0678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targi_market_products_products_id_245e0678 ON public.targi_market_products USING btree (products_id);


--
-- Name: targi_market_slug_eaa16884_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targi_market_slug_eaa16884_like ON public.targi_market USING btree (slug varchar_pattern_ops);


--
-- Name: targi_market_town_city_id_7c0dd28e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targi_market_town_city_id_7c0dd28e ON public.targi_market USING btree (town_city_id);


--
-- Name: targi_photoalbum_market_id_a2ee8e2a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targi_photoalbum_market_id_a2ee8e2a ON public.targi_photoalbum USING btree (market_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags django_comment_flags_comment_id_d8054933_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_d8054933_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES public.django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags django_comment_flags_user_id_f3f81f0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_f3f81f0a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_content_type_id_c4afe962_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_content_type_id_c4afe962_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_site_id_9dcf666e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_site_id_9dcf666e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments django_comments_user_id_a0a440a1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_user_id_a0a440a1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: targi_article targi_article_author_id_065ceb6a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_article
    ADD CONSTRAINT targi_article_author_id_065ceb6a_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: targi_market_products targi_market_products_market_id_dde8e53f_fk_targi_market_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market_products
    ADD CONSTRAINT targi_market_products_market_id_dde8e53f_fk_targi_market_id FOREIGN KEY (market_id) REFERENCES public.targi_market(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: targi_market_products targi_market_products_products_id_245e0678_fk_targi_products_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market_products
    ADD CONSTRAINT targi_market_products_products_id_245e0678_fk_targi_products_id FOREIGN KEY (products_id) REFERENCES public.targi_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: targi_market targi_market_town_city_id_7c0dd28e_fk_targi_townandcities_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_market
    ADD CONSTRAINT targi_market_town_city_id_7c0dd28e_fk_targi_townandcities_id FOREIGN KEY (town_city_id) REFERENCES public.targi_townandcities(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: targi_photoalbum targi_photoalbum_market_id_a2ee8e2a_fk_targi_market_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_photoalbum
    ADD CONSTRAINT targi_photoalbum_market_id_a2ee8e2a_fk_targi_market_id FOREIGN KEY (market_id) REFERENCES public.targi_market(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: targi_userprofile targi_userprofile_user_id_7cfe8c01_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targi_userprofile
    ADD CONSTRAINT targi_userprofile_user_id_7cfe8c01_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

