--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

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
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: danautoba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.danautoba (
    gid integer NOT NULL,
    id bigint,
    nama character varying(80),
    geom public.geometry(MultiLineString)
);


ALTER TABLE public.danautoba OWNER TO postgres;

--
-- Name: danautoba_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.danautoba_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.danautoba_gid_seq OWNER TO postgres;

--
-- Name: danautoba_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.danautoba_gid_seq OWNED BY public.danautoba.gid;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    gid integer NOT NULL,
    id bigint,
    nama character varying(80),
    kota character varying(80),
    geom public.geometry(Point)
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- Name: hotel_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_gid_seq OWNER TO postgres;

--
-- Name: hotel_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_gid_seq OWNED BY public.hotel.gid;


--
-- Name: ibukota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ibukota (
    gid integer NOT NULL,
    id bigint,
    nama character varying(80),
    geom public.geometry(MultiLineString)
);


ALTER TABLE public.ibukota OWNER TO postgres;

--
-- Name: ibukota_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ibukota_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ibukota_gid_seq OWNER TO postgres;

--
-- Name: ibukota_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ibukota_gid_seq OWNED BY public.ibukota.gid;


--
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office (
    id integer,
    "NAMA" text,
    geom public.geometry
);


ALTER TABLE public.office OWNER TO postgres;

--
-- Name: danautoba gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.danautoba ALTER COLUMN gid SET DEFAULT nextval('public.danautoba_gid_seq'::regclass);


--
-- Name: hotel gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel ALTER COLUMN gid SET DEFAULT nextval('public.hotel_gid_seq'::regclass);


--
-- Name: ibukota gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ibukota ALTER COLUMN gid SET DEFAULT nextval('public.ibukota_gid_seq'::regclass);


--
-- Data for Name: danautoba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.danautoba (gid, id, nama, geom) FROM stdin;
1	1	Danau Toba	01050000000100000001020000009E0200009CE9FABC0CAC5840B28B004D4CED0440A453BA7984AB5840F714BF3F7CF30440D8FD166021AB5840BA0CF7365AF70440C25D48CB0EAB5840A6C8E70D980705402AB2019848AA5840438B0310D20605405AA7FE9F29AA584067A9EDE2491605408E515B86C6A9584015A5B6E7BD14054048BC8FE9D2A95840AB7BA409240905407C66ECCF6FA95840C818C80B5E080540B01049B60CA95840406C14CA051E0540279B115BE1A85840863B15EAF7130540B87A087384A8584067A9EDE24916054045A59FAC6BA858407B8F42822132054033BA30F614A85840BF397899F12B0540077A93CCEFA75840AEA4F7AC8726054067648DDCB1A75840AEA4F7AC87260540DEEE558186A758408C9317B535240540B2AEB85761A75840BF397899F12B054051C4BE479FA758407D46DB63DD39054063AF2DFEF5A75840DC9D8E0DF94D0540BD2F685140A85840FEFE91E9B455054090EFCA271BA85840DB71D98C44680540C0E4C72FFCA758402B581E5B8C710540495AFF8A27A8584055BEF42F48790540495AFF8A27A85840D66D4C0C787F05404D0F5F69E3A7584084393A030481054093A42A06D7A758400A82A1D9F9870540C84E87EC73A75840D72E10A57B90054054791E265BA75840080F505A159C05406FCE4C9929A75840F512FF3045A205407383AC77E5A65840F9728226D1A305401A0372249BA65840B91049C5BCB1054076380C56A1A65840C04D9F8104BB0540C18237D150A658409A9B8F6A1CBE05400718036E44A658403D56AD3B4CC40540DBD765441FA658400F602FE71FCF05404EADCE0A38A658406A3AC5BB89D405406802FD7D06A658404561938FF3D905406802FD7D06A65840F5CED734C7E40540C8ECF68DC8A5584027B4126997DE054029D7F09D8AA55840990BFF413BE30540A061B9425FA55840F77C1C5C23E00540A41619211BA5584062786D3B01E40540D40B1629FCA45840CD2DAE13A5E805404B96DECDD0A45840370F3E2E8DE50540C220A772A5A4584017B34D0631EA0540922BAA6AC4A45840361EFBD69AEF0540F215A47A86A458401A00B3B478F3054080403BB46DA458400FD6A7F45908064080403BB46DA4584025E0537DB914064053009E8A48A458401F25E6283B1D064057B5FD6804A4584079C991CA82260640A2FF28E4B3A35840FA319FBA0E2806408F14BA2D5DA35840CC8E961786370640D5A985CA50A358403265A4C3413F06400954E2B0EDA25840C6EB126EFD4606403EFE3E978AA258403744AE42DB4A0640CFDD35AF2DA25840CFAFF4CFE854064003889295CAA15840628E0A91525A06401928612ADDA15840AEB3D0102665064060BD2CC7D0A1584066928C2DB577064060BD2CC7D0A158409DB1B79A4E830640337D8F9DABA158409DB1B79A4E83064003889295CAA15840B43A66B217950640D747F56BA5A158408BB016013DA2064060BD2CC7D0A158404DC25EC1E0A606401DDDC00899A15840278F9A0906B4064090B229CFB1A1584037C1AC6ED9BE06408CFDC9F0F5A15840C1875C09CFC50640A752F863C4A15840260F2DAEFECB06407A125B3A9FA1584070090F2F80D406401DDDC00899A15840566D7FEE60E90640DAFC544A61A15840EBE26868E2F106407A125B3A9FA1584091ADD2D329FB0640C45C86B54EA15840A2B27F49AB03074051871DEF35A15840688321303705074051871DEF35A1584053D09FE3DA090740D747F56BA5A158404B96C12EAE1407407A125B3A9FA15840FEEF1991F51D0740F19C23DF73A15840FEEF1991F51D07407DC7BA185BA15840F5481AD6C8280740FB1DD3D852A25840F5481AD6C82807406EF33B9F6BA258401CF29676811F0740F76873FA96A258405110BEB8A31B0740F76873FA96A258404B96C12EAE140740F4B3131CDBA2584096EA24BD2C0C07406A3EDCC0AFA2584096582856E502074066897CE2F3A2584091ADD2D329FB06405E1FBD257CA35840920DC2A141FE06405B6A5D47C0A35840CDF96B23FD050740487FEE9069A3584055E4C46296110740EC49545F63A3584016845CED8B1807401C3F516744A35840D8F94E694720074032DF1FFC56A35840124ADE0BB1250740069F82D231A35840F5481AD6C8280740FE34C315BAA358405EE9B39B913A07402B75603FDFA35840D4C491E30228074026C0006123A45840D8F94E694720074009B6720F99A4584049EE04F13C270740F215A47A86A45840995979FAC5170740EF60449CCAA45840EA279A89440F0740BAB6E7B52DA55840C9FDB521741507409DAC5964A3A558404B96C12EAE140740C53797AF0CA65840FEEF1991F51D07403458A09769A65840C9FDB521741507401EB8D10257A65840DEC0D23C7104074061983DC18EA658406883213037050740164E1246DFA658409FEF6A1E86F60640B56318361DA75840920DC2A141FE0640592E7E0417A758406883213037050740AEF95879A5A75840DEC0D23C71040740C0E4C72FFCA7584096EA24BD2C0C074088850B6BA3A85840BBC16C6F590107408C3A6B495FA8584091ADD2D329FB0640A2DA39DE71A858406AE2AE741CF106403E3BE0EFF3A85840D4082E8D90EF06400D46E3E712A95840165EB7120FE706407C66ECCF6FA958407CF6F8BD78EC0640EB86F5B7CCA958401AF554C7EFFB06404407300B17AA584028317D4334F40640E067D61C99AA5840EBE26868E2F106403C9D704E9FAA5840FFD4C836BDE40640F25245D3EFAA5840FBD5B35A6BE20640DBB2763EDDAA5840100F2637FAF406401F93E2FC14AB584081F2D2BAB5FC0640D8FD166021AB5840A2B27F49AB030740471E20487EAB5840A2B27F49AB030740B389C9511FAC584028317D4334F40640E37EC65900AC5840165EB7120FE70640F569351057AC5840DC3DED512ED2064000EBE40936AD58404FA04AE720C80640CB40882399AD584078E2465865C0064093E1CB5E40AE584080B7259087BC06408F2C6C8084AE584016A401854DBD0640D20CD83EBCAE5840967AABF391B50640E8ACA6D3CEAE58405EFB07CC1AA60640CE57786000AF58400F591F550D9C06400D8384407CAF58401BCD3C2B259F064092435CBDEBAF584002706DDBFF9106405E99FFD64EB05840B43A66B217950640E70E37327AB05840BDBBEE54B8880640562F401AD7B05840584A12CC707F06408586CD8063B2584075F55351BC5F06403B3CA205B4B25840D78F141A6064064021E77392E5B25840A092E116B94E064003DDE5405BB358406C2CB476374606404208F220D7B35840B9A1E00119210640E5D257EFD0B3584056CD2E28FA350640204904F190B4584063F8E969CA2F064048D4413CFAB4584064802021011E0640FE8916C14AB55840BD9B4E44D8FF0540354B63E44EB6584031A45BEB48ED054004B8F63A19B85840F23181B54FD50540B5B86BE1ADB8584062E4B70542CB05406B6E4066FEB85840C679C092B2B8054037C4E37F61B95840F512FF3045A20540021A8799C4B95840EF5337367FA105404145937940BA5840ABB4976EFD980540DDA5398BC2BA5840BE133E2197A40540661B71E6EDBA58400E899F73379805403E90339B84BA58400AA530A041910540243B0528B6BA58409503FCE26D8605406366110832BB58401CF617FA8F820540BF9BAB3938BB5840DED16678226C0540719C20E0CCBB58403534906300700540B37C8C9E04BC58409A8F78DE065805408EA6AE3157BB5840A4B02FE240570540181CE68C82BB584069C1B036B1440540146786AEC6BB58407D46DB63DD390540146786AEC6BB584052C44876393505403271140051BB58406614975D693B0540507BA251DBBA5840638FB5BF1D210540E50FF9473ABA5840C818C80B5E0805405430023097BA584050F4D4442AF10440DDA5398BC2BA5840D7E4A77F22CF04405EB1B12976BB58402B5DA57EE8CF0440BF9BAB3938BB5840F912CE9ABEB10440CA1C5B3317BC584028B1C5A0689E0440D8526A0BB2BC5840105C879B34870440177E76EB2DBD5840DEFF3996B27E044031D3A45EFCBC584094DDC69EF08E04401D4AC60651BE5840363FF4873A6F044089B56F10F2BE58400B91D9939A7B0440F8D578F84EBF58400BE16063B4550440370185D8CABF5840A577AC68CC5804400AC1E7AEA5BF584099D28F7DB8660440E54C9AA0A3C05840D05958453C460440CEACCB0B91C0584081E24D32BA3D0440E8638ADD0AC258407D954DF5852604409964FF839FC25840BD7528C081150440578493C567C258407E23DB97E709044005D0A88D40C35840F3084EC3A0D703400885086CFCC258409801897162C70340EE2FDAF82DC35840AC0392BFABA70340CC70ECC8E7C35840DA832C3803920340D0254CA7A3C35840045081E0DC840340A79A0E5C3AC35840C26F639039570340696F027CBEC258401BE1A6EC1C43034091FA3FC727C358404EA344ECB725034074F0B1759DC35840FD0E041D222B03405231C44557C45840F2333508D0280340941130048FC458402899BA753035034058FD13617AC55840A4ADA9DF90410340791E92EF6BC65840A4ADA9DF9041034045743509CFC65840C669D17721540340C67FADA782C758408AABC95843500340D96A1C5ED9C758408FE42447346F034074CBC26F5BC85840438694C038800340530CD53F15C95840D1ED3B8A7C780340D7CCACBC84C95840D1ED3B8A7C7803408D828141D5C958408AABC95843500340A7D7AFB4A3C95840EE71DD898237034077E2B2ACC2C95840F2333508D0280340DC810C9B40C95840045F08739118034044D6C5677AC85840CFC8B6D7520803406695B397C0C758405038C5E6DE090340FB290A8E1FC758406D5294A2E8020340CEE96C64FAC6584029DF98860FE702404DDEF4C546C65840B76B3FD00AD60240B532AE9280C55840325A297B4ECE02406F9DE2F58CC55840420EB42492C60240007DD90D30C55840DDB82BF0EDC10240ED916A57D9C45840537C7347AAC902405A9B8302CFC358403E3D83F444AC0240748E2117F2C15840D400D8969BE8024062A3B2609BC158409A9E4B7683E502404C03E4CB88C15840E1C5FA69C2CC0240B1A23DBA06C158405B4C3F1306C502402F97C51B53C05840B69FA758C7B40240035728F22DC05840A39D4C69AAA002405F8CC22334C05840DC9C9BE4D5950240F420191A93BF5840ECE5AC7270A1024028CB750030BF5840F1C972A0F7BA02407315A17BDFBE584017B820E2B8AA02406894F18100BE5840C244AFFD0AAD024056A982CBA9BD58409E2CA97CDFB70240A4A80D2515BD5840C244AFFD0AAD0240F2A7987E80BC58403CA97F0A40C40240B37C8C9E04BC58405B4C3F1306C5024083878F9623BC58406FD6A302AFDA0240E826E984A1BB58409CE0D494A0D00240ADB03C83E1BA58401AA319E196D70240D7D9E96F9FB958403E3D83F444AC0240AE4EAC2436B9584036809E4F01B40240810E0FFB10B95840EA17E0CCD5BE0240469862F950B8584083E98CDE61C0024034ADF342FAB75840B69FA758C7B402403C17B3FF71B7584083E98CDE61C00240F581E7627EB75840DCE1498CDACF02408A163E59DDB658404126BE5836CB0240BFC09A3F7AB65840866AEDB3DAA60240090BC6BA29B65840A780A5AA14A602405355F135D9B55840EF309797A58F0240CE9419B969B5584068683384198E0240D6FED875E1B45840BB27CD1D7A9A024097D3CC9565B45840A780A5AA14A602406A932F6C40B458407AE291463BB302403A9E32645FB458405B4C3F1306C50240EF5307E9AFB45840DCE1498CDACF024048D4413CFAB458401FC7E5F122D902403DB522A1C6B55840DCE1498CDACF02400CC02599E5B55840250209A727EA0240715F7F8763B558400AD719FFA9F202404D89A11AB6B458407C436FB93A050340DE68983259B45840441CD629D51003403E5392421BB45840EA2446F37D260340CF32895ABEB35840FD0E041D222B0340889DBDBDCAB35840E05384A49A3A03408033FE0053B45840E05384A49A3A03409A882C7421B4584073A52184AD5503405C5D2094A5B358405F0784EAD3620340301D836A80B35840CCAF1B588671034098713C37BAB258407E5E1A05478A03403FF101E46FB25840758FBB8F4279034000C6F503F4B15840438694C038800340EA25276FE1B1584099FE125B6D970340A745BBB0A9B1584023B599B159A5034065654FF271B1584073C8B55032C10340DCEF179746B15840EA850AA1AAD00340E359D753BEB05840A97E52FD00E403408F8EFCDE2FB0584060241F12A5E80340EF78F6EEF1AF58404492643DB3F20340BF83F9E610B05840205CD08643050440C33859C5CCAF5840D69ABBB569120440CE57786000AF5840CCAEDD06B62C04401D5703BA6BAE584082DBFFFBD728044067A12E351BAE584031147A1D38350440C4D6C86621AE5840B7C7A03E24430440DE2BF7D9EFAD58407FDB9753324D044037AC312D3AAE584069301A55F84D04400E21F4E1D0AD5840C8773B6B585A04400E21F4E1D0AD5840F3BC947E7E670440E595B69667AD58406D2393800A6904407EDF6C6B82AC5840D05958453C4604403FB4608B06AC58402098FD5A10510440C82998E631AC5840B2DB2B70705D044059098FFED4AB58400F44BB6DE45B0440A8081A5840AB58404F1D3E78DA620440D448B78165AB58403A336284226C044017EBAE5710AB5840B91EC0854B6D04408F7577FCE4AA58406D2393800A690440533013AAFAAA5840B2DB2B70705D0440FAAFD856B0AA58406D2393800A690440AB7F054E6FAA58400A27618E6A75044079A460B8FCA95840416F1195267D0440803F68244AAA584098335D98CA810440E40F0AC29DAA5840A824DA97048104408F7577FCE4AA584089917B9A45850440D055E3BA1CAB5840B628809D758B044008E6E72E4BAB58405CD4579956830440664CCA0F27AC5840190BBA9B97870440FDC6C89317AC5840107F229F19900440CEA083DC60AB5840C9CA92A00F970440C2501C9257AB5840D003A89F0892044039DBE4362CAB5840D67C759F4291044069D0E13E0DAB5840CDABCBA0059E0440B600B5474EAB5840F8E180A01DA10440AE96F58AD6AB58401205939C43AE0440390C2DE601AC5840CFEA969A21B20440BAE65CD5DFAB584096635996B4B80440FDC6C89317AC584060AD5E92BBBD0440D0862B6AF2AB5840ECB7DF8E99C10440C636C41FE9AB58408F2A8B830ACC044059FC62C51DAC5840B92D057618D60440918C67394CAC58404706396937DE04400FB2374A6EAC58400AACBD7093D90440AEC73D3AACAC5840BFA32270F6D90440A75D7E7D34AD5840379A338C4EC404404A28E44B2EAD5840288A09921EBE0440C94DB45C50AD5840E74EC7957AB90440DEED82F162AD584081BA049C6CAF04405C13530285AD5840B32FD89E76A80440C398547E94AD5840978E64A0E3A10440167E876591AD5840EE8AD2A0279A044073B3219797AD584079B3D69FCE920440D0E8BBC89DAD58401D67A69E8D8E04404E0E8CD9BFAD584088012D9DAF8A044063AE5A6ED2AD5840F022439AE284044063AE5A6ED2AD5840574B9D982D82044034B95D66F1AD5840C4025D95897D0440B1DE2D7713AE5840BF14E991487904406B4962DA1FAE5840AD5E798C7B730440BC2E95C11CAE5840F56E4C85E86C04407699C92429AE5840A991CA783D630440E86E32EB41AE58409E586465DD560440A1D9664E4EAE584022BC11526C4C0440E6B9D20C86AE58405093CD47654704400D451058EFAE58401B3EBA2DCB3B0440A20AAFFD23AF584065E86412F7300440B4F51DB47AAF5840414A4CFF002A0440E135BBDD9FAF5840C3BCCB05532C044027CB867A93AF584091EBC3F0F9240440E135BBDD9FAF58404C2B57E67E210440A4F0568BB5AF5840728BD6D1EB1A04408331695B6FB058408C2F0481B7030440C711D519A7B05840F2E38DA19C0C044008F240D8DEB05840F87D0CB7CC120440BFA7155D2FB1584076C712AB510F04402DC81E458CB158401B296BACB40F0440ACEDEE55AEB15840D69ABBB569120440A7388F77F2B158403852C3B1401104406CF32A2508B2584005CA089C100B0440892E012668B2584014FE3E759F000440C1BE059A96B2584037B7B96724FD0340E1AE3B79B2B258402F093E6987FD03403FE4D5AAB8B25840ED1A9F6198FB0340DEF9DB9AF6B258403774CC4B2EF60340D3A97450EDB2584083B9622B72EE0340AE04DF9215B358400E8FB21FBDEB0340C4A4AD2728B358405EADAAD7E1DB0340895F49D53DB35840EDC8E6C8C9D8034072BF7A402BB3584073C8B55032C10340E594E30644B3584085ABD22C9FBA034012D5803069B35840C09AAD1098B5034054B5ECEEA0B35840EB31931B87B703400E202152ADB35840F3979B39F1BC03401870889CB6B3584084E7C95295C1034077A522CEBCB35840782A115B21C30340E4C52BB619B458404F499B7DB4C90340EC60332267B458402E66736B39C6034018A1D04B8CB45840D2EC3C614AC40340D20B05AF98B45840231D0F427DBE0340A9B10F1305B558408D60D6FC1CB203403327476E30B558408C534B0CD2B4034053177D4D4CB558404439EEE178AD0340D23C4D5E6EB55840B59EB4CF60AA0340CC87ED7FB2B55840F53CAADF15AD0340350DEFFBC1B55840ECC781C6D4A803406C9DF36FF0B558401E7242AFF6A40340EBC2C38012B65840B4D3079A7BA103406AE8939134B658403A30D169BF99034072839BFD81B658409F8921333D91034026397082D2B65840DCE7122E77900340BAFE0E2807B7584011148302E4890340238410A416B7584081509BD08A8203405A14151845B758405B30F4976B7A034040BFE6A476B75840D1ED3B8A7C7803407B3593A636B85840CCAF1B588671034014B0912A27B858408496E076C775034061E0643368B8584084F16C7C8D76034031EB672B87B85840E8BF7A87197803408A6BA27ED1B858405CD48A60AF7203408A6BA27ED1B85840466F0D36E26C034013E1D9D9FCB858401D4A9510DB6703403B6C172566B9584019B87752C07003402117E9B197B958403A83B8AD837D0340030D5B600DBA58405B30F4976B7A03402C9898AB76BA5840EB2703AB207D0340DD980D520BBB58408496E076C77503407DAE134249BB58405B30F4976B7A0340C08E7F0081BB5840AFE9AF9ACE7A0340519FBEC7F9BB5840E49FEBD5508303407DDF5BF11EBC5840FFEC421CC28D034090CACAA775BC584019E0EAFF8089034002A0336E8EBC584076DB2317FC8C034051D00677CFBC5840CF36460A0D8B0340CEF5D687F1BC584076DB2317FC8C03409E00DA7F10BD5840C99E0029B18F0340277611DB3BBD58404617D11E258E034002D17B1D64BD58407B1B76264E8F0340DD2BE65F8CBD5840A0AD9A30DA900340B78650A2B4BD584074843747559403409D31222FE6BD584053DF334C1B9503400F078BF5FEBD58403A30D169BF990340AF1C91E53CBE584075BBEA86639E0340E7AC95596BBE584075BBEA86639E03407022CDB496BE5840B580B78B299F03409D626ADEBBBE5840BE2B91AA30A40340830D3C6BEDBE5840ECC781C6D4A8034052183F630CBF5840B59EB4CF60AA0340D13D0F742EBF58404439EEE178AD03406403AE1963BF5840335F34ED67AF0340D8D816E07BBF584030BB7B0346B303403F5E185C8BBF5840131E671924B70340F8C84CBF97BF584085ABD22C9FBA03403F5E185C8BBF58406532D73DB7BD0340E3287E2A85BF5840FFBB0059BEC203401E6EE27C6FBF58405CAA4963ADC403407BA37CAE75BF5840995C8E73C5C70340E3287E2A85BF58404F499B7DB4C903404E63DF8450BF5840B4F2ACBD77D603407308754228BF5840592550D055DA0340F5E2A43106BF584068D724DD0ADD0340D3F26E52EABE58401319CCE9BFDF0340C9A20708E1BE5840BC49F01831EA034056CD9E41C8BE5840357FBA24E6EC0340CC5767E69CBE58405E8F614D91F60340AB67310781BE58406EFB456F13FF0340DB5C2E0F62BE5840D5D6B08909060440C5BC5F7A4FBE5840E7042EA0390C0440C5BC5F7A4FBE58401B296BACB40F04408D2C5B0621BE5840EB87F9BAF51304401A57F23F08BE5840B34CBAC247160440AC36E957ABBD5840F8D706DEC91E044080F64B2E86BD584017279FEF9624044017714AB276BD5840A2C58CF74B270440EA30AD8851BD5840414A4CFF002A0440A85041CA19BD5840CCAEDD06B62C0440D8453ED2FABC584066CD541031300440393038E2BCBC584031147A1D38350440B0BA008791BC58408EFC0E29DC390440E0AFFD8E72BC5840E375A62E2E3C0440782AFC1263BC5840A230E635463F0440B36F60654DBC58408E4A2E3B98410440364A90542BBC5840F14D4F3A35410440C374278E12BC5840686DE93C5E4204405BEF251203BC584064B78444D94504408BE4221AE4BB58407849074BF148044075445485D1BB58401D7A1358844F044078F9B3638DBB5840AD6E8A594A500440EF837C0862BB584097A60D6417560440C343DFDE3CBB5840A577AC68CC580440FE88433127BB58400F44BB6DE45B04405323D6F6DFBA58404F1D3E78DA62044026E338CDBABA58406AC4157FE167044058D835D59BBA58403A336284226C04404C88CE8A92BA5840EC60A689C6700440E502CD0E83BA58406AE7A08DA4740440204831616DBA584076F98A90BC770440A12261504BBA58400B91D9939A7B0440D2175E582CBA5840044BF1954F7E0440F7BCF31504BA58400F0BB39AA885044048A226FD00BA5840B2413F9E648D044048A226FD00BA5840849AEC9F31930440BC778FC319BA5840C6D85BA08395044054F28D470ABA5840EE8AD2A0279A04403E52BFB2F7B958401CF7D9A0799C0440CA7C56ECDEB958407FFAADA0919F044007C2BA3EC9B95840DE998DA0BAA00440E5D1845FADB9584022B9CC9FFBA40440C4E14E8091B95840FD5DD39BCFAF0440F4D64B8872B95840A0F1719728B7044098A1B1566CB9584003D5109617B90440DF367DF35FB958402748589392BC044055C1459834B958401897EB8866C704403F21770322B95840E62712836DCC04401E31412406B958402B5DA57EE8CF0440B5AB3FA8F6B85840F1CF267752D50440A00B7113E4B85840F7DF0C6DE5DB044065C60CC1F9B8584098C4DE69D4DD044013E1D9D9FCB858402B1B2861DBE2044043D6D6E1DDB85840A14ABF5A56E604408A6BA27ED1B8584052887E5297EA04402C36084DCBB85840E482AA45C7F004407F1B3B34C8B85840423397300FFA0440A4C0D0F19FB85840278A472379FF0440A87530D05BB85840B8B267064D0A05401E00F97430B85840792E8EF47C100540968AC11905B85840ED48DCDC381805401765F108E3B75840638FB5BF1D210540993F21F8C0B758405F63BFB398240540BFE4B6B598B75840381DB69DC82A0540067A82528CB7584021A55292E02D0540067A82528CB75840C7B5278895300540C299169454B7584052C4487639350540DCEE440723B75840C528BB60A33A05400194DAC4FAB65840C7E8CB4870400540CA03D650CCB65840F0185933774505409DC33827A7B658406FBAF71E1B4A054072839BFD81B65840ECFD1111334D054009FE998172B658405743070ABF4E0540A278980563B6584063EFF4F93952054072839BFD81B65840DC4411EF8B5405409DC33827A7B65840872C3DEDEE5405401199A1EDBFB658405172BDDACC580540D5533D9BD5B65840113958D1BB5A0540B0AEA7DDFDB65840CAE9BAE7175605408B09122026B7584088809BDC69580540A1A9E0B438B75840D120A9CBE45B05409659796A2FB75840B702A0B2EB600540C74E767210B758406E2CEB9EC96405409A0ED948EBB658402950EB94B86605406DCE3B1FC6B65840D4BD857C5C6B05409DC33827A7B65840C6DB5576856C054009FE998172B65840D0C7767ABF6B0540144E01CC7BB65840CA39EE9A8F650540F45DCBEC5FB65840CA39EE9A8F6505402353C8F440B658409660E4907E670540A52DF8E31EB65840D4BD857C5C6B05408F8D294F0CB658401621C3673A6F05400618F2F3E0B558401621C3673A6F05409E92F077D1B55840D070BE54B5720540CF87ED7FB2B55840774F3C5D29710540AD97B7A096B5584035349063007005408CA781C17AB55840D97F79507B7305406BB74BE25EB5584014940A4AA4740540A5FCAF3449B55840D3B1113DF6760540E141148733B558408EBA87361F780540BF51DEA717B558407CAD401E607C0540FC9642FA01B558402E2AF300678105409411417EF2B4584058CE80F5558305401F3CD8B7D9B458401CF617FA8F8205406A86033389B45840814ACCBA008D05405F369CE87FB458400BF157AC528F05409A7B003B6AB45840D72E10A57B90054027A6977451B45840308C028FF693054006B6619535B458400E899F733798054041FBC5E71FB458405C8BDC5CB29B05407C402A3A0AB45840C3F6EF4A679E0540086BC173F1B3584015C8C22B0BA3054045B025C6DBB358407877011486A6054067A05BA5F7B35840EB239FFE9DA9054015BB28BEFAB358408156D8D56AAF054015BB28BEFAB358403EA22ABA48B30540E87A8B94D5B35840F6CD2DAC37B505402F105731C9B35840BBCE0E8D78B9054002D0B907A4B358407714A9677FBE05408FFA50418BB3584091D1045C0BC0054028754FC57BB358409124CC2FD8C50540C0EF4D496CB358403A02CD0E19CA05409EFF176A50B35840665A80F630CD0540B85446DD1EB358408A4093D1D4D10540976410FE02B35840F74B489C67D80540D2A97450EDB25840C5E0EF952DD905406A2473D4DDB258404B499A7FE2DB0540183F40EDE0B25840F2AF876FD1DD05404A343DF5C1B25840F77C1C5C23E00540D75ED42EA9B258404F1B59524CE1054064896B6890B258404F1B59524CE10540FB036AEC80B258407D26233864E40540728E329155B258407D26233864E405405CEE63FC42B258406348581ADFE70540DEC893EB20B25840DC5297FFF6EA054060A3C3DAFEB15840361EFBD69AEF05402813BF66D0B15840893825B815F30540944D20C19BB158406EDCE3C589F105400BD8E86570B15840EE9606BF4FF20540C8F77CA738B15840893825B815F30540A80747C81CB15840EE9606BF4FF205403532DE0104B15840893825B815F30540EE9C126510B158404F1D92D3FDEF05406F774254EEB05840D77ABDEEE5EC0540F0517243CCB058404F1D92D3FDEF0540E6010BF9C2B058401A00B3B478F305400057396C91B05840C7BC75C2ECF1054047EC040985B0584016E594E40EEE054025FCCE2969B05840C20DCADDD4EE05406C919AC65CB05840541628D060F005409D8697CE3DB05840BC3056AAA1F40540340196522EB05840654D0884E2F8054059A62B1006B05840BD9B4E44D8FF05408B9B2818E7AF58402D35D811420506405E5B8BEEC1AF584041BBA4E982090640A4F0568BB5AF584041BBA4E9820906406C60521787AF58400F7651ED1F090640EE3A820665AF58400F7651ED1F090640CD4A4C2749AF5840972F48E2480A0640A10AAFFD23AF584028C082D3D40B0640C6AF44BBFBAE58404B520AB24F0F0640A5BF0EDCDFAE58406A4288791C150640B4C4D504A5AE584001761E815614064041EF6C3E8CAE5840378AB08890130640669402FC63AE5840EB9CBB757F1506407699C92429AE584041BBA4E982090640EB2392C9FDAD5840FAA07915DF04064011C92787D5AD5840D5B95720B6030640F0D8F1A7B9AD584010A6E14775FF05401FCEEEAF9AAD5840167080790BFA05404573846D72AD58401A00B3B478F305409A0D17332BAD584091C7F8E7ABED05409FC27611E7AC5840E4A6EF2AF0E50540144D3FB6BBAC5840B8888C4875E2054046423CBE9CAC5840F2AF876FD1DD0540753739C67DAC584077CD3289B9DA05400EB2374A6EAC5840792F05C2C3D305400262D0FF64AC58403A02CD0E19CA0540853C00EF42AC584094F86F4A5DC205401CB7FE7233AC58405DE4C07E67BB05406E9C315A30AC5840F6CD2DAC37B50540C18164412DAC584079C9FD03D8A80540B631FDF623AC584042DCC7452D9F0540B631FDF623AC584010D88B69C3990540644CCA0F27AC584094311B8582950540071730DE20AC58409A2EC3AEEF8E0540ABE195AC1AAC58409D1393D222890540FDC6C89317AC5840D5B833F3B8830540FDC6C89317AC584084393A0304810540644CCA0F27AC58407CAD401E607C0540ABE195AC1AAC584099BD2632E57805409F912E6211AC5840DB86554EDE730540F17661490EAC58405F3D756163700540445C94300BAC5840DB71D98C446805409541C71708AC58406E2CEB9EC9640540F17661490EAC58404B0066BA5F5F0540F17661490EAC584015288FCD815B05404EACFB7A14AC5840C6D5E2E57A560540DBD692B4FBAB5840872C3DEDEE540540370C2DE601AC5840CA318EFD73510540370C2DE601AC58402F30D212D04C0540D0862B6AF2AB58404C6C05351445054073519138ECAB584028096F5A2F3C0540C536C41FE9AB5840BF16C5749C35054052615B59D0AB584003E8AF86F8300540EADB59DDC0AB5840602250A33C29054082565861B1AB5840DF756EBAA92205403171257AB4AB5840B3AC6FD0161C0540A4468E40CDAB5840B1712CD961190540226C5E51EFAB584015A5B6E7BD140540FDC6C89317AC5840863B15EAF71305401DB7FE7233AC5840D399C6EE6B120540290766BD3CAC5840C0251CF9F00E05407BEC98A439AC5840B8B267064D0A0540CBD1CB8B36AC5840A6C8E70D98070540290766BD3CAC5840A077531AF40205403457CD0746AC5840C49A1E288AFD04403457CD0746AC58400A705833E6F80440E3719A2049AC5840414D053E42F404401DB7FE7233AC5840236B4E4253F20440ABE195AC1AAC58403F177F4664F00440F17661490EAC5840BB54CC4DE9EC0440
\.


--
-- Name: danautoba_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.danautoba_gid_seq', 1, true);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel (gid, id, nama, kota, geom) FROM stdin;
1	1	Ever Bright	surabaya-kertajaya	0101000000C986F21404315C40BC680BA0EE1E1DC0
2	2	hotel dan apartemen Sahid Gunawangsa	surabaya-kertajaya	0101000000AE8FE7FA34315C404BAA7182E5281DC0
3	3	apartemen kertajaya one East	surabaya kertajaya	01010000009AD1E04CFF315C409D4E845DF41E1DC0
4	4	Hotel santika Premier	gubeng surabaya	01010000008F2DDC31D92F5C402545D58DB4161DC0
5	5	G. Hotel Suite	gubeng surabaya	0101000000918EFBDFE12F5C40776D2EBA39171DC0
6	10	POP Hotel	Gubeng Surabaya	0101000000AC45D4B1F52F5C40F3C2C5CC49171DC0
7	6	Hotel Demira	Karimun jawa surabaya	01010000005AC670C3B62F5C4097A5A17C01181DC0
8	7	Hotel G. Suite	Gubeng sby	0101000000CD51B16BD42F5C40E426318528181DC0
9	8	Hotel	SURABAYA	010100000008DC7AE410305C40763DA047BA151DC0
10	9	Hotel Sulawesi Gorontalo	sulawesi Surabaya	010100000015D916F8A42F5C400C7670C98F141DC0
11	11	The Win Hotel	KAYON surabaya	01010000003AC1D93EDD2F5C40ED938F4F8C121DC0
12	12	Miran Inn Hotel	kayon surabaya	0101000000A8839555E42F5C40559FC77E95121DC0
13	13	Hotel Kenongo	embong kenongo surabaya	01010000005E2ED6A6C42F5C40865C99AEA6101DC0
14	14	loxy in	Surabaya	01010000003211281C9F2F5C4012B316C417111DC0
15	15	Grand Surabaya Hotel	surabaya-jalan taman simpang	01010000002954BE50C62F5C4046E11ED5900E1DC0
16	16	Surabaya Suites Hotel	plaza boulevard Surabaya	01010000004773FC05E82F5C401172E378020E1DC0
17	17	Remaja Hotel	Surabaya	01010000001B2FEFA1DF2F5C4038CAD0BE32111DC0
18	18	Sparking BackPaper Hotel	Surabaya	0101000000776BBC5BF72F5C409A0F32F9E6101DC0
19	19	Hotel	surabaya agung suprapto	0101000000478CCF74C02F5C404D95E7856C071DC0
20	20	Ameral Hotel	Suarabaya jl Ambengan	0101000000B29AD899C02F5C4033DAB36D3D061DC0
21	21	New Grand Park Hotel	Surabaya pusat	01010000003AA0ECD88F2F5C406FF5150564F61CC0
22	22	Hotel Arcadia Rajawali	surabaya jln mliwis	0101000000E8DF82E0252F5C40AE6BA2D93CF21CC0
23	23	Best Hotel	Kedungsari surabaya utara	0101000000B4D2F0EA062F5C40FA102B70A8121DC0
24	24	Bisanta Bidakara Hotel	surabaya utara	01010000007E2B5334292F5C40AA96D00CB5111DC0
25	25	Hotel Cendana	Suarabaya	0101000000A1581D54552F5C40D2A0D2FDC3121DC0
26	26	Midtown Hotel	NULLBasuki Rahmat Surabaya	0101000000A67435296A2F5C40673A7B4323121DC0
27	27	Hotel Croen Price	NBasuki Rahmat surabaya	0101000000C07EA13E7C2F5C4097B96297DF151DC0
28	28	Citihub Hotel sudirman	Tunjungan plaza surabaya	010100000016F92F9C822F5C4058A7296BF5161DC0
29	29	Hotel Elmi	tunjungan  surabaya	01010000005BDF43328F2F5C40EDFDA10002141DC0
30	30	Hotel Tanjung Emas	jln karimata surabaya	0101000000B5E224D9F02F5C40C7A034AF1D1E1DC0
31	31	Grand Darmo Suite Hotel	jl progo surabaya	0101000000515BC6796C2F5C4049E40CFE0F2B1DC0
32	32	Novotel Surabaya Hotel	Raya ngagel surabaya	0101000000046CFB098E2F5C4030382497142E1DC0
33	33	Hotel sulawesi Kertajaya	kertajaya surabaya	010100000041253E5322305C40350C05F83A1F1DC0
34	34	Hotel Evora	Menur Suarabaya	0101000000D75F552FC2305C4081107AD4A61A1DC0
35	35	core Hotel	Surabaya manyar	01010000009B83CC34F7305C403BD08F94281D1DC0
36	36	Hotel Pondok Hijau	bukit darmo surabaya	0101000000413DD66EB12C5C405FCAF1DBD4271DC0
37	37	Hotel Grand Kalimas	Surabaya	010100000010D45772682F5C4031782805AEEB1CC0
38	38	Hotel  Trunojoyo	Sampang jl Rajawali	0101000000916077B1A54F5C40970EF9D6ABC91CC0
39	39	TS SUITE hotel	surabaya	010100000053E46D5DC82E5C400A3DC3F2F42D1DC0
40	39	Shangrila hotel	Surabaya	01010000005DA40D9ED52D5C40147C0D6ABC281DC0
41	40	Hotel Pakis surabaya	surabaya pakis	0101000000D17700E9C62D5C400B96F79B352B1DC0
42	41	Hotel Singga Sana	surabaya selatan	01010000001EF6F067F22D5C4099117DAF46391DC0
43	42	Farila Guest house	surabaya	01010000007C1E12EFCC2D5C40649CF956E7251DC0
44	44	homestay Baroe Tjahaja	Surabaya dukuh kupang	0101000000B79F7950E82D5C4037C1BA1457261DC0
45	45	henny homestay	surabaya	01010000000C0FF256922D5C400C03AF14E3221DC0
46	46	hote wijaya kusuma	sby dukuh kupang	01010000001AF54FAC8A2D5C40C5EFD6AE9A211DC0
47	47	hotel juanda	surabaya juanda	0101000000F9276D1578305C40CEBD17125E811DC0
48	48	Sinar Hotel	Juanda surabaya	0101000000A7144F90D8305C40B64316E58B791DC0
49	49	sun city hotel	sidoarjo	0101000000F45F6A21702D5C4092188A12FFCB1DC0
50	50	Vanda Gardenia Hotel	Mojokerto	01010000003F1EED6AE3265C4046B20FBD7FAD1EC0
51	51	Hotel Trawas	Mojokerto	01010000007AB4CC14F7275C402C8798D660B31EC0
52	52	Hotel	markisa MALANG	0101000000BEF87A3524275C4067E3466177EA1FC0
53	53	Hotel Arya GAjayana	MALANG	010100000026EC8B36F4275C405403B86A2DE91FC0
54	54	Hotel Olli	Malang	0101000000F391351AD4275C40ACBE39D415E81FC0
55	55	The Grand Palace Hotel	Malang	0101000000EE19E18A42285C406819C179DEF01FC0
56	56	Hotel Kyai agus salim	malang	010100000015CEB0197A285C40D6E40331DEEF1FC0
57	57	Hotel Haji Ahmad	Malang	01010000000EB57D4895285C408B97FE98D1EF1FC0
58	58	Hotel	Malang jln jendral  gatot subrato	010100000052297BDDBC285C40259C9580FBEE1FC0
59	59	olino Hotel	jln Aris munandar Malang	0101000000635717589E285C40382B40A316ED1FC0
60	60	Hotel	jln majapahit malang	01010000004325AE7A83285C407C3360C15AE91FC0
61	61	Hotel	majapahit malang	01010000000FCB575E63285C405744B63AB2EB1FC0
62	62	Hotel	JLN trunojoyo Malang	01010000009CBFB33ABC285C40EB45949642E61FC0
63	63	Hotel Graha Kartika	MALANG	01010000000E91C7E853285C4027F7FC8655E41FC0
64	64	jonas Homestay	malang	01010000007745742194285C40D939D72FDFE11FC0
65	65	Hotel santika	Malang	01010000008A14EFDDC8285C40080DCFA347D51FC0
66	66	Rumah alfian	Malang	0101000000305922FDDA285C40DF24DDEBB9D61FC0
67	68	hotel amaris	jln litjend malang	0101000000E0C898DBB7285C40874404AAB2D71FC0
68	67	Grand Surya	KEDIRI	010100000028E6E0F5E2005C40B4C52B2F5F451FC0
\.


--
-- Name: hotel_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_gid_seq', 68, true);


--
-- Data for Name: ibukota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ibukota (gid, id, nama, geom) FROM stdin;
1	1	jatim	01050000000100000001020000000F000000DB5898F4882D5C40A6CC16C643631DC05FA08E3030365C40A83BDEB52B691DC028E9DB8C00365C402CB88518571F1DC0666507560C345C40156A0621C2041DC08E4DB5EC29315C4040C26259BAC61CC0B2309D8FAC2B5C405D6C329838E71CC068E56CB98E2A5C40BB96F10497CF1CC0A9665E76352B5C402B4210E100B51CC00401F9BCE7255C40C948CC5918AF1CC0AFEB89CD52245C4031A402DBA6EB1CC032EE6C47A0255C40963E7E41B6071DC082FE15439A245C40F41B739B92101DC0B9B5C8E6C9245C405BD5C2997D351DC04B47639F6A245C40AD3B67A6996D1DC0AD6B246AD02D5C40D84381C2BD641DC0
2	2	bali	01050000000100000001020000000F0000008D6BCC33AAC55C402973C23A513A21C0A504105A33C95C40DC604511D21F21C0A909D64DCECB5C4025DD9FA83C2421C0B5D3146745CC5C40817330975F3721C062C36B6B4BCD5C40506AB1AB174621C0729270785DD05C406A118176904721C059397A2093D15C4082FA8C36B74C21C07C5CAF91D4D05C40026C851FF65921C044A5FCEDA4D05C40C4FAA9C34C6F21C09C7A1E0F7BCD5C408D8FD21E097021C031D131EDF7CA5C40E1642F2F3E7221C02907F3D380CA5C4009B1FCB3FF6421C04060E92B4BC95C400B5EAF76CF5421C0C05D06B2FDC75C405297EB27655021C028C7A505C2C55C406F408373863C21C0
3	3	yogyakarta	01050000000100000001020000000F000000CE1BE9ECC6945B40654B8F98C5481FC03625AFA7EA945B40C450A27B1F341FC0B4C2F294FC955B40B6CE41F3F6FA1EC04FBEF2CD73985B408F91245A72031FC0588831E7EA985B40318A317ED20A1FC01DBC726AAF995B4022A4B7A53D081FC0F9E8D0AC9D9B5B407643206317111FC02B3BE4C3919B5B40DFC3CAEC0D221FC077E6ED32509A5B400D5DC42029231FC02786B183269A5B408E422A2D143E1FC0908F773E4A9A5B404C5F82CF08481FC0BC7CEBC8029A5B400F34AD91BB591FC04A09C08D08975B40457031AD0B561FC0FAA883DEDE965B40E7FC8CD283501FC0B4725FE1CC945B40E9BE0DFD23491FC0
4	4	jabar	01050000000100000001020000000F000000D43DB5010FDF5A409F5C1ACA8DB31BC03CE7A12392E15A40963983BB4D811BC078A31ABB5CE45A408458D004BE631BC03B27EFF150E65A408084E338C9601BC0A4D0DB13D4E85A4041B9CA6BD45D1BC086B26C962DEC5A40193E847A42841BC09E4BB0BCB6EF5A4076869312BBA71BC0F3601FAC4BF15A40A2CFDB9D5DE11BC0F3601FAC4BF15A400A839F0FB20D1CC0FEEA10F703ED5A4017EA5E73053A1CC08B77E5BB09EA5A4052FFDB95DD641CC0AF5ACD5E8CE45A408042F26363631CC07A63CDEC9DDF5A40EF15AE388B381CC0F7209DA491D95A405CDA422256251CC06F998ED326DF5A409802B61F08B51BC0
5	5	jakarta	01050000000100000001020000000F00000064850C92C4AE5A40150F1A6D8DD118C00AAB247D53AF5A40B6F7135AAA7E18C07354119FD6B15A40057314692F7D18C059FB1A470CB35A4037C83CC7FC8B18C0361833A489B85A40F48E94BD4D7418C0DF421183B3BB5A409E7876A2437718C0FDA0CDCE18BD5A407CE425A778B218C098FCA6A030BD5A405343EB54DFDE18C01BFF891A7EBE5A4011F8F4B5DD2819C0DA7D985DD7BD5A40062E6D0F2F3619C01CBF3C4CBFB95A40A86EAAB78A4019C05E00E13AA7B55A40B82C3C1B953D19C04B6C6308B9B45A408D3EDDFCC82E19C09677461018B15A40A5EC7DEF811E19C0D3F371D923AF5A40150F1A6D8DD118C0
6	6	banten	01050000000100000001020000000F000000C75F8A343F885A4003B6BB29440F18C0449DF488B08B5A40F80064C8541D18C026DF5EA4AA8C5A40727FEDAB011018C03ED87B63D48D5A40DB871FB07C1118C0E4FD934E638E5A401FCFE8CFA72A18C011EB07D91B8E5A40AA412627154318C0E4FD934E638E5A4071A6A5C4495918C0EEC7D267DA8E5A405CA027A13B7018C085BE0CADB68E5A40643802C76F8618C00D86684CE08D5A40357AB5B1A39C18C06C25C9862D8B5A40F74D1B506B9A18C06D85A21FCE885A4041CA1ED60E9018C0A0378FCF62865A40C56A3B4FB28518C0130B94A3FD865A405C303825785E18C02C04B16227885A4003B6BB29440F18C0
7	7	jateng	01050000000100000001020000000F0000002A1B23C0B48F5B4080683024E2A51BC0A3137A52CC8B5B40E4C8B87E530D1CC0EA59E4344F8A5B401F6C146D279B1CC002F3275BD88D5B40A462BF7501E51CC0A8184046678E5B40A96ED3A2B4371DC02396F76897965B40AFF34BCD78461DC0A418757F62A15B403F275E6AE42B1DC089FFCBF556A75B402F95DE75BAF61CC043B96113D4A85B40A682F44E04A41CC0E9DE79FE62A95B4051A69A7FC9301CC0FEF25C94D3A05B4082D9F9E825941BC08B7F3159D99D5B404B751E2D7CC01BC0DD4F8D8614985B4056E0D8D270C31BC0A29314EF49955B404B751E2D7CC01BC007F8ED4E73905B4051C19B72EDA21BC0
\.


--
-- Name: ibukota_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ibukota_gid_seq', 7, true);


--
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office (id, "NAMA", geom) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: danautoba danautoba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.danautoba
    ADD CONSTRAINT danautoba_pkey PRIMARY KEY (gid);


--
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (gid);


--
-- Name: ibukota ibukota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ibukota
    ADD CONSTRAINT ibukota_pkey PRIMARY KEY (gid);


--
-- PostgreSQL database dump complete
--

