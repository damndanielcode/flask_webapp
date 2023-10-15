--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Artist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Artist" (
    id integer NOT NULL,
    name character varying,
    genres character varying(120),
    city character varying(120),
    state character varying(120),
    phone character varying(120),
    website character varying(500),
    facebook_link character varying(120),
    seeking_venue boolean,
    seeking_description character varying,
    image_link character varying(500)
);


--
-- Name: Artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Artist_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Artist_id_seq" OWNED BY public."Artist".id;


--
-- Name: Show; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Show" (
    id integer NOT NULL,
    venue_id integer NOT NULL,
    artist_id integer NOT NULL,
    start_time timestamp with time zone
);


--
-- Name: Show_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Show_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Show_id_seq" OWNED BY public."Show".id;


--
-- Name: Venue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Venue" (
    id integer NOT NULL,
    name character varying,
    genres character varying(120),
    address character varying(120),
    city character varying(120),
    state character varying(120),
    phone character varying(120),
    website character varying(500),
    facebook_link character varying(120),
    seeking_talent boolean,
    seeking_description character varying,
    image_link character varying(500)
);


--
-- Name: Venue_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Venue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Venue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Venue_id_seq" OWNED BY public."Venue".id;


--
-- Name: Artist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Artist" ALTER COLUMN id SET DEFAULT nextval('public."Artist_id_seq"'::regclass);


--
-- Name: Show id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Show" ALTER COLUMN id SET DEFAULT nextval('public."Show_id_seq"'::regclass);


--
-- Name: Venue id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Venue" ALTER COLUMN id SET DEFAULT nextval('public."Venue_id_seq"'::regclass);


--
-- Data for Name: Artist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Artist" (id, name, genres, city, state, phone, website, facebook_link, seeking_venue, seeking_description, image_link) FROM stdin;
4	Guns N Petals	Rock n Roll	San Francisco	CA	326-123-5000	https://www.gunsnpetalsband.com	https://www.facebook.com/GunsNPetals	t	Looking for shows to perform at in the San Francisco Bay Area!	https://images.unsplash.com/photo-1549213783-8284d0336c4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=80
5	Matt Quevedo	Jazz	New York	NY	300-400-5000	https://www.theduelingpianos.com	\N	f	\N	https://images.unsplash.com/photo-1495223153807-b916f75de8c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80
6	The Wild Sax Band	Jazz, Classical	San Francisco	CA	432-325-5432	\N	\N	f	\N	https://images.unsplash.com/photo-1558369981-f9ca78462e61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=794&q=80
\.


--
-- Data for Name: Show; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Show" (id, venue_id, artist_id, start_time) FROM stdin;
1	1	4	2023-07-05 21:00:00+00
2	2	5	2023-08-10 23:00:00+00
3	3	6	2023-09-01 20:00:00+00
4	1	4	2023-10-25 20:00:00+00
5	2	5	2023-11-15 20:00:00+00
\.


--
-- Data for Name: Venue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Venue" (id, name, genres, address, city, state, phone, website, facebook_link, seeking_talent, seeking_description, image_link) FROM stdin;
1	The Musical Hop	Jazz, Reggae, Swing, Classical, Folk	1015 Folsom Street	San Francisco	CA	123-123-1234	https://www.themusicalhop.com	https://www.facebook.com/TheMusicalHop	t	We are on the lookout for a local artist to play every two weeks. Please call us.	https://images.unsplash.com/photo-1543900694-133f37abaaa5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60
2	The Dueling Pianos Bar	Classical, R&B, Hip-Hop	335 Delancey Street	New York	NY	914-003-1132	https://www.theduelingpianos.com	https://www.facebook.com/theduelingpianos	f	\N	https://images.unsplash.com/photo-1497032205916-ac775f0649ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80
3	Park Square Live Music & Coffee	Rock n Roll, Jazz, Classical, Folk	34 Whiskey Moore Ave	San Francisco	CA	415-000-1234	https://www.parksquarelivemusicandcoffee.com	https://www.facebook.com/ParkSquareLiveMusicAndCoffee	f	\N	https://images.unsplash.com/photo-1485686531765-ba63b07845a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=747&q=80
\.


--
-- Name: Artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Artist_id_seq"', 6, true);


--
-- Name: Show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Show_id_seq"', 5, true);


--
-- Name: Venue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Venue_id_seq"', 3, true);


--
-- Name: Artist Artist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Artist"
    ADD CONSTRAINT "Artist_pkey" PRIMARY KEY (id);


--
-- Name: Show Show_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_pkey" PRIMARY KEY (id);


--
-- Name: Venue Venue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Venue"
    ADD CONSTRAINT "Venue_pkey" PRIMARY KEY (id);


--
-- Name: Show Show_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_artist_id_fkey" FOREIGN KEY (artist_id) REFERENCES public."Artist"(id);


--
-- Name: Show Show_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_venue_id_fkey" FOREIGN KEY (venue_id) REFERENCES public."Venue"(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;


--
-- PostgreSQL database dump complete
--

