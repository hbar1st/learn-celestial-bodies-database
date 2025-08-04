--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(25) NOT NULL,
    shape character varying(25) NOT NULL,
    diameter integer NOT NULL,
    type character varying(5)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: globular_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.globular_cluster (
    globular_cluster_id integer NOT NULL,
    name character varying(15) NOT NULL,
    magnitude numeric,
    notes text,
    galaxy_id integer
);


ALTER TABLE public.globular_cluster OWNER TO freecodecamp;

--
-- Name: globular_cluster_globular_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.globular_cluster_globular_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globular_cluster_globular_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: globular_cluster_globular_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.globular_cluster_globular_cluster_id_seq OWNED BY public.globular_cluster.globular_cluster_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(25) NOT NULL,
    mean_radius numeric,
    discovered_by character varying(75),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(25) NOT NULL,
    rings boolean NOT NULL,
    global_magnetic_field boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    constellation character varying(25),
    distance integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: globular_cluster globular_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.globular_cluster ALTER COLUMN globular_cluster_id SET DEFAULT nextval('public.globular_cluster_globular_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 105700, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'barred spiral', 152000, NULL);
INSERT INTO public.galaxy VALUES (3, 'LMC', 'barred spiral', 32200, NULL);
INSERT INTO public.galaxy VALUES (4, 'SMC', 'dwarf irregular galaxy', 18900, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'spiral galaxy', 61120, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pisces Dwarf', 'irregular dwarf', 17000, NULL);


--
-- Data for Name: globular_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.globular_cluster VALUES (1, 'FSR 584', NULL, 'Possibly an open cluster', 1);
INSERT INTO public.globular_cluster VALUES (2, 'M4', 5.63, NULL, 1);
INSERT INTO public.globular_cluster VALUES (3, 'Omega Centauri', 3.9, 'Visually brightest globular cluster, most massive and largest globular cluster in Milky Way', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, '', 2);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.267, 'Hall', 5);
INSERT INTO public.moon VALUES (3, 'Lo', 1821.6, 'Galileo', 6);
INSERT INTO public.moon VALUES (4, 'Delmos', 6.2, 'Hall', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, 'Galileo', 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.1, 'Galileo', 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3, 'Galileo', 6);
INSERT INTO public.moon VALUES (8, 'Amalthea', 83.5, 'Barnard', 6);
INSERT INTO public.moon VALUES (9, 'Himalia', 69.8, 'Perrine', 6);
INSERT INTO public.moon VALUES (10, 'Elara', 39.95, 'Perrine', 6);
INSERT INTO public.moon VALUES (11, 'Sinope', 17.5, 'Nicholson', 6);
INSERT INTO public.moon VALUES (12, 'Lysithea', 21.1, 'Nicholson', 6);
INSERT INTO public.moon VALUES (13, 'Carme', 23.3, 'Nicholson', 6);
INSERT INTO public.moon VALUES (14, 'Ananke', 14.55, 'Nicholson', 6);
INSERT INTO public.moon VALUES (15, 'Leda', 10.75, 'Kowal', 6);
INSERT INTO public.moon VALUES (16, 'Thebe', 23.92, 'Synnot (Voyager 1)', 6);
INSERT INTO public.moon VALUES (17, 'Adrastea', 31.378, 'Jewitt, Danielson (Voyager 1)', 6);
INSERT INTO public.moon VALUES (18, 'Callirrhoe', 4.8, 'Scotti, Spahr, McMillan, Larsen, Montani, Gleason, Gehrels', 6);
INSERT INTO public.moon VALUES (19, 'Themisto', 4.5, 'Kowal and Roemer', 6);
INSERT INTO public.moon VALUES (20, 'Megaclite', 2.7, 'Sheppard, Jewitt, Fernandez, Magnier, Damn, Evans', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 1);
INSERT INTO public.planet VALUES (2, 'earth', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, false, 1);
INSERT INTO public.planet VALUES (4, 'Moon', false, false, 1);
INSERT INTO public.planet VALUES (5, 'Mars', false, false, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', true, true, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', true, true, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', false, true, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', false, true, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Centaurus', 4, 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', NULL, 97, 2);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus', 'Centaurus', 4, 1);
INSERT INTO public.star VALUES (5, 'Toliman', 'Centaurus', 4, 1);
INSERT INTO public.star VALUES (6, 'Barnard''s Star', 'Ophiuchus', 6, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: globular_cluster_globular_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.globular_cluster_globular_cluster_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: globular_cluster gc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.globular_cluster
    ADD CONSTRAINT gc_pkey PRIMARY KEY (globular_cluster_id);


--
-- Name: globular_cluster globular_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.globular_cluster
    ADD CONSTRAINT globular_cluster_name_key UNIQUE (name);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: globular_cluster gc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.globular_cluster
    ADD CONSTRAINT gc_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

