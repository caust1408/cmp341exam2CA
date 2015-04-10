--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
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
-- Name: a_c; Type: TABLE; Schema: public; Owner: cgen; Tablespace: 
--

CREATE TABLE a_c (
    assn character varying(9) NOT NULL,
    aacctno character varying(17) NOT NULL
);


ALTER TABLE a_c OWNER TO cgen;

--
-- Name: account; Type: TABLE; Schema: public; Owner: cgen; Tablespace: 
--

CREATE TABLE account (
    acctno character varying(17) NOT NULL,
    balance character varying(12),
    type character varying(10)
);


ALTER TABLE account OWNER TO cgen;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: cgen; Tablespace: 
--

CREATE TABLE bank (
    fname character varying(15) NOT NULL,
    lname character varying(15) NOT NULL,
    addr character varying(30),
    code character varying(10) NOT NULL
);


ALTER TABLE bank OWNER TO cgen;

--
-- Name: bank_branch; Type: TABLE; Schema: public; Owner: cgen; Tablespace: 
--

CREATE TABLE bank_branch (
    baddr character varying(30),
    branchno character varying(10) NOT NULL,
    bcode character varying(10)
);


ALTER TABLE bank_branch OWNER TO cgen;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: cgen; Tablespace: 
--

CREATE TABLE customer (
    ssn character varying(9) NOT NULL,
    phone character varying(8),
    cname character varying(15),
    clname character varying(15),
    caddr character varying(30)
);


ALTER TABLE customer OWNER TO cgen;

--
-- Name: l_c; Type: TABLE; Schema: public; Owner: cgen; Tablespace: 
--

CREATE TABLE l_c (
    lloanno character varying(15) NOT NULL,
    lssn character varying(9) NOT NULL
);


ALTER TABLE l_c OWNER TO cgen;

--
-- Name: loan; Type: TABLE; Schema: public; Owner: cgen; Tablespace: 
--

CREATE TABLE loan (
    loanno character varying(15) NOT NULL,
    lamount character varying(15),
    ltype character varying(15),
    lbranchno character varying(10)
);


ALTER TABLE loan OWNER TO cgen;

--
-- Data for Name: a_c; Type: TABLE DATA; Schema: public; Owner: cgen
--

COPY a_c (assn, aacctno) FROM stdin;
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: cgen
--

COPY account (acctno, balance, type) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: cgen
--

COPY bank (fname, lname, addr, code) FROM stdin;
\.


--
-- Data for Name: bank_branch; Type: TABLE DATA; Schema: public; Owner: cgen
--

COPY bank_branch (baddr, branchno, bcode) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: cgen
--

COPY customer (ssn, phone, cname, clname, caddr) FROM stdin;
\.


--
-- Data for Name: l_c; Type: TABLE DATA; Schema: public; Owner: cgen
--

COPY l_c (lloanno, lssn) FROM stdin;
\.


--
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: cgen
--

COPY loan (loanno, lamount, ltype, lbranchno) FROM stdin;
\.


--
-- Name: a_c_pkey; Type: CONSTRAINT; Schema: public; Owner: cgen; Tablespace: 
--

ALTER TABLE ONLY a_c
    ADD CONSTRAINT a_c_pkey PRIMARY KEY (assn, aacctno);


--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: cgen; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (acctno);


--
-- Name: bank_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: cgen; Tablespace: 
--

ALTER TABLE ONLY bank_branch
    ADD CONSTRAINT bank_branch_pkey PRIMARY KEY (branchno);


--
-- Name: bank_pkey; Type: CONSTRAINT; Schema: public; Owner: cgen; Tablespace: 
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (code);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: cgen; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (ssn);


--
-- Name: l_c_pkey; Type: CONSTRAINT; Schema: public; Owner: cgen; Tablespace: 
--

ALTER TABLE ONLY l_c
    ADD CONSTRAINT l_c_pkey PRIMARY KEY (lloanno, lssn);


--
-- Name: loan_pkey; Type: CONSTRAINT; Schema: public; Owner: cgen; Tablespace: 
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (loanno);


--
-- Name: a_c_aacctno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cgen
--

ALTER TABLE ONLY a_c
    ADD CONSTRAINT a_c_aacctno_fkey FOREIGN KEY (aacctno) REFERENCES account(acctno);


--
-- Name: a_c_assn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cgen
--

ALTER TABLE ONLY a_c
    ADD CONSTRAINT a_c_assn_fkey FOREIGN KEY (assn) REFERENCES customer(ssn);


--
-- Name: bank_branch_bcode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cgen
--

ALTER TABLE ONLY bank_branch
    ADD CONSTRAINT bank_branch_bcode_fkey FOREIGN KEY (bcode) REFERENCES bank(code);


--
-- Name: l_c_lloanno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cgen
--

ALTER TABLE ONLY l_c
    ADD CONSTRAINT l_c_lloanno_fkey FOREIGN KEY (lloanno) REFERENCES loan(loanno);


--
-- Name: l_c_lssn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cgen
--

ALTER TABLE ONLY l_c
    ADD CONSTRAINT l_c_lssn_fkey FOREIGN KEY (lssn) REFERENCES customer(ssn);


--
-- Name: loan_lbranchno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cgen
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loan_lbranchno_fkey FOREIGN KEY (lbranchno) REFERENCES bank_branch(branchno);


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

