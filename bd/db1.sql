--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: release; Type: SCHEMA; Schema: -; Owner: lbaw1324
--

CREATE SCHEMA release;


ALTER SCHEMA release OWNER TO lbaw1324;

--
-- Name: SCHEMA release; Type: COMMENT; Schema: -; Owner: lbaw1324
--

COMMENT ON SCHEMA release IS 'Used for verticcal releasetype';


SET search_path = release, pg_catalog;

--
-- Name: fill_date_shipped(); Type: FUNCTION; Schema: release; Owner: lbaw1324
--

CREATE FUNCTION fill_date_shipped() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
IF NEW.idState <> OLD.idState THEN
NEW.date_shipped := localtimestamp;
END IF;
RETURN NEW;
END;
$$;


ALTER FUNCTION release.fill_date_shipped() OWNER TO lbaw1324;

--
-- Name: insert_date(); Type: FUNCTION; Schema: release; Owner: lbaw1324
--

CREATE FUNCTION insert_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.date_placed := localtimestamp;
RETURN NEW;
END;
$$;


ALTER FUNCTION release.insert_date() OWNER TO lbaw1324;

--
-- Name: insert_date_wishlist(); Type: FUNCTION; Schema: release; Owner: lbaw1324
--

CREATE FUNCTION insert_date_wishlist() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.date_added := localtimestamp;
RETURN NEW;
END;
$$;


ALTER FUNCTION release.insert_date_wishlist() OWNER TO lbaw1324;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE address (
    idaddress integer NOT NULL,
    street text NOT NULL,
    door_nr text NOT NULL,
    postcode text NOT NULL,
    formatted_address text,
    idbuyer integer NOT NULL
);


ALTER TABLE release.address OWNER TO lbaw1324;

--
-- Name: address_idaddress_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE address_idaddress_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.address_idaddress_seq OWNER TO lbaw1324;

--
-- Name: address_idaddress_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE address_idaddress_seq OWNED BY address.idaddress;


--
-- Name: buyer; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE buyer (
    iduser integer NOT NULL,
    banned boolean DEFAULT false NOT NULL,
    nif bigint NOT NULL
);


ALTER TABLE release.buyer OWNER TO lbaw1324;

--
-- Name: category; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE category (
    idcategory integer NOT NULL,
    name character varying(50) NOT NULL,
    iddepartment integer NOT NULL
);


ALTER TABLE release.category OWNER TO lbaw1324;

--
-- Name: category_idcategory_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE category_idcategory_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.category_idcategory_seq OWNER TO lbaw1324;

--
-- Name: category_idcategory_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE category_idcategory_seq OWNED BY category.idcategory;


--
-- Name: catfilter; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE catfilter (
    idcategory integer NOT NULL,
    idfilter integer NOT NULL
);


ALTER TABLE release.catfilter OWNER TO lbaw1324;

--
-- Name: department; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE department (
    iddepartment integer NOT NULL,
    name character varying(50) NOT NULL,
    CONSTRAINT ck_empty_name CHECK (((name)::text <> ''::text))
);


ALTER TABLE release.department OWNER TO lbaw1324;

--
-- Name: department_iddepartment_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE department_iddepartment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.department_iddepartment_seq OWNER TO lbaw1324;

--
-- Name: department_iddepartment_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE department_iddepartment_seq OWNED BY department.iddepartment;


--
-- Name: filter; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE filter (
    idfilter integer NOT NULL,
    filter_name character varying(50) NOT NULL
);


ALTER TABLE release.filter OWNER TO lbaw1324;

--
-- Name: filter_idfilter_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE filter_idfilter_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.filter_idfilter_seq OWNER TO lbaw1324;

--
-- Name: filter_idfilter_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE filter_idfilter_seq OWNED BY filter.idfilter;


--
-- Name: order_; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE order_ (
    idorder integer NOT NULL,
    date_placed timestamp without time zone NOT NULL,
    date_shipped timestamp without time zone,
    observations text,
    idstate integer NOT NULL,
    idtransporter integer NOT NULL,
    idaddress integer NOT NULL,
    idbuyer integer NOT NULL
);


ALTER TABLE release.order_ OWNER TO lbaw1324;

--
-- Name: order__idorder_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE order__idorder_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.order__idorder_seq OWNER TO lbaw1324;

--
-- Name: order__idorder_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE order__idorder_seq OWNED BY order_.idorder;


--
-- Name: orderline; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE orderline (
    idproduct integer NOT NULL,
    idorder integer NOT NULL,
    quantity integer NOT NULL,
    price_per_unit numeric(9,2) NOT NULL,
    CONSTRAINT ck_price_per_unit CHECK ((price_per_unit >= (0)::numeric)),
    CONSTRAINT ck_quantity CHECK ((quantity > 0))
);


ALTER TABLE release.orderline OWNER TO lbaw1324;

--
-- Name: state; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE state (
    idstate integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE release.state OWNER TO lbaw1324;

--
-- Name: order_sumup; Type: VIEW; Schema: release; Owner: lbaw1324
--

CREATE VIEW order_sumup AS
SELECT o.idorder, o.date_placed, s.name, sub.total FROM ((order_ o JOIN state s ON ((s.idstate = o.idstate))) JOIN (SELECT ol.idorder, sum((ol.price_per_unit * (ol.quantity)::numeric)) AS total FROM orderline ol GROUP BY ol.idorder) sub ON ((sub.idorder = o.idorder)));


ALTER TABLE release.order_sumup OWNER TO lbaw1324;

--
-- Name: prodfilter; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE prodfilter (
    idproduct integer NOT NULL,
    idfilter integer NOT NULL,
    value_string character varying(50),
    value_int integer,
    type integer NOT NULL,
    CONSTRAINT ck_type CHECK (((type >= 0) AND (type <= 1)))
);


ALTER TABLE release.prodfilter OWNER TO lbaw1324;

--
-- Name: prodfilter_idproduct_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE prodfilter_idproduct_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.prodfilter_idproduct_seq OWNER TO lbaw1324;

--
-- Name: prodfilter_idproduct_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE prodfilter_idproduct_seq OWNED BY prodfilter.idproduct;


--
-- Name: product; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE product (
    idproduct integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    price numeric(9,2) NOT NULL,
    stock integer NOT NULL,
    removed boolean DEFAULT false NOT NULL,
    img text,
    idcategory integer NOT NULL,
    CONSTRAINT ck_price CHECK ((price >= (0)::numeric)),
    CONSTRAINT ck_stock CHECK ((stock >= 0))
);


ALTER TABLE release.product OWNER TO lbaw1324;

--
-- Name: product_idproduct_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE product_idproduct_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.product_idproduct_seq OWNER TO lbaw1324;

--
-- Name: product_idproduct_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE product_idproduct_seq OWNED BY product.idproduct;


--
-- Name: review; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE review (
    idreview integer NOT NULL,
    rating integer NOT NULL,
    text text,
    reported boolean DEFAULT false NOT NULL,
    idorder integer NOT NULL,
    idproduct integer NOT NULL,
    removed boolean DEFAULT false NOT NULL,
    CONSTRAINT ck_rating CHECK (((rating >= 0) AND (rating <= 5)))
);


ALTER TABLE release.review OWNER TO lbaw1324;

--
-- Name: review_idreview_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE review_idreview_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.review_idreview_seq OWNER TO lbaw1324;

--
-- Name: review_idreview_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE review_idreview_seq OWNED BY review.idreview;


--
-- Name: state_idstate_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE state_idstate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.state_idstate_seq OWNER TO lbaw1324;

--
-- Name: state_idstate_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE state_idstate_seq OWNED BY state.idstate;


--
-- Name: transporter; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE transporter (
    idtransporter integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    price numeric(9,2) NOT NULL,
    CONSTRAINT ck_price CHECK ((price >= (0)::numeric))
);


ALTER TABLE release.transporter OWNER TO lbaw1324;

--
-- Name: transporter_idtransporter_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE transporter_idtransporter_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.transporter_idtransporter_seq OWNER TO lbaw1324;

--
-- Name: transporter_idtransporter_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE transporter_idtransporter_seq OWNED BY transporter.idtransporter;


--
-- Name: user_; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE user_ (
    iduser integer NOT NULL,
    email character varying(50) NOT NULL,
    password text NOT NULL,
    name character varying(50) NOT NULL,
    phone character varying(20),
    date_signed timestamp without time zone NOT NULL,
    birthdate timestamp without time zone NOT NULL,
    user_type integer NOT NULL,
    CONSTRAINT ck_user_type CHECK (((user_type >= 0) AND (user_type <= 2)))
);


ALTER TABLE release.user_ OWNER TO lbaw1324;

--
-- Name: user__iduser_seq; Type: SEQUENCE; Schema: release; Owner: lbaw1324
--

CREATE SEQUENCE user__iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE release.user__iduser_seq OWNER TO lbaw1324;

--
-- Name: user__iduser_seq; Type: SEQUENCE OWNED BY; Schema: release; Owner: lbaw1324
--

ALTER SEQUENCE user__iduser_seq OWNED BY user_.iduser;


--
-- Name: wishlist; Type: TABLE; Schema: release; Owner: lbaw1324; Tablespace: 
--

CREATE TABLE wishlist (
    iduser integer NOT NULL,
    idproduct integer NOT NULL,
    date_added timestamp without time zone
);


ALTER TABLE release.wishlist OWNER TO lbaw1324;

--
-- Name: idaddress; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY address ALTER COLUMN idaddress SET DEFAULT nextval('address_idaddress_seq'::regclass);


--
-- Name: idcategory; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY category ALTER COLUMN idcategory SET DEFAULT nextval('category_idcategory_seq'::regclass);


--
-- Name: iddepartment; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY department ALTER COLUMN iddepartment SET DEFAULT nextval('department_iddepartment_seq'::regclass);


--
-- Name: idfilter; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY filter ALTER COLUMN idfilter SET DEFAULT nextval('filter_idfilter_seq'::regclass);


--
-- Name: idorder; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY order_ ALTER COLUMN idorder SET DEFAULT nextval('order__idorder_seq'::regclass);


--
-- Name: idproduct; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY prodfilter ALTER COLUMN idproduct SET DEFAULT nextval('prodfilter_idproduct_seq'::regclass);


--
-- Name: idproduct; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY product ALTER COLUMN idproduct SET DEFAULT nextval('product_idproduct_seq'::regclass);


--
-- Name: idreview; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY review ALTER COLUMN idreview SET DEFAULT nextval('review_idreview_seq'::regclass);


--
-- Name: idstate; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY state ALTER COLUMN idstate SET DEFAULT nextval('state_idstate_seq'::regclass);


--
-- Name: idtransporter; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY transporter ALTER COLUMN idtransporter SET DEFAULT nextval('transporter_idtransporter_seq'::regclass);


--
-- Name: iduser; Type: DEFAULT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY user_ ALTER COLUMN iduser SET DEFAULT nextval('user__iduser_seq'::regclass);


--
-- Name: pk_address; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT pk_address PRIMARY KEY (idaddress);


--
-- Name: pk_buyer; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY buyer
    ADD CONSTRAINT pk_buyer PRIMARY KEY (iduser);


--
-- Name: pk_category; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT pk_category PRIMARY KEY (idcategory);


--
-- Name: pk_catfilter; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY catfilter
    ADD CONSTRAINT pk_catfilter PRIMARY KEY (idcategory, idfilter);


--
-- Name: pk_department; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT pk_department PRIMARY KEY (iddepartment);


--
-- Name: pk_filter; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY filter
    ADD CONSTRAINT pk_filter PRIMARY KEY (idfilter);


--
-- Name: pk_order; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY order_
    ADD CONSTRAINT pk_order PRIMARY KEY (idorder);


--
-- Name: pk_orderline; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT pk_orderline PRIMARY KEY (idproduct, idorder);


--
-- Name: pk_prodfilter; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY prodfilter
    ADD CONSTRAINT pk_prodfilter PRIMARY KEY (idproduct, idfilter);


--
-- Name: pk_product; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT pk_product PRIMARY KEY (idproduct);


--
-- Name: pk_review; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY review
    ADD CONSTRAINT pk_review PRIMARY KEY (idreview);


--
-- Name: pk_state; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY state
    ADD CONSTRAINT pk_state PRIMARY KEY (idstate);


--
-- Name: pk_transporter; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY transporter
    ADD CONSTRAINT pk_transporter PRIMARY KEY (idtransporter);


--
-- Name: pk_user; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY user_
    ADD CONSTRAINT pk_user PRIMARY KEY (iduser);


--
-- Name: pk_wishlist; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY wishlist
    ADD CONSTRAINT pk_wishlist PRIMARY KEY (idproduct, iduser);


--
-- Name: uq_buyer_nif; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY buyer
    ADD CONSTRAINT uq_buyer_nif UNIQUE (nif);


--
-- Name: uq_category_name; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT uq_category_name UNIQUE (name);


--
-- Name: uq_department_name; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT uq_department_name UNIQUE (name);


--
-- Name: uq_filter_name; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY filter
    ADD CONSTRAINT uq_filter_name UNIQUE (filter_name);


--
-- Name: uq_transporter_name; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY transporter
    ADD CONSTRAINT uq_transporter_name UNIQUE (name);


--
-- Name: uq_user_email; Type: CONSTRAINT; Schema: release; Owner: lbaw1324; Tablespace: 
--

ALTER TABLE ONLY user_
    ADD CONSTRAINT uq_user_email UNIQUE (email);


--
-- Name: fill_date_shipped; Type: TRIGGER; Schema: release; Owner: lbaw1324
--

CREATE TRIGGER fill_date_shipped BEFORE UPDATE OF idstate ON order_ FOR EACH ROW WHEN ((new.idstate = 3)) EXECUTE PROCEDURE fill_date_shipped();


--
-- Name: insert_order_date_placed; Type: TRIGGER; Schema: release; Owner: lbaw1324
--

CREATE TRIGGER insert_order_date_placed BEFORE INSERT ON order_ FOR EACH ROW EXECUTE PROCEDURE insert_date();


--
-- Name: insert_wishlist_date_added; Type: TRIGGER; Schema: release; Owner: lbaw1324
--

CREATE TRIGGER insert_wishlist_date_added BEFORE INSERT ON wishlist FOR EACH ROW EXECUTE PROCEDURE insert_date_wishlist();


--
-- Name: fk_address_buyer; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_address_buyer FOREIGN KEY (idbuyer) REFERENCES buyer(iduser);


--
-- Name: fk_buyer_user; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY buyer
    ADD CONSTRAINT fk_buyer_user FOREIGN KEY (iduser) REFERENCES user_(iduser);


--
-- Name: fk_category_department; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY category
    ADD CONSTRAINT fk_category_department FOREIGN KEY (iddepartment) REFERENCES department(iddepartment);


--
-- Name: fk_catfilter_category; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY catfilter
    ADD CONSTRAINT fk_catfilter_category FOREIGN KEY (idcategory) REFERENCES category(idcategory);


--
-- Name: fk_catfilter_filter; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY catfilter
    ADD CONSTRAINT fk_catfilter_filter FOREIGN KEY (idfilter) REFERENCES filter(idfilter);


--
-- Name: fk_order_address; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY order_
    ADD CONSTRAINT fk_order_address FOREIGN KEY (idaddress) REFERENCES address(idaddress);


--
-- Name: fk_order_buyer; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY order_
    ADD CONSTRAINT fk_order_buyer FOREIGN KEY (idbuyer) REFERENCES buyer(iduser);


--
-- Name: fk_order_state; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY order_
    ADD CONSTRAINT fk_order_state FOREIGN KEY (idstate) REFERENCES state(idstate);


--
-- Name: fk_order_transporter; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY order_
    ADD CONSTRAINT fk_order_transporter FOREIGN KEY (idtransporter) REFERENCES transporter(idtransporter);


--
-- Name: fk_orderline_order; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT fk_orderline_order FOREIGN KEY (idorder) REFERENCES order_(idorder);


--
-- Name: fk_orderline_product; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT fk_orderline_product FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- Name: fk_prodfilter_filter; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY prodfilter
    ADD CONSTRAINT fk_prodfilter_filter FOREIGN KEY (idfilter) REFERENCES filter(idfilter);


--
-- Name: fk_prodfilter_product; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY prodfilter
    ADD CONSTRAINT fk_prodfilter_product FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- Name: fk_review_order; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review_order FOREIGN KEY (idorder) REFERENCES order_(idorder);


--
-- Name: fk_review_product; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review_product FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- Name: fk_wishlist_buyer; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY wishlist
    ADD CONSTRAINT fk_wishlist_buyer FOREIGN KEY (iduser) REFERENCES buyer(iduser);


--
-- Name: fk_wishlist_product; Type: FK CONSTRAINT; Schema: release; Owner: lbaw1324
--

ALTER TABLE ONLY wishlist
    ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (idproduct) REFERENCES product(idproduct);


--
-- PostgreSQL database dump complete
--

