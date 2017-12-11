-- msqldump dump database Tue Nov 14 18:10:24 2017
-- MonetDB v11.27.9 (Jul2017-SP2), 'mapi:monetdb://Inspiron-7560:50000/dataflow_analyzer'
START TRANSACTION;
CREATE SEQUENCE "sys"."att_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."dd_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."df_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ds_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."dt_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ecombination_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_ibuying_pattern_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_icloth_item_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_ideduplication_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_oaggregation_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_ocartesian_product_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_odeduplication_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_oeurope_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_oprediction_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_ounion_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ext_ounited_states_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."extractor_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."file_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ibuying_pattern_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."icloth_item_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ideduplication_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."oaggregation_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ocartesian_product_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."odeduplication_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."oeurope_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."oprediction_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ounion_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."ounited_states_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."performance_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."program_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."task_id_seq" AS INTEGER;
CREATE SEQUENCE "sys"."version_id_seq" AS INTEGER;
SET SCHEMA "sys";
CREATE TABLE "sys"."dataflow" (
	"id"  INTEGER       NOT NULL DEFAULT next value for "sys"."df_id_seq",
	"tag" VARCHAR(50)   NOT NULL,
	CONSTRAINT "dataflow_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."dataflow" FROM stdin USING DELIMITERS '\t','\n','"';
2	"clothing"
CREATE TABLE "sys"."dataflow_version" (
	"version" INTEGER       NOT NULL DEFAULT next value for "sys"."version_id_seq",
	"df_id"   INTEGER       NOT NULL,
	CONSTRAINT "dataflow_version_version_pkey" PRIMARY KEY ("version")
);
COPY 1 RECORDS INTO "sys"."dataflow_version" FROM stdin USING DELIMITERS '\t','\n','"';
2	2
CREATE TABLE "sys"."data_transformation" (
	"id"    INTEGER       NOT NULL DEFAULT next value for "sys"."dt_id_seq",
	"df_id" INTEGER       NOT NULL,
	"tag"   VARCHAR(50)   NOT NULL,
	CONSTRAINT "data_transformation_id_pkey" PRIMARY KEY ("id")
);
COPY 7 RECORDS INTO "sys"."data_transformation" FROM stdin USING DELIMITERS '\t','\n','"';
2	2	"deduplication"
4	2	"europe"
6	2	"united_states"
8	2	"union"
10	2	"cartesian_product"
12	2	"prediction"
14	2	"aggregation"
CREATE TABLE "sys"."program" (
	"id"    INTEGER       NOT NULL DEFAULT next value for "sys"."program_id_seq",
	"df_id" INTEGER       NOT NULL,
	"name"  VARCHAR(200)  NOT NULL,
	"path"  VARCHAR(500)  NOT NULL,
	CONSTRAINT "program_id_pkey" PRIMARY KEY ("id")
);
COPY 7 RECORDS INTO "sys"."program" FROM stdin USING DELIMITERS '\t','\n','"';
2	2	"ClothingApp::deduplication()"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo"
4	2	"ClothingApp::europe()"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo"
6	2	"ClothingApp::united_states()"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo"
8	2	"ClothingApp::union()"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo"
10	2	"ClothingApp::cartesian_product()"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo"
12	2	"ClothingApp::prediction()"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo"
14	2	"ClothingApp::aggregation()"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo"
CREATE TABLE "sys"."use_program" (
	"dt_id"      INTEGER       NOT NULL,
	"program_id" INTEGER       NOT NULL,
	CONSTRAINT "use_program_dt_id_program_id_pkey" PRIMARY KEY ("dt_id", "program_id")
);
COPY 7 RECORDS INTO "sys"."use_program" FROM stdin USING DELIMITERS '\t','\n','"';
2	2
4	4
6	6
8	8
10	10
12	12
14	14
CREATE TABLE "sys"."data_set" (
	"id"    INTEGER       NOT NULL DEFAULT next value for "sys"."ds_id_seq",
	"df_id" INTEGER       NOT NULL,
	"tag"   VARCHAR(50)   NOT NULL,
	CONSTRAINT "data_set_id_pkey" PRIMARY KEY ("id")
);
COPY 10 RECORDS INTO "sys"."data_set" FROM stdin USING DELIMITERS '\t','\n','"';
2	2	"ideduplication"
4	2	"odeduplication"
6	2	"oeurope"
8	2	"ounited_states"
10	2	"ounion"
12	2	"icloth_item"
14	2	"ocartesian_product"
16	2	"ibuying_pattern"
18	2	"oprediction"
20	2	"oaggregation"
CREATE TABLE "sys"."data_dependency" (
	"id"             INTEGER       NOT NULL DEFAULT next value for "sys"."dd_id_seq",
	"previous_dt_id" INTEGER,
	"next_dt_id"     INTEGER,
	"ds_id"          INTEGER       NOT NULL,
	CONSTRAINT "data_dependency_id_pkey" PRIMARY KEY ("id")
);
COPY 11 RECORDS INTO "sys"."data_dependency" FROM stdin USING DELIMITERS '\t','\n','"';
2	NULL	2	2
4	2	4	4
6	4	8	6
8	2	6	4
10	6	8	8
12	8	10	10
14	NULL	10	12
16	10	12	14
18	NULL	12	16
20	12	14	18
22	14	NULL	20
CREATE TABLE "sys"."extractor" (
	"id"        INTEGER       NOT NULL DEFAULT next value for "sys"."extractor_id_seq",
	"ds_id"     INTEGER       NOT NULL,
	"tag"       VARCHAR(50)   NOT NULL,
	"cartridge" VARCHAR(20)   NOT NULL,
	"extension" VARCHAR(20)   NOT NULL,
	CONSTRAINT "extractor_id_pkey" PRIMARY KEY ("id")
);
COPY 10 RECORDS INTO "sys"."extractor" FROM stdin USING DELIMITERS '\t','\n','"';
2	2	"ideduplication"	"EXTRACTION"	"PROGRAM"
4	4	"odeduplication"	"EXTRACTION"	"PROGRAM"
6	6	"oeurope"	"EXTRACTION"	"PROGRAM"
8	8	"ounited_states"	"EXTRACTION"	"PROGRAM"
10	10	"ounion"	"EXTRACTION"	"PROGRAM"
12	12	"icloth_item"	"EXTRACTION"	"PROGRAM"
14	14	"ocartesian_product"	"EXTRACTION"	"PROGRAM"
16	16	"ibuying_pattern"	"EXTRACTION"	"PROGRAM"
18	18	"oprediction"	"EXTRACTION"	"PROGRAM"
20	20	"oaggregation"	"EXTRACTION"	"PROGRAM"
CREATE TABLE "sys"."extractor_combination" (
	"id"           INTEGER       NOT NULL DEFAULT next value for "sys"."ecombination_id_seq",
	"ds_id"        INTEGER       NOT NULL,
	"outer_ext_id" INTEGER       NOT NULL,
	"inner_ext_id" INTEGER       NOT NULL,
	"keys"         VARCHAR(100)  NOT NULL,
	"key_types"    VARCHAR(100)  NOT NULL,
	CONSTRAINT "extractor_combination_id_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "sys"."attribute" (
	"id"           INTEGER       NOT NULL DEFAULT next value for "sys"."att_id_seq",
	"ds_id"        INTEGER       NOT NULL,
	"extractor_id" INTEGER,
	"name"         VARCHAR(30),
	"type"         VARCHAR(15),
	CONSTRAINT "attribute_id_pkey" PRIMARY KEY ("id")
);
COPY 60 RECORDS INTO "sys"."attribute" FROM stdin USING DELIMITERS '\t','\n','"';
2	2	2	"customerid"	"NUMERIC"
4	2	2	"country"	"TEXT"
6	2	2	"continent"	"TEXT"
8	2	2	"age"	"NUMERIC"
10	2	2	"gender"	"TEXT"
12	2	2	"children"	"NUMERIC"
14	2	2	"status"	"TEXT"
16	4	4	"customerid"	"NUMERIC"
18	4	4	"country"	"TEXT"
20	4	4	"continent"	"TEXT"
22	4	4	"age"	"NUMERIC"
24	4	4	"gender"	"TEXT"
26	4	4	"children"	"NUMERIC"
28	4	4	"status"	"TEXT"
30	6	6	"customerid"	"NUMERIC"
32	6	6	"country"	"TEXT"
34	6	6	"continent"	"TEXT"
36	6	6	"age"	"NUMERIC"
38	6	6	"gender"	"TEXT"
40	6	6	"children"	"NUMERIC"
42	6	6	"status"	"TEXT"
44	8	8	"customerid"	"NUMERIC"
46	8	8	"country"	"TEXT"
48	8	8	"continent"	"TEXT"
50	8	8	"age"	"NUMERIC"
52	8	8	"gender"	"TEXT"
54	8	8	"children"	"NUMERIC"
56	8	8	"status"	"TEXT"
58	10	10	"customerid"	"NUMERIC"
60	10	10	"country"	"TEXT"
62	10	10	"continent"	"TEXT"
64	10	10	"age"	"NUMERIC"
66	10	10	"gender"	"TEXT"
68	10	10	"children"	"NUMERIC"
70	10	10	"status"	"TEXT"
72	12	12	"clothid"	"NUMERIC"
74	12	12	"description"	"TEXT"
76	14	14	"customerid"	"NUMERIC"
78	14	14	"country"	"TEXT"
80	14	14	"continent"	"TEXT"
82	14	14	"age"	"NUMERIC"
84	14	14	"gender"	"TEXT"
86	14	14	"children"	"NUMERIC"
88	14	14	"status"	"TEXT"
90	14	14	"clothid"	"NUMERIC"
92	14	14	"description"	"TEXT"
94	16	16	"buyingpatternid"	"NUMERIC"
96	16	16	"clothid"	"NUMERIC"
98	16	16	"country"	"TEXT"
100	16	16	"continent"	"TEXT"
102	16	16	"age"	"NUMERIC"
104	16	16	"gender"	"TEXT"
106	16	16	"children"	"NUMERIC"
108	16	16	"status"	"TEXT"
110	18	18	"customerid"	"NUMERIC"
112	18	18	"buyingpatternid"	"NUMERIC"
114	18	18	"clothid"	"NUMERIC"
116	18	18	"probability"	"NUMERIC"
118	20	20	"clothid"	"NUMERIC"
120	20	20	"quantity"	"NUMERIC"
CREATE TABLE "sys"."task" (
	"id"                 INTEGER       NOT NULL DEFAULT next value for "sys"."task_id_seq",
	"identifier"         INTEGER       NOT NULL,
	"df_version"         INTEGER       NOT NULL,
	"dt_id"              INTEGER       NOT NULL,
	"status"             VARCHAR(10),
	"workspace"          VARCHAR(500),
	"computing_resource" VARCHAR(100),
	"output_msg"         CHARACTER LARGE OBJECT,
	"error_msg"          CHARACTER LARGE OBJECT,
	CONSTRAINT "task_id_pkey" PRIMARY KEY ("id")
);
COPY 7 RECORDS INTO "sys"."task" FROM stdin USING DELIMITERS '\t','\n','"';
2	1	2	2	"FINISHED"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/"	"MASTER_ERROR"	"null"	"null"
4	1	2	6	"FINISHED"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/"	"MASTER_ERROR"	"null"	"null"
6	1	2	4	"FINISHED"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/"	"MASTER_ERROR"	"null"	"null"
8	1	2	8	"FINISHED"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/"	"MASTER_ERROR"	"null"	"null"
10	1	2	10	"FINISHED"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/"	"MASTER_ERROR"	"null"	"null"
12	1	2	12	"FINISHED"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/"	"MASTER_ERROR"	"null"	"null"
14	1	2	14	"FINISHED"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/"	"MASTER_ERROR"	"null"	"null"
CREATE TABLE "sys"."file" (
	"id"      INTEGER       NOT NULL DEFAULT next value for "sys"."file_id_seq",
	"task_id" INTEGER       NOT NULL,
	"name"    VARCHAR(200)  NOT NULL,
	"path"    VARCHAR(500)  NOT NULL,
	CONSTRAINT "file_id_pkey" PRIMARY KEY ("id")
);
COPY 13 RECORDS INTO "sys"."file" FROM stdin USING DELIMITERS '\t','\n','"';
2	2	"customer_list1.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1"
4	2	"customer_list2.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2"
6	2	"customer_list3.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3"
8	2	"customer_list4.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4"
10	2	"deduplication.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication"
12	4	"united_states.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/united_states"
14	6	"europe.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe"
16	8	"union.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union"
18	10	"cloth_items.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items"
20	10	"cartesian_product.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product"
22	12	"buying_patterns.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns"
24	12	"prediction.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction"
26	14	"aggregation.data"	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation"
CREATE TABLE "sys"."performance" (
	"id"          INTEGER       NOT NULL DEFAULT next value for "sys"."performance_id_seq",
	"task_id"     INTEGER       NOT NULL,
	"subtask_id"  INTEGER,
	"method"      VARCHAR(30)   NOT NULL,
	"description" VARCHAR(200),
	"starttime"   VARCHAR(30),
	"endtime"     VARCHAR(30),
	"invocation"  CHARACTER LARGE OBJECT,
	CONSTRAINT "performance_id_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "sys"."ds_ideduplication" (
	"id"                     INTEGER       NOT NULL DEFAULT next value for "sys"."ideduplication_id_seq",
	"deduplication_task_id"  INTEGER,
	"ideduplication_file_id" INTEGER,
	CONSTRAINT "ds_ideduplication_id_pkey" PRIMARY KEY ("id")
);
COPY 4 RECORDS INTO "sys"."ds_ideduplication" FROM stdin USING DELIMITERS '\t','\n','"';
1	2	2
2	2	4
3	2	6
4	2	8
CREATE TABLE "sys"."ext_ideduplication" (
	"ideduplication_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_ideduplication_id_seq",
	"ideduplication_file_id" INTEGER       NOT NULL,
	"filename"               VARCHAR(200),
	"customerid"             DOUBLE,
	"country"                VARCHAR(500),
	"continent"              VARCHAR(500),
	"age"                    DOUBLE,
	"gender"                 VARCHAR(500),
	"children"               DOUBLE,
	"status"                 VARCHAR(500),
	CONSTRAINT "ext_ideduplication_ideduplication_id_pkey" PRIMARY KEY ("ideduplication_id")
);
COPY 206 RECORDS INTO "sys"."ext_ideduplication" FROM stdin USING DELIMITERS '\t','\n','"';
1	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	1	"Botswana"	"Africa"	46	"female"	1	"single"
2	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	4	"Albania"	"Europe"	42	"female"	3	"married"
3	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"
4	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	8	"Sudan"	"Africa"	58	"female"	2	"divorced"
5	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"
6	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	15	"Burma_Myanmar"	"Asia"	22	"male"	2	"single"
7	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	16	"North_Korea_"	"Asia"	84	"female"	5	"single"
8	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"
9	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	21	"Canada"	"North_America"	60	"male"	3	"widow"
10	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	24	"Vietnam"	"Asia"	12	"male"	4	"divorced"
11	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	27	"Ivory_Coast"	"Africa"	74	"female"	5	"married"
12	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"
13	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	29	"Saudi_Arabia"	"Asia"	72	"female"	0	"single"
14	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	32	"Nauru"	"Oceania"	42	"female"	2	"widow"
15	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	33	"Honduras"	"North_America"	41	"male"	3	"widow"
16	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	35	"Nigeria"	"Africa"	50	"male"	2	"single"
17	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	39	"Burkina"	"Africa"	9	"male"	1	"divorced"
18	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	41	"Philippines"	"Asia"	71	"male"	2	"divorced"
19	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	42	"Uruguay"	"South_America"	9	"female"	3	"single"
20	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	43	"Sri_Lanka"	"Asia"	69	"male"	3	"divorced"
21	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	49	"Angola"	"Africa"	51	"male"	2	"single"
22	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"
23	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	54	"France"	"Europe"	37	"female"	0	"widow"
24	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	56	"Tuvalu"	"Oceania"	0	"female"	2	"widow"
25	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"
26	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	60	"Dominican_Republic"	"North_America"	13	"male"	1	"widow"
27	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	63	"Sudan"	"Africa"	67	"male"	2	"married"
28	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	65	"Congo"	"Africa"	80	"male"	4	"married"
29	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	66	"Algeria"	"Africa"	37	"female"	3	"divorced"
30	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	68	"South_Sudan"	"Africa"	83	"female"	3	"single"
31	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	69	"Saint_Kitts_and_Nevis"	"North_America"	59	"male"	4	"single"
32	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	70	"Mozambique"	"Africa"	47	"female"	3	"married"
33	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	75	"Uruguay"	"South_America"	45	"female"	5	"widow"
34	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	76	"Turkmenistan"	"Asia"	49	"male"	4	"married"
35	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	79	"Congo"	"Africa"	16	"female"	3	"single"
36	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	80	"Democratic_Republic_of_Congo"	"Africa"	79	"female"	3	"divorced"
37	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	81	"Ecuador"	"South_America"	68	"female"	0	"single"
38	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	82	"Burkina"	"Africa"	45	"male"	2	"divorced"
39	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"
40	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"
41	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	87	"South_Africa"	"Africa"	1	"female"	1	"divorced"
42	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"
43	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	90	"Albania"	"Europe"	35	"female"	5	"single"
44	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"
45	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	94	"Namibia"	"Africa"	39	"female"	2	"married"
46	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	95	"Saint_Lucia"	"North_America"	38	"male"	0	"divorced"
47	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	97	"Israel"	"Asia"	2	"female"	2	"married"
48	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	98	"Colombia"	"South_America"	17	"male"	4	"divorced"
49	2	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list1/customer_list1.data"	100	"Pakistan"	"Asia"	67	"male"	2	"married"
50	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	1	"Togo"	"Africa"	80	"female"	0	"divorced"
51	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	5	"Egypt"	"Africa"	85	"female"	5	"married"
52	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	6	"Senegal"	"Africa"	15	"female"	0	"single"
53	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"
54	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"
55	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	13	"Mongolia"	"Asia"	95	"male"	5	"divorced"
56	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	14	"Marshall_Islands"	"Oceania"	6	"female"	1	"married"
57	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	15	"Nigeria"	"Africa"	67	"female"	4	"married"
58	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	18	"Togo"	"Africa"	54	"female"	3	"single"
59	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	19	"Colombia"	"South_America"	42	"female"	5	"married"
60	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"
61	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"
62	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	26	"Honduras"	"North_America"	24	"male"	0	"single"
63	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	32	"Gabon"	"Africa"	94	"female"	4	"divorced"
64	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	33	"South_Sudan"	"Africa"	79	"male"	5	"married"
65	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	35	"Honduras"	"North_America"	58	"male"	4	"divorced"
66	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	39	"Djibouti"	"Africa"	70	"female"	3	"single"
67	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	45	"Israel"	"Asia"	2	"female"	4	"married"
68	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	46	"Cameroon"	"Africa"	25	"male"	5	"widow"
69	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	51	"Egypt"	"Africa"	89	"female"	3	"divorced"
70	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"
71	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	56	"Uruguay"	"South_America"	92	"female"	2	"widow"
72	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	57	"Dominican_Republic"	"North_America"	83	"male"	4	"single"
73	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	58	"Gambia"	"Africa"	90	"female"	5	"widow"
74	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	59	"Swaziland"	"Africa"	34	"female"	1	"divorced"
75	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	61	"Nepal"	"Asia"	37	"female"	5	"divorced"
76	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	63	"Ecuador"	"South_America"	66	"male"	1	"single"
77	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	67	"Sudan"	"Africa"	92	"male"	1	"divorced"
78	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	70	"Lebanon"	"Asia"	40	"male"	4	"married"
79	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"
80	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	74	"Central_African_Republic"	"Africa"	69	"female"	4	"divorced"
81	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	75	"Saint_Kitts_and_Nevis"	"North_America"	18	"male"	1	"married"
82	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	76	"East_Timor"	"Asia"	14	"male"	3	"single"
83	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	79	"Guatemala"	"North_America"	20	"female"	0	"divorced"
84	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	80	"Palau"	"Oceania"	63	"male"	3	"single"
85	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	81	"Angola"	"Africa"	12	"male"	2	"widow"
86	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	82	"Nigeria"	"Africa"	94	"female"	0	"divorced"
87	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	83	"Marshall_Islands"	"Oceania"	21	"female"	5	"divorced"
88	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"
89	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	87	"Paraguay"	"South_America"	72	"male"	4	"divorced"
90	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	92	"Dominica"	"North_America"	0	"male"	0	"single"
91	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"
92	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	96	"Suriname"	"South_America"	8	"female"	4	"divorced"
93	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"
94	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"
95	4	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list2/customer_list2.data"	100	"Bolivia"	"South_America"	61	"male"	5	"single"
96	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	2	"Angola"	"Africa"	8	"female"	2	"divorced"
97	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	9	"Chad"	"Africa"	18	"female"	1	"divorced"
98	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	11	"Oman"	"Asia"	25	"female"	5	"divorced"
99	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	12	"Burma_Myanmar"	"Asia"	94	"male"	4	"single"
100	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	13	"Maldives"	"Asia"	45	"female"	3	"married"
101	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"
102	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	20	"Cape_Verde"	"Africa"	48	"female"	5	"divorced"
103	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	22	"Lesotho"	"Africa"	10	"male"	4	"married"
104	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	24	"Lebanon"	"Asia"	16	"female"	5	"married"
105	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"
106	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	26	"Tajikistan"	"Asia"	45	"male"	1	"married"
107	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	29	"United_Arab_Emirates"	"Asia"	79	"female"	5	"widow"
108	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	30	"South_Sudan"	"Africa"	77	"female"	4	"widow"
109	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"
110	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	32	"Russian_Federation"	"Asia"	0	"male"	4	"single"
111	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	33	"Nicaragua"	"North_America"	94	"female"	0	"married"
112	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"
113	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	37	"Chile"	"South_America"	39	"male"	4	"widow"
114	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	38	"Senegal"	"Africa"	84	"female"	3	"divorced"
115	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	39	"Antigua_and_Barbuda"	"North_America"	8	"female"	0	"divorced"
116	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	40	"Panama"	"North_America"	99	"female"	2	"widow"
117	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	42	"Namibia"	"Africa"	15	"female"	0	"divorced"
118	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	44	"Turkmenistan"	"Asia"	79	"male"	2	"single"
119	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"
120	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"
121	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	47	"Malawi"	"Africa"	69	"female"	3	"single"
122	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	48	"Kyrgyzstan"	"Asia"	68	"male"	4	"married"
123	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"
124	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	50	"Ivory_Coast"	"Africa"	47	"female"	4	"married"
125	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	52	"Palau"	"Oceania"	30	"male"	5	"married"
126	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	53	"Malawi"	"Africa"	91	"male"	1	"single"
127	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	55	"Solomon_Islands"	"Oceania"	27	"male"	4	"widow"
128	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"
129	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	60	"Libya"	"Africa"	29	"female"	4	"married"
130	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	63	"Palau"	"Oceania"	50	"male"	3	"single"
131	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"
132	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	66	"Mexico"	"North_America"	87	"female"	4	"divorced"
133	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	68	"Congo"	"Africa"	57	"female"	1	"divorced"
134	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	70	"Micronesia"	"Oceania"	69	"male"	1	"divorced"
135	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	71	"Saint_Lucia"	"North_America"	71	"female"	0	"married"
136	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	72	"Japan"	"Asia"	9	"female"	0	"divorced"
137	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	74	"Ivory_Coast"	"Africa"	13	"female"	2	"single"
138	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	76	"Uruguay"	"South_America"	31	"male"	3	"divorced"
139	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	77	"Mozambique"	"Africa"	73	"male"	1	"divorced"
140	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	78	"Samoa"	"Oceania"	11	"male"	3	"single"
141	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	79	"Guinea"	"Africa"	88	"female"	0	"married"
142	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"
143	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	83	"Panama"	"North_America"	60	"male"	1	"divorced"
144	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	85	"Peru"	"South_America"	47	"male"	1	"married"
145	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	86	"Iran"	"Asia"	71	"female"	3	"married"
146	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	87	"Uganda"	"Africa"	24	"female"	1	"divorced"
147	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	89	"China"	"Asia"	73	"female"	1	"widow"
148	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	92	"Grenada"	"North_America"	24	"male"	2	"single"
149	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	93	"Qatar"	"Asia"	17	"male"	5	"single"
150	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	96	"Burkina"	"Africa"	72	"male"	1	"single"
151	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	98	"Barbados"	"North_America"	82	"female"	2	"married"
152	6	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list3/customer_list3.data"	99	"Jordan"	"Asia"	72	"female"	3	"single"
153	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	1	"Tunisia"	"Africa"	91	"male"	3	"widow"
154	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"
155	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"
156	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"
157	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"
158	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	8	"Yemen"	"Asia"	51	"female"	5	"widow"
159	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	15	"Tajikistan"	"Asia"	50	"female"	3	"divorced"
160	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	16	"Burundi"	"Africa"	36	"female"	4	"widow"
161	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	17	"Niger"	"Africa"	67	"female"	2	"married"
162	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"
163	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	21	"Kuwait"	"Asia"	13	"male"	4	"single"
164	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	24	"Vanuatu"	"Oceania"	50	"female"	1	"divorced"
165	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	25	"Uzbekistan"	"Asia"	24	"male"	2	"divorced"
166	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	26	"Nepal"	"Asia"	74	"male"	0	"single"
167	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"
168	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	28	"Bolivia"	"South_America"	88	"female"	5	"divorced"
169	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	31	"Papua_New_Guinea"	"Oceania"	16	"male"	0	"divorced"
170	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	32	"China"	"Asia"	34	"female"	5	"single"
171	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	33	"Palau"	"Oceania"	27	"female"	5	"widow"
172	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	35	"Papua_New_Guinea"	"Oceania"	35	"female"	2	"married"
173	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	36	"Russian_Federation"	"Asia"	19	"male"	4	"married"
174	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"
175	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	43	"Zimbabwe"	"Africa"	73	"female"	5	"married"
176	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	44	"Laos"	"Asia"	39	"male"	2	"married"
177	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"
178	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"
179	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	51	"Cuba"	"North_America"	63	"male"	2	"divorced"
180	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	52	"Bahamas"	"North_America"	75	"female"	4	"married"
181	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	53	"El_Salvador"	"North_America"	60	"female"	1	"single"
182	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	58	"North_Korea_"	"Asia"	22	"female"	5	"married"
183	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"
184	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"
185	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	63	"Burkina"	"Africa"	59	"male"	1	"widow"
186	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	64	"Kenya"	"Africa"	75	"female"	3	"married"
187	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	65	"Ghana"	"Africa"	1	"male"	2	"married"
188	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	67	"Belize"	"North_America"	56	"female"	1	"single"
189	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"
190	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	72	"Poland"	"Europe"	14	"female"	2	"married"
191	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"
192	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"
193	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	76	"Finland"	"Europe"	95	"female"	1	"married"
194	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	79	"Ivory_Coast"	"Africa"	67	"male"	5	"divorced"
195	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	82	"Laos"	"Asia"	53	"female"	2	"single"
196	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"
197	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"
198	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	87	"Canada"	"North_America"	2	"female"	4	"widow"
199	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	88	"United_States"	"North_America"	78	"male"	2	"single"
200	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	91	"Bhutan"	"Asia"	9	"female"	5	"married"
201	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"
202	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	94	"Nauru"	"Oceania"	27	"male"	0	"divorced"
203	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	95	"Saint_Kitts_and_Nevis"	"North_America"	21	"male"	0	"divorced"
204	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	96	"Japan"	"Asia"	1	"male"	3	"widow"
205	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	97	"Gambia"	"Africa"	12	"female"	1	"widow"
206	8	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/customer_list4/customer_list4.data"	98	"Uzbekistan"	"Asia"	29	"male"	0	"divorced"
CREATE TABLE "sys"."ds_odeduplication" (
	"id"                     INTEGER       NOT NULL DEFAULT next value for "sys"."odeduplication_id_seq",
	"deduplication_task_id"  INTEGER,
	"europe_task_id"         INTEGER,
	"united_states_task_id"  INTEGER,
	"odeduplication_file_id" INTEGER,
	CONSTRAINT "ds_odeduplication_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_odeduplication" FROM stdin USING DELIMITERS '\t','\n','"';
1	2	6	4	10
CREATE TABLE "sys"."ext_odeduplication" (
	"odeduplication_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_odeduplication_id_seq",
	"odeduplication_file_id" INTEGER       NOT NULL,
	"filename"               VARCHAR(200),
	"customerid"             DOUBLE,
	"country"                VARCHAR(500),
	"continent"              VARCHAR(500),
	"age"                    DOUBLE,
	"gender"                 VARCHAR(500),
	"children"               DOUBLE,
	"status"                 VARCHAR(500),
	CONSTRAINT "ext_odeduplication_odeduplication_id_pkey" PRIMARY KEY ("odeduplication_id")
);
COPY 206 RECORDS INTO "sys"."ext_odeduplication" FROM stdin USING DELIMITERS '\t','\n','"';
1	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	42	"Uruguay"	"South_America"	9	"female"	3	"single"
2	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"
3	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	55	"Solomon_Islands"	"Oceania"	27	"male"	4	"widow"
4	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	58	"Gambia"	"Africa"	90	"female"	5	"widow"
5	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	15	"Burma_Myanmar"	"Asia"	22	"male"	2	"single"
6	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"
7	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"
8	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	17	"Niger"	"Africa"	67	"female"	2	"married"
9	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	88	"United_States"	"North_America"	78	"male"	2	"single"
10	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	94	"Nauru"	"Oceania"	27	"male"	0	"divorced"
11	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	67	"Belize"	"North_America"	56	"female"	1	"single"
12	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	72	"Poland"	"Europe"	14	"female"	2	"married"
13	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	78	"Samoa"	"Oceania"	11	"male"	3	"single"
14	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	91	"Bhutan"	"Asia"	9	"female"	5	"married"
15	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	80	"Palau"	"Oceania"	63	"male"	3	"single"
16	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	71	"Saint_Lucia"	"North_America"	71	"female"	0	"married"
17	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	32	"China"	"Asia"	34	"female"	5	"single"
18	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	100	"Bolivia"	"South_America"	61	"male"	5	"single"
19	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	65	"Ghana"	"Africa"	1	"male"	2	"married"
20	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"
21	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	99	"Jordan"	"Asia"	72	"female"	3	"single"
22	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	87	"Uganda"	"Africa"	24	"female"	1	"divorced"
23	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	96	"Japan"	"Asia"	1	"male"	3	"widow"
24	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	70	"Micronesia"	"Oceania"	69	"male"	1	"divorced"
25	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"
26	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	1	"Tunisia"	"Africa"	91	"male"	3	"widow"
27	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"
28	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	28	"Bolivia"	"South_America"	88	"female"	5	"divorced"
29	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"
30	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	59	"Swaziland"	"Africa"	34	"female"	1	"divorced"
31	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	81	"Angola"	"Africa"	12	"male"	2	"widow"
32	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"
33	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"
34	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	82	"Laos"	"Asia"	53	"female"	2	"single"
35	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"
36	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	39	"Burkina"	"Africa"	9	"male"	1	"divorced"
37	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	95	"Saint_Kitts_and_Nevis"	"North_America"	21	"male"	0	"divorced"
38	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	24	"Lebanon"	"Asia"	16	"female"	5	"married"
39	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	87	"Paraguay"	"South_America"	72	"male"	4	"divorced"
40	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"
41	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	53	"Malawi"	"Africa"	91	"male"	1	"single"
42	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	9	"Chad"	"Africa"	18	"female"	1	"divorced"
43	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	14	"Marshall_Islands"	"Oceania"	6	"female"	1	"married"
44	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	39	"Antigua_and_Barbuda"	"North_America"	8	"female"	0	"divorced"
45	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"
46	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"
47	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	93	"Qatar"	"Asia"	17	"male"	5	"single"
48	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	96	"Suriname"	"South_America"	8	"female"	4	"divorced"
49	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	98	"Uzbekistan"	"Asia"	29	"male"	0	"divorced"
50	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"
51	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	13	"Maldives"	"Asia"	45	"female"	3	"married"
52	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	57	"Dominican_Republic"	"North_America"	83	"male"	4	"single"
53	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	74	"Central_African_Republic"	"Africa"	69	"female"	4	"divorced"
54	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	32	"Russian_Federation"	"Asia"	0	"male"	4	"single"
55	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	68	"South_Sudan"	"Africa"	83	"female"	3	"single"
56	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	33	"South_Sudan"	"Africa"	79	"male"	5	"married"
57	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	19	"Colombia"	"South_America"	42	"female"	5	"married"
58	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	43	"Zimbabwe"	"Africa"	73	"female"	5	"married"
59	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	97	"Gambia"	"Africa"	12	"female"	1	"widow"
60	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	79	"Guatemala"	"North_America"	20	"female"	0	"divorced"
61	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	53	"El_Salvador"	"North_America"	60	"female"	1	"single"
62	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"
63	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"
64	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"
65	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	63	"Burkina"	"Africa"	59	"male"	1	"widow"
66	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	29	"United_Arab_Emirates"	"Asia"	79	"female"	5	"widow"
67	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	76	"East_Timor"	"Asia"	14	"male"	3	"single"
68	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	16	"North_Korea_"	"Asia"	84	"female"	5	"single"
69	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	48	"Kyrgyzstan"	"Asia"	68	"male"	4	"married"
70	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	26	"Tajikistan"	"Asia"	45	"male"	1	"married"
71	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	51	"Cuba"	"North_America"	63	"male"	2	"divorced"
72	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"
73	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	29	"Saudi_Arabia"	"Asia"	72	"female"	0	"single"
74	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	1	"Botswana"	"Africa"	46	"female"	1	"single"
75	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"
76	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"
77	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"
78	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	38	"Senegal"	"Africa"	84	"female"	3	"divorced"
79	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	11	"Oman"	"Asia"	25	"female"	5	"divorced"
80	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	67	"Sudan"	"Africa"	92	"male"	1	"divorced"
81	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	33	"Honduras"	"North_America"	41	"male"	3	"widow"
82	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	69	"Saint_Kitts_and_Nevis"	"North_America"	59	"male"	4	"single"
83	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	79	"Guinea"	"Africa"	88	"female"	0	"married"
84	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"
85	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	70	"Mozambique"	"Africa"	47	"female"	3	"married"
86	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	33	"Palau"	"Oceania"	27	"female"	5	"widow"
87	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	87	"South_Africa"	"Africa"	1	"female"	1	"divorced"
88	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	20	"Cape_Verde"	"Africa"	48	"female"	5	"divorced"
89	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	52	"Palau"	"Oceania"	30	"male"	5	"married"
90	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	4	"Albania"	"Europe"	42	"female"	3	"married"
91	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	26	"Honduras"	"North_America"	24	"male"	0	"single"
92	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	16	"Burundi"	"Africa"	36	"female"	4	"widow"
93	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	74	"Ivory_Coast"	"Africa"	13	"female"	2	"single"
94	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"
95	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	8	"Yemen"	"Asia"	51	"female"	5	"widow"
96	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	76	"Uruguay"	"South_America"	31	"male"	3	"divorced"
97	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"
98	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"
99	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"
100	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"
101	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"
102	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"
103	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	83	"Panama"	"North_America"	60	"male"	1	"divorced"
104	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	60	"Dominican_Republic"	"North_America"	13	"male"	1	"widow"
105	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	45	"Israel"	"Asia"	2	"female"	4	"married"
106	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	79	"Ivory_Coast"	"Africa"	67	"male"	5	"divorced"
107	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	89	"China"	"Asia"	73	"female"	1	"widow"
108	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	86	"Iran"	"Asia"	71	"female"	3	"married"
109	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	21	"Kuwait"	"Asia"	13	"male"	4	"single"
110	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"
111	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	68	"Congo"	"Africa"	57	"female"	1	"divorced"
112	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	46	"Cameroon"	"Africa"	25	"male"	5	"widow"
113	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	32	"Gabon"	"Africa"	94	"female"	4	"divorced"
114	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	98	"Barbados"	"North_America"	82	"female"	2	"married"
115	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	35	"Nigeria"	"Africa"	50	"male"	2	"single"
116	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	51	"Egypt"	"Africa"	89	"female"	3	"divorced"
117	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	42	"Namibia"	"Africa"	15	"female"	0	"divorced"
118	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	6	"Senegal"	"Africa"	15	"female"	0	"single"
119	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	64	"Kenya"	"Africa"	75	"female"	3	"married"
120	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	87	"Canada"	"North_America"	2	"female"	4	"widow"
121	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"
122	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	58	"North_Korea_"	"Asia"	22	"female"	5	"married"
123	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"
124	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"
125	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"
126	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	41	"Philippines"	"Asia"	71	"male"	2	"divorced"
127	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	27	"Ivory_Coast"	"Africa"	74	"female"	5	"married"
128	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	70	"Lebanon"	"Asia"	40	"male"	4	"married"
129	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	63	"Palau"	"Oceania"	50	"male"	3	"single"
130	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	36	"Russian_Federation"	"Asia"	19	"male"	4	"married"
131	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	21	"Canada"	"North_America"	60	"male"	3	"widow"
132	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	24	"Vanuatu"	"Oceania"	50	"female"	1	"divorced"
133	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	92	"Grenada"	"North_America"	24	"male"	2	"single"
134	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"
135	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	85	"Peru"	"South_America"	47	"male"	1	"married"
136	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	50	"Ivory_Coast"	"Africa"	47	"female"	4	"married"
137	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	63	"Sudan"	"Africa"	67	"male"	2	"married"
138	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	33	"Nicaragua"	"North_America"	94	"female"	0	"married"
139	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	35	"Papua_New_Guinea"	"Oceania"	35	"female"	2	"married"
140	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	47	"Malawi"	"Africa"	69	"female"	3	"single"
141	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	44	"Laos"	"Asia"	39	"male"	2	"married"
142	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	8	"Sudan"	"Africa"	58	"female"	2	"divorced"
143	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	60	"Libya"	"Africa"	29	"female"	4	"married"
144	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	63	"Ecuador"	"South_America"	66	"male"	1	"single"
145	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	98	"Colombia"	"South_America"	17	"male"	4	"divorced"
146	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	79	"Congo"	"Africa"	16	"female"	3	"single"
147	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	1	"Togo"	"Africa"	80	"female"	0	"divorced"
148	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"
149	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"
150	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	82	"Burkina"	"Africa"	45	"male"	2	"divorced"
151	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	35	"Honduras"	"North_America"	58	"male"	4	"divorced"
152	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	15	"Nigeria"	"Africa"	67	"female"	4	"married"
153	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	96	"Burkina"	"Africa"	72	"male"	1	"single"
154	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	94	"Namibia"	"Africa"	39	"female"	2	"married"
155	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	18	"Togo"	"Africa"	54	"female"	3	"single"
156	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	97	"Israel"	"Asia"	2	"female"	2	"married"
157	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	76	"Turkmenistan"	"Asia"	49	"male"	4	"married"
158	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	32	"Nauru"	"Oceania"	42	"female"	2	"widow"
159	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	81	"Ecuador"	"South_America"	68	"female"	0	"single"
160	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	43	"Sri_Lanka"	"Asia"	69	"male"	3	"divorced"
161	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"
162	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"
163	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"
164	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	5	"Egypt"	"Africa"	85	"female"	5	"married"
165	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	83	"Marshall_Islands"	"Oceania"	21	"female"	5	"divorced"
166	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"
167	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"
168	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	13	"Mongolia"	"Asia"	95	"male"	5	"divorced"
169	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	31	"Papua_New_Guinea"	"Oceania"	16	"male"	0	"divorced"
170	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	39	"Djibouti"	"Africa"	70	"female"	3	"single"
171	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	52	"Bahamas"	"North_America"	75	"female"	4	"married"
172	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	12	"Burma_Myanmar"	"Asia"	94	"male"	4	"single"
173	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	22	"Lesotho"	"Africa"	10	"male"	4	"married"
174	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	90	"Albania"	"Europe"	35	"female"	5	"single"
175	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	2	"Angola"	"Africa"	8	"female"	2	"divorced"
176	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	72	"Japan"	"Asia"	9	"female"	0	"divorced"
177	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"
178	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"
179	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	54	"France"	"Europe"	37	"female"	0	"widow"
180	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	66	"Algeria"	"Africa"	37	"female"	3	"divorced"
181	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	44	"Turkmenistan"	"Asia"	79	"male"	2	"single"
182	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"
183	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	100	"Pakistan"	"Asia"	67	"male"	2	"married"
184	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	15	"Tajikistan"	"Asia"	50	"female"	3	"divorced"
185	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	76	"Finland"	"Europe"	95	"female"	1	"married"
186	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	30	"South_Sudan"	"Africa"	77	"female"	4	"widow"
187	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	66	"Mexico"	"North_America"	87	"female"	4	"divorced"
188	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	40	"Panama"	"North_America"	99	"female"	2	"widow"
189	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	80	"Democratic_Republic_of_Congo"	"Africa"	79	"female"	3	"divorced"
190	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	75	"Saint_Kitts_and_Nevis"	"North_America"	18	"male"	1	"married"
191	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	56	"Tuvalu"	"Oceania"	0	"female"	2	"widow"
192	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"
193	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"
194	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	26	"Nepal"	"Asia"	74	"male"	0	"single"
195	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	65	"Congo"	"Africa"	80	"male"	4	"married"
196	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	37	"Chile"	"South_America"	39	"male"	4	"widow"
197	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	49	"Angola"	"Africa"	51	"male"	2	"single"
198	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	56	"Uruguay"	"South_America"	92	"female"	2	"widow"
199	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	24	"Vietnam"	"Asia"	12	"male"	4	"divorced"
200	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	25	"Uzbekistan"	"Asia"	24	"male"	2	"divorced"
201	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	95	"Saint_Lucia"	"North_America"	38	"male"	0	"divorced"
202	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	82	"Nigeria"	"Africa"	94	"female"	0	"divorced"
203	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	77	"Mozambique"	"Africa"	73	"male"	1	"divorced"
204	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	61	"Nepal"	"Asia"	37	"female"	5	"divorced"
205	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	75	"Uruguay"	"South_America"	45	"female"	5	"widow"
206	10	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/deduplication/deduplication.data"	92	"Dominica"	"North_America"	0	"male"	0	"single"
CREATE TABLE "sys"."ds_oeurope" (
	"id"              INTEGER       NOT NULL DEFAULT next value for "sys"."oeurope_id_seq",
	"europe_task_id"  INTEGER,
	"union_task_id"   INTEGER,
	"oeurope_file_id" INTEGER,
	CONSTRAINT "ds_oeurope_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_oeurope" FROM stdin USING DELIMITERS '\t','\n','"';
1	6	8	14
CREATE TABLE "sys"."ext_oeurope" (
	"oeurope_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_oeurope_id_seq",
	"oeurope_file_id" INTEGER       NOT NULL,
	"filename"        VARCHAR(200),
	"customerid"      DOUBLE,
	"country"         VARCHAR(500),
	"continent"       VARCHAR(500),
	"age"             DOUBLE,
	"gender"          VARCHAR(500),
	"children"        DOUBLE,
	"status"          VARCHAR(500),
	CONSTRAINT "ext_oeurope_oeurope_id_pkey" PRIMARY KEY ("oeurope_id")
);
COPY 51 RECORDS INTO "sys"."ext_oeurope" FROM stdin USING DELIMITERS '\t','\n','"';
1	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"
2	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"
3	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"
4	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	72	"Poland"	"Europe"	14	"female"	2	"married"
5	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"
6	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"
7	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"
8	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"
9	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"
10	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"
11	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"
12	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"
13	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"
14	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"
15	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"
16	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"
17	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"
18	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"
19	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"
20	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"
21	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"
22	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"
23	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"
24	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	4	"Albania"	"Europe"	42	"female"	3	"married"
25	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"
26	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"
27	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"
28	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"
29	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"
30	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"
31	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"
32	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"
33	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"
34	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"
35	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"
36	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"
37	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"
38	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"
39	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"
40	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"
41	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"
42	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"
43	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"
44	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"
45	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	90	"Albania"	"Europe"	35	"female"	5	"single"
46	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"
47	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"
48	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	54	"France"	"Europe"	37	"female"	0	"widow"
49	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"
50	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	76	"Finland"	"Europe"	95	"female"	1	"married"
51	14	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/europe/europe.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"
CREATE TABLE "sys"."ds_ounited_states" (
	"id"                     INTEGER       NOT NULL DEFAULT next value for "sys"."ounited_states_id_seq",
	"united_states_task_id"  INTEGER,
	"union_task_id"          INTEGER,
	"ounited_states_file_id" INTEGER,
	CONSTRAINT "ds_ounited_states_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_ounited_states" FROM stdin USING DELIMITERS '\t','\n','"';
1	4	8	12
CREATE TABLE "sys"."ext_ounited_states" (
	"ounited_states_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_ounited_states_id_seq",
	"ounited_states_file_id" INTEGER       NOT NULL,
	"filename"               VARCHAR(200),
	"customerid"             DOUBLE,
	"country"                VARCHAR(500),
	"continent"              VARCHAR(500),
	"age"                    DOUBLE,
	"gender"                 VARCHAR(500),
	"children"               DOUBLE,
	"status"                 VARCHAR(500),
	CONSTRAINT "ext_ounited_states_ounited_states_id_pkey" PRIMARY KEY ("ounited_states_id")
);
COPY 2 RECORDS INTO "sys"."ext_ounited_states" FROM stdin USING DELIMITERS '\t','\n','"';
1	12	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/united_states/united_states.data"	88	"United_States"	"North_America"	78	"male"	2	"single"
2	12	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/united_states/united_states.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"
CREATE TABLE "sys"."ds_ounion" (
	"id"                        INTEGER       NOT NULL DEFAULT next value for "sys"."ounion_id_seq",
	"union_task_id"             INTEGER,
	"cartesian_product_task_id" INTEGER,
	"ounion_file_id"            INTEGER,
	CONSTRAINT "ds_ounion_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_ounion" FROM stdin USING DELIMITERS '\t','\n','"';
1	8	10	16
CREATE TABLE "sys"."ext_ounion" (
	"ounion_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_ounion_id_seq",
	"ounion_file_id" INTEGER       NOT NULL,
	"filename"       VARCHAR(200),
	"customerid"     DOUBLE,
	"country"        VARCHAR(500),
	"continent"      VARCHAR(500),
	"age"            DOUBLE,
	"gender"         VARCHAR(500),
	"children"       DOUBLE,
	"status"         VARCHAR(500),
	CONSTRAINT "ext_ounion_ounion_id_pkey" PRIMARY KEY ("ounion_id")
);
COPY 53 RECORDS INTO "sys"."ext_ounion" FROM stdin USING DELIMITERS '\t','\n','"';
1	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	88	"United_States"	"North_America"	78	"male"	2	"single"
2	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"
3	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"
4	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"
5	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"
6	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"
7	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	90	"Albania"	"Europe"	35	"female"	5	"single"
8	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"
9	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"
10	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	54	"France"	"Europe"	37	"female"	0	"widow"
11	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"
12	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	76	"Finland"	"Europe"	95	"female"	1	"married"
13	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"
14	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"
15	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"
16	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"
17	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"
18	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"
19	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"
20	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"
21	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"
22	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"
23	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"
24	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"
25	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"
26	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	4	"Albania"	"Europe"	42	"female"	3	"married"
27	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"
28	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"
29	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"
30	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"
31	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"
32	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"
33	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"
34	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"
35	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"
36	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"
37	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	72	"Poland"	"Europe"	14	"female"	2	"married"
38	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"
39	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"
40	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"
41	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"
42	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"
43	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"
44	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"
45	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"
46	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"
47	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"
48	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"
49	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"
50	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"
51	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"
52	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"
53	16	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/union/union.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"
CREATE TABLE "sys"."ds_icloth_item" (
	"id"                        INTEGER       NOT NULL DEFAULT next value for "sys"."icloth_item_id_seq",
	"cartesian_product_task_id" INTEGER,
	"icloth_item_file_id"       INTEGER,
	CONSTRAINT "ds_icloth_item_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_icloth_item" FROM stdin USING DELIMITERS '\t','\n','"';
1	10	18
CREATE TABLE "sys"."ext_icloth_item" (
	"icloth_item_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_icloth_item_id_seq",
	"icloth_item_file_id" INTEGER       NOT NULL,
	"filename"            VARCHAR(200),
	"clothid"             DOUBLE,
	"description"         VARCHAR(500),
	CONSTRAINT "ext_icloth_item_icloth_item_id_pkey" PRIMARY KEY ("icloth_item_id")
);
COPY 10 RECORDS INTO "sys"."ext_icloth_item" FROM stdin USING DELIMITERS '\t','\n','"';
1	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	1	"clothing-1"
2	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	2	"clothing-2"
3	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	3	"clothing-3"
4	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	4	"clothing-4"
5	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	5	"clothing-5"
6	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	6	"clothing-6"
7	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	7	"clothing-7"
8	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	8	"clothing-8"
9	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	9	"clothing-9"
10	18	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cloth_items/cloth_items.data"	10	"clothing-10"
CREATE TABLE "sys"."ds_ocartesian_product" (
	"id"                         INTEGER       NOT NULL DEFAULT next value for "sys"."ocartesian_product_id_seq",
	"cartesian_product_task_id"  INTEGER,
	"prediction_task_id"         INTEGER,
	"ocartesian_product_file_id" INTEGER,
	CONSTRAINT "ds_ocartesian_product_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_ocartesian_product" FROM stdin USING DELIMITERS '\t','\n','"';
1	10	12	20
CREATE TABLE "sys"."ext_ocartesian_product" (
	"ocartesian_product_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_ocartesian_product_id_seq",
	"ocartesian_product_file_id" INTEGER       NOT NULL,
	"filename"                   VARCHAR(200),
	"customerid"                 DOUBLE,
	"country"                    VARCHAR(500),
	"continent"                  VARCHAR(500),
	"age"                        DOUBLE,
	"gender"                     VARCHAR(500),
	"children"                   DOUBLE,
	"status"                     VARCHAR(500),
	"clothid"                    DOUBLE,
	"description"                VARCHAR(500),
	CONSTRAINT "ext_ocartesian_product_ocartesian_product_id_pkey" PRIMARY KEY ("ocartesian_product_id")
);
COPY 530 RECORDS INTO "sys"."ext_ocartesian_product" FROM stdin USING DELIMITERS '\t','\n','"';
1	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	7	"clothing-7"
2	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	8	"clothing-8"
3	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	9	"clothing-9"
4	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	10	"clothing-10"
5	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	7	"clothing-7"
6	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	8	"clothing-8"
7	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	9	"clothing-9"
8	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	10	"clothing-10"
9	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	7	"clothing-7"
10	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	8	"clothing-8"
11	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	9	"clothing-9"
12	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	10	"clothing-10"
13	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	7	"clothing-7"
14	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	8	"clothing-8"
15	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	9	"clothing-9"
16	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	10	"clothing-10"
17	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	7	"clothing-7"
18	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	8	"clothing-8"
19	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	9	"clothing-9"
20	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	10	"clothing-10"
21	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	1	"clothing-1"
22	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	2	"clothing-2"
23	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	3	"clothing-3"
24	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	4	"clothing-4"
25	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	5	"clothing-5"
26	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	6	"clothing-6"
27	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	1	"clothing-1"
28	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	2	"clothing-2"
29	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	3	"clothing-3"
30	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	4	"clothing-4"
31	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	5	"clothing-5"
32	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	6	"clothing-6"
33	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	1	"clothing-1"
34	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	2	"clothing-2"
35	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	3	"clothing-3"
36	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	4	"clothing-4"
37	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	5	"clothing-5"
38	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	6	"clothing-6"
39	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	1	"clothing-1"
40	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	2	"clothing-2"
41	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	3	"clothing-3"
42	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	4	"clothing-4"
43	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	5	"clothing-5"
44	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	6	"clothing-6"
45	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	1	"clothing-1"
46	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	2	"clothing-2"
47	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	3	"clothing-3"
48	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	4	"clothing-4"
49	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	5	"clothing-5"
50	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	6	"clothing-6"
51	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	1	"clothing-1"
52	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	2	"clothing-2"
53	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	3	"clothing-3"
54	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	4	"clothing-4"
55	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	5	"clothing-5"
56	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	6	"clothing-6"
57	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	1	"clothing-1"
58	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	2	"clothing-2"
59	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	3	"clothing-3"
60	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	4	"clothing-4"
61	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	5	"clothing-5"
62	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	6	"clothing-6"
63	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	1	"clothing-1"
64	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	2	"clothing-2"
65	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	3	"clothing-3"
66	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	4	"clothing-4"
67	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	5	"clothing-5"
68	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	6	"clothing-6"
69	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	1	"clothing-1"
70	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	2	"clothing-2"
71	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	3	"clothing-3"
72	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	4	"clothing-4"
73	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	5	"clothing-5"
74	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	6	"clothing-6"
75	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	1	"clothing-1"
76	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	2	"clothing-2"
77	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	3	"clothing-3"
78	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	4	"clothing-4"
79	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	5	"clothing-5"
80	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	6	"clothing-6"
81	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	1	"clothing-1"
82	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	2	"clothing-2"
83	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	3	"clothing-3"
84	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	4	"clothing-4"
85	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	5	"clothing-5"
86	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	6	"clothing-6"
87	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	7	"clothing-7"
88	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	8	"clothing-8"
89	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	9	"clothing-9"
90	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	10	"clothing-10"
91	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	7	"clothing-7"
92	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	8	"clothing-8"
93	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	9	"clothing-9"
94	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	10	"clothing-10"
95	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	7	"clothing-7"
96	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	8	"clothing-8"
97	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	9	"clothing-9"
98	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	10	"clothing-10"
99	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	7	"clothing-7"
100	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	8	"clothing-8"
101	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	9	"clothing-9"
102	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	10	"clothing-10"
103	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	7	"clothing-7"
104	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	8	"clothing-8"
105	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	9	"clothing-9"
106	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	10	"clothing-10"
107	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	7	"clothing-7"
108	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	8	"clothing-8"
109	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	9	"clothing-9"
110	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	10	"clothing-10"
111	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	7	"clothing-7"
112	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	8	"clothing-8"
113	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	9	"clothing-9"
114	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	10	"clothing-10"
115	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	7	"clothing-7"
116	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	8	"clothing-8"
117	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	9	"clothing-9"
118	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	10	"clothing-10"
119	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	1	"clothing-1"
120	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	2	"clothing-2"
121	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	3	"clothing-3"
122	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	4	"clothing-4"
123	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	5	"clothing-5"
124	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	6	"clothing-6"
125	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	1	"clothing-1"
126	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	2	"clothing-2"
127	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	3	"clothing-3"
128	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	4	"clothing-4"
129	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	5	"clothing-5"
130	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	6	"clothing-6"
131	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	1	"clothing-1"
132	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	2	"clothing-2"
133	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	3	"clothing-3"
134	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	4	"clothing-4"
135	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	5	"clothing-5"
136	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	6	"clothing-6"
137	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	1	"clothing-1"
138	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	2	"clothing-2"
139	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	3	"clothing-3"
140	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	4	"clothing-4"
141	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	5	"clothing-5"
142	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	6	"clothing-6"
143	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	1	"clothing-1"
144	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	2	"clothing-2"
145	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	3	"clothing-3"
146	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	4	"clothing-4"
147	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	5	"clothing-5"
148	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	6	"clothing-6"
149	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	1	"clothing-1"
150	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	2	"clothing-2"
151	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	3	"clothing-3"
152	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	4	"clothing-4"
153	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	5	"clothing-5"
154	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	6	"clothing-6"
155	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	1	"clothing-1"
156	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	2	"clothing-2"
157	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	3	"clothing-3"
158	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	4	"clothing-4"
159	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	5	"clothing-5"
160	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	6	"clothing-6"
161	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	1	"clothing-1"
162	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	2	"clothing-2"
163	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	3	"clothing-3"
164	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	4	"clothing-4"
165	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	5	"clothing-5"
166	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	6	"clothing-6"
167	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	1	"clothing-1"
168	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	2	"clothing-2"
169	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	3	"clothing-3"
170	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	4	"clothing-4"
171	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	5	"clothing-5"
172	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	6	"clothing-6"
173	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	7	"clothing-7"
174	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	8	"clothing-8"
175	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	9	"clothing-9"
176	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	10	"clothing-10"
177	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	1	"clothing-1"
178	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	2	"clothing-2"
179	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	3	"clothing-3"
180	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	4	"clothing-4"
181	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	5	"clothing-5"
182	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	6	"clothing-6"
183	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	1	"clothing-1"
184	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	2	"clothing-2"
185	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	3	"clothing-3"
186	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	4	"clothing-4"
187	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	5	"clothing-5"
188	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	6	"clothing-6"
189	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	1	"clothing-1"
190	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	2	"clothing-2"
191	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	3	"clothing-3"
192	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	4	"clothing-4"
193	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	5	"clothing-5"
194	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	6	"clothing-6"
195	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	1	"clothing-1"
196	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	2	"clothing-2"
197	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	3	"clothing-3"
198	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	4	"clothing-4"
199	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	5	"clothing-5"
200	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	6	"clothing-6"
201	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	1	"clothing-1"
202	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	2	"clothing-2"
203	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	3	"clothing-3"
204	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	4	"clothing-4"
205	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	5	"clothing-5"
206	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	6	"clothing-6"
207	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	1	"clothing-1"
208	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	2	"clothing-2"
209	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	3	"clothing-3"
210	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	4	"clothing-4"
211	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	5	"clothing-5"
212	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	6	"clothing-6"
213	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	1	"clothing-1"
214	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	2	"clothing-2"
215	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	3	"clothing-3"
216	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	4	"clothing-4"
217	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	5	"clothing-5"
218	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	6	"clothing-6"
219	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	1	"clothing-1"
220	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	2	"clothing-2"
221	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	3	"clothing-3"
222	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	4	"clothing-4"
223	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	5	"clothing-5"
224	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	6	"clothing-6"
225	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	1	"clothing-1"
226	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	2	"clothing-2"
227	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	3	"clothing-3"
228	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	4	"clothing-4"
229	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	5	"clothing-5"
230	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	6	"clothing-6"
231	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	1	"clothing-1"
232	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	2	"clothing-2"
233	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	3	"clothing-3"
234	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	4	"clothing-4"
235	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	5	"clothing-5"
236	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	6	"clothing-6"
237	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	1	"clothing-1"
238	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	2	"clothing-2"
239	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	3	"clothing-3"
240	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	4	"clothing-4"
241	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	5	"clothing-5"
242	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	6	"clothing-6"
243	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	1	"clothing-1"
244	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	2	"clothing-2"
245	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	3	"clothing-3"
246	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	4	"clothing-4"
247	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	5	"clothing-5"
248	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	46	"Poland"	"Europe"	12	"female"	2	"divorced"	6	"clothing-6"
249	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	1	"clothing-1"
250	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	2	"clothing-2"
251	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	3	"clothing-3"
252	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	4	"clothing-4"
253	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	5	"clothing-5"
254	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	27	"Albania"	"Europe"	59	"male"	1	"widow"	6	"clothing-6"
255	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	1	"clothing-1"
256	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	2	"clothing-2"
257	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	3	"clothing-3"
258	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	4	"clothing-4"
259	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	5	"clothing-5"
260	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	84	"Serbia"	"Europe"	78	"female"	0	"married"	6	"clothing-6"
261	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	1	"clothing-1"
262	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	2	"clothing-2"
263	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	3	"clothing-3"
264	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	4	"clothing-4"
265	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	5	"clothing-5"
266	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	9	"Luxembourg"	"Europe"	96	"female"	5	"widow"	6	"clothing-6"
267	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	1	"clothing-1"
268	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	2	"clothing-2"
269	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	3	"clothing-3"
270	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	4	"clothing-4"
271	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	5	"clothing-5"
272	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	58	"Slovakia"	"Europe"	22	"female"	0	"married"	6	"clothing-6"
273	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	7	"clothing-7"
274	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	8	"clothing-8"
275	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	9	"clothing-9"
276	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	15	"Serbia"	"Europe"	3	"male"	1	"divorced"	10	"clothing-10"
277	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	7	"clothing-7"
278	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	8	"clothing-8"
279	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	9	"clothing-9"
280	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Albania"	"Europe"	42	"female"	3	"married"	10	"clothing-10"
281	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	7	"clothing-7"
282	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	8	"clothing-8"
283	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	9	"clothing-9"
284	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	5	"Estonia"	"Europe"	74	"male"	5	"widow"	10	"clothing-10"
285	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	7	"clothing-7"
286	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	8	"clothing-8"
287	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	9	"clothing-9"
288	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	99	"Andorra"	"Europe"	26	"female"	2	"married"	10	"clothing-10"
289	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	7	"clothing-7"
290	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	8	"clothing-8"
291	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	9	"clothing-9"
292	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	53	"Armenia"	"Europe"	10	"male"	0	"widow"	10	"clothing-10"
293	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	7	"clothing-7"
294	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	8	"clothing-8"
295	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	9	"clothing-9"
296	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	83	"Macedonia"	"Europe"	57	"female"	3	"divorced"	10	"clothing-10"
297	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	7	"clothing-7"
298	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	8	"clothing-8"
299	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	9	"clothing-9"
300	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	10	"Finland"	"Europe"	66	"female"	4	"widow"	10	"clothing-10"
301	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	7	"clothing-7"
302	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	8	"clothing-8"
303	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	9	"clothing-9"
304	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	59	"Azerbaijan"	"Europe"	83	"male"	0	"divorced"	10	"clothing-10"
305	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	7	"clothing-7"
306	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	8	"clothing-8"
307	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	9	"clothing-9"
308	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Portugal"	"Europe"	63	"male"	3	"divorced"	10	"clothing-10"
309	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	7	"clothing-7"
310	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	8	"clothing-8"
311	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	9	"clothing-9"
312	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	70	"Macedonia"	"Europe"	59	"male"	1	"single"	10	"clothing-10"
313	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	7	"clothing-7"
314	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	8	"clothing-8"
315	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	9	"clothing-9"
316	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	28	"Andorra"	"Europe"	25	"female"	0	"divorced"	10	"clothing-10"
317	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	7	"clothing-7"
318	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	8	"clothing-8"
319	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	9	"clothing-9"
320	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	4	"Lithuania"	"Europe"	53	"male"	2	"married"	10	"clothing-10"
321	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	7	"clothing-7"
322	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	8	"clothing-8"
323	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	9	"clothing-9"
324	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	73	"Switzerland"	"Europe"	16	"male"	3	"single"	10	"clothing-10"
325	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	7	"clothing-7"
326	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	8	"clothing-8"
327	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	9	"clothing-9"
328	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	31	"Netherlands"	"Europe"	79	"female"	2	"widow"	10	"clothing-10"
329	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	7	"clothing-7"
330	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	8	"clothing-8"
331	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	9	"clothing-9"
332	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	90	"Albania"	"Europe"	35	"female"	5	"single"	10	"clothing-10"
333	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	7	"clothing-7"
334	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	8	"clothing-8"
335	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	9	"clothing-9"
336	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	71	"Estonia"	"Europe"	82	"male"	0	"married"	10	"clothing-10"
337	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	7	"clothing-7"
338	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	8	"clothing-8"
339	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	9	"clothing-9"
340	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	74	"Iceland"	"Europe"	52	"female"	0	"single"	10	"clothing-10"
341	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	7	"clothing-7"
342	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	8	"clothing-8"
343	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	9	"clothing-9"
344	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	54	"France"	"Europe"	37	"female"	0	"widow"	10	"clothing-10"
345	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	7	"clothing-7"
346	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	8	"clothing-8"
347	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	9	"clothing-9"
348	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	23	"Latvia"	"Europe"	21	"male"	2	"single"	10	"clothing-10"
349	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	7	"clothing-7"
350	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	8	"clothing-8"
351	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	9	"clothing-9"
352	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	76	"Finland"	"Europe"	95	"female"	1	"married"	10	"clothing-10"
353	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	1	"clothing-1"
354	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	2	"clothing-2"
355	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	3	"clothing-3"
356	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	4	"clothing-4"
357	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	5	"clothing-5"
358	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	85	"Slovakia"	"Europe"	31	"female"	3	"divorced"	6	"clothing-6"
359	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	7	"clothing-7"
360	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	8	"clothing-8"
361	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	9	"clothing-9"
362	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	88	"United_States"	"North_America"	78	"male"	2	"single"	10	"clothing-10"
363	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	1	"clothing-1"
364	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	2	"clothing-2"
365	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	3	"clothing-3"
366	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	4	"clothing-4"
367	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	5	"clothing-5"
368	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	6	"clothing-6"
369	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	1	"clothing-1"
370	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	2	"clothing-2"
371	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	3	"clothing-3"
372	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	4	"clothing-4"
373	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	5	"clothing-5"
374	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	6	"clothing-6"
375	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	1	"clothing-1"
376	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	2	"clothing-2"
377	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	3	"clothing-3"
378	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	4	"clothing-4"
379	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	5	"clothing-5"
380	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	6	"clothing-6"
381	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	1	"clothing-1"
382	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	2	"clothing-2"
383	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	3	"clothing-3"
384	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	4	"clothing-4"
385	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	5	"clothing-5"
386	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	6	"clothing-6"
387	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	1	"clothing-1"
388	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	2	"clothing-2"
389	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	3	"clothing-3"
390	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	4	"clothing-4"
391	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	5	"clothing-5"
392	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	6	"clothing-6"
393	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	1	"clothing-1"
394	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	2	"clothing-2"
395	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	3	"clothing-3"
396	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	4	"clothing-4"
397	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	5	"clothing-5"
398	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	6	"clothing-6"
399	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	1	"clothing-1"
400	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	2	"clothing-2"
401	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	3	"clothing-3"
402	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	4	"clothing-4"
403	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	5	"clothing-5"
404	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	6	"clothing-6"
405	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	7	"clothing-7"
406	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	8	"clothing-8"
407	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	9	"clothing-9"
408	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	42	"Monaco"	"Europe"	42	"male"	3	"divorced"	10	"clothing-10"
409	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	7	"clothing-7"
410	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	8	"clothing-8"
411	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	9	"clothing-9"
412	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Denmark"	"Europe"	41	"female"	0	"married"	10	"clothing-10"
413	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	7	"clothing-7"
414	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	8	"clothing-8"
415	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	9	"clothing-9"
416	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	60	"Monaco"	"Europe"	86	"female"	4	"married"	10	"clothing-10"
417	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	7	"clothing-7"
418	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	8	"clothing-8"
419	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	9	"clothing-9"
420	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	91	"Andorra"	"Europe"	72	"male"	4	"married"	10	"clothing-10"
421	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	7	"clothing-7"
422	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	8	"clothing-8"
423	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	9	"clothing-9"
424	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	11	"Czech_Republic"	"Europe"	37	"female"	5	"widow"	10	"clothing-10"
425	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	7	"clothing-7"
426	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	8	"clothing-8"
427	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	9	"clothing-9"
428	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Netherlands"	"Europe"	22	"female"	4	"married"	10	"clothing-10"
429	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	7	"clothing-7"
430	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	8	"clothing-8"
431	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	9	"clothing-9"
432	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	62	"Slovenia"	"Europe"	20	"female"	2	"married"	10	"clothing-10"
433	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	7	"clothing-7"
434	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	8	"clothing-8"
435	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	9	"clothing-9"
436	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	22	"Latvia"	"Europe"	11	"male"	2	"married"	10	"clothing-10"
437	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	7	"clothing-7"
438	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	8	"clothing-8"
439	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	9	"clothing-9"
440	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	98	"Portugal"	"Europe"	17	"male"	2	"divorced"	10	"clothing-10"
441	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	7	"clothing-7"
442	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	8	"clothing-8"
443	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	9	"clothing-9"
444	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	34	"Portugal"	"Europe"	48	"female"	5	"married"	10	"clothing-10"
445	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	1	"clothing-1"
446	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	2	"clothing-2"
447	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	3	"clothing-3"
448	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	4	"clothing-4"
449	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	5	"clothing-5"
450	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	6	"clothing-6"
451	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	7	"clothing-7"
452	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	8	"clothing-8"
453	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	9	"clothing-9"
454	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	25	"Latvia"	"Europe"	43	"female"	5	"widow"	10	"clothing-10"
455	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	7	"clothing-7"
456	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	8	"clothing-8"
457	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	9	"clothing-9"
458	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	89	"Macedonia"	"Europe"	80	"male"	3	"single"	10	"clothing-10"
459	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	7	"clothing-7"
460	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	8	"clothing-8"
461	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	9	"clothing-9"
462	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	3	"Bulgaria"	"Europe"	29	"male"	2	"married"	10	"clothing-10"
463	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	7	"clothing-7"
464	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	8	"clothing-8"
465	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	9	"clothing-9"
466	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	72	"Poland"	"Europe"	14	"female"	2	"married"	10	"clothing-10"
467	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	7	"clothing-7"
468	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	8	"clothing-8"
469	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	9	"clothing-9"
470	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	65	"Vatican_City"	"Europe"	5	"female"	2	"divorced"	10	"clothing-10"
471	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	7	"clothing-7"
472	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	8	"clothing-8"
473	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	9	"clothing-9"
474	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	80	"Romania"	"Europe"	45	"female"	2	"divorced"	10	"clothing-10"
475	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	7	"clothing-7"
476	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	8	"clothing-8"
477	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	9	"clothing-9"
478	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	94	"Belgium"	"Europe"	7	"male"	4	"married"	10	"clothing-10"
479	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	1	"clothing-1"
480	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	2	"clothing-2"
481	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	3	"clothing-3"
482	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	4	"clothing-4"
483	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	5	"clothing-5"
484	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Poland"	"Europe"	70	"female"	5	"widow"	6	"clothing-6"
485	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	1	"clothing-1"
486	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	2	"clothing-2"
487	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	3	"clothing-3"
488	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	4	"clothing-4"
489	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	5	"clothing-5"
490	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	49	"Estonia"	"Europe"	29	"female"	2	"widow"	6	"clothing-6"
491	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	1	"clothing-1"
492	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	2	"clothing-2"
493	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	3	"clothing-3"
494	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	4	"clothing-4"
495	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	5	"clothing-5"
496	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	7	"Ireland"	"Europe"	86	"female"	3	"married"	6	"clothing-6"
497	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	1	"clothing-1"
498	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	2	"clothing-2"
499	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	3	"clothing-3"
500	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	4	"clothing-4"
501	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	5	"clothing-5"
502	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	6	"San_Marino"	"Europe"	14	"female"	5	"married"	6	"clothing-6"
503	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	1	"clothing-1"
504	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	2	"clothing-2"
505	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	3	"clothing-3"
506	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	4	"clothing-4"
507	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	5	"clothing-5"
508	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	86	"Czech_Republic"	"Europe"	78	"male"	1	"single"	6	"clothing-6"
509	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	1	"clothing-1"
510	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	2	"clothing-2"
511	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	3	"clothing-3"
512	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	4	"clothing-4"
513	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	5	"clothing-5"
514	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	50	"Estonia"	"Europe"	74	"male"	5	"single"	6	"clothing-6"
515	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	1	"clothing-1"
516	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	2	"clothing-2"
517	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	3	"clothing-3"
518	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	4	"clothing-4"
519	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	5	"clothing-5"
520	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	45	"Georgia"	"Europe"	7	"female"	1	"divorced"	6	"clothing-6"
521	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	1	"clothing-1"
522	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	2	"clothing-2"
523	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	3	"clothing-3"
524	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	4	"clothing-4"
525	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	5	"clothing-5"
526	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	19	"Croatia"	"Europe"	44	"female"	2	"divorced"	6	"clothing-6"
527	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	7	"clothing-7"
528	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	8	"clothing-8"
529	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	9	"clothing-9"
530	20	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/cartesian_product/cartesian_product.data"	92	"United_States"	"North_America"	94	"male"	3	"widow"	10	"clothing-10"
CREATE TABLE "sys"."ds_ibuying_pattern" (
	"id"                      INTEGER       NOT NULL DEFAULT next value for "sys"."ibuying_pattern_id_seq",
	"prediction_task_id"      INTEGER,
	"ibuying_pattern_file_id" INTEGER,
	CONSTRAINT "ds_ibuying_pattern_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_ibuying_pattern" FROM stdin USING DELIMITERS '\t','\n','"';
1	12	22
CREATE TABLE "sys"."ext_ibuying_pattern" (
	"ibuying_pattern_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_ibuying_pattern_id_seq",
	"ibuying_pattern_file_id" INTEGER       NOT NULL,
	"filename"                VARCHAR(200),
	"buyingpatternid"         DOUBLE,
	"clothid"                 DOUBLE,
	"country"                 VARCHAR(500),
	"continent"               VARCHAR(500),
	"age"                     DOUBLE,
	"gender"                  VARCHAR(500),
	"children"                DOUBLE,
	"status"                  VARCHAR(500),
	CONSTRAINT "ext_ibuying_pattern_ibuying_pattern_id_pkey" PRIMARY KEY ("ibuying_pattern_id")
);
COPY 50 RECORDS INTO "sys"."ext_ibuying_pattern" FROM stdin USING DELIMITERS '\t','\n','"';
1	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	0	0	"Singapore"	"Asia"	43	"female"	4	"divorced"
2	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	1	0	"Saint_Lucia"	"North_America"	86	"male"	4	"single"
3	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	2	0	"Congo"	"Africa"	15	"female"	3	"married"
4	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	3	0	"Swaziland"	"Africa"	68	"male"	3	"married"
5	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	4	0	"Canada"	"North_America"	1	"male"	4	"married"
6	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	5	1	"Yemen"	"Asia"	73	"male"	4	"married"
7	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	6	1	"Botswana"	"Africa"	48	"female"	1	"single"
8	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	7	1	"Malta"	"Europe"	24	"female"	5	"widow"
9	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	8	1	"United_Kingdom"	"Europe"	22	"female"	0	"widow"
10	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	9	1	"Oman"	"Asia"	60	"female"	1	"widow"
11	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	10	2	"Cyprus"	"Europe"	8	"female"	1	"married"
12	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	11	2	"Germany"	"Europe"	18	"female"	0	"widow"
13	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	12	2	"Cape_Verde"	"Africa"	3	"female"	5	"widow"
14	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	13	2	"Lithuania"	"Europe"	78	"female"	0	"single"
15	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	14	2	"Finland"	"Europe"	60	"female"	1	"married"
16	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	15	3	"Kenya"	"Africa"	68	"female"	0	"single"
17	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	16	3	"Tunisia"	"Africa"	44	"female"	2	"single"
18	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	17	3	"Singapore"	"Asia"	70	"female"	3	"married"
19	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	18	3	"Kazakhstan"	"Asia"	24	"female"	0	"divorced"
20	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	19	3	"Samoa"	"Oceania"	72	"male"	4	"widow"
21	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	20	4	"Antigua_and_Barbuda"	"North_America"	67	"male"	1	"single"
22	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	21	4	"Ethiopia"	"Africa"	56	"female"	4	"widow"
23	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	22	4	"Bhutan"	"Asia"	74	"male"	1	"divorced"
24	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	23	4	"Colombia"	"South_America"	0	"male"	1	"single"
25	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	24	4	"Mauritius"	"Africa"	79	"female"	1	"divorced"
26	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	25	5	"Japan"	"Asia"	42	"female"	3	"divorced"
27	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	26	5	"Tajikistan"	"Asia"	34	"male"	5	"widow"
28	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	27	5	"Kuwait"	"Asia"	81	"male"	2	"divorced"
29	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	28	5	"Palau"	"Oceania"	2	"male"	2	"divorced"
30	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	29	5	"Finland"	"Europe"	20	"female"	5	"widow"
31	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	30	6	"Saint_Lucia"	"North_America"	87	"male"	4	"married"
32	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	31	6	"Palau"	"Oceania"	17	"male"	0	"widow"
33	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	32	6	"Poland"	"Europe"	60	"female"	2	"married"
34	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	33	6	"Saudi_Arabia"	"Asia"	97	"female"	1	"single"
35	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	34	6	"Denmark"	"Europe"	76	"female"	2	"single"
36	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	35	7	"Kyrgyzstan"	"Asia"	96	"male"	1	"single"
37	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	36	7	"Bahamas"	"North_America"	80	"female"	1	"divorced"
38	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	37	7	"Armenia"	"Europe"	91	"male"	1	"single"
39	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	38	7	"Brunei"	"Asia"	99	"male"	2	"widow"
40	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	39	7	"Saint_Lucia"	"North_America"	58	"female"	3	"single"
41	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	40	8	"Fiji"	"Oceania"	1	"female"	2	"single"
42	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	41	8	"Eritrea"	"Africa"	18	"female"	5	"divorced"
43	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	42	8	"Cape_Verde"	"Africa"	7	"female"	0	"married"
44	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	43	8	"Marshall_Islands"	"Oceania"	79	"female"	5	"married"
45	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	44	8	"South_Africa"	"Africa"	66	"female"	1	"married"
46	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	45	9	"Liechtenstein"	"Europe"	98	"female"	3	"widow"
47	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	46	9	"Poland"	"Europe"	36	"male"	2	"divorced"
48	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	47	9	"Burma_Myanmar"	"Asia"	79	"male"	5	"single"
49	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	48	9	"Nauru"	"Oceania"	50	"female"	2	"single"
50	22	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/buying_patterns/buying_patterns.data"	49	9	"Italy"	"Europe"	43	"male"	0	"divorced"
CREATE TABLE "sys"."ds_oprediction" (
	"id"                  INTEGER       NOT NULL DEFAULT next value for "sys"."oprediction_id_seq",
	"prediction_task_id"  INTEGER,
	"aggregation_task_id" INTEGER,
	"oprediction_file_id" INTEGER,
	CONSTRAINT "ds_oprediction_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_oprediction" FROM stdin USING DELIMITERS '\t','\n','"';
1	12	14	24
CREATE TABLE "sys"."ext_oprediction" (
	"oprediction_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_oprediction_id_seq",
	"oprediction_file_id" INTEGER       NOT NULL,
	"filename"            VARCHAR(200),
	"customerid"          DOUBLE,
	"buyingpatternid"     DOUBLE,
	"clothid"             DOUBLE,
	"probability"         DOUBLE,
	CONSTRAINT "ext_oprediction_oprediction_id_pkey" PRIMARY KEY ("oprediction_id")
);
COPY 480 RECORDS INTO "sys"."ext_oprediction" FROM stdin USING DELIMITERS '\t','\n','"';
1	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	37	7	1
2	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	37	7	0.6
3	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	48	9	1
4	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	18	3	0.9
5	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	37	7	0.6
6	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	34	6	1
7	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	42	8	0.7
8	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	10	2	1
9	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	34	6	0.8
10	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	13	2	1
11	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	29	5	1
12	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	37	7	0.8
13	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	43	8	0.6
14	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	36	7	0.65
15	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	0	0	0.65
16	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	29	5	0.6
17	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	41	8	0.45
18	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	34	6	1
19	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	49	9	1
20	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	29	5	1
21	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	36	7	0.65
22	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	24	4	0.65
23	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	32	6	1
24	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	16	3	0.6
25	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	8	1	1
26	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	41	8	0.45
27	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	9	1	1
28	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	28	5	0.85
29	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	34	6	1
30	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	5	1	1
31	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	13	2	1
32	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	4	0	0.8
33	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	1	0	0.65
34	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	14	2	1
35	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	12	2	0.45
36	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	8	1	0.9
37	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	19	3	0.9
38	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	2	0	1
39	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	4	0	1
40	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	2	0	1
41	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	23	4	0.45
42	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	34	6	0.8
43	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	45	9	0.8
44	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	8	1	0.6
45	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	24	4	0.65
46	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	6	1	0.75
47	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	29	5	0.8
48	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	43	8	1
49	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	17	3	0.65
50	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	0	0	0.65
51	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	36	7	0.65
52	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	14	2	0.8
53	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	17	3	0.65
54	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	18	3	0.65
55	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	37	7	1
56	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	45	9	1
57	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	14	2	1
58	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	7	1	1
59	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	29	5	1
60	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	24	4	0.6
61	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	14	2	1
62	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	34	6	1
63	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	42	8	1
64	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	0	0	0.85
65	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	3	0	0.9
66	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	37	7	0.8
67	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	8	1	1
68	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	29	5	1
69	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	49	9	0.8
70	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	34	6	1
71	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	32	6	1
72	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	44	8	0
73	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	11	2	1
74	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	19	3	0.65
75	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	13	2	1
76	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	14	2	1
77	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	44	8	0.7
78	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	19	3	0.85
79	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	32	6	1
80	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	8	1	1
81	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	14	2	1
82	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	21	4	0.6
83	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	2	0	0.65
84	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	41	8	0.45
85	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	49	9	0.9
86	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	41	8	0.45
87	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	24	4	0.65
88	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	3	0	0.6
89	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	14	2	1
90	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	8	1	0.8
91	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	45	9	1
92	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	18	3	0.75
93	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	37	7	0.6
94	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	44	8	0.95
95	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	41	8	0.85
96	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	18	3	0.45
97	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	42	8	0.5
98	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	24	4	0.2
99	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	49	9	1
100	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	37	7	0.6
101	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	44	8	0.6
102	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	32	6	1
103	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	42	8	0.95
104	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	47	9	1
105	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	40	8	0.45
106	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	41	8	0.65
107	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	46	9	1
108	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	36	7	0.65
109	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	34	6	0.8
110	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	40	8	0.75
111	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	18	3	1
112	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	21	4	0.65
113	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	21	4	0.85
114	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	34	6	1
115	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	46	9	1
116	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	0	0	0.6
117	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	8	1	1
118	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	8	1	1
119	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	8	1	0.8
120	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	15	3	0.95
121	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	44	8	0.85
122	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	2	0	0.65
123	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	23	4	0.65
124	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	9	1	1
125	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	29	5	0.6
126	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	29	5	1
127	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	29	5	1
128	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	38	7	1
129	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	13	2	1
130	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	37	7	1
131	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	11	2	1
132	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	16	3	0.9
133	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	37	7	1
134	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	42	8	0.95
135	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	36	7	0.85
136	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	37	7	1
137	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	34	6	1
138	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	37	7	1
139	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	42	8	0.85
140	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	49	9	1
141	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	19	3	0.85
142	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	36	7	0.95
143	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	29	5	1
144	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	40	8	0.75
145	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	13	2	1
146	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	19	3	0.65
147	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	4	0	0.65
148	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	1	0	0.45
149	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	15	3	0.85
150	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	17	3	0.65
151	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	37	7	1
152	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	26	5	0.65
153	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	1	0	0.4
154	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	8	1	1
155	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	34	6	1
156	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	13	2	1
157	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	2	0	0.4
158	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	24	4	0.4
159	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	19	3	0.5
160	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	29	5	0.6
161	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	11	2	1
162	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	34	6	1
163	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	8	1	0.8
164	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	16	3	0.9
165	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	44	8	0.45
166	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	0	0	0.65
167	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	24	4	0.6
168	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	29	5	1
169	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	37	7	0.8
170	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	16	3	0.75
171	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	0	0	0.6
172	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	25	5	0.75
173	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	25	5	1
174	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	13	2	1
175	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	34	6	0.8
176	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	24	4	0.65
177	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	45	9	0.8
178	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	41	8	0.65
179	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	37	7	0.6
180	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	37	7	0.6
181	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	13	2	1
182	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	17	3	0.45
183	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	14	2	1
184	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	8	1	0.8
185	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	7	1	1
186	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	3	0	1
187	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	16	3	0.45
188	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	2	0	0.7
189	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	29	5	1
190	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	8	1	1
191	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	19	3	0.65
192	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	22	4	0.6
193	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	8	1	0.8
194	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	5	1	0.95
195	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	14	2	1
196	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	14	2	1
197	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	8	1	1
198	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	14	2	1
199	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	17	3	0.45
200	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	20	4	0.8
201	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	29	5	0.6
202	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	1	0	0.45
203	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	34	6	1
204	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	14	2	1
205	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	23	4	0.95
206	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	34	6	0.6
207	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	34	6	1
208	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	14	2	1
209	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	37	7	0.6
210	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	49	9	1
211	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	46	9	0.9
212	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	27	5	1
213	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	28	5	1
214	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	43	8	0.95
215	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	49	9	1
216	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	8	1	1
217	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	32	6	1
218	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	23	4	0.6
219	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	0	0	0.5
220	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	13	2	1
221	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	0	0	0.45
222	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	16	3	0.45
223	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	0	0	0.6
224	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	8	1	1
225	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	20	4	1
226	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	8	1	1
227	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	24	4	0.2
228	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	30	6	1
229	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	29	5	0.6
230	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	40	8	0.65
231	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	37	7	0.8
232	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	2	0	0.65
233	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	34	6	1
234	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	49	9	1
235	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	49	9	1
236	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	25	5	1
237	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	37	7	0.8
238	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	18	3	0.65
239	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	23	4	0.65
240	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	3	0	0.4
241	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	46	9	0.9
242	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	24	4	0.95
243	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	29	5	0.6
244	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	49	9	0.9
245	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	41	8	0.65
246	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	23	4	0.65
247	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	34	6	1
248	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	37	7	1
249	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	11	2	1
250	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	27	5	0.9
251	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	4	0	0.2
252	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	4	0	0.65
253	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	9	1	0.45
254	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	6	1	0.75
255	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	90	16	3	0.65
256	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	91	14	2	1
257	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	41	8	1
258	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	24	4	0.65
259	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	49	9	1
260	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	47	9	1
261	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	29	5	1
262	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	29	5	1
263	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	46	9	1
264	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	37	7	0.6
265	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	29	5	1
266	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	34	6	1
267	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	32	6	1
268	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	43	8	0.5
269	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	49	9	1
270	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	29	5	1
271	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	49	9	1
272	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	49	9	1
273	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	0	0	1
274	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	45	9	1
275	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	43	8	0.5
276	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	37	7	0.6
277	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	45	9	1
278	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	44	8	0.65
279	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	24	4	0.85
280	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	22	4	0.95
281	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	14	2	0.6
282	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	25	5	0.95
283	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	45	9	1
284	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	41	8	0.65
285	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	37	7	1
286	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	2	0	0.85
287	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	32	6	1
288	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	24	4	0.2
289	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	1	0	1
290	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	14	2	1
291	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	24	4	0.6
292	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	18	3	1
293	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	8	1	0.8
294	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	34	6	0.8
295	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	38	7	0.75
296	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	49	9	1
297	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	37	7	1
298	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	21	4	0.65
299	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	34	6	0.8
300	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	39	7	1
301	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	29	5	0.8
302	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	34	6	1
303	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	14	2	1
304	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	49	9	1
305	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	8	1	1
306	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	49	9	1
307	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	37	7	0.8
308	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	40	8	0.9
309	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	34	6	1
310	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	11	2	1
311	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	36	7	0.65
312	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	44	8	0.6
313	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	44	8	0.7
314	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	14	2	1
315	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	29	5	1
316	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	29	5	1
317	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	38	7	0.75
318	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	24	4	0.2
319	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	34	6	0.9
320	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	40	8	0.65
321	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	45	9	0.9
322	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	32	6	1
323	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	32	6	1
324	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	8	1	0.6
325	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	8	1	0.9
326	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	34	6	0.8
327	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	37	7	1
328	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	8	1	1
329	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	2	0	0.95
330	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	41	8	1
331	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	49	46	9	1
332	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	27	45	9	1
333	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	19	49	9	1
334	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	34	6	1
335	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	17	3	0.65
336	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	21	4	0.65
337	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	43	8	0.7
338	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	16	3	0.6
339	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	24	4	0.5
340	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	42	8	1
341	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	49	9	1
342	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	29	5	1
343	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	29	5	1
344	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	14	2	1
345	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	2	0	1
346	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	22	4	0.65
347	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	37	7	1
348	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	21	4	0.95
349	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	42	8	0.85
350	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	29	5	1
351	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	17	3	0.95
352	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	4	0	0.75
353	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	8	1	1
354	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	14	2	0.8
355	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	37	7	0.8
356	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	32	6	1
357	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	24	4	0.2
358	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	5	1	0.6
359	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	49	9	1
360	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	18	3	0.45
361	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	24	4	0.65
362	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	0	0	0.65
363	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	1	0	1
364	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	10	2	1
365	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	32	6	1
366	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	5	1	0.65
367	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	1	0	0.65
368	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	29	5	0.8
369	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	29	5	1
370	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	37	7	1
371	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	43	8	0.5
372	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	17	3	0.7
373	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	70	49	9	0.8
374	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	92	45	9	1
375	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	17	3	0.65
376	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	29	5	0.8
377	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	18	3	0.85
378	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	21	4	0.65
379	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	16	3	0.6
380	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	14	2	1
381	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	19	3	1
382	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	21	4	0.45
383	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	37	7	1
384	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	7	1	1
385	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	37	7	0.8
386	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	71	43	8	0.85
387	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	11	2	1
388	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	37	7	0.6
389	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	34	6	1
390	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	8	1	0.8
391	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	45	9	1
392	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	0	0	0.65
393	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	23	4	0.95
394	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	8	1	0.6
395	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	18	3	0.65
396	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	43	8	1
397	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	39	7	0.9
398	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	8	1	1
399	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	34	6	1
400	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	22	4	0.65
401	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	13	2	0.85
402	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	14	2	1
403	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	34	6	1
404	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	25	5	0.95
405	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	28	49	9	1
406	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	58	8	1	1
407	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	11	21	4	0.65
408	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	34	17	3	0.65
409	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	72	46	9	1
410	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	73	40	8	0.45
411	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	54	29	5	1
412	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	98	29	5	1
413	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	76	29	5	1
414	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	53	31	6	1
415	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	59	1	0	0.6
416	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	74	39	7	1
417	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	15	4	0	0.6
418	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	99	24	4	0.2
419	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	10	29	5	1
420	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	94	49	9	0.8
421	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	50	47	9	1
422	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	31	34	6	1
423	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	44	8	0.65
424	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	14	2	1
425	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	29	5	0.8
426	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	2	0	1
427	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	19	3	0.45
428	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	46	9	1
429	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	37	7	0.8
430	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	24	4	0.65
431	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	2	0	0.65
432	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	8	1	0.8
433	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	32	6	1
434	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	17	3	0.95
435	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	13	2	1
436	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	2	0	0.95
437	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	7	1	1
438	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	23	4	0.2
439	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	32	6	1
440	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	2	0	0.2
441	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	25	5	0.9
442	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	8	1	0.8
443	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	22	4	0.6
444	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	17	3	0.65
445	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	14	2	1
446	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	2	0	1
447	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	14	2	1
448	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	8	1	1
449	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	17	3	0.45
450	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	46	11	2	1
451	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	86	32	6	1
452	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	65	28	5	1
453	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	36	7	0.65
454	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	23	16	3	0.75
455	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	42	34	6	0.6
456	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	25	8	1	1
457	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	43	8	1
458	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	88	20	4	1
459	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	44	8	0.65
460	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	89	16	3	0.45
461	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	45	18	3	0.65
462	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	49	9	1
463	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	22	23	4	0.2
464	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	84	8	1	1
465	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	62	8	1	1
466	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	85	0	0	0.65
467	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	49	9	1
468	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	25	5	1
469	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	43	8	0.7
470	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	60	17	3	0.65
471	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	83	14	2	1
472	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	32	6	1
473	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	9	21	4	0.65
474	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	37	7	0.6
475	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	3	29	5	0.6
476	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	5	19	3	1
477	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	6	14	2	1
478	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	4	21	4	0.4
479	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	7	8	1	0.8
480	24	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/prediction/prediction.data"	80	0	0	1
CREATE TABLE "sys"."ds_oaggregation" (
	"id"                   INTEGER       NOT NULL DEFAULT next value for "sys"."oaggregation_id_seq",
	"aggregation_task_id"  INTEGER,
	"oaggregation_file_id" INTEGER,
	CONSTRAINT "ds_oaggregation_id_pkey" PRIMARY KEY ("id")
);
COPY 1 RECORDS INTO "sys"."ds_oaggregation" FROM stdin USING DELIMITERS '\t','\n','"';
1	14	26
CREATE TABLE "sys"."ext_oaggregation" (
	"oaggregation_id"      INTEGER       NOT NULL DEFAULT next value for "sys"."ext_oaggregation_id_seq",
	"oaggregation_file_id" INTEGER       NOT NULL,
	"filename"             VARCHAR(200),
	"clothid"              DOUBLE,
	"quantity"             DOUBLE,
	CONSTRAINT "ext_oaggregation_oaggregation_id_pkey" PRIMARY KEY ("oaggregation_id")
);
COPY 10 RECORDS INTO "sys"."ext_oaggregation" FROM stdin USING DELIMITERS '\t','\n','"';
1	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	0	1269
2	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	6	1726
3	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	5	1714
4	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	3	1200
5	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	1	1606
6	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	2	1756
7	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	4	1161
8	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	8	1242
9	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	7	1401
10	26	"/home/vitor/Documents/dev/dfanalyzer-spark-demo/output/aggregation/aggregation.data"	9	1779
create function insertdataflow (v_tag varchar(50))
returns integer
begin
declare v_df_id integer;
 select df.id into v_df_id from dataflow df where df.tag=v_tag;
 if(v_df_id is null) then
 select next value for "df_id_seq" into v_df_id;
 insert into dataflow(id,tag) values (v_df_id,v_tag);
end if;
return v_df_id;
end;
create function insertdataflowversion (vdf_id integer)
returns integer
begin
declare version_id integer;
select next value for "version_id_seq" into version_id;
 insert into dataflow_version(version,df_id) values (version_id,vdf_id);
return version_id;
end;
create function insertdatatransformation (vdf_id integer, vtag varchar(50))
returns integer
begin
declare vdt_id integer;
 select id into vdt_id from data_transformation where df_id = vdf_id and tag = vtag;
 if(vdt_id is null) then
 select next value for "dt_id_seq" into vdt_id;
 insert into data_transformation(id,df_id,tag) values (vdt_id,vdf_id,vtag);
end if;
return vdt_id;
end;
create function insertprogram (vdf_id integer, vdt_id integer, vname varchar(200), vpath varchar(500))
returns integer
begin
declare vprogram_id integer;
 select id into vprogram_id from program p where df_id = vdf_id and name = vname and path = vpath;
 if(vprogram_id is null) then
 select next value for "program_id_seq" into vprogram_id;
 insert into program(id,df_id,name,path) values (vprogram_id,vdf_id,vname,vpath);
end if;
insert into use_program(dt_id,program_id) values (vdt_id,vprogram_id);
return vprogram_id;
end;
create function insertdataset (vdf_id integer, vdt_id integer, vdep_dt_id integer, vtag varchar(500), vtype varchar(10))
returns integer
begin
declare vds_id integer;
 select id into vds_id from data_set ds where df_id = vdf_id and tag = vtag;
 if(vds_id is null) then
 select next value for "ds_id_seq" into vds_id;
 insert into data_set(id,df_id,tag) values (vds_id,vdf_id,vtag);
end if;
if(vdep_dt_id is not null) then
declare vdd_id integer;
select ds_id into vdd_id from data_dependency
where previous_dt_id = vdep_dt_id and next_dt_id = vdt_id and ds_id = vds_id;
declare vid integer;
select id into vid from data_dependency where previous_dt_id = vdep_dt_id and next_dt_id is null;
if(vid is null) then
if(vdd_id is null) then
declare vdd_id integer;
select next value for "dd_id_seq" into vdd_id;
insert into data_dependency(id,previous_dt_id,next_dt_id,ds_id) values (vdd_id,vdep_dt_id,vdt_id,vds_id);
end if;
else
update data_dependency set next_dt_id = vdt_id where id = vid;
end if;
else
declare vdd_id integer;
select next value for "dd_id_seq" into vdd_id;
if(vtype like 'INPUT') then
insert into data_dependency(id,previous_dt_id,next_dt_id,ds_id) values (vdd_id,null,vdt_id,vds_id);
else
insert into data_dependency(id,previous_dt_id,next_dt_id,ds_id) values (vdd_id,vdt_id,null,vds_id);
end if;
end if;
return vds_id;
end;
create function insertattribute (dds_id integer, vextractor_id integer, vname varchar(30), vtype varchar(15))
returns integer
begin
declare vid integer;
 select id into vid from attribute where ds_id=dds_id and name=vname;
 if(vid is null) then
 select next value for "att_id_seq" into vid;
 insert into attribute(id,ds_id,extractor_id,name,type) values (vid,dds_id,vextractor_id,vname,vtype);
end if;
return vid;
end;
create function inserttask (videntifier integer, vdf_tag varchar(50), vdt_tag varchar(50), vstatus varchar(10), vworkspace varchar(500), 
vcomputing_resource varchar(100), voutput_msg text, verror_msg text)
returns integer
begin
declare vid integer;
declare vvstatus varchar(10);
declare vdf_version integer;
declare vdt_id integer;
select dfv.version, dt.id into vdf_version, vdt_id
from dataflow df, data_transformation dt, dataflow_version as dfv
where df.id = dt.df_id and dfv.df_id = df.id and df.tag = vdf_tag and dt.tag = vdt_tag;
if((vdf_version is not null) and (vdt_id is not null)) then
select t.id, t.status into vid, vvstatus
from task t
where t.df_version = vdf_version and t.dt_id = vdt_id and t.identifier = videntifier;
if(vid is null) then
 select next value for "task_id_seq" into vid;
 insert into task(id,identifier,df_version,dt_id,status,workspace,computing_resource,output_msg,error_msg) 
 values (vid,videntifier,vdf_version,vdt_id,vstatus,vworkspace,vcomputing_resource,voutput_msg,verror_msg);
 else
 update task
 set status = vstatus, output_msg = voutput_msg, error_msg = verror_msg
 where identifier = videntifier and df_version = vdf_version and dt_id = vdt_id;
end if;
 end if;
return vid;
end;
create function insertfile (vtask_id integer, vname varchar(200), vpath varchar(500))
returns integer
begin
declare vid integer;
 select id into vid from file where name=vname and path=vpath;
 if(vid is null) then
 select next value for "file_id_seq" into vid;
 insert into file(id,task_id,name,path) values (vid,vtask_id,vname,vpath);
end if;
return vid;
end;
create function insertperformance (vtask_id integer, vsubtask_id integer, vmethod varchar(30), vdescription varchar(200), vstarttime varchar(30), vendtime varchar(30), vinvocation text)
returns integer
begin
declare vid integer;
if(vsubtask_id is null) then
select id into vid from performance where method=vmethod and task_id=vtask_id;
else
select id into vid from performance where method=vmethod and task_id=vtask_id and subtask_id=vsubtask_id;
end if;
 
 if(vid is null) then
 select next value for "performance_id_seq" into vid;
 insert into performance(id,task_id,subtask_id,method,description,starttime,endtime,invocation) values (vid,vtask_id,vsubtask_id,vmethod,vdescription,vstarttime,vendtime,vinvocation);
else
 update performance
 set endtime = vendtime, invocation = vinvocation
 where id = vid and endtime = 'null';
end if;
return vid;
end;
create function insertextractor (vtag varchar(50), vds_id integer, vcartridge varchar(20), vextension varchar(20))
returns integer
begin
declare vid integer;
 select id into vid from extractor where tag = vtag and ds_id = vds_id and cartridge = vcartridge and extension = vextension;
 if(vid is null) then
 select next value for "extractor_id_seq" into vid;
 insert into extractor(id,ds_id,tag,cartridge,extension) values (vid,vds_id,vtag,vcartridge,vextension);
end if;
return vid;
end;
create function insertextractorcombination (vouter_ext_id integer, vinner_ext_id integer, vds_id integer, vkeys varchar(100), vkey_types varchar(100))
returns integer
begin
declare vid integer;
 select id into vid from extractor_combination where outer_ext_id = vouter_ext_id and inner_ext_id = vinner_ext_id and ds_id = vds_id;
 if(vid is null) then
 select next value for "ecombination_id_seq" into vid;
 insert into extractor_combination(outer_ext_id,inner_ext_id,keys,key_types,ds_id) values (vouter_ext_id,vinner_ext_id,vkeys,vkey_types,vds_id);
end if;
return vid;
end;
create view ideduplication(id, deduplication_task_id, ideduplication_file_id, ideduplication_id, ideduplication_filename, customerid, country, continent, age, gender, children, status) as
select ds.id, ds.deduplication_task_id, ideduplication.ideduplication_file_id, ideduplication.ideduplication_id, ideduplication.filename, ideduplication.customerid, ideduplication.country, ideduplication.continent, ideduplication.age, ideduplication.gender, ideduplication.children, ideduplication.status
 from ds_ideduplication as ds, ext_ideduplication as ideduplication
 where ds.ideduplication_file_id=ideduplication.ideduplication_file_id;
create view odeduplication(id, deduplication_task_id, europe_task_id, united_states_task_id, odeduplication_file_id, odeduplication_id, odeduplication_filename, customerid, country, continent, age, gender, children, status) as
select ds.id, ds.deduplication_task_id, ds.europe_task_id, ds.united_states_task_id, odeduplication.odeduplication_file_id, odeduplication.odeduplication_id, odeduplication.filename, odeduplication.customerid, odeduplication.country, odeduplication.continent, odeduplication.age, odeduplication.gender, odeduplication.children, odeduplication.status
 from ds_odeduplication as ds, ext_odeduplication as odeduplication
 where ds.odeduplication_file_id=odeduplication.odeduplication_file_id;
create view oeurope(id, europe_task_id, union_task_id, oeurope_file_id, oeurope_id, oeurope_filename, customerid, country, continent, age, gender, children, status) as
select ds.id, ds.europe_task_id, ds.union_task_id, oeurope.oeurope_file_id, oeurope.oeurope_id, oeurope.filename, oeurope.customerid, oeurope.country, oeurope.continent, oeurope.age, oeurope.gender, oeurope.children, oeurope.status
 from ds_oeurope as ds, ext_oeurope as oeurope
 where ds.oeurope_file_id=oeurope.oeurope_file_id;
create view ounited_states(id, united_states_task_id, union_task_id, ounited_states_file_id, ounited_states_id, ounited_states_filename, customerid, country, continent, age, gender, children, status) as
select ds.id, ds.united_states_task_id, ds.union_task_id, ounited_states.ounited_states_file_id, ounited_states.ounited_states_id, ounited_states.filename, ounited_states.customerid, ounited_states.country, ounited_states.continent, ounited_states.age, ounited_states.gender, ounited_states.children, ounited_states.status
 from ds_ounited_states as ds, ext_ounited_states as ounited_states
 where ds.ounited_states_file_id=ounited_states.ounited_states_file_id;
create view ounion(id, union_task_id, cartesian_product_task_id, ounion_file_id, ounion_id, ounion_filename, customerid, country, continent, age, gender, children, status) as
select ds.id, ds.union_task_id, ds.cartesian_product_task_id, ounion.ounion_file_id, ounion.ounion_id, ounion.filename, ounion.customerid, ounion.country, ounion.continent, ounion.age, ounion.gender, ounion.children, ounion.status
 from ds_ounion as ds, ext_ounion as ounion
 where ds.ounion_file_id=ounion.ounion_file_id;
create view icloth_item(id, cartesian_product_task_id, icloth_item_file_id, icloth_item_id, icloth_item_filename, clothid, description) as
select ds.id, ds.cartesian_product_task_id, icloth_item.icloth_item_file_id, icloth_item.icloth_item_id, icloth_item.filename, icloth_item.clothid, icloth_item.description
 from ds_icloth_item as ds, ext_icloth_item as icloth_item
 where ds.icloth_item_file_id=icloth_item.icloth_item_file_id;
create view ocartesian_product(id, cartesian_product_task_id, prediction_task_id, ocartesian_product_file_id, ocartesian_product_id, ocartesian_product_filename, customerid, country, continent, age, gender, children, status, clothid, description) as
select ds.id, ds.cartesian_product_task_id, ds.prediction_task_id, ocartesian_product.ocartesian_product_file_id, ocartesian_product.ocartesian_product_id, ocartesian_product.filename, ocartesian_product.customerid, ocartesian_product.country, ocartesian_product.continent, ocartesian_product.age, ocartesian_product.gender, ocartesian_product.children, ocartesian_product.status, ocartesian_product.clothid, ocartesian_product.description
 from ds_ocartesian_product as ds, ext_ocartesian_product as ocartesian_product
 where ds.ocartesian_product_file_id=ocartesian_product.ocartesian_product_file_id;
create view ibuying_pattern(id, prediction_task_id, ibuying_pattern_file_id, ibuying_pattern_id, ibuying_pattern_filename, buyingpatternid, clothid, country, continent, age, gender, children, status) as
select ds.id, ds.prediction_task_id, ibuying_pattern.ibuying_pattern_file_id, ibuying_pattern.ibuying_pattern_id, ibuying_pattern.filename, ibuying_pattern.buyingpatternid, ibuying_pattern.clothid, ibuying_pattern.country, ibuying_pattern.continent, ibuying_pattern.age, ibuying_pattern.gender, ibuying_pattern.children, ibuying_pattern.status
 from ds_ibuying_pattern as ds, ext_ibuying_pattern as ibuying_pattern
 where ds.ibuying_pattern_file_id=ibuying_pattern.ibuying_pattern_file_id;
create view oprediction(id, prediction_task_id, aggregation_task_id, oprediction_file_id, oprediction_id, oprediction_filename, customerid, buyingpatternid, clothid, probability) as
select ds.id, ds.prediction_task_id, ds.aggregation_task_id, oprediction.oprediction_file_id, oprediction.oprediction_id, oprediction.filename, oprediction.customerid, oprediction.buyingpatternid, oprediction.clothid, oprediction.probability
 from ds_oprediction as ds, ext_oprediction as oprediction
 where ds.oprediction_file_id=oprediction.oprediction_file_id;
create view oaggregation(id, aggregation_task_id, oaggregation_file_id, oaggregation_id, oaggregation_filename, clothid, quantity) as
select ds.id, ds.aggregation_task_id, oaggregation.oaggregation_file_id, oaggregation.oaggregation_id, oaggregation.filename, oaggregation.clothid, oaggregation.quantity
 from ds_oaggregation as ds, ext_oaggregation as oaggregation
 where ds.oaggregation_file_id=oaggregation.oaggregation_file_id;
ALTER TABLE "sys"."attribute" ADD CONSTRAINT "attribute_ds_id_fkey" FOREIGN KEY ("ds_id") REFERENCES "sys"."data_set" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."attribute" ADD CONSTRAINT "attribute_extractor_id_fkey" FOREIGN KEY ("extractor_id") REFERENCES "sys"."extractor" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."data_dependency" ADD CONSTRAINT "data_dependency_ds_id_fkey" FOREIGN KEY ("ds_id") REFERENCES "sys"."data_set" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."data_dependency" ADD CONSTRAINT "data_dependency_next_dt_id_fkey" FOREIGN KEY ("next_dt_id") REFERENCES "sys"."data_transformation" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."data_dependency" ADD CONSTRAINT "data_dependency_previous_dt_id_fkey" FOREIGN KEY ("previous_dt_id") REFERENCES "sys"."data_transformation" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."data_set" ADD CONSTRAINT "data_set_df_id_fkey" FOREIGN KEY ("df_id") REFERENCES "sys"."dataflow" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."data_transformation" ADD CONSTRAINT "data_transformation_df_id_fkey" FOREIGN KEY ("df_id") REFERENCES "sys"."dataflow" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."dataflow_version" ADD CONSTRAINT "dataflow_version_df_id_fkey" FOREIGN KEY ("df_id") REFERENCES "sys"."dataflow" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ibuying_pattern" ADD CONSTRAINT "ds_ibuying_pattern_ibuying_pattern_file_id_fkey" FOREIGN KEY ("ibuying_pattern_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ibuying_pattern" ADD CONSTRAINT "ds_ibuying_pattern_prediction_task_id_fkey" FOREIGN KEY ("prediction_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_icloth_item" ADD CONSTRAINT "ds_icloth_item_cartesian_product_task_id_fkey" FOREIGN KEY ("cartesian_product_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_icloth_item" ADD CONSTRAINT "ds_icloth_item_icloth_item_file_id_fkey" FOREIGN KEY ("icloth_item_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ideduplication" ADD CONSTRAINT "ds_ideduplication_deduplication_task_id_fkey" FOREIGN KEY ("deduplication_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ideduplication" ADD CONSTRAINT "ds_ideduplication_ideduplication_file_id_fkey" FOREIGN KEY ("ideduplication_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_oaggregation" ADD CONSTRAINT "ds_oaggregation_aggregation_task_id_fkey" FOREIGN KEY ("aggregation_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_oaggregation" ADD CONSTRAINT "ds_oaggregation_oaggregation_file_id_fkey" FOREIGN KEY ("oaggregation_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ocartesian_product" ADD CONSTRAINT "ds_ocartesian_product_cartesian_product_task_id_fkey" FOREIGN KEY ("cartesian_product_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ocartesian_product" ADD CONSTRAINT "ds_ocartesian_product_ocartesian_product_file_id_fkey" FOREIGN KEY ("ocartesian_product_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_odeduplication" ADD CONSTRAINT "ds_odeduplication_deduplication_task_id_fkey" FOREIGN KEY ("deduplication_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_odeduplication" ADD CONSTRAINT "ds_odeduplication_odeduplication_file_id_fkey" FOREIGN KEY ("odeduplication_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_oeurope" ADD CONSTRAINT "ds_oeurope_europe_task_id_fkey" FOREIGN KEY ("europe_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_oeurope" ADD CONSTRAINT "ds_oeurope_oeurope_file_id_fkey" FOREIGN KEY ("oeurope_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_oprediction" ADD CONSTRAINT "ds_oprediction_oprediction_file_id_fkey" FOREIGN KEY ("oprediction_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_oprediction" ADD CONSTRAINT "ds_oprediction_prediction_task_id_fkey" FOREIGN KEY ("prediction_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ounion" ADD CONSTRAINT "ds_ounion_ounion_file_id_fkey" FOREIGN KEY ("ounion_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ounion" ADD CONSTRAINT "ds_ounion_union_task_id_fkey" FOREIGN KEY ("union_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ounited_states" ADD CONSTRAINT "ds_ounited_states_ounited_states_file_id_fkey" FOREIGN KEY ("ounited_states_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ds_ounited_states" ADD CONSTRAINT "ds_ounited_states_united_states_task_id_fkey" FOREIGN KEY ("united_states_task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_ibuying_pattern" ADD CONSTRAINT "ext_ibuying_pattern_ibuying_pattern_file_id_fkey" FOREIGN KEY ("ibuying_pattern_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_icloth_item" ADD CONSTRAINT "ext_icloth_item_icloth_item_file_id_fkey" FOREIGN KEY ("icloth_item_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_ideduplication" ADD CONSTRAINT "ext_ideduplication_ideduplication_file_id_fkey" FOREIGN KEY ("ideduplication_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_oaggregation" ADD CONSTRAINT "ext_oaggregation_oaggregation_file_id_fkey" FOREIGN KEY ("oaggregation_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_ocartesian_product" ADD CONSTRAINT "ext_ocartesian_product_ocartesian_product_file_id_fkey" FOREIGN KEY ("ocartesian_product_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_odeduplication" ADD CONSTRAINT "ext_odeduplication_odeduplication_file_id_fkey" FOREIGN KEY ("odeduplication_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_oeurope" ADD CONSTRAINT "ext_oeurope_oeurope_file_id_fkey" FOREIGN KEY ("oeurope_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_oprediction" ADD CONSTRAINT "ext_oprediction_oprediction_file_id_fkey" FOREIGN KEY ("oprediction_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_ounion" ADD CONSTRAINT "ext_ounion_ounion_file_id_fkey" FOREIGN KEY ("ounion_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."ext_ounited_states" ADD CONSTRAINT "ext_ounited_states_ounited_states_file_id_fkey" FOREIGN KEY ("ounited_states_file_id") REFERENCES "sys"."file" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."extractor" ADD CONSTRAINT "extractor_ds_id_fkey" FOREIGN KEY ("ds_id") REFERENCES "sys"."data_set" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."extractor_combination" ADD CONSTRAINT "extractor_combination_ds_id_fkey" FOREIGN KEY ("ds_id") REFERENCES "sys"."data_set" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."extractor_combination" ADD CONSTRAINT "extractor_combination_inner_ext_id_fkey" FOREIGN KEY ("inner_ext_id") REFERENCES "sys"."extractor" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."extractor_combination" ADD CONSTRAINT "extractor_combination_outer_ext_id_fkey" FOREIGN KEY ("outer_ext_id") REFERENCES "sys"."extractor" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."file" ADD CONSTRAINT "file_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."performance" ADD CONSTRAINT "performance_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "sys"."task" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."program" ADD CONSTRAINT "program_df_id_fkey" FOREIGN KEY ("df_id") REFERENCES "sys"."dataflow" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."task" ADD CONSTRAINT "task_df_version_fkey" FOREIGN KEY ("df_version") REFERENCES "sys"."dataflow_version" ("version") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."task" ADD CONSTRAINT "task_dt_id_fkey" FOREIGN KEY ("dt_id") REFERENCES "sys"."data_transformation" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."use_program" ADD CONSTRAINT "use_program_dt_id_fkey" FOREIGN KEY ("dt_id") REFERENCES "sys"."data_transformation" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sys"."use_program" ADD CONSTRAINT "use_program_program_id_fkey" FOREIGN KEY ("program_id") REFERENCES "sys"."program" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER SEQUENCE "sys"."att_id_seq" RESTART WITH 121 NO CYCLE;
ALTER SEQUENCE "sys"."dd_id_seq" RESTART WITH 23 NO CYCLE;
ALTER SEQUENCE "sys"."df_id_seq" RESTART WITH 3 NO CYCLE;
ALTER SEQUENCE "sys"."ds_id_seq" RESTART WITH 21 NO CYCLE;
ALTER SEQUENCE "sys"."dt_id_seq" RESTART WITH 15 NO CYCLE;
ALTER SEQUENCE "sys"."ecombination_id_seq" RESTART WITH 1 NO CYCLE;
ALTER SEQUENCE "sys"."ext_ibuying_pattern_id_seq" RESTART WITH 51 NO CYCLE;
ALTER SEQUENCE "sys"."ext_icloth_item_id_seq" RESTART WITH 11 NO CYCLE;
ALTER SEQUENCE "sys"."ext_ideduplication_id_seq" RESTART WITH 207 NO CYCLE;
ALTER SEQUENCE "sys"."ext_oaggregation_id_seq" RESTART WITH 11 NO CYCLE;
ALTER SEQUENCE "sys"."ext_ocartesian_product_id_seq" RESTART WITH 531 NO CYCLE;
ALTER SEQUENCE "sys"."ext_odeduplication_id_seq" RESTART WITH 207 NO CYCLE;
ALTER SEQUENCE "sys"."ext_oeurope_id_seq" RESTART WITH 52 NO CYCLE;
ALTER SEQUENCE "sys"."ext_oprediction_id_seq" RESTART WITH 481 NO CYCLE;
ALTER SEQUENCE "sys"."ext_ounion_id_seq" RESTART WITH 54 NO CYCLE;
ALTER SEQUENCE "sys"."ext_ounited_states_id_seq" RESTART WITH 3 NO CYCLE;
ALTER SEQUENCE "sys"."extractor_id_seq" RESTART WITH 21 NO CYCLE;
ALTER SEQUENCE "sys"."file_id_seq" RESTART WITH 27 NO CYCLE;
ALTER SEQUENCE "sys"."ibuying_pattern_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."icloth_item_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."ideduplication_id_seq" RESTART WITH 5 NO CYCLE;
ALTER SEQUENCE "sys"."oaggregation_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."ocartesian_product_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."odeduplication_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."oeurope_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."oprediction_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."ounion_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."ounited_states_id_seq" RESTART WITH 2 NO CYCLE;
ALTER SEQUENCE "sys"."performance_id_seq" RESTART WITH 1 NO CYCLE;
ALTER SEQUENCE "sys"."program_id_seq" RESTART WITH 15 NO CYCLE;
ALTER SEQUENCE "sys"."task_id_seq" RESTART WITH 15 NO CYCLE;
ALTER SEQUENCE "sys"."version_id_seq" RESTART WITH 3 NO CYCLE;
COMMIT;
