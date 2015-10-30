--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Sp_Companies_companies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Companies_companies" (
    id integer NOT NULL,
    company_name character varying(128),
    company_short_name character varying(128),
    contact_id_id integer
);


ALTER TABLE public."Sp_Companies_companies" OWNER TO postgres;

--
-- Name: Sp_Companies_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Companies_companies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Companies_companies_id_seq" OWNER TO postgres;

--
-- Name: Sp_Companies_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Companies_companies_id_seq" OWNED BY "Sp_Companies_companies".id;


--
-- Name: Sp_Companies_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Companies_companies_id_seq"', 1, false);


--
-- Name: Sp_Discipline_disciplines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Discipline_disciplines" (
    id integer NOT NULL,
    discipline_name character varying(128),
    abbr character varying(128)
);


ALTER TABLE public."Sp_Discipline_disciplines" OWNER TO postgres;

--
-- Name: Sp_Discipline_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Discipline_disciplines_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Discipline_disciplines_id_seq" OWNER TO postgres;

--
-- Name: Sp_Discipline_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Discipline_disciplines_id_seq" OWNED BY "Sp_Discipline_disciplines".id;


--
-- Name: Sp_Discipline_disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Discipline_disciplines_id_seq"', 5, true);


--
-- Name: Sp_Divisions_divisions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Divisions_divisions" (
    id integer NOT NULL,
    division_name character varying(128),
    primary_contact character varying(128),
    is_active boolean NOT NULL,
    company_id_id integer,
    user_id_id integer
);


ALTER TABLE public."Sp_Divisions_divisions" OWNER TO postgres;

--
-- Name: Sp_Divisions_divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Divisions_divisions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Divisions_divisions_id_seq" OWNER TO postgres;

--
-- Name: Sp_Divisions_divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Divisions_divisions_id_seq" OWNED BY "Sp_Divisions_divisions".id;


--
-- Name: Sp_Divisions_divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Divisions_divisions_id_seq"', 1, false);


--
-- Name: Sp_Divisions_divisionsothercontacts_join; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Divisions_divisionsothercontacts_join" (
    id integer NOT NULL,
    contact_id_id integer,
    division_id_id integer
);


ALTER TABLE public."Sp_Divisions_divisionsothercontacts_join" OWNER TO postgres;

--
-- Name: Sp_Divisions_divisionsothercontacts_join_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Divisions_divisionsothercontacts_join_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Divisions_divisionsothercontacts_join_id_seq" OWNER TO postgres;

--
-- Name: Sp_Divisions_divisionsothercontacts_join_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Divisions_divisionsothercontacts_join_id_seq" OWNED BY "Sp_Divisions_divisionsothercontacts_join".id;


--
-- Name: Sp_Divisions_divisionsothercontacts_join_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Divisions_divisionsothercontacts_join_id_seq"', 1, false);


--
-- Name: Sp_Invoice_invoiceheaders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Invoice_invoiceheaders" (
    id integer NOT NULL,
    invoice_date timestamp with time zone,
    invoice_totals character varying(128),
    project_totals character varying(128),
    client_totals character varying(128),
    comments character varying(128),
    companies_id_id integer,
    divisions_id_id integer,
    user_id_id integer
);


ALTER TABLE public."Sp_Invoice_invoiceheaders" OWNER TO postgres;

--
-- Name: Sp_Invoice_invoiceheaders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Invoice_invoiceheaders_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Invoice_invoiceheaders_id_seq" OWNER TO postgres;

--
-- Name: Sp_Invoice_invoiceheaders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Invoice_invoiceheaders_id_seq" OWNED BY "Sp_Invoice_invoiceheaders".id;


--
-- Name: Sp_Invoice_invoiceheaders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Invoice_invoiceheaders_id_seq"', 1, false);


--
-- Name: Sp_Invoice_invoicelines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Invoice_invoicelines" (
    id integer NOT NULL,
    invoice_comments character varying(128),
    "invoiceHeaders_id_id" integer,
    "timeEntriers_id_id" integer
);


ALTER TABLE public."Sp_Invoice_invoicelines" OWNER TO postgres;

--
-- Name: Sp_Invoice_invoicelines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Invoice_invoicelines_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Invoice_invoicelines_id_seq" OWNER TO postgres;

--
-- Name: Sp_Invoice_invoicelines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Invoice_invoicelines_id_seq" OWNED BY "Sp_Invoice_invoicelines".id;


--
-- Name: Sp_Invoice_invoicelines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Invoice_invoicelines_id_seq"', 1, false);


--
-- Name: Sp_Invoice_payperiod; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Invoice_payperiod" (
    id integer NOT NULL,
    duration character varying(128)
);


ALTER TABLE public."Sp_Invoice_payperiod" OWNER TO postgres;

--
-- Name: Sp_Invoice_payperiod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Invoice_payperiod_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Invoice_payperiod_id_seq" OWNER TO postgres;

--
-- Name: Sp_Invoice_payperiod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Invoice_payperiod_id_seq" OWNED BY "Sp_Invoice_payperiod".id;


--
-- Name: Sp_Invoice_payperiod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Invoice_payperiod_id_seq"', 1, false);


--
-- Name: Sp_Projects_projectpoprojects_bin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Projects_projectpoprojects_bin" (
    id integer NOT NULL,
    project_tax_exempt boolean NOT NULL,
    project_is_activated boolean NOT NULL,
    project_requires_po boolean NOT NULL,
    orignal_amount character varying(128),
    current_amount character varying(128),
    related_projects character varying(128),
    projectpos_id_id integer,
    projects_id_id integer
);


ALTER TABLE public."Sp_Projects_projectpoprojects_bin" OWNER TO postgres;

--
-- Name: Sp_Projects_projectpoprojects_bin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Projects_projectpoprojects_bin_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Projects_projectpoprojects_bin_id_seq" OWNER TO postgres;

--
-- Name: Sp_Projects_projectpoprojects_bin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Projects_projectpoprojects_bin_id_seq" OWNED BY "Sp_Projects_projectpoprojects_bin".id;


--
-- Name: Sp_Projects_projectpoprojects_bin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Projects_projectpoprojects_bin_id_seq"', 1, false);


--
-- Name: Sp_Projects_projectpos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Projects_projectpos" (
    id integer NOT NULL,
    projectpo_number character varying(128),
    projectpo_amount character varying(128)
);


ALTER TABLE public."Sp_Projects_projectpos" OWNER TO postgres;

--
-- Name: Sp_Projects_projectpos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Projects_projectpos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Projects_projectpos_id_seq" OWNER TO postgres;

--
-- Name: Sp_Projects_projectpos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Projects_projectpos_id_seq" OWNED BY "Sp_Projects_projectpos".id;


--
-- Name: Sp_Projects_projectpos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Projects_projectpos_id_seq"', 1, false);


--
-- Name: Sp_Projects_projects; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Projects_projects" (
    id integer NOT NULL,
    project_code character varying(128),
    project_name character varying(128),
    client_billable_hrs time without time zone,
    non_billable_hrs time without time zone,
    project_description character varying(128),
    start_period timestamp with time zone NOT NULL,
    end_period timestamp with time zone NOT NULL,
    last_updated character varying(128),
    client_name character varying(128),
    project_notes character varying(128),
    is_archived boolean NOT NULL,
    was_recently_viewed boolean NOT NULL,
    is_active_project boolean NOT NULL,
    contacts_id_id integer,
    division_id_id integer
);


ALTER TABLE public."Sp_Projects_projects" OWNER TO postgres;

--
-- Name: Sp_Projects_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Projects_projects_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Projects_projects_id_seq" OWNER TO postgres;

--
-- Name: Sp_Projects_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Projects_projects_id_seq" OWNED BY "Sp_Projects_projects".id;


--
-- Name: Sp_Projects_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Projects_projects_id_seq"', 1, false);


--
-- Name: Sp_TimeEntries_timeentries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_TimeEntries_timeentries" (
    id integer NOT NULL,
    flag_value_billable character varying(128),
    flag_value_nonbillable character varying(128),
    notes character varying(128),
    events character varying(128),
    discipline_id_id integer,
    payperiod_id_id integer,
    project_id_id integer,
    user_id_id integer
);


ALTER TABLE public."Sp_TimeEntries_timeentries" OWNER TO postgres;

--
-- Name: Sp_TimeEntries_timeentries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_TimeEntries_timeentries_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_TimeEntries_timeentries_id_seq" OWNER TO postgres;

--
-- Name: Sp_TimeEntries_timeentries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_TimeEntries_timeentries_id_seq" OWNED BY "Sp_TimeEntries_timeentries".id;


--
-- Name: Sp_TimeEntries_timeentries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_TimeEntries_timeentries_id_seq"', 1, false);


--
-- Name: Sp_Users_contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Users_contacts" (
    id integer NOT NULL,
    primary_contact character varying(128),
    secondary_contact character varying(128),
    project_id_id integer,
    user_id_id integer
);


ALTER TABLE public."Sp_Users_contacts" OWNER TO postgres;

--
-- Name: Sp_Users_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Users_contacts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Users_contacts_id_seq" OWNER TO postgres;

--
-- Name: Sp_Users_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Users_contacts_id_seq" OWNED BY "Sp_Users_contacts".id;


--
-- Name: Sp_Users_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Users_contacts_id_seq"', 1, false);


--
-- Name: Sp_Users_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Users_files" (
    id integer NOT NULL,
    files_path character varying(128),
    user_id_id integer
);


ALTER TABLE public."Sp_Users_files" OWNER TO postgres;

--
-- Name: Sp_Users_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Users_files_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Users_files_id_seq" OWNER TO postgres;

--
-- Name: Sp_Users_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Users_files_id_seq" OWNED BY "Sp_Users_files".id;


--
-- Name: Sp_Users_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Users_files_id_seq"', 21, true);


--
-- Name: Sp_Users_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Users_roles" (
    id integer NOT NULL,
    roles character varying(128)
);


ALTER TABLE public."Sp_Users_roles" OWNER TO postgres;

--
-- Name: Sp_Users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Users_roles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Users_roles_id_seq" OWNER TO postgres;

--
-- Name: Sp_Users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Users_roles_id_seq" OWNED BY "Sp_Users_roles".id;


--
-- Name: Sp_Users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Users_roles_id_seq"', 2, true);


--
-- Name: Sp_Users_teams; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Users_teams" (
    id integer NOT NULL,
    team_ids character varying(128),
    user_id_id integer
);


ALTER TABLE public."Sp_Users_teams" OWNER TO postgres;

--
-- Name: Sp_Users_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Users_teams_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Users_teams_id_seq" OWNER TO postgres;

--
-- Name: Sp_Users_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Users_teams_id_seq" OWNED BY "Sp_Users_teams".id;


--
-- Name: Sp_Users_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Users_teams_id_seq"', 18, true);


--
-- Name: Sp_Users_userrelations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Users_userrelations" (
    id integer NOT NULL,
    "relationName" character varying(128)
);


ALTER TABLE public."Sp_Users_userrelations" OWNER TO postgres;

--
-- Name: Sp_Users_userrelations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Users_userrelations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Users_userrelations_id_seq" OWNER TO postgres;

--
-- Name: Sp_Users_userrelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Users_userrelations_id_seq" OWNED BY "Sp_Users_userrelations".id;


--
-- Name: Sp_Users_userrelations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Users_userrelations_id_seq"', 1, false);


--
-- Name: Sp_Users_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Users_users" (
    id integer NOT NULL,
    alternate_email character varying(128),
    intials character varying(128),
    phone_work character varying(128),
    phone_cell character varying(128),
    phone_fax character varying(128),
    mail_adress1 character varying(128),
    mail_adress2 character varying(128),
    city character varying(128),
    state character varying(128),
    billing_adress1 character varying(128),
    billing_adress2 character varying(128),
    zip character varying(128),
    date_joined timestamp with time zone NOT NULL,
    activation_key character varying(40),
    key_expires timestamp with time zone NOT NULL,
    profile_image character varying(128),
    company_id_id integer,
    discipline_id_id integer,
    division_id_id integer,
    role_id_id integer,
    timeentries_id_id integer,
    user_id integer NOT NULL,
    userrelation_id_id integer,
    disciplines character varying(128),
    has_pm_previ boolean NOT NULL
);


ALTER TABLE public."Sp_Users_users" OWNER TO postgres;

--
-- Name: Sp_Users_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Users_users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Users_users_id_seq" OWNER TO postgres;

--
-- Name: Sp_Users_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Users_users_id_seq" OWNED BY "Sp_Users_users".id;


--
-- Name: Sp_Users_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Users_users_id_seq"', 9, true);


--
-- Name: Sp_Users_vacations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sp_Users_vacations" (
    id integer NOT NULL,
    vacation_duration character varying(128),
    vacation_taken character varying(128),
    vacation_start_date date NOT NULL,
    vacation_end_date date NOT NULL,
    total_vacation character varying(128),
    user_id_id integer
);


ALTER TABLE public."Sp_Users_vacations" OWNER TO postgres;

--
-- Name: Sp_Users_vacations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sp_Users_vacations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sp_Users_vacations_id_seq" OWNER TO postgres;

--
-- Name: Sp_Users_vacations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sp_Users_vacations_id_seq" OWNED BY "Sp_Users_vacations".id;


--
-- Name: Sp_Users_vacations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sp_Users_vacations_id_seq"', 1, false);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 84, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
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

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 28, true);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 35, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: swingtime_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE swingtime_event (
    id integer NOT NULL,
    title character varying(32) NOT NULL,
    description character varying(100) NOT NULL,
    event_type_id integer NOT NULL
);


ALTER TABLE public.swingtime_event OWNER TO postgres;

--
-- Name: swingtime_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE swingtime_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swingtime_event_id_seq OWNER TO postgres;

--
-- Name: swingtime_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE swingtime_event_id_seq OWNED BY swingtime_event.id;


--
-- Name: swingtime_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('swingtime_event_id_seq', 1, false);


--
-- Name: swingtime_eventtype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE swingtime_eventtype (
    id integer NOT NULL,
    abbr character varying(4) NOT NULL,
    label character varying(50) NOT NULL
);


ALTER TABLE public.swingtime_eventtype OWNER TO postgres;

--
-- Name: swingtime_eventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE swingtime_eventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swingtime_eventtype_id_seq OWNER TO postgres;

--
-- Name: swingtime_eventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE swingtime_eventtype_id_seq OWNED BY swingtime_eventtype.id;


--
-- Name: swingtime_eventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('swingtime_eventtype_id_seq', 1, false);


--
-- Name: swingtime_note; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE swingtime_note (
    id integer NOT NULL,
    note text NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT swingtime_note_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.swingtime_note OWNER TO postgres;

--
-- Name: swingtime_note_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE swingtime_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swingtime_note_id_seq OWNER TO postgres;

--
-- Name: swingtime_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE swingtime_note_id_seq OWNED BY swingtime_note.id;


--
-- Name: swingtime_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('swingtime_note_id_seq', 1, false);


--
-- Name: swingtime_occurrence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE swingtime_occurrence (
    id integer NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE public.swingtime_occurrence OWNER TO postgres;

--
-- Name: swingtime_occurrence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE swingtime_occurrence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swingtime_occurrence_id_seq OWNER TO postgres;

--
-- Name: swingtime_occurrence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE swingtime_occurrence_id_seq OWNED BY swingtime_occurrence.id;


--
-- Name: swingtime_occurrence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('swingtime_occurrence_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Companies_companies" ALTER COLUMN id SET DEFAULT nextval('"Sp_Companies_companies_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Discipline_disciplines" ALTER COLUMN id SET DEFAULT nextval('"Sp_Discipline_disciplines_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Divisions_divisions" ALTER COLUMN id SET DEFAULT nextval('"Sp_Divisions_divisions_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Divisions_divisionsothercontacts_join" ALTER COLUMN id SET DEFAULT nextval('"Sp_Divisions_divisionsothercontacts_join_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_invoiceheaders" ALTER COLUMN id SET DEFAULT nextval('"Sp_Invoice_invoiceheaders_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_invoicelines" ALTER COLUMN id SET DEFAULT nextval('"Sp_Invoice_invoicelines_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_payperiod" ALTER COLUMN id SET DEFAULT nextval('"Sp_Invoice_payperiod_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Projects_projectpoprojects_bin" ALTER COLUMN id SET DEFAULT nextval('"Sp_Projects_projectpoprojects_bin_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Projects_projectpos" ALTER COLUMN id SET DEFAULT nextval('"Sp_Projects_projectpos_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Projects_projects" ALTER COLUMN id SET DEFAULT nextval('"Sp_Projects_projects_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_TimeEntries_timeentries" ALTER COLUMN id SET DEFAULT nextval('"Sp_TimeEntries_timeentries_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_contacts" ALTER COLUMN id SET DEFAULT nextval('"Sp_Users_contacts_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_files" ALTER COLUMN id SET DEFAULT nextval('"Sp_Users_files_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_roles" ALTER COLUMN id SET DEFAULT nextval('"Sp_Users_roles_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_teams" ALTER COLUMN id SET DEFAULT nextval('"Sp_Users_teams_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_userrelations" ALTER COLUMN id SET DEFAULT nextval('"Sp_Users_userrelations_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users" ALTER COLUMN id SET DEFAULT nextval('"Sp_Users_users_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_vacations" ALTER COLUMN id SET DEFAULT nextval('"Sp_Users_vacations_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swingtime_event ALTER COLUMN id SET DEFAULT nextval('swingtime_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swingtime_eventtype ALTER COLUMN id SET DEFAULT nextval('swingtime_eventtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swingtime_note ALTER COLUMN id SET DEFAULT nextval('swingtime_note_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swingtime_occurrence ALTER COLUMN id SET DEFAULT nextval('swingtime_occurrence_id_seq'::regclass);


--
-- Data for Name: Sp_Companies_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Companies_companies" (id, company_name, company_short_name, contact_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_Discipline_disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Discipline_disciplines" (id, discipline_name, abbr) FROM stdin;
1	Project Manager 	Pm
2	Mechanical	ME
3	Electrical Engg	ee
4	software developer	SW
5	iDIOT	id
\.


--
-- Data for Name: Sp_Divisions_divisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Divisions_divisions" (id, division_name, primary_contact, is_active, company_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_Divisions_divisionsothercontacts_join; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Divisions_divisionsothercontacts_join" (id, contact_id_id, division_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_Invoice_invoiceheaders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Invoice_invoiceheaders" (id, invoice_date, invoice_totals, project_totals, client_totals, comments, companies_id_id, divisions_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_Invoice_invoicelines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Invoice_invoicelines" (id, invoice_comments, "invoiceHeaders_id_id", "timeEntriers_id_id") FROM stdin;
\.


--
-- Data for Name: Sp_Invoice_payperiod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Invoice_payperiod" (id, duration) FROM stdin;
\.


--
-- Data for Name: Sp_Projects_projectpoprojects_bin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Projects_projectpoprojects_bin" (id, project_tax_exempt, project_is_activated, project_requires_po, orignal_amount, current_amount, related_projects, projectpos_id_id, projects_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_Projects_projectpos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Projects_projectpos" (id, projectpo_number, projectpo_amount) FROM stdin;
\.


--
-- Data for Name: Sp_Projects_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Projects_projects" (id, project_code, project_name, client_billable_hrs, non_billable_hrs, project_description, start_period, end_period, last_updated, client_name, project_notes, is_archived, was_recently_viewed, is_active_project, contacts_id_id, division_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_TimeEntries_timeentries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_TimeEntries_timeentries" (id, flag_value_billable, flag_value_nonbillable, notes, events, discipline_id_id, payperiod_id_id, project_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_Users_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Users_contacts" (id, primary_contact, secondary_contact, project_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: Sp_Users_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Users_files" (id, files_path, user_id_id) FROM stdin;
1	uploads/6adf97f83acf6453d4a6a4b1070f3754/idea.properties	3
2	uploads/6adf97f83acf6453d4a6a4b1070f3754/log.xml	4
3	uploads/6adf97f83acf6453d4a6a4b1070f3754/append.bat	5
4	uploads/6adf97f83acf6453d4a6a4b1070f3754/pycharm.exe.vmoptions	6
5	uploads/6adf97f83acf6453d4a6a4b1070f3754/rango.jpg	7
6		3
7		3
8		3
9		3
10		3
11		3
12		3
13		3
14		3
15		3
16		3
17		3
18		3
19		3
20		3
21		3
\.


--
-- Data for Name: Sp_Users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Users_roles" (id, roles) FROM stdin;
1	client
2	engg
\.


--
-- Data for Name: Sp_Users_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Users_teams" (id, team_ids, user_id_id) FROM stdin;
3	['5']	3
\.


--
-- Data for Name: Sp_Users_userrelations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Users_userrelations" (id, "relationName") FROM stdin;
\.


--
-- Data for Name: Sp_Users_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Users_users" (id, alternate_email, intials, phone_work, phone_cell, phone_fax, mail_adress1, mail_adress2, city, state, billing_adress1, billing_adress2, zip, date_joined, activation_key, key_expires, profile_image, company_id_id, discipline_id_id, division_id_id, role_id_id, timeentries_id_id, user_id, userrelation_id_id, disciplines, has_pm_previ) FROM stdin;
1	qqqgisirfire@gmail.com	che	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-11-21 21:54:20.7325+05:30	\N	2014-11-21 21:54:20.7325+05:30		\N	\N	\N	2	\N	3	\N	['1', '2', '3']	t
5	aaagisirfire@gmail.com	che	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-11-22 00:30:21.537055+05:30	\N	2014-11-22 00:30:21.537055+05:30		\N	\N	\N	2	\N	7	\N	['1','3']	t
4	zzzzgisirfire@gmail.com	jony	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-11-22 00:23:32.361056+05:30	\N	2014-11-22 00:23:32.361056+05:30		\N	\N	\N	1	\N	6	\N	['1', '2']	t
2	qqqgisirfire@gmail.com	ecfeqwfe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-11-22 00:10:22.08142+05:30	\N	2014-11-22 00:10:22.08142+05:30		\N	\N	\N	2	\N	4	\N	['2', '3']	t
3	qqqgisirfire@gmail.com	davc	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-11-22 00:21:17.075927+05:30	\N	2014-11-22 00:21:17.075927+05:30		\N	\N	\N	2	\N	5	\N	['3']	t
\.


--
-- Data for Name: Sp_Users_vacations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sp_Users_vacations" (id, vacation_duration, vacation_taken, vacation_start_date, vacation_end_date, total_vacation, user_id_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add discipline	7	add_disciplines
20	Can change discipline	7	change_disciplines
21	Can delete discipline	7	delete_disciplines
22	Can add invoice lines	8	add_invoicelines
23	Can change invoice lines	8	change_invoicelines
24	Can delete invoice lines	8	delete_invoicelines
25	Can add invoice headers	9	add_invoiceheaders
26	Can change invoice headers	9	change_invoiceheaders
27	Can delete invoice headers	9	delete_invoiceheaders
28	Can add pay period	10	add_payperiod
29	Can change pay period	10	change_payperiod
30	Can delete pay period	10	delete_payperiod
31	Can add projects	11	add_projects
32	Can change projects	11	change_projects
33	Can delete projects	11	delete_projects
34	Can add project pos	12	add_projectpos
35	Can change project pos	12	change_projectpos
36	Can delete project pos	12	delete_projectpos
37	Can add project po projects_bin	13	add_projectpoprojects_bin
38	Can change project po projects_bin	13	change_projectpoprojects_bin
39	Can delete project po projects_bin	13	delete_projectpoprojects_bin
40	Can add users	14	add_users
41	Can change users	14	change_users
42	Can delete users	14	delete_users
43	Can add files	15	add_files
44	Can change files	15	change_files
45	Can delete files	15	delete_files
46	Can add user relations	16	add_userrelations
47	Can change user relations	16	change_userrelations
48	Can delete user relations	16	delete_userrelations
49	Can add vacations	17	add_vacations
50	Can change vacations	17	change_vacations
51	Can delete vacations	17	delete_vacations
52	Can add Contacts	18	add_contacts
53	Can change Contacts	18	change_contacts
54	Can delete Contacts	18	delete_contacts
55	Can add Roles	19	add_roles
56	Can change Roles	19	change_roles
57	Can delete Roles	19	delete_roles
58	Can add divisions	20	add_divisions
59	Can change divisions	20	change_divisions
60	Can delete divisions	20	delete_divisions
61	Can add divisions other contacts_join	21	add_divisionsothercontacts_join
62	Can change divisions other contacts_join	21	change_divisionsothercontacts_join
63	Can delete divisions other contacts_join	21	delete_divisionsothercontacts_join
64	Can add time entries	22	add_timeentries
65	Can change time entries	22	change_timeentries
66	Can delete time entries	22	delete_timeentries
67	Can add Company	23	add_companies
68	Can change Company	23	change_companies
69	Can delete Company	23	delete_companies
70	Can add note	24	add_note
71	Can change note	24	change_note
72	Can delete note	24	delete_note
73	Can add event type	25	add_eventtype
74	Can change event type	25	change_eventtype
75	Can delete event type	25	delete_eventtype
76	Can add event	26	add_event
77	Can change event	26	change_event
78	Can delete event	26	delete_event
79	Can add occurrence	27	add_occurrence
80	Can change occurrence	27	change_occurrence
81	Can delete occurrence	27	delete_occurrence
82	Can add teams	28	add_teams
83	Can change teams	28	change_teams
84	Can delete teams	28	delete_teams
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$12000$9EDNPkpRHJtb$1UdAzUUkIBPAoUV67rYgG01U+brlYTMhZn+ghnWatiE=	2014-11-24 23:29:52.757841+05:30	f	chetu	wswsdw	khare	bairagisirfire@gmail.com	f	t	2014-11-21 21:54:20.623267+05:30
4	pbkdf2_sha256$12000$6K2gWAWWJpFo$/NxUYWMsGR89gwUJsiGtRHtQbs7Cn9Zy9hBVIwojz3g=	2014-11-22 00:20:25.587806+05:30	f	petu	efsdvs	dwdwd	chetankhareaiet@gmail.com	f	t	2014-11-22 00:10:21.845996+05:30
5	pbkdf2_sha256$12000$bVKqTPVu7HWn$9IR9pS4HebqdcVL16V9yRG26j9CptyhSZiDmj9O73A0=	2014-11-22 00:22:33.549832+05:30	f	david	david	windy	aaareaiet@gmail.com	f	t	2014-11-22 00:21:16.959411+05:30
6	pbkdf2_sha256$12000$Ajq9HX7lagpt$KWb23CkYNKtipDzfFIY5AUhF8CNw8oJjRKQPLcnbMv8=	2014-11-22 00:27:52.115299+05:30	f	john	jonh	kisinger	wwisirfire@gmail.com	f	t	2014-11-22 00:23:32.286005+05:30
7	pbkdf2_sha256$12000$S3g7QzdlnEw6$ca8wmHj29uY2S/ZwH85Y3NtESOvpf1u7Ubiw7wJswRA=	2014-11-22 00:32:23.437672+05:30	f	chetu_nayak	chetu	nayak	aairagisirfire@gmail.com	f	t	2014-11-22 00:30:21.478754+05:30
2	pbkdf2_sha256$12000$j9h67aPlflRu$ZHrfzncTYCs0a4dbMbG4ZFZAO8FGtpjOLxdq7Yto4+o=	2014-11-24 18:03:47.1717+05:30	t	laitkor				t	t	2014-11-21 21:37:38.575135+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2014-11-21 21:37:57.828525+05:30	1	client	1		19	2
2	2014-11-21 21:38:07.933271+05:30	2	engg	1		19	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	discipline	Sp_Discipline	disciplines
8	invoice lines	Sp_Invoice	invoicelines
9	invoice headers	Sp_Invoice	invoiceheaders
10	pay period	Sp_Invoice	payperiod
11	projects	Sp_Projects	projects
12	project pos	Sp_Projects	projectpos
13	project po projects_bin	Sp_Projects	projectpoprojects_bin
14	users	Sp_Users	users
15	files	Sp_Users	files
16	user relations	Sp_Users	userrelations
17	vacations	Sp_Users	vacations
18	Contacts	Sp_Users	contacts
19	Roles	Sp_Users	roles
20	divisions	Sp_Divisions	divisions
21	divisions other contacts_join	Sp_Divisions	divisionsothercontacts_join
22	time entries	Sp_TimeEntries	timeentries
23	Company	Sp_Companies	companies
24	note	swingtime	note
25	event type	swingtime	eventtype
26	event	swingtime	event
27	occurrence	swingtime	occurrence
28	teams	Sp_Users	teams
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2014-11-21 17:26:10.349553+05:30
2	auth	0001_initial	2014-11-21 17:26:10.973369+05:30
3	Sp_Projects	0001_initial	2014-11-21 17:26:11.117204+05:30
4	Sp_Invoice	0001_initial	2014-11-21 17:26:11.288493+05:30
5	Sp_Discipline	0001_initial	2014-11-21 17:26:11.33927+05:30
6	Sp_TimeEntries	0001_initial	2014-11-21 17:26:11.519284+05:30
7	Sp_Divisions	0001_initial	2014-11-21 17:26:11.608326+05:30
8	Sp_Companies	0001_initial	2014-11-21 17:26:11.66625+05:30
9	Sp_Users	0001_initial	2014-11-21 17:26:12.809158+05:30
10	Sp_Companies	0002_companies_contact_id	2014-11-21 17:26:13.007849+05:30
11	Sp_Divisions	0002_auto_20141121_1156	2014-11-21 17:26:13.431776+05:30
12	Sp_Invoice	0002_auto_20141121_1156	2014-11-21 17:26:13.897712+05:30
13	Sp_Projects	0002_auto_20141121_1156	2014-11-21 17:26:14.325255+05:30
14	Sp_TimeEntries	0002_timeentries_user_id	2014-11-21 17:26:14.51949+05:30
15	admin	0001_initial	2014-11-21 17:26:14.693596+05:30
16	sessions	0001_initial	2014-11-21 17:26:14.783479+05:30
17	Sp_Projects	0003_auto_20141121_1156	2014-11-21 17:49:26.008643+05:30
18	Sp_Projects	0004_auto_20141121_1219	2014-11-21 17:49:26.305531+05:30
19	Sp_Projects	0005_auto_20141121_1219	2014-11-21 17:49:33.30096+05:30
20	Sp_Projects	0006_auto_20141121_1222	2014-11-21 17:52:51.656539+05:30
21	Sp_Projects	0007_auto_20141121_1229	2014-11-21 18:00:03.399261+05:30
22	Sp_Projects	0008_auto_20141121_1232	2014-11-21 18:02:11.649256+05:30
23	Sp_Projects	0009_auto_20141121_1232	2014-11-21 18:02:31.485254+05:30
24	Sp_Projects	0003_auto_20141121_1243	2014-11-21 18:16:15.489643+05:30
25	Sp_Users	0002_teams	2014-11-24 18:50:10.851357+05:30
26	Sp_Discipline	0002_auto_20141124_1456	2014-11-24 20:26:43.144924+05:30
27	Sp_Users	0003_users_disciplines	2014-11-24 20:26:43.421939+05:30
28	Sp_Users	0004_auto_20141124_1930	2014-11-25 01:00:53.934637+05:30
29	Sp_Users	0005_auto_20141126_1156	2014-11-26 17:26:30.537212+05:30
30	Sp_Users	0006_auto_20141126_1250	2014-11-26 18:20:58.512043+05:30
31	Sp_Users	0004_teams	2014-11-26 18:27:09.388513+05:30
32	Sp_Users	0005_auto_20141126_1448	2014-11-26 20:18:45.875349+05:30
33	Sp_Discipline	0003_auto_20141126_1615	2014-11-26 21:45:40.572992+05:30
34	Sp_Users	0006_users_has_pm_previ	2014-12-01 22:04:38.907164+05:30
35	Sp_Users	0005_auto_20141201_1714	2014-12-01 22:44:28.472762+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
l0xourmrnvlenvd9ilh0clmqwy4482w8	Y2E5YmViYzZiNjE1ZDAxNzE3NDg1ZDk2ZGRmZDJkMzQ1MThhNWM2Nzp7fQ==	2014-12-05 18:11:42.951913+05:30
u2hcdd40v3pz6rsdnfrgfz83exqqyu52	Y2E5YmViYzZiNjE1ZDAxNzE3NDg1ZDk2ZGRmZDJkMzQ1MThhNWM2Nzp7fQ==	2014-12-05 18:14:01.290496+05:30
6mb56bklmw5x9egas0gj8d8leu2dgguk	M2IxMzhiYjliZmU2NDRhYjBjYzg5YzdhNmRlOTNhMWIzODNiOTAyYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzU4ZTUwNzgyMjkwYTBmYTk2MWRjOWU1NmUxNzE0MzM1ZDkxODYyNSIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-12-08 20:43:11.704865+05:30
9rie6d4iaf7aym8slkt213vx1cd9oa3y	ZjA3ZTMzZTNhZjQ1MmIxMzQyNGY3Yjg0NGFlZThhYTEyNzc3M2Y3Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1OGU1MDc4MjI5MGEwZmE5NjFkYzllNTZlMTcxNDMzNWQ5MTg2MjUiLCJfYXV0aF91c2VyX2lkIjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2014-12-08 23:29:52.774716+05:30
\.


--
-- Data for Name: swingtime_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY swingtime_event (id, title, description, event_type_id) FROM stdin;
\.


--
-- Data for Name: swingtime_eventtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY swingtime_eventtype (id, abbr, label) FROM stdin;
\.


--
-- Data for Name: swingtime_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY swingtime_note (id, note, created, content_type_id, object_id) FROM stdin;
\.


--
-- Data for Name: swingtime_occurrence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY swingtime_occurrence (id, start_time, end_time, event_id) FROM stdin;
\.


--
-- Name: Sp_Companies_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Companies_companies"
    ADD CONSTRAINT "Sp_Companies_companies_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Discipline_disciplines_abbr_319582fb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Discipline_disciplines"
    ADD CONSTRAINT "Sp_Discipline_disciplines_abbr_319582fb_uniq" UNIQUE (abbr);


--
-- Name: Sp_Discipline_disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Discipline_disciplines"
    ADD CONSTRAINT "Sp_Discipline_disciplines_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Divisions_divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Divisions_divisions"
    ADD CONSTRAINT "Sp_Divisions_divisions_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Divisions_divisionsothercontacts_join_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Divisions_divisionsothercontacts_join"
    ADD CONSTRAINT "Sp_Divisions_divisionsothercontacts_join_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Invoice_invoiceheaders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Invoice_invoiceheaders"
    ADD CONSTRAINT "Sp_Invoice_invoiceheaders_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Invoice_invoicelines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Invoice_invoicelines"
    ADD CONSTRAINT "Sp_Invoice_invoicelines_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Invoice_payperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Invoice_payperiod"
    ADD CONSTRAINT "Sp_Invoice_payperiod_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Projects_projectpoprojects_bin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Projects_projectpoprojects_bin"
    ADD CONSTRAINT "Sp_Projects_projectpoprojects_bin_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Projects_projectpos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Projects_projectpos"
    ADD CONSTRAINT "Sp_Projects_projectpos_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Projects_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Projects_projects"
    ADD CONSTRAINT "Sp_Projects_projects_pkey" PRIMARY KEY (id);


--
-- Name: Sp_TimeEntries_timeentries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_TimeEntries_timeentries"
    ADD CONSTRAINT "Sp_TimeEntries_timeentries_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Users_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_contacts"
    ADD CONSTRAINT "Sp_Users_contacts_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Users_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_files"
    ADD CONSTRAINT "Sp_Users_files_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_roles"
    ADD CONSTRAINT "Sp_Users_roles_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Users_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_teams"
    ADD CONSTRAINT "Sp_Users_teams_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Users_userrelations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_userrelations"
    ADD CONSTRAINT "Sp_Users_userrelations_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Users_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Users_users_pkey" PRIMARY KEY (id);


--
-- Name: Sp_Users_users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Users_users_user_id_key" UNIQUE (user_id);


--
-- Name: Sp_Users_vacations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sp_Users_vacations"
    ADD CONSTRAINT "Sp_Users_vacations_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_44a92ef3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_44a92ef3_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: swingtime_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY swingtime_event
    ADD CONSTRAINT swingtime_event_pkey PRIMARY KEY (id);


--
-- Name: swingtime_eventtype_abbr_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY swingtime_eventtype
    ADD CONSTRAINT swingtime_eventtype_abbr_key UNIQUE (abbr);


--
-- Name: swingtime_eventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY swingtime_eventtype
    ADD CONSTRAINT swingtime_eventtype_pkey PRIMARY KEY (id);


--
-- Name: swingtime_note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY swingtime_note
    ADD CONSTRAINT swingtime_note_pkey PRIMARY KEY (id);


--
-- Name: swingtime_occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY swingtime_occurrence
    ADD CONSTRAINT swingtime_occurrence_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: sp_companies_companies_6ba603a3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_companies_companies_6ba603a3 ON "Sp_Companies_companies" USING btree (contact_id_id);


--
-- Name: sp_divisions_divisions_18624dd3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_divisions_divisions_18624dd3 ON "Sp_Divisions_divisions" USING btree (user_id_id);


--
-- Name: sp_divisions_divisions_ca4ae90a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_divisions_divisions_ca4ae90a ON "Sp_Divisions_divisions" USING btree (company_id_id);


--
-- Name: sp_divisions_divisionsothercontacts_join_6ba603a3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_divisions_divisionsothercontacts_join_6ba603a3 ON "Sp_Divisions_divisionsothercontacts_join" USING btree (contact_id_id);


--
-- Name: sp_divisions_divisionsothercontacts_join_d2af858b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_divisions_divisionsothercontacts_join_d2af858b ON "Sp_Divisions_divisionsothercontacts_join" USING btree (division_id_id);


--
-- Name: sp_invoice_invoiceheaders_18624dd3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_invoice_invoiceheaders_18624dd3 ON "Sp_Invoice_invoiceheaders" USING btree (user_id_id);


--
-- Name: sp_invoice_invoiceheaders_2a5a465b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_invoice_invoiceheaders_2a5a465b ON "Sp_Invoice_invoiceheaders" USING btree (companies_id_id);


--
-- Name: sp_invoice_invoiceheaders_d5d73364; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_invoice_invoiceheaders_d5d73364 ON "Sp_Invoice_invoiceheaders" USING btree (divisions_id_id);


--
-- Name: sp_invoice_invoicelines_3c33e506; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_invoice_invoicelines_3c33e506 ON "Sp_Invoice_invoicelines" USING btree ("invoiceHeaders_id_id");


--
-- Name: sp_invoice_invoicelines_45022a18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_invoice_invoicelines_45022a18 ON "Sp_Invoice_invoicelines" USING btree ("timeEntriers_id_id");


--
-- Name: sp_projects_projectpoprojects_bin_9b821bfd; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_projects_projectpoprojects_bin_9b821bfd ON "Sp_Projects_projectpoprojects_bin" USING btree (projects_id_id);


--
-- Name: sp_projects_projectpoprojects_bin_b262b5d6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_projects_projectpoprojects_bin_b262b5d6 ON "Sp_Projects_projectpoprojects_bin" USING btree (projectpos_id_id);


--
-- Name: sp_projects_projects_56098757; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_projects_projects_56098757 ON "Sp_Projects_projects" USING btree (contacts_id_id);


--
-- Name: sp_projects_projects_d2af858b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_projects_projects_d2af858b ON "Sp_Projects_projects" USING btree (division_id_id);


--
-- Name: sp_timeentries_timeentries_04e8870d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_timeentries_timeentries_04e8870d ON "Sp_TimeEntries_timeentries" USING btree (discipline_id_id);


--
-- Name: sp_timeentries_timeentries_18624dd3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_timeentries_timeentries_18624dd3 ON "Sp_TimeEntries_timeentries" USING btree (user_id_id);


--
-- Name: sp_timeentries_timeentries_bfec2ef8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_timeentries_timeentries_bfec2ef8 ON "Sp_TimeEntries_timeentries" USING btree (project_id_id);


--
-- Name: sp_timeentries_timeentries_e032b747; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_timeentries_timeentries_e032b747 ON "Sp_TimeEntries_timeentries" USING btree (payperiod_id_id);


--
-- Name: sp_users_contacts_18624dd3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_contacts_18624dd3 ON "Sp_Users_contacts" USING btree (user_id_id);


--
-- Name: sp_users_contacts_bfec2ef8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_contacts_bfec2ef8 ON "Sp_Users_contacts" USING btree (project_id_id);


--
-- Name: sp_users_files_18624dd3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_files_18624dd3 ON "Sp_Users_files" USING btree (user_id_id);


--
-- Name: sp_users_users_04e8870d; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_users_04e8870d ON "Sp_Users_users" USING btree (discipline_id_id);


--
-- Name: sp_users_users_37d4f1a8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_users_37d4f1a8 ON "Sp_Users_users" USING btree (role_id_id);


--
-- Name: sp_users_users_72d400b2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_users_72d400b2 ON "Sp_Users_users" USING btree (userrelation_id_id);


--
-- Name: sp_users_users_9119a183; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_users_9119a183 ON "Sp_Users_users" USING btree (timeentries_id_id);


--
-- Name: sp_users_users_ca4ae90a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_users_ca4ae90a ON "Sp_Users_users" USING btree (company_id_id);


--
-- Name: sp_users_users_d2af858b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_users_d2af858b ON "Sp_Users_users" USING btree (division_id_id);


--
-- Name: sp_users_vacations_18624dd3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sp_users_vacations_18624dd3 ON "Sp_Users_vacations" USING btree (user_id_id);


--
-- Name: swingtime_event_event_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX swingtime_event_event_type_id ON swingtime_event USING btree (event_type_id);


--
-- Name: swingtime_eventtype_abbr_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX swingtime_eventtype_abbr_like ON swingtime_eventtype USING btree (abbr varchar_pattern_ops);


--
-- Name: swingtime_note_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX swingtime_note_content_type_id ON swingtime_note USING btree (content_type_id);


--
-- Name: swingtime_occurrence_event_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX swingtime_occurrence_event_id ON swingtime_occurrence USING btree (event_id);


--
-- Name: S_invoiceHeaders_id_id_358195dc_fk_Sp_Invoice_invoiceheaders_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_invoicelines"
    ADD CONSTRAINT "S_invoiceHeaders_id_id_358195dc_fk_Sp_Invoice_invoiceheaders_id" FOREIGN KEY ("invoiceHeaders_id_id") REFERENCES "Sp_Invoice_invoiceheaders"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Companies_com_contact_id_id_566a8c4d_fk_Sp_Users_contacts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Companies_companies"
    ADD CONSTRAINT "Sp_Companies_com_contact_id_id_566a8c4d_fk_Sp_Users_contacts_id" FOREIGN KEY (contact_id_id) REFERENCES "Sp_Users_contacts"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Divisio_division_id_id_41d349c3_fk_Sp_Divisions_divisions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Divisions_divisionsothercontacts_join"
    ADD CONSTRAINT "Sp_Divisio_division_id_id_41d349c3_fk_Sp_Divisions_divisions_id" FOREIGN KEY (division_id_id) REFERENCES "Sp_Divisions_divisions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Division_company_id_id_71c06915_fk_Sp_Companies_companies_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Divisions_divisions"
    ADD CONSTRAINT "Sp_Division_company_id_id_71c06915_fk_Sp_Companies_companies_id" FOREIGN KEY (company_id_id) REFERENCES "Sp_Companies_companies"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Divisions_div_contact_id_id_2e0b37a1_fk_Sp_Users_contacts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Divisions_divisionsothercontacts_join"
    ADD CONSTRAINT "Sp_Divisions_div_contact_id_id_2e0b37a1_fk_Sp_Users_contacts_id" FOREIGN KEY (contact_id_id) REFERENCES "Sp_Users_contacts"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Divisions_divisions_user_id_id_39bdb1ec_fk_Sp_Users_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Divisions_divisions"
    ADD CONSTRAINT "Sp_Divisions_divisions_user_id_id_39bdb1ec_fk_Sp_Users_users_id" FOREIGN KEY (user_id_id) REFERENCES "Sp_Users_users"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Invoic_companies_id_id_72d065ee_fk_Sp_Companies_companies_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_invoiceheaders"
    ADD CONSTRAINT "Sp_Invoic_companies_id_id_72d065ee_fk_Sp_Companies_companies_id" FOREIGN KEY (companies_id_id) REFERENCES "Sp_Companies_companies"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Invoic_divisions_id_id_17d83c3b_fk_Sp_Divisions_divisions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_invoiceheaders"
    ADD CONSTRAINT "Sp_Invoic_divisions_id_id_17d83c3b_fk_Sp_Divisions_divisions_id" FOREIGN KEY (divisions_id_id) REFERENCES "Sp_Divisions_divisions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Invoice_invoicehead_user_id_id_35e9f51b_fk_Sp_Users_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_invoiceheaders"
    ADD CONSTRAINT "Sp_Invoice_invoicehead_user_id_id_35e9f51b_fk_Sp_Users_users_id" FOREIGN KEY (user_id_id) REFERENCES "Sp_Users_users"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Proje_projectpos_id_id_32bc1b00_fk_Sp_Projects_projectpos_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Projects_projectpoprojects_bin"
    ADD CONSTRAINT "Sp_Proje_projectpos_id_id_32bc1b00_fk_Sp_Projects_projectpos_id" FOREIGN KEY (projectpos_id_id) REFERENCES "Sp_Projects_projectpos"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Project_division_id_id_5cfdbbf5_fk_Sp_Divisions_divisions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Projects_projects"
    ADD CONSTRAINT "Sp_Project_division_id_id_5cfdbbf5_fk_Sp_Divisions_divisions_id" FOREIGN KEY (division_id_id) REFERENCES "Sp_Divisions_divisions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Projects__projects_id_id_5a5d76ce_fk_Sp_Projects_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Projects_projectpoprojects_bin"
    ADD CONSTRAINT "Sp_Projects__projects_id_id_5a5d76ce_fk_Sp_Projects_projects_id" FOREIGN KEY (projects_id_id) REFERENCES "Sp_Projects_projects"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Projects_pro_contacts_id_id_7626d343_fk_Sp_Users_contacts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Projects_projects"
    ADD CONSTRAINT "Sp_Projects_pro_contacts_id_id_7626d343_fk_Sp_Users_contacts_id" FOREIGN KEY (contacts_id_id) REFERENCES "Sp_Users_contacts"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Ti_discipline_id_id_6d2e0bae_fk_Sp_Discipline_disciplines_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_TimeEntries_timeentries"
    ADD CONSTRAINT "Sp_Ti_discipline_id_id_6d2e0bae_fk_Sp_Discipline_disciplines_id" FOREIGN KEY (discipline_id_id) REFERENCES "Sp_Discipline_disciplines"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_TimeEntr_payperiod_id_id_753e7244_fk_Sp_Invoice_payperiod_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_TimeEntries_timeentries"
    ADD CONSTRAINT "Sp_TimeEntr_payperiod_id_id_753e7244_fk_Sp_Invoice_payperiod_id" FOREIGN KEY (payperiod_id_id) REFERENCES "Sp_Invoice_payperiod"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_TimeEntrie_project_id_id_4be86f7c_fk_Sp_Projects_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_TimeEntries_timeentries"
    ADD CONSTRAINT "Sp_TimeEntrie_project_id_id_4be86f7c_fk_Sp_Projects_projects_id" FOREIGN KEY (project_id_id) REFERENCES "Sp_Projects_projects"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_TimeEntries_timeent_user_id_id_4572da79_fk_Sp_Users_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_TimeEntries_timeentries"
    ADD CONSTRAINT "Sp_TimeEntries_timeent_user_id_id_4572da79_fk_Sp_Users_users_id" FOREIGN KEY (user_id_id) REFERENCES "Sp_Users_users"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Us_discipline_id_id_2217634e_fk_Sp_Discipline_disciplines_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Us_discipline_id_id_2217634e_fk_Sp_Discipline_disciplines_id" FOREIGN KEY (discipline_id_id) REFERENCES "Sp_Discipline_disciplines"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Use_userrelation_id_id_102d543d_fk_Sp_Users_userrelations_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Use_userrelation_id_id_102d543d_fk_Sp_Users_userrelations_id" FOREIGN KEY (userrelation_id_id) REFERENCES "Sp_Users_userrelations"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_cont_project_id_id_6824f347_fk_Sp_Projects_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_contacts"
    ADD CONSTRAINT "Sp_Users_cont_project_id_id_6824f347_fk_Sp_Projects_projects_id" FOREIGN KEY (project_id_id) REFERENCES "Sp_Projects_projects"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_contacts_user_id_id_7bc97444_fk_Sp_Users_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_contacts"
    ADD CONSTRAINT "Sp_Users_contacts_user_id_id_7bc97444_fk_Sp_Users_users_id" FOREIGN KEY (user_id_id) REFERENCES "Sp_Users_users"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_files_user_id_id_68e9402e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_files"
    ADD CONSTRAINT "Sp_Users_files_user_id_id_68e9402e_fk_auth_user_id" FOREIGN KEY (user_id_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_teams_user_id_id_368a14f5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_teams"
    ADD CONSTRAINT "Sp_Users_teams_user_id_id_368a14f5_fk_auth_user_id" FOREIGN KEY (user_id_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_u_division_id_id_4bfebf47_fk_Sp_Divisions_divisions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Users_u_division_id_id_4bfebf47_fk_Sp_Divisions_divisions_id" FOREIGN KEY (division_id_id) REFERENCES "Sp_Divisions_divisions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_us_company_id_id_427a3e3c_fk_Sp_Companies_companies_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Users_us_company_id_id_427a3e3c_fk_Sp_Companies_companies_id" FOREIGN KEY (company_id_id) REFERENCES "Sp_Companies_companies"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_users_role_id_id_47da8fae_fk_Sp_Users_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Users_users_role_id_id_47da8fae_fk_Sp_Users_roles_id" FOREIGN KEY (role_id_id) REFERENCES "Sp_Users_roles"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_users_user_id_2d6eef37_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp_Users_users_user_id_2d6eef37_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp_Users_vacations_user_id_id_4a660c0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_vacations"
    ADD CONSTRAINT "Sp_Users_vacations_user_id_id_4a660c0a_fk_auth_user_id" FOREIGN KEY (user_id_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp__timeEntriers_id_id_76b9b76_fk_Sp_TimeEntries_timeentries_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Invoice_invoicelines"
    ADD CONSTRAINT "Sp__timeEntriers_id_id_76b9b76_fk_Sp_TimeEntries_timeentries_id" FOREIGN KEY ("timeEntriers_id_id") REFERENCES "Sp_TimeEntries_timeentries"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Sp__timeentries_id_id_3e12174a_fk_Sp_TimeEntries_timeentries_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sp_Users_users"
    ADD CONSTRAINT "Sp__timeentries_id_id_3e12174a_fk_Sp_TimeEntries_timeentries_id" FOREIGN KEY (timeentries_id_id) REFERENCES "Sp_TimeEntries_timeentries"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_634a87a8_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_634a87a8_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_766c604a_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_766c604a_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_3a138a33_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_3a138a33_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_3d82f909_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_3d82f909_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6b7845c2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6b7845c2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_210eb3d7_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_210eb3d7_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_1da99780_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_1da99780_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin__content_type_id_7553ee3_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin__content_type_id_7553ee3_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_37f4417e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_37f4417e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: swingtime_event_event_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swingtime_event
    ADD CONSTRAINT swingtime_event_event_type_id_fkey FOREIGN KEY (event_type_id) REFERENCES swingtime_eventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: swingtime_occurrence_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY swingtime_occurrence
    ADD CONSTRAINT swingtime_occurrence_event_id_fkey FOREIGN KEY (event_id) REFERENCES swingtime_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

