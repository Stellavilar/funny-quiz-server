BEGIN;

DROP TABLE IF EXISTS "answer";
CREATE TABLE "answer" (
    id integer NOT NULL,
    title text NOT NULL,
    quiz_id integer NOT NULL,
    created_at timestamp with time zone,
    color text
);


DROP TABLE IF EXISTS "levels";
CREATE TABLE "levels" (
    id integer NOT NULL,
    title text NOT NULL,
    color text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


DROP TABLE IF EXISTS "quiz";
CREATE TABLE "quiz" (
    id integer NOT NULL UNIQUE,
    langue text DEFAULT ''::text,
    theme text DEFAULT ''::text,
    question text DEFAULT ''::text NOT NULL,
    prop1 text DEFAULT ''::text NOT NULL,
    prop2 text DEFAULT ''::text NOT NULL,
    prop3 text DEFAULT ''::text NOT NULL,
    prop4 text DEFAULT ''::text NOT NULL,
    niveau integer,
    anecdote character varying(255) DEFAULT ''::character varying NOT NULL,
    wiki character varying(255) DEFAULT ''::character varying NOT NULL,
    tag_id integer NOT NULL,
    level_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    answer_id integer NOT NULL
);


CREATE SEQUENCE "quiz_answer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE "quiz_answer_id_seq" OWNED BY quiz.answer_id;


DROP TABLE IF EXISTS "quiz_has_subcategory";
CREATE TABLE "quiz_has_subcategory" (
    subcategory_id integer NOT NULL,
    quizzes_id integer NOT NULL,
    created_at timestamp with time zone,
    id integer NOT NULL

);


CREATE SEQUENCE "quiz_has_subcategory_id_seq" 
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "quiz_has_subcategory_id_seq" OWNED BY quiz_has_subcategory.id;



CREATE SEQUENCE "quiz_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE "quiz_id_seq" OWNED BY quiz.id;


DROP TABLE IF EXISTS "score";
CREATE TABLE "score" (
    id integer NOT NULL,
    number integer,
    updated_at timestamp with time zone,
    user_id integer,
    created_at timestamp with time zone
);


ALTER TABLE "score" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "score_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

DROP TABLE IF EXISTS "subcategory";
CREATE TABLE "subcategory" (
    id integer NOT NULL,
    title text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    color text
);


CREATE SEQUENCE "subcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "subcategory_id_seq" OWNED BY subcategory.id;



DROP TABLE IF EXISTS "tag";
CREATE TABLE "tag" (
    id integer NOT NULL,
    title text NOT NULL,
    color text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
    id integer NOT NULL,
    username text NOT NULL,
    mail text NOT NULL,
    score_id integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    password text NOT NULL,
    token text
);


CREATE SEQUENCE "users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "users_id_seq" OWNED BY users.id;


ALTER TABLE "quiz" ALTER COLUMN "id" SET DEFAULT nextval('quiz_id_seq'::regclass);


ALTER TABLE "quiz" ALTER COLUMN "answer_id" SET DEFAULT nextval('quiz_answer_id_seq'::regclass);


ALTER TABLE "quiz_has_subcategory" ALTER COLUMN "id" SET DEFAULT nextval('quiz_has_subcategory_id_seq'::regclass);


ALTER TABLE "subcategory" ALTER COLUMN "id" SET DEFAULT nextval('subcategory_id_seq'::regclass);


ALTER TABLE "users" ALTER COLUMN "id" SET DEFAULT nextval('users_id_seq'::regclass);


/*insert data*/

INSERT INTO "answer" ("id", "title", "quiz_id", "created_at", "color") VALUES 
(1, 'Se rafra??chir', 1, NULL, NULL),
(2, 'Nageoire dorsale', 2, NULL, NULL),
(3, 'Trop aigu', 3, NULL, NULL),
(4, 'B??nitier', 4, NULL, NULL),
(5, 'Tuer les m??les', 5, NULL, NULL),
(6, 'Pucerons', 6, NULL, NULL),
(7, 'Des cadavres', 7, NULL, NULL),
(8, 'Humide', 8, NULL, NULL),
(9, 'Langue', 9, NULL, NULL),
(10, 'Son ventre', 10, NULL, NULL),
(11, 'Usure des dents', 11, NULL, NULL),
(12, 'Vibrisses', 12, NULL, NULL),
(13, 'Rhinoc??ros', 13, NULL, NULL),
(14, 'Par leurs s??cr??tions', 14, NULL, NULL),
(15, 'Lions', 15, NULL, NULL),
(16, '2 grammes', 16, NULL, NULL),
(17, '??raflures', 17, NULL, NULL),
(18, '120 km/h', 18, NULL, NULL),
(19, 'En s''enroulant', 19, NULL, NULL),
(20, 'Homme', 20, NULL, NULL),
(21, 'Six mois', 21, NULL, NULL),
(22, '35 l', 22, NULL, NULL),
(23, 'Boire', 23, NULL, NULL),
(24, 'Hyacinthe', 24, NULL, NULL),
(25, 'Seize', 25, NULL, NULL),
(26, '18 mois', 26, NULL, NULL),
(27, 'Sang', 27, NULL, NULL),
(28, 'Corne', 28, NULL, NULL),
(29, 'Printemps', 29, NULL, NULL),
(30, '16 000', 30, NULL, NULL),
(31, 'Insectes', 31, NULL, NULL),
(32, 'Fourmili??re', 32, NULL, NULL),
(33, '1001 pattes', 33, NULL, NULL),
(34, 'Les termites', 34, NULL, NULL),
(35, 'Le Groenland', 35, NULL, NULL),
(36, 'La Reine', 36, NULL, NULL),
(37, 'Leurs antennes', 37, NULL, NULL),
(38, 'La cigale', 38, NULL, NULL),
(39, 'Le vinaigre', 39, NULL, NULL),
(40, 'Fourmiz', 40, NULL, NULL),
(41, 'Bernard Werber', 41, NULL, NULL),
(42, 'Supercolonie', 42, NULL, NULL),
(43, 'Ouvri??res', 43, NULL, NULL),
(44, 'Femelle', 44, NULL, NULL),
(45, 'Charpenti??res', 45, NULL, NULL),
(46, 'Soldats', 46, NULL, NULL),
(47, 'Pot-de-miel', 47, NULL, NULL),
(48, 'Les ph??romones', 48, NULL, NULL),
(49, 'Les nettoyeuses', 49, NULL, NULL),
(50, 'Le tamanoir', 50, NULL, NULL),
(51, '12 600', 51, NULL, NULL),
(52, 'Monogynes', 52, NULL, NULL),
(53, '400', 53, NULL, NULL),
(54, 'Bulldog', 54, NULL, NULL),
(55, '22 km', 55, NULL, NULL),
(56, '28 ans', 56, NULL, NULL),
(57, '1 %', 57, NULL, NULL),
(58, 'Stridulations', 58, NULL, NULL),
(59, '10 millions', 59, NULL, NULL),
(60, 'Pangolin', 60, NULL, NULL),
(61, 'Lyon', 61, NULL, NULL),
(62, 'Ath??nes', 62, NULL, NULL),
(63, 'Agen', 63, NULL, NULL),
(64, 'Rouge', 64, NULL, NULL),
(65, 'La Havane', 65, NULL, NULL),
(66, 'Tha??lande', 66, NULL, NULL),
(67, 'Brazzaville', 67, NULL, NULL),
(68, 'P??kin', 68, NULL, NULL),
(69, 'Madrid', 69, NULL, NULL),
(70, 'Inde', 70, NULL, NULL),
(72, 'Inde', 72, NULL, NULL),
(73, 'Rio de Janeiro', 73, NULL, NULL),
(74, 'La Haye', 74, NULL, NULL),
(75, 'Une seule', 75, NULL, NULL),
(76, 'Libye', 76, NULL, NULL),
(77, 'Le Caire', 77, NULL, NULL),
(78, 'Adriatique', 78, NULL, NULL),
(79, 'New York', 79, NULL, NULL),
(80, 'Pangolin', 80, NULL, NULL),
(81, 'Lac', 81, NULL, NULL),
(82, 'Chinoise', 82, NULL, NULL),
(83, '20 millions', 83, NULL, NULL),
(84, 'Catalogne', 84, NULL, NULL),
(85, 'Casbah', 85, NULL, NULL),
(86, 'Birmanie', 86, NULL, NULL),
(87, 'Norv??ge', 87, NULL, NULL),
(88, 'Monrovia', 88, NULL, NULL),
(89, 'Alg??rie', 89, NULL, NULL),
(90, 'Peak Tram', 90, NULL, NULL),
(91, 'Oasis', 91, NULL, NULL),
(92, 'Pomme', 92, NULL, NULL),
(93, 'Bretagne', 93, NULL, NULL),
(94, 'Georges Clooney', 94, NULL, NULL),
(95, 'Rouge et blanche', 95, NULL, NULL),
(96, 'Des dosettes', 96, NULL, NULL),
(97, 'Jus de fruits', 97, NULL, NULL),
(98, 'Jean Dujardin', 98, NULL, NULL),
(99, 'Tropicana', 99, NULL, NULL),
(100, 'Champomy', 100, NULL, NULL),
(101, 'Evian', 101, NULL, NULL),
(102, 'Monster energy', 102, NULL, NULL),
(103, 'Bloody Mary', 103, NULL, NULL),
(104, 'Nestl??', 104, NULL, NULL),
(105, 'Le blanc', 105, NULL, NULL),
(106, 'Noire', 106, NULL, NULL),
(107, 'Canada Dry', 107, NULL, NULL),
(108, 'Jacques Vabres', 108, NULL, NULL),
(109, 'Banga', 109, NULL, NULL),
(110, 'Ricor??', 110, NULL, NULL),
(111, 'Pastis51', 111, NULL, NULL),
(112, 'Taurine', 112, NULL, NULL),
(113, 'De la coca??ne', 113, NULL, NULL),
(114, 'Islande', 114, NULL, NULL),
(115, 'Open Cola', 115, NULL, NULL),
(116, 'Zinedine Zidane', 116, NULL, NULL),
(117, 'Canada Dry', 117, NULL, NULL),
(118, '1898', 188, NULL, NULL),
(119, 'Boston', 119, NULL, NULL),
(120, '1783', 120, NULL, NULL),
(121, '67 394', 121, NULL, NULL),
(122, 'LOSC Lille', 122, NULL, NULL),
(123, 'Stade de Reims', 123, NULL, NULL),
(124, 'AJ Auxerre', 124, NULL, NULL),
(125, 'N??mes olympiques', 125, NULL, NULL),
(126, 'Armand-Cesari', 126, NULL, NULL),
(127, 'FC Lorient', 127, NULL, NULL),
(128, 'Stadium Municipal', 128, NULL, NULL),
(129, 'Le Chaudron', 129, NULL, NULL),
(130, 'Une rivi??re', 130, NULL, NULL),
(131, 'RC Lens', 131, NULL, NULL),
(132, 'Strasbourg', 132, NULL, NULL),
(133, 'Saint-Symphorien', 133, NULL, NULL),
(134, 'Joneli??re', 134, NULL, NULL),
(135, 'Stade Oc??ane', 135, NULL, NULL),
(136, 'Marcel Picot', 136, NULL, NULL),
(137, 'FC Sochaux', 137, NULL, NULL),
(138, 'Roazhon park', 138, NULL, NULL),
(139, 'Tours FC', 139, NULL, NULL),
(140, 'Stade V??lodrome', 140, NULL, NULL),
(141, 'D??cines-Charpieu', 141, NULL, NULL),
(142, 'Louis Fonteneau', 142, NULL, NULL),
(143, 'Stade du Ray', 143, NULL, NULL),
(144, 'Stade L??on-Boll??e', 144, NULL, NULL),
(145, 'CS Sedan Ardennes', 145, NULL, NULL),
(146, 'Bocca', 146, NULL, NULL),
(147, 'Roudourou', 147, NULL, NULL),
(148, 'Duathlon', 148, NULL, NULL),
(149, 'Lyon', 149, NULL, NULL),
(150, 'Ange-Casanova', 150, NULL, NULL),
(151, '140', 151, NULL, NULL),
(152, 'Pinterest', 152, NULL, NULL),
(153, 'Marc Zukerberg', 153, NULL, NULL),
(154, 'Linkedin', 154, NULL, NULL),
(155, 'Des photos', 155, NULL, NULL),
(156, 'Ellen DeGeneres', 156, NULL, NULL),
(157, 'Une vid??o', 157, NULL, NULL),
(158, 'Vine', 158, NULL, NULL),
(159, 'Pinterest', 159, NULL, NULL),
(160, 'Linkedin', 160, NULL, NULL),
(161, 'Reddit', 161, NULL, NULL),
(162, 'Slingshot', 162, NULL, NULL),
(163, '300 millions', 163, NULL, NULL),
(164, '80%', 164, NULL, NULL),
(165, '2006', 165, NULL, NULL),
(166, 'Foursquare', 166, NULL, NULL),
(167, 'CIA', 167, NULL, NULL),
(168, 'Des cadeaux', 168, NULL, NULL),
(169, '55 millions', 169, NULL, NULL),
(170, 'Tumblr', 170, NULL, NULL),
(171, 'Viadeo', 171, NULL, NULL),
(172, '19 milliards', 172, NULL, NULL),
(173, 'Piwie', 173, NULL, NULL),
(174, 'Disneyland', 174, NULL, NULL),
(175, 'Kipi', 175, NULL, NULL),
(176, 'XING', 176, NULL, NULL),
(177, 'LINE', 177, NULL, NULL),
(178, 'Renren', 178, NULL, NULL),
(179, 'Plaxo', 179, NULL, NULL),
(180, 'VK', 180, NULL, NULL),
(181, 'Tatooine', 181, NULL, NULL),
(182, 'Chewbacca', 181, NULL, NULL),
(183, 'Ben', 183, NULL, NULL),
(184, 'Faucon Millenium', 184, NULL, NULL),
(185, 'C-3PO', 185, NULL, NULL),
(186, 'Chasseur de Primes', 186, NULL, NULL),
(187, 'Ewok', 187, NULL, NULL),
(188, 'Fr??re et soeur', 188, NULL, NULL),
(189, 'Luke Skywalker', 189, NULL, NULL),
(190, 'Mark Hamill', 190, NULL, NULL),
(191, 'Jabba Le Hut', 191, NULL, NULL),
(192, 'La Princesse Leia', 192, NULL, NULL),
(193, 'Violette', 193, NULL, NULL),
(194, 'Dark Sidious', 194, NULL, NULL),
(195, 'Dark Sidious', 195, NULL, NULL),
(196, 'Dark Maul', 196, NULL, NULL),
(197, 'Deux', 197, NULL, NULL),
(198, 'Luke', 198, NULL, NULL),
(199, 'Boba', 199, NULL, NULL),
(200, 'Jar Jar Binks', 200, NULL, NULL),
(201, '900 ans', 201, NULL, NULL),
(202, 'Sebulba', 202, NULL, NULL),
(203, 'Shmi', 203, NULL, NULL),
(204, 'Ordre 66', 204, NULL, NULL),
(205, 'Neimoidien', 205, NULL, NULL),
(206, 'Dark Tyranus', 206, NULL, NULL),
(207, 'Watoo', 207, NULL, NULL),
(208, 'Leai Organa', 208, NULL, NULL),
(209, 'Plo Koon', 209, NULL, NULL),
(210, 'Shaak Ti', 210, NULL, NULL),
(211, 'Une rose', 211, NULL, NULL),
(212, 'En citrouille', 212, NULL, NULL),
(213, 'Blanche-Neige', 213, NULL, NULL),
(214, 'Sept', 214, NULL, NULL),
(215, 'Blanche-Neige', 215, NULL, NULL),
(216, 'Par un baiser', 216, NULL, NULL),
(217, 'Blanche-Neige', 217, NULL, NULL),
(218, 'Cendrillon', 218, NULL, NULL),
(219, 'Minuit', 219, NULL, NULL),
(220, 'Blanche-Neige', 220, NULL, NULL),
(221, 'Rose', 221, NULL, NULL),
(222, 'Mulan', 222, NULL, NULL),
(223, 'Ariel', 223, NULL, NULL),
(224, 'Jasmine', 224, NULL, NULL),
(225, 'Raiponce', 225, NULL, NULL),
(226, 'Aladdin', 226, NULL, NULL),
(227, 'Des souris', 227, NULL, NULL),
(228, 'Un raton-laveur', 228, NULL, NULL),
(229, 'Merida', 229, NULL, NULL),
(230, 'Tiana', 230, NULL, NULL),
(231, 'Mulan', 231, NULL, NULL),
(232, 'Des diamants', 232, NULL, NULL),
(233, '100 ans', 233, NULL, NULL),
(234, 'Lucifer', 234, NULL, NULL),
(235, 'Mushu', 235, NULL, NULL),
(236, 'Un tigre', 236, NULL, NULL),
(237, 'Souris', 237, NULL, NULL),
(238, 'Naomi Campbell', 238, NULL, NULL),
(239, 'Pocahontas', 239, NULL, NULL),
(240, 'Belle', 240, NULL, NULL),
(241, 'Thomas', 241, NULL, NULL),
(242, 'Loft Story', 242, NULL, NULL),
(243, 'Koh Lanta', 243, NULL, NULL),
(244, 'Jenifer', 244, NULL, NULL),
(245, 'Gr??gory Basso', 245, NULL, NULL),
(246, 'Loft Story', 246, NULL, NULL),
(247, 'Nikos Aliagas', 247, NULL, NULL),
(248, 'Secret Story', 248, NULL, NULL),
(249, 'Master Chef', 249, NULL, NULL),
(250, 'Les Chtis', 250, NULL, NULL),
(251, 'Stephane Rotenberg', 251, NULL, NULL),
(252, 'Popstars', 252, NULL, NULL),
(253, 'Italienne', 253, NULL, NULL),
(254, 'Dilemme', 254, NULL, NULL),
(255, 'Andr?? Manoukian', 255, NULL, NULL),
(256, 'Des millionnaires', 256, NULL, NULL),
(257, 'W9', 257, NULL, NULL),
(258, 'Star Academy', 258, NULL, NULL),
(259, 'Endemol', 259, NULL, NULL),
(260, 'Bachelor', 260, NULL, NULL),
(261, 'Saison 4', 261, NULL, NULL),
(262, 'Neuf', 262, NULL, NULL),
(263, 'Les colocataires', 263, NULL, NULL),
(264, 'Nathalie Simon', 264, NULL, NULL),
(265, 'Une princesse', 265, NULL, NULL),
(266, 'Les colocataires', 266, NULL, NULL),
(267, 'Richard Virenque', 267, NULL, NULL),
(268, 'C??line Catalaa', 268, NULL, NULL),
(269, 'Aliz??e', 269, NULL, NULL),
(270, 'Matthieu Delormeau', 270, NULL, NULL),
(71, 'Le Caire', 71, NULL, NULL);


INSERT INTO "levels" ("id", "title", "color", "created_at", "updated_at") VALUES 
    (1, 'D??butant', 'green', '2020-09-18 12:16:38.251232', NULL),
    (2, 'Interm??diare', 'yellow', '2020-09-18 12:16:38.251232', NULL),
    (3, 'Expert', 'red', '2020-09-18 12:16:38.251232', NULL);

-- 

INSERT INTO "quiz" ("id", "langue", "theme", "question", "prop1", "prop2", "prop3", "prop4", "niveau", "anecdote", "wiki", "tag_id", "level_id", "created_at", "updated_at", "answer_id") VALUES 
     (1, 'fr', 'Animaux en vrac', 'Pourquoi les ours polaires se couchent-ils dans la neige lorsquils courent ?', 'Se reposer', 'Dormir', 'Se rafra??chir', 'Manger', 1, 'Les ours polaires peuvent rapidement avoir trop chaud sous leur fourrure tr??s ??paisse et leur couche de graisse isolante.', 'https://fr.wikipedia.org/wiki/Ours_blanc', 1, 1, '2020-09-16 18:56:33.382527', NULL, 1),
     (2, 'fr', 'Animaux en vrac', 'Quelle partie du corps permet aux hippocampes de nager ?', 'Nageoire dorsale', 'T??te','Nageoire ventrale', 'Queue', 1, 'Malgr?? qu''ils soient des poissons, les hippocampes ne nagent que tr??s lentement en effectuant des mouvements onduleux.', 'https://fr.wikipedia.org/wiki/Hippocampe_(poisson)', 1, 1, '2020-09-16 18:56:33.382527', NULL, 2),
     (3, 'fr', 'Animaux en vrac', 'Pour quelle raison ne pouvons-nous pas entendre les cris de la chauve-souris ?', 'Trop faible', 'Trop grave', 'Trop fort', 'Trop aigu',1, 'Les chauves-souris ??mettent et re??oivent des ultrasons que notre oreille ne peut percevoir (max 20 000 hertz).', 'https://fr.wikipedia.org/wiki/Chiroptera', 1, 1, '2020-09-16 18:56:33.382527', NULL, 3),
     (4, 'fr', 'Animaux en vrac', '?? quoi servait la coquille du tridacne g??ant dans de nombreuses ??glises ?', 'B??nitier', 'Tronc', 'Corbeille ?? pain','Chandelier',  1, 'Il y a 300 ans, les coquilles ??taient consid??r??es comme des objets pr??cieux et servaient de b??nitier ?? ''entr??e des ??glises.', 'https://fr.wikipedia.org/wiki/Tridacne_g??ant', 1, 1, '2020-09-16 18:56:33.382527', NULL, 4),
     (5, 'fr', 'Animaux en vrac', 'Quelle lourde et p??nible t??che incombe ?? la reine des fourmis ?', 'D??fendre le nid','Pondre des oeufs',  'Chercher ?? manger', 'Tuer les m??les', 1, 'La reine est la seule fourmi du nid ?? pondre des oeufs qui sont en r??alit?? des larves ??closes dont na??tront les futures fourmis.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 18:56:33.382527', NULL, 5),
     (6, 'fr', 'Animaux en vrac', 'Qu''est-ce que les coccinelles aiment tout particuli??rement manger ?',  'P??tales', '??xcr??ments','Pucerons', '??corces', 1, 'Consid??r??es comme animaux utiles, on ??l??ve les coccinelles puis on les utilise pour combattre ??cologiquement les parasites.', 'https://fr.wikipedia.org/wiki/Coccinellidae', 1, 1, '2020-09-16 18:56:33.382527', NULL, 6),
     (7, 'fr', 'Animaux en vrac', 'Pour quelle raison les n??crophores se battent-ils entre eux ?', 'Des femelles','Des cadavres',  'Un territoire', 'De l''or', 1, 'Un couple de n??crophores enterre un animal mort dans le sol et y pond ses oeufs dont les larves sont nourries.', 'https://fr.wikipedia.org/wiki/N??crophore', 1, 1, '2020-09-16 18:56:33.382527', NULL, 7),
     (8, 'fr', 'Animaux en vrac', 'De quel type d''environnement un acarien a-t-il besoin pour vivre ?', 'Sec',  'Humide','Gras', 'Ensoleill??', 1, 'Sans les acariens, qui nichent dans nos matelas et les endroits humides, les for??ts seraient submerg??es de feuilles mortes.', 'https://fr.wikipedia.org/wiki/Acari', 1, 1, '2020-09-16 18:56:33.382527', NULL, 8),
     (9, 'fr', 'Animaux en vrac', 'Quelle partie du corps de la limace lui permet-elle de d??couper les plantes ?', 'Dents', 'Palais',  'Langue', 'Bras', 1, 'Telle une lime, la langue r??che de la limace r??pe les plantes tendres en petits morceaux et d??pouille ainsi les jeunes salades.', 'https://fr.wikipedia.org/wiki/Limace', 1, 1, '2020-09-16 18:56:33.382527', NULL, 9),
     (10, 'fr', 'Animaux en vrac', 'Quelle partie du corps montre le loup le plus faible apr??s une lutte pour la hi??rarchie ?', 'Son ventre', 'Sa langue', 'Sa queue', 'Ses dents', 1, 'Le loup inf??rieur n''est ainsi pas bless?? mais devra ?? l''avenir se soumettre au m??le dominant, selon leur hi??rarchie prononc??e.', 'https://fr.wikipedia.org/wiki/Canis_lupus', 1, 1, '2020-09-16 18:56:33.382527', NULL, 10),
     (11, 'fr', 'Animaux en vrac', 'Quelle est la cause de mortalit?? la plus fr??quente chez les ??l??phants en libert?? ?', 'Trompe cass??e',  'Usure des dents', 'Maladie', 'Morsure de lion', 2, 'Lorsque la derni??re molaire est us??e par la mastication, l''??l??phant ne peut plus se nourrir suffisamment et meurt tristement de faim.', 'https://fr.wikipedia.org/wiki/??l??phant', 1, 2, '2020-09-16 19:07:51.258251', NULL, 11),
     (12, 'fr', 'Animaux en vrac', 'Gr??ce ?? quelle partie de son corps la taupe s''oriente-t-elle sous terre ?', 'Museau', 'Vibrisses', 'Yeux', 'Oreilles', 2, 'Les taupes s''orientent presque exclusivement en utilisant une sorte de moustaches et t??tent leur nourriture de cette mani??re.', 'https://fr.wikipedia.org/wiki/Taupe', 1, 2, '2020-09-16 19:07:51.258251', NULL, 12),
     (13, 'fr', 'Animaux en vrac', '?? part le cheval, ?? quel autre animal le tapir est-il apparent?? ?', '??l??phant','Rhinoc??ros', 'Cochon', 'Hamster', 2, 'Les tapirs, de la famille des ongul??s, utilisent leur trompe comme main et peuvent ainsi la r??tracter lorsque celle-ci les g??ne.', 'https://fr.wikipedia.org/wiki/Tapir', 1, 2, '2020-09-16 19:07:51.258251', NULL, 13),
     (14, 'fr', 'Animaux en vrac', 'Comment les mille-pattes se prot??gent-ils de leurs pr??dateurs ?', 'Par camouflage', 'Par leurs s??cr??tions', 'En criant', 'En mordant', 2, 'En cas de danger, les mille-pattes ??mettent une substance rouge caustique ?? l''odeur naus??abonde via des glandes sur leurs anneaux.', 'https://fr.wikipedia.org/wiki/Myriapoda', 1, 2, '2020-09-16 19:07:51.258251', NULL, 14),
     (15, 'fr', 'Animaux en vrac', 'Quels animaux volent souvent aux hy??nes la proie qu''elles ont chass??e ?', 'Gnous',  'Lions','Gu??pards', 'Buffles', 2, 'Les hy??nes chassent g??n??ralement en meute d''environ quarante individus des animaux tels que les z??bres ou les gnous.', 'https://fr.wikipedia.org/wiki/Hyaenidae', 1, 2, '2020-09-16 19:07:51.258251', NULL, 15),
     (16, 'fr', 'Animaux en vrac', 'Combien p??se environ la plus petite esp??ce de musaraigne connue ?',  '20 grammes', '70 grammes', '130 grammes','2 grammes', 2, 'Notre musaraigne pygm??e locale est, quant ?? elle, deux fois plus grande et plus lourde que ce pachyure ??trusque.', 'https://fr.wikipedia.org/wiki/Musaraigne', 1, 2, '2020-09-16 19:07:51.258251', NULL, 16),
     (17, 'fr', 'Animaux en vrac', 'De quelle mani??re le lynx a-t-il l''habitude de marquer son territoire ?',  'Excr??ments','??raflures', 'Poils', 'Souris mortes', 2, 'Outre des ??raflures, les lynx utilisent parfois ??galement leur urine comme marque odorante afin de d??limiter leur domaine.', 'https://fr.wikipedia.org/wiki/Lynx', 1, 2, '2020-09-16 19:07:51.258251', NULL, 17),
     (18, 'fr', 'Animaux en vrac', 'Taill?? pour la course, jusqu''?? quelle vitesse un gu??pard peut-il courir ?', '90 km/h', '60 km/h','120 km/h', '150 km/h', 2, 'Le plus rapide des animaux ne peut maintenir cette vitesse que sur quelques centaines de m??tres, laissant une chance aux gazelles.', 'https://fr.wikipedia.org/wiki/Gu??pard', 1, 2, '2020-09-16 19:07:51.258251', NULL, 18),
     (19, 'fr', 'Animaux en vrac', 'Comment les cloportes se prot??gent-ils des attaques ?', 'En s''enfuyant','En s''enroulant', 'En s''enterrant', 'En s''envolant', 2, 'Le corps d''un cloporte, dans ce cas immobile, est compos?? de plusieurs anneaux solides qui rappellent une armure de chevalier.', 'https://fr.wikipedia.org/wiki/Cloporte', 1, 2, '2020-09-16 19:07:51.258251', NULL, 19),
     (20, 'fr', 'Animaux en vrac', 'Quel animal est le plus grand ennemi connu de la buse variable ?', 'Renard', 'Aigle', 'Homme', 'Ours brun', 2, 'De nombreuses buses sont ??cras??es par l''homme lorsqu''elles tentent de r??cup??rer des cadavres d''animaux sur les autoroutes.', 'https://fr.wikipedia.org/wiki/Buse_variable', 1, 2, '2020-09-16 19:07:51.258251', NULL, 20),
     (21, 'fr', 'Animaux en vrac', 'Apr??s combien de temps un b??b?? tigre re??oit-il de la viande pour la premi??re fois ?', 'Six mois', 'Un mois', 'Un an', 'Six ans', 3, 'Au cours des six premiers mois, les b??b??s tigres qui ne connaissent pas leur p??re sont allait??s par leur m??re.', 'https://fr.wikipedia.org/wiki/Tigre', 1, 3, '2020-09-16 19:10:35.551407', NULL, 21),
     (22, 'fr', 'Animaux en vrac', 'Combien de litres de lait une vache performante produit-elle chaque jour ?', '35 l', '25 l', '15 l', '5 l', 3, 'Ces vaches fortement exploit??es souffrent le plus souvent d''une inflammation des pis et n??cessitent beaucoup de m??dicaments.', 'https://fr.wikipedia.org/wiki/Vache', 1, 3, '2020-09-16 19:10:35.551407', NULL, 22),
     (23, 'fr', 'Animaux en vrac', 'De quelle fonction vitale le fennec peut-il ??tonnamment se passer ?', 'Boire', 'Manger', 'Dormir', 'Voir', 3, 'Le liquide que le fennec absorbe gr??ce ?? son alimentation lui suffit et est donc admirablement adapt?? ?? la vie dans le d??sert.', 'https://fr.wikipedia.org/wiki/Fennec', 1, 3, '2020-09-16 19:10:35.551407', NULL, 23),
     (24, 'fr', 'Animaux en vrac', 'Quel est le plus grand des aras parmi les perroquets connus ?? ce jour ?', 'Hyacinthe', 'Macao', 'Ararauna', 'Chloropt??re', 3, 'Ce perroquet d''environ 150 cm, queue comprise, poss??de un plumage bleu clair uni et vit principalement en Bolivie et au Br??sil.', 'https://fr.wikipedia.org/wiki/Ara_(oiseau)', 1, 3, '2020-09-16 19:10:35.551407', NULL, 24),
     (25, 'fr', 'Animaux en vrac', 'De mani??re g??n??rale, combien d''heures par jour un panda g??ant est-il occup?? ?? manger ?', 'Seize', 'Douze', 'Huit', 'Quatre', 3, 'Le panda g??ant mange uniquement des jeunes pousses de bambou mais celles-ci ne sont toutefois pas tr??s nourrissantes.', 'https://fr.wikipedia.org/wiki/Panda_g??ant', 1, 3, '2020-09-16 19:10:35.551407', NULL, 25),
     (26, 'fr', 'Animaux en vrac', 'Combien de temps un b??b?? morse est-il allait?? par sa m??re ?', '1 mois', '6 mois', '1 an', '18 mois', 3, 'Apr??s une p??riode de 12 mois de gestation, le b??b?? morse p??se plus de 50 kg et sait d??j?? nager au bout de deux semaines seulement.', 'https://fr.wikipedia.org/wiki/Morse_(animal)', 1, 3, '2020-09-16 19:10:35.551407', NULL, 26),
     (27, 'fr', 'Animaux en vrac', 'Pour quelle raison les martres tuent-elles parfois les poules ?', 'Sang', 'Pattes', 'Foie', 'Cuisses', 3, 'Les martres boivent uniquement le sang et laissent le reste, pr??f??rant manger des lapins, des oeufs, des l??zards ou des insectes.', 'https://fr.wikipedia.org/wiki/Martre_des_pins', 1, 3, '2020-09-16 19:10:35.551407', NULL, 27),
     (28, 'fr', 'Animaux en vrac', 'De quoi est constitu??e la sonnette du serpent ?? sonnette ?', 'Bois',  'Corne','Calcaire', 'Pierres', 3, 'Les six ?? dix anneaux de corne situ??s ?? l''extr??mit?? de la queue du serpent ?? sonnette proviennent des mues pr??c??dentes.', 'https://fr.wikipedia.org/wiki/Crotalus', 1, 3, '2020-09-16 19:10:35.551407', NULL, 28),
     (29, 'fr', 'Animaux en vrac', 'Durant quelle saison de l''ann??e peut-on entendre le hibou crier ?', 'Automne',  '??t??', 'Printemps','Hiver', 3, 'Le hibou m??le crie en avril et en mai pour attirer l''attention d''une femelle qui restera alors toute sa vie fid??lement ?? ses c??t??s.', 'https://fr.wikipedia.org/wiki/Hibou', 1, 3, '2020-09-16 19:10:35.551407', NULL, 29),
     (30, 'fr', 'Animaux en vrac', 'De combien de piquants est compos??e la fourrure du h??risson m??le ?', '12 000', '16 000', '8 000', '4 000', 3, 'En cas de danger, le h??risson peut ainsi dresser ses nombreux piquants et s''enrouler sur lui-m??me pour se prot??ger des ennemis.', 'https://fr.wikipedia.org/wiki/H??risson', 1, 3, '2020-09-16 19:10:35.551407', NULL, 30),
     (31, 'fr', 'Fourmis', 'De quelle esp??ce animale font partie les fourmis, de l''ordre des hym??nopt??res ?', 'Insectes', 'Mammif??res', 'Poissons', 'Invert??br??s', 1, 'Certaines esp??ces de fourmis forment des supercolonies ?? plusieurs centaines de millions d''individus et ?? plus de 50 colonies.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 31),
     (32, 'fr', 'Fourmis', 'Quel habitat des fourmis est g??n??ralement con??u par construction de d??mes ?', 'Fourmili??re', 'Nid', 'Cage', 'Niche', 1, 'La fourmili??re a pour but de prot??ger la ou les reines et de garantir ?? la colonie une s??curit?? et un abri face aux intemp??ries.', 'https://fr.wikipedia.org/wiki/Fourmili??re', 1, 1, '2020-09-16 19:15:47.796537', NULL, 32),
     (33, 'fr', 'Fourmis', 'Dans quel film d''animation des studios Pixar Tilt est-il un ouvrier fourmi ?', ' Toy Story ', ' Monstres et Cie ', ' Ratatouille ',' 1001 pattes ',  1, 'Woody le cow-boy h??ros du film d''animation  Toy Story  est apparu dans le b??tisier du g??n??rique de fin.', 'https://fr.wikipedia.org/wiki/1001_pattes', 1, 1, '2020-09-16 19:15:47.796537', NULL, 33),
     (34, 'fr', 'Fourmis', 'Quels insectes sont parfois appel??s ??fourmis blanches?? au sein de colonies hi??rarchis??es ?', 'Les blattes', 'Les cafards', 'Les termites', 'Les cancrelats', 1, 'Les termites se rencontrent surtout dans les pays chauds, o?? certaines esp??ces construisent de grands nids en terre m??ch??e.', 'https://fr.wikipedia.org/wiki/Termite', 1, 1, '2020-09-16 19:15:47.796537', NULL, 34),
     (35, 'fr', 'Fourmis', 'Avec l''Antarctique, quelle r??gion du monde n''est pas colonis??e par les fourmis ?', 'L''Afrique du Sud', 'La Russie',  'Le Groenland','Le Japon', 1, 'En 2013, plus de 12 000 esp??ces ont ??t?? r??pertori??es, mais il en reste probablement des milliers encore ?? d??couvrir.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 35),
     (36, 'fr', 'Fourmis', 'Au sein d''une colonie de fourmis, qui pond les oeufs dans la fourmili??re ?', 'La reine', 'L''ouvri??re', 'La guerri??re', 'La tisserande', 1, 'Certaines esp??ces de fourmis peuvent tol??rer plusieurs reines lorsque la colonie est cons??quente.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 36),
     (37, 'fr', 'Fourmis', 'Avec quoi les fourmis sentent-elles le rep??rage de pistes olfactives ?','Leurs pattes', 'Leur abdomen', 'Leur queue', 'Leurs antennes',  1, 'Les fourmis peuvent aussi d??tecter ?? quel groupe de travail (par exemple la recherche de nourriture) l''une ou l''autre appartient.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 37),
     (38, 'fr', 'Fourmis', 'Avec quel autre insecte la fourmi partage-t-elle une c??l??bre fable de Jean de La Fontaine ?','La mouche',  'La cigale',  'La coccinelle', 'La libellule', 1, ' La Cigale et la Fourmi  est la premi??re fable du livre I de Jean de La Fontaine situ??e dans le premier recueil des  Fables de La Fontaine .', 'https://fr.wikipedia.org/wiki/La_Cigale_et_la_Fourmi_(La_Fontaine)', 1, 1, '2020-09-16 19:15:47.796537', NULL, 38),
     (39, 'fr', 'Fourmis', 'Laquelle de ces m??thodes semble radicale pour tenir ??loign?? les fourmis de son habitation ?', 'Le vinaigre', 'Le sucre', 'Le miel', 'Le riz', 1, 'Certaines odeurs fortes ont une action r??pulsive sur les fourmis, comme c''est notamment le cas du jus de citron et du vinaigre.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 39),
     (40, 'fr', 'Fourmis', 'Quel film du studio Dreamworks sorti en 1998 relate la vie des fourmis ?',' Chicken Run ', ' Shrek ', ' Madagascar ',  ' Fourmiz ',  1, 'Seulement un mois apr??s la sortie du film fut propos?? le film d''animation  1001 pattes  du  concurrent historique  Pixar.', 'https://fr.wikipedia.org/wiki/Fourmiz', 1, 1, '2020-09-16 19:15:47.796537', NULL, 40),
     (41, 'fr', 'Fourmis', 'Quel ??crivain fran??ais n?? ?? Toulouse a publi?? une c??l??bre trilogie sur les fourmis ?', 'Bernard Werber', 'Gaston Boca', 'Robert Merle', 'Alain Grousset', 2, 'Son oeuvre, traduite dans une trentaine de langues, fait se rencontrer spiritualit??, science-fiction, polar, biologie et mythologie.', 'https://fr.wikipedia.org/wiki/Bernard_Werber', 1, 2, '2020-09-17 11:13:40.552188', NULL, 41),
     (42, 'fr', 'Fourmis', 'Quel terme est utilis?? pour d??signer une colonie de fourmis form??es de plusieurs reines ?','M??tapopulation', '??cotype', 'Supercolonie',  '??pifaune', 2, 'Les ouvri??res s''y d??placent librement de nids en nids, comme si la population enti??re ??tait une unique colonie.', 'https://fr.wikipedia.org/wiki/Supercolonie', 1, 2, '2020-09-17 11:13:40.552188', NULL, 42),
     (43, 'fr', 'Fourmis', 'Chez les fourmis, comment appelle-t-on les femelles apt??res et st??riles ?', 'Ouvri??res', 'Guerri??res', 'Reines', 'Nettoyeuses', 2, 'Les diff??rences morphologiques majeures entre les castes d''ouvri??res sont induites par le r??gime alimentaire au stade larvaire.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 43),
     (184, 'fr', 'H??ros de Star Wars', 'Quel est le nom du vaisseau spatial du contrebandier Han Solo ?', 'Faucon Millenium', 'Aigle Solitaire', 'B-Wing', 'Speeder', 1, 'Le vaisseau fut appel??  Millenium Condor  dans la version fran??aise du premier ??pisode produit.', 'https://fr.wikipedia.org/wiki/Faucon_Millenium', 6, 1, '2020-09-18 21:10:50.252078', NULL, 184),
     (186, 'fr', 'H??ros de Star Wars', 'Quel m??tier est exerc?? par Jango Fett, humain originaire de Concord Dawn ?', 'Chasseur de primes', 'S??nateur', 'Vendeur de dro??des', 'Musicien', 1, 'Inventif, sachant se sortir de toutes les situations, Jango Fett est appr??ci?? pour son professionnalisme par ses commanditaires.', 'https://fr.wikipedia.org/wiki/Jango_Fett', 6, 1, '2020-09-18 21:10:50.252078', NULL, 186),
     (187, 'fr', 'H??ros de Star Wars', 'Dans l''univers de  Star Wars , quelle esp??ce vit sur la lune foresti??re de la plan??te Endor ?','Wookiee', 'Sarlacc',  'Ewok',  'Tusken', 1, 'Physiquement, ces??mammif??res??humano??des??omnivores??mesurent environ un m??tre de haut.', 'https://fr.wikipedia.org/wiki/Ewok', 6, 1, '2020-09-18 21:10:50.252078', NULL, 187),
     (188, 'fr', 'H??ros de Star Wars', 'Quel est le lien de parent?? entre Luke Skywalker et la Princesse Leia ?','Cousin et cousine', 'Oncle et tante', 'Mari et femme',  'Fr??re et soeur',  1, 'Luke et Leila sont les deux enfants??d''Anakin Skywalker??et de??Padm?? Amidala.', 'https://fr.wikipedia.org/wiki/Luke_Skywalker', 6, 1, '2020-09-18 21:10:50.252078', NULL, 188),
     (189, 'fr', 'H??ros de Star Wars', 'Quel c??l??bre personnage de  Star Wars  a ??t?? ??lev?? par son oncle et sa tante ?', 'Luke Skywalker', 'Han Solo', 'Chewbacca', 'Plo Koon', 1, 'Luke Skywalker a vu le jour sur l''ast??ro??de de Polis Massa, peu de temps apr??s la cr??ation de l''Empire galactique.', 'https://fr.wikipedia.org/wiki/Luke_Skywalker', 6, 1, '2020-09-18 21:10:50.252078', NULL, 189),
     (190, 'fr', 'H??ros de Star Wars', 'Quel acteur est c??l??bre pour avoir tenu le r??le de Luke Skywalker dans la saga  Star Wars  ?', 'Harrison Ford', 'Alec Guinness', 'Mark Hamill',  'Liam Neeson', 1, 'Mark Hamill a trouv?? une nouvelle carri??re dans le doublage de dessins anim??s et de jeux vid??o.', 'https://fr.wikipedia.org/wiki/Mark_Hamill', 6, 1, '2020-09-18 21:10:50.252078', NULL, 190),
     (191, 'fr', 'H??ros de Star Wars', 'Quel personnage de  Star Wars  a ??t?? con??u comme un alien ressemblant ?? une limace ?', 'Jabba le Hutt', 'Dark Maul', 'Mace Windu', 'Lando Calrissian', 2, 'Le critique??Roger Ebert??consid??re que son apparence physique le rapproche d''un croisement entre un??crapaud??et le??chat du Cheshire.', 'https://fr.wikipedia.org/wiki/Jabba_le_Hutt', 6, 2, '2020-09-18 21:10:50.252078', NULL, 191),
     (192, 'fr', 'H??ros de Star Wars', 'Qui a enregistr?? un message dans les circuits int??gr??s de R2-D2 dans  Un Nouvel Espoir  ?', 'La Princesse Leia', 'Anakin', 'Chewbacca', 'Obi-Wan', 2, 'R2-D2 arrive tant bien que mal ?? se faire comprendre par les autres au gr?? de ses sifflements.', 'https://fr.wikipedia.org/wiki/R2-D2', 6, 2, '2020-09-18 21:10:50.252078', NULL, 192),
     (193, 'fr', 'H??ros de Star Wars', 'Quelle est la couleur du sabre laser de Mace Windu, cr??ateur de la technique du Vaapad ?','Rouge', 'Violette', 'Verte', 'Bleue', 2, 'En plus de sa r??putation de sage, Windu est consid??r?? comme l''un des meilleurs combattants au??sabre laser??de l''Ordre Jedi.', 'https://fr.wikipedia.org/wiki/Mace_Windu', 6, 2, '2020-09-18 21:10:50.252078', NULL, 193),
     (194, 'fr', 'H??ros de Star Wars', 'Qui ??tait le ma??tre du Comte Dooku, membre des syst??mes ind??pendants ?', 'Dark Sidious', 'Dark Bane', 'Dark Vador', 'Dark Maul', 2, 'Dooku fut l''h??ritier d''une famille d''aristocrates et diplomates de Serenno ?? la fortune colossale.', 'https://fr.wikipedia.org/wiki/Comte_Dooku', 6, 2, '2020-09-18 21:10:50.252078', NULL, 194),
     (195, 'fr', 'H??ros de Star Wars', 'Sous quel autre nom conna??t-on le Chancelier Palpatine, originaire de Naboo ?', 'Dark Sidious', 'Dark Bane', 'Dark Malak', 'Dark Vador', 2, 'Palpatine s''est fix?? comme mission de r??tablir l''Ordre Sith??et de d??truire les Jedi gr??ce ?? un vaste complot.', 'https://fr.wikipedia.org/wiki/Palpatine', 6, 2, '2020-09-18 21:10:50.252078', NULL, 195),
     (196, 'fr', 'H??ros de Star Wars', 'Quel seigneur Sith, tr??s habile ?? manier le sabre double, a tu?? Qui-Gon Jinn ?','Le Compte Dooku', 'Bail Organa', 'Kit Fisto',  'Dark Maul',  2, 'Le personnage de Qui-Gon Jinn, interpr??t?? par??Liam Neeson, est doubl?? en France par??Samuel Labarthe.', 'https://fr.wikipedia.org/wiki/Qui-Gon_Jinn', 6, 2, '2020-09-18 21:10:50.252078', NULL, 196),
     (45, 'fr', 'Fourmis', 'Quelles fourmis, pourtant parfois de petite taille, font leurs nids en creusant le bois ?', 'Pot-de-miel', 'Charpenti??res',  'Moissonneuses', 'Tisserandes', 2, 'Les ouvri??res varient en taille et certaines d''entre elles comptent parmi les plus grandes esp??ces d''Europe.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 45),
     (46, 'fr', 'Fourmis', 'Comment sont parfois appel??es les ouvri??res g??antes au sein d''une colonie de fourmis ?', 'Soldats', 'Ouvri??res', 'Gu??pes', 'Pondeuses', 2, 'Les plus grandes ouvri??res sont parfois appel??es  soldats , bien que leur r??le d??fensif ne soit pas n??cessairement pr??pond??rant.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 46),
     (51, 'fr', 'Fourmis', 'Environ combien d''esp??ces de fourmis ont ??t?? r??pertori??es en 2013 ?', '12 600', '10 500', '8 400', '6 700', 3, 'Bien que les fourmis repr??sentent moins d''un pour cent des esp??ces d''insectes, leur masse totale exc??de le poids de l''humanit??.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 51),
     (52, 'fr', 'Fourmis', 'Comment sont appel??es les esp??ces de fourmis poss??dant une seule reine ?', 'Monogynes', 'Phytozoaires', 'Zoophytes', 'Euryapsides', 3, 'Ce terme est ??galement applicable chez les abeilles, les gu??pes, les termites et rats-taupes nus.', 'https://fr.wikipedia.org/wiki/Monogyne', 1, 3, '2020-09-17 11:16:25.655314', NULL, 52),
     (53, 'fr', 'Fourmis', 'Environ combien d''esp??ces de fourmis sont connues en Europe ?','4 000', '400',  '40 000', '400 000', 3, 'En for??t tropicale en Malaisie, on peut compter jusqu\?? 40 esp??ces diff??rentes sur un seul m??tre carr??.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 53),
     (54, 'fr', 'Fourmis', 'La piq??re r??p??t??e de quelle fourmi peut ??tre mortelle pour l''homme ?', 'Bulldog', 'Veuve noire', 'Tigre', 'Ta??pan', 3, 'M??me si les attaques sur l''??tre humain sont plut??t rares, les piq??res peuvent ??tre mortelles en raison d''un possible choc anaphylactique.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 54),
     (55, 'fr', 'Fourmis', 'Jusqu''?? quelle profondeur a-t-on retrouv?? des fourmis en Asie du Sud-Est ?','18 km', '14 km', '10 km',  '22 km', 3, 'Les fourmis se sont adapt??es ?? presque tous les milieux terrestres et souterrains mais pas aux milieux aquatiques et aux zones polaires.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 55),
     (197, 'fr', 'H??ros de Star Wars', 'S??natrice de Naboo au S??nat galactique, combien Padm?? Amidala eut-elle d''enfants ?','Trois',  'Deux',  'Quatre', 'Cinq', 2, 'Amoureuse d''Anakin Skywalker, Padm?? donne naissance aux jumeaux??Luke Skywalker et Leia Organa avant de mourir.', 'https://fr.wikipedia.org/wiki/Padm??_Amidala', 6, 2, '2020-09-18 21:10:50.252078', NULL, 197),
     (198, 'fr', 'H??ros de Star Wars', '?? qui Dark Vador a-t-il tranch?? la main droite dans l''??pisode V de  Star Wars  ?', 'Luke', 'Obi-Wan', 'Han Solo', 'Mace Windu', 2, 'Dark Vador proposera ?? Luke de devenir son alli?? afin de renverser l''Empereur pour r??gner  comme p??re et fils .', 'https://fr.wikipedia.org/wiki/Anakin_Skywalker', 6, 2, '2020-09-18 21:10:50.252078', NULL, 198),
     (199, 'fr', 'H??ros de Star Wars', 'Quel est le pr??nom du fils clon?? de Jango Fett, c??l??bre chasseur de primes ?','Owen', 'Shmi', 'Dooku',  'Boba',  2, 'Boba est le seul clone non modifi?? et est ??lev?? par Jango pour apprendre les techniques Mandaloriennes.', 'https://fr.wikipedia.org/wiki/Boba_Fett', 6, 2, '2020-09-18 21:10:50.252078', NULL, 199),
     (200, 'fr', 'H??ros de Star Wars', 'Quel Gungan vivant dans la cit?? sous-marine d''Otoh Gunga a ??t?? exil?? par Boss Nass ?', 'Jar Jar Binks', 'Watto', 'Lando Calrissian', 'Chewbacca', 2, 'Le personnage et le nom de Jar Jar Binks est une id??e de Jett, le jeune fils de??George Lucas.', 'https://fr.wikipedia.org/wiki/Jar_Jar_Binks', 6, 2, '2020-09-18 21:10:50.252078', NULL, 200),
     (201, 'fr', 'H??ros de Star Wars', 'Apr??s avoir impos?? le respect aupr??s des ma??tres Jedi, ?? quel ??ge Yoda est-il mort ?', '900 ans', '2 200 ans', '1 200 ans', '750 ans', 3, 'Les yeux de Yoda ont ??t?? repris sur ceux d''Albert Einstein pour, d''apr??s George Lucas, lui donner un air intelligent et sage.', 'https://fr.wikipedia.org/wiki/Yoda', 6, 3, '2020-09-18 21:10:50.252078', NULL, 201),
     (202, 'fr', 'H??ros de Star Wars', 'Dans le premier ??pisode, qui est le concurrent d''Anakin lors de la course de modules ?', 'Ben Quadinaros', 'Sebulba',  'Lama Su', 'Bultar Swan', 3, 'Avaricieux et tr??s mauvais perdant, Sebulba est l''un des plus fameux pilote de module de course de la galaxie.', 'https://fr.wikipedia.org/wiki/Liste_des_personnages_de_Star_Wars', 6, 3, '2020-09-18 21:10:50.252078', NULL, 202),
     (203, 'fr', 'H??ros de Star Wars', 'Quel est le pr??nom de la m??re d''Anakin Skywalker, qui deviendra Dark Vador ?', 'Boba', 'Shmi', 'Cord??', 'Padm??', 3, 'George Lucas??a choisi son pr??nom ?? partir de??Lakshmi, une d??esse??hindoue.', 'https://fr.wikipedia.org/wiki/Anakin Skywalker', 6, 3, '2020-09-18 21:10:50.252078', NULL, 203),
     (204, 'fr', 'H??ros de Star Wars', 'Quel ordre Palpatine a-t-il donn?? aux g??n??raux de l''arm??e de clones dans l''??pisode III ?','Ordre 88', 'Ordre 44', 'Ordre 22', 'Ordre 66',  3, 'La??Grande Purge Jedi??est un ??v??nement majeur de l''histoire de l''univers fictif de?? Star Wars ,??imagin?? par George Lucas.', 'https://fr.wikipedia.org/wiki/Grande_purge_Jedi', 6, 3, '2020-09-18 21:10:50.252078', NULL, 204),
     (205, 'fr', 'H??ros de Star Wars', 'Quel est l''esp??ce du Vice roi de la F??d??ration du commerce Nute Gunray ?', 'Ortolan', 'Quarren', 'Nohgri','Neimoidien',  3, 'Les Neimoidiens sont des humano??des ?? la peau vert olive et grise, dont le visage poss??de un large nez aplati.', 'https://fr.wikipedia.org/wiki/Liste_des_esp??ces_de_Star_Wars', 6, 3, '2020-09-18 21:10:50.252078', NULL, 205),
     (206, 'fr', 'H??ros de Star Wars', 'Apparu dans les ??pisodes II et III, comment le comte Dooku est-il ??galement appel?? ?', 'Dark Sidious', 'Dark Malak', 'Dark Tyranus', 'Dark Vador', 3, 'Le comte Dooku est interpr??t?? par??Christopher Lee??et doubl?? en version fran??aise par??Bernard Dh??ran.', 'https://fr.wikipedia.org/wiki/Comte_Dooku', 6, 3, '2020-09-18 21:10:50.252078', NULL, 206),
     (207, 'fr', 'H??ros de Star Wars', 'Quel ferrailleur originaire de Toydaria fut l''ancien propri??taire d''Anakin et de sa m??re ?','Plo Koon', 'Jango', 'Boss Nass',  'Watto',  3, 'Watto est int??gralement g??n??r?? par ordinateur par les ??quipes de mod??lisation d''Industrial Light et Magic.', 'https://fr.wikipedia.org/wiki/Watto', 6, 3, '2020-09-18 21:10:50.252078', NULL, 207),
     (208, 'fr', 'H??ros de Star Wars', 'Quel autre nom est utilis?? pour d??signer Leia Amidala Skywalker, soeur de Luke ?', 'Leia Organa', 'Leia Amidala', 'Leia Windu', 'Leia Solo', 3, 'Leia et Luke b??b??s furent jou??s par le m??me nourrisson qui ??tait le fils du monteur, Roger Barton.', 'https://fr.wikipedia.org/wiki/Leia_Organa', 6, 3, '2020-09-18 21:10:50.252078', NULL, 208),
     (209, 'fr', 'H??ros de Star Wars', 'Quel personnage peut survivre dans le vide spatial sans appareil respiratoire ?', 'Plo Koon', 'Dark Bane', 'Han Solo', 'Watto', 3, 'Dernier??Padawan??instruit par Ma??tre??Tyvokka, Plo Koon est devenu Chevalier Jedi.', 'https://fr.wikipedia.org/wiki/Plo_Koon', 6, 3, '2020-09-18 21:10:50.252078', NULL, 209),
     (210, 'fr', 'H??ros de Star Wars', 'Qui est consid??r??e comme la femme Jedi la plus puissante de sa g??n??ration ?', 'Shaak Ti', 'Plo Koon', 'Leia Organa', 'Sebulba', 3, 'Shaak Ti fait partie du groupe des survivants secourus par??Yoda??et l''arm??e des clones.', 'https://fr.wikipedia.org/wiki/Shaak_Ti', 6, 3, '2020-09-18 21:10:50.252078', NULL, 210),
     (211, 'fr', 'Princesses Disney', 'Quelle fleur repr??sentant l''amour est porteuse de mauvais sort dans  La Belle et la B??te  ?','Une tulipe', 'Un oeillet',  'Une rose', 'Une jonquille', 1, 'Bien que non mentionn?? dans le film, le jeune Prince, dont la devise est  Vainc qui se vainc , se pr??nomme Adam.', 'https://fr.wikipedia.org/wiki/La_Belle_et_la_B??te_(film,_1991)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 211),
     (212, 'fr', 'Princesses Disney', 'Pass?? minuit, en quoi le somptueux carrosse de Cendrillon se transforme-t-il ?', 'En g??teau', 'En citrouille',  'En pomme', 'En souris', 1, 'Cendrillon est une jeune femme soumise ?? l''autorit?? de sa mar??tre, Lady Tr??maine, et ?? celle de ses deux demi-soeurs.', 'https://fr.wikipedia.org/wiki/Cendrillon_(Disney)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 212),
     (213, 'fr', 'Princesses Disney', 'Quelle princesse de Disney peut-on entendre chanter  Siffler en travaillant  ? ', 'Blanche-Neige', 'Merida', 'Tiana', 'Pocahontas', 1, 'La version cr????e par les studios Disney diff??re l??g??rement des autres adaptations du conte.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_(Disney)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 213),
     (214, 'fr', 'Princesses Disney', 'Combien de nains ont accueilli Blanche-Neige dans leur chaumi??re au fond des bois ?', 'Sept', 'Six', 'Cinq', 'Quatre', 1, ' Blanche-Neige et les Sept Nains  est le premier long-m??trage d''animation Disney.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_et_les_Sept_Nains', 7, 1, '2020-09-18 21:59:37.49672', NULL, 214),
     (215, 'fr', 'Princesses Disney', 'Qui chante  Un jour, mon prince viendra  dans un dessin anim?? Disney ?', 'Blanche-Neige', 'Cendrillon', 'Alice', 'Jasmine', 1, 'Le film  Blanche-Neige  est une adaptation du conte ??ponyme des fr??res Grimm paru en 1812.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_et_les_Sept_Nains', 7, 1, '2020-09-18 21:59:37.49672', NULL, 215),
     (223, 'fr', 'Princesses Disney', 'Quelle princesse Disney est une sir??ne vivant aupr??s de son p??re, le roi Triton ?', 'Ariel', 'Jasmine', 'Tiana', 'Merida', 2, 'L''animateur Glen Keane aurait d??clar?? dans une conf??rence que l''apparence du personnage ??tait fond??e sur sa propre femme.', 'https://fr.wikipedia.org/wiki/Ariel_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 223),
     (224, 'fr', 'Princesses Disney', 'Dans le monde de Disney, quelle princesse chante  Ce r??ve bleu  ?','Ariel', 'Merida', 'Tiana',  'Jasmine',  2, 'Jasmine est un personnage de fiction qui est apparu pour la premi??re fois en 1992 dans le long m??trage d''animation  Aladdin .', 'https://fr.wikipedia.org/wiki/Jasmine_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 224),
     (225, 'fr', 'Princesses Disney', 'Quelle princesse de Disney est c??l??bre pour sa longue chevelure blonde ?','Merida', 'Tiana', 'Raiponce',  'Ariel', 2, 'Si on coupe une m??che de cheveux de Raiponce, ceux-ci deviennent bruns et perdent leurs effets magiques.', 'https://fr.wikipedia.org/wiki/Raiponce_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 225),
     (226, 'fr', 'Princesses Disney', 'Quel film de Disney a r??uni sur les ??crans un pauvre voleur et une belle princesse ?', ' Aladdin ', ' Pocahontas ', ' Rebelle ', ' Raiponce ', 2, 'L''apparence de Jasmine fut inspir??e de Jennifer Connelly mais ??galement de la soeur de l''animateur du personnage.', 'https://fr.wikipedia.org/wiki/Jasmine_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 226),
     (227, 'fr', 'Princesses Disney', 'Qui a fabriqu?? la premi??re robe de bal qu''a port??e Cendrillon ?', 'Des souris', 'Des chouettes', 'Des enfants', 'Des sorci??res', 2, 'Cendrillon est appel??e ainsi car elle se repose dans la cendre une fois le travail termin??.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 2, '2020-09-18 21:59:37.49672', NULL, 227),
     (228, 'fr', 'Princesses Disney', 'Qui est Meeko dans  Pocahontas, une l??gende indienne  ?', 'Un raton-laveur', 'Un ours', 'Un oiseau', 'Un sanglier', 2, 'Disney a donn?? ?? Pocahontas les traits et la plastique du mannequin plan??taire Naomi Campbell.', 'https://fr.wikipedia.org/wiki/Pocahontas_(film,_1995)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 228),
     (230, 'fr', 'Princesses Disney', 'Quelle premi??re princesse afro-am??ricaine a ??t?? mise en sc??ne par Disney ?', 'Aurore', 'Tiana', 'Ariel', 'Jasmine', 2, 'Disney revient ici sur sa d??cision de ne pourtant plus r??aliser des films en deux dimensions.', 'https://fr.wikipedia.org/wiki/La_Princesse_et_la_Grenouille', 7, 2, '2020-09-18 21:59:37.49672', NULL, 230),
     (231, 'fr', 'Princesses Disney', 'Quelle princesse Disney est savamment entra??n??e aux arts martiaux ?', 'Merida', 'Ariel', 'Tiana', 'Mulan', 3, 'Le courage, la d??termination et l''ing??niosit?? de Mulan l''aideront dans ses aventures ?? gagner le respect des autres.', 'https://fr.wikipedia.org/wiki/Fa_Mulan', 7, 3, '2020-09-18 21:59:37.49672', NULL, 231),
     (232, 'fr', 'Princesses Disney', 'Que recherchent les sept nains de Blanche-Neige dans leur mine ?', 'Du schiste', 'Des diamants',  'Du p??trole', 'Du charbon', 3, 'Dans le parc d''attractions Efteling, les nains vivent dans le Bois des contes, jouxtant le ch??teau de sa belle-m??re.', 'https://fr.wikipedia.org/wiki/Blanche-Neige', 7, 3, '2020-09-18 21:59:37.49672', NULL, 232),
     (233, 'fr', 'Princesses Disney', 'En 2037, quel ??ge aura le c??l??bre dessin anim??  Blanche-Neige  des studios Disney ?', '75 ans', '50 ans', '125 ans','100 ans',  3, 'Le budget de production, 1.48 million de dollars, marque un record historique pour l''??poque.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_et_les_Sept_Nains', 7, 3, '2020-09-18 21:59:37.49672', NULL, 233),
     (234, 'fr', 'Princesses Disney', 'Quel est le pr??nom du chat de la belle-m??re de Cendrillon ?','Belz??buth',  'Lucifer', 'Diabolo', 'Satan', 3, 'Lucifer est le chat de Lady Tr??maine : fourbe et paresseux, il repr??sente une menace pour Jack.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 3, '2020-09-18 21:59:37.49672', NULL, 234),
     (96, 'fr', 'Boissons sans alcool', 'Avec quoi les cafeti??res de la marque Senseo fonctionnent-elles ?', 'Du caf?? soluble',  'Des dosettes', 'Des capsules', 'Du caf?? filtre', 1, 'La??marque??de??cafeti??re est port??e en Europe par les entreprises n??erlandaises Philips et Jacobs Douwe Egberts.', 'https://fr.wikipedia.org/wiki/Senseo', 3, 1, '2020-09-18 14:48:09.520789', NULL, 96),
     (97, 'fr', 'Boissons sans alcool', 'Dans quel domaine la soci??t?? Tropicana est-elle un des leaders mondiaux du march?? ?', 'Jus de fruits', 'Th??', 'Limonade', 'Bi??res sans alcool', 1, 'L''entreprise a ??t?? fond??e en??1947??par??Anthony T. Rossi, un immigrant italien, avec ?? l''origine 50 employ??s.', 'https://fr.wikipedia.org/wiki/Tropicana', 3, 1, '2020-09-18 14:48:09.520789', NULL, 97),
     (98, 'fr', 'Boissons sans alcool', 'En 2014, quelle star fran??aise est apparue avec George Clooney dans une publicit?? Nespresso ?', 'Jean Dujardin', 'Omar Sy', 'Alain Delon', 'Jean-Paul Belmondo', 1, 'Via ces stars, la marque cherche ?? ne pas correspondre au mod??le de vente d'' un produit dans une boite .', 'https://fr.wikipedia.org/wiki/Nespresso', 3, 1, '2020-09-18 14:48:09.520789', NULL, 98),
     (99, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne d??signe pas une marque d''eau min??rale ?', 'Tropicana', 'Badoit', 'Qu??zac', 'Saint-Yorre', 1, 'Apr??s pressage, les fruits, transform??s en jus, sont embouteill??s selon la certification??ISO 14001.', 'https://fr.wikipedia.org/wiki/Tropicana', 3, 1, '2020-09-18 14:48:09.520789', NULL, 99),
     (100, 'fr', 'Boissons sans alcool', 'Parmi ces diff??rentes marques de sirops se cache un intrus, mais lequel ?', 'Champomy', 'Teisseire', 'Marie Dolin', 'Williams', 1, 'Champomy est cr????e en 1989 par??Pampryl??et est pr??sent??e comme ??la premi??re boisson festive pour enfants??.', 'https://fr.wikipedia.org/wiki/Champomy', 3, 1, '2020-09-18 14:48:09.520789', NULL, 100),
     (101, 'fr', 'Boissons sans alcool', 'En 2009, quelle eau min??rale a produit une publicit?? o?? des b??b??s faisaient du roller ?', 'Badoit', 'Volvic', 'Rozana', 'Evian', 2, 'Sa source se situe dans les??Alpes????????vian-les-Bains??dans le d??partement de la??Haute-Savoie.', 'https://fr.wikipedia.org/wiki/??vian_(eau_min??rale)', 3, 2, '2020-09-18 15:07:46.091152', NULL, 101),
     (102, 'fr', 'Boissons sans alcool', 'Quelle marque de boissons ??nergisantes a pour logo trois griffes vertes ?', 'Monster Energy', 'Rockstar', 'Red Bull', 'Dark Dog', 2, 'La gamme comporte des boissons gazeuses ??nerg??tiques aux divers ar??mes fruit??s et des boissons non gazeuses ?? base de th??.', 'https://fr.wikipedia.org/wiki/Monster_Energy', 3, 2, '2020-09-18 15:07:46.091152', NULL, 102),
     (103, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne d??signe pas un cocktail sans alcool ?', 'Lassi sucr??', 'Arnold Palmer', 'Fauxmosa',  'Bloody Mary', 2, 'Le??Bloody Mary??est un??cocktail??plus ou moins fortement??piment????et????pic????selon les go??ts, ?? base de??vodka.', 'https://fr.wikipedia.org/wiki/Bloody_Mary', 3, 2, '2020-09-18 15:07:46.091152', NULL, 103),
     (104, 'fr', 'Boissons sans alcool', 'Quelle soci??t?? a cr???? la marque de caf?? Ricor??, caf?? soluble avec de la chicor??e ?',  'Carrefour', 'Nestl??', 'Danone', 'Starbucks', 2, 'La marque est principalement pr??sente en??France??et dans une moindre mesure en??Belgique??et en??Pologne.', 'https://fr.wikipedia.org/wiki/Ricor??', 3, 2, '2020-09-18 15:07:46.091152', NULL, 104),
     (105, 'fr', 'Boissons sans alcool', 'Les couleurs du logo de la marque de caf?? Carte Noire sont le noir, l''or et...', 'Le blanc', 'Le rouge', 'Le bleu', 'Le vert', 2, 'Le caf?? est torr??fi?? en??France au sein d''une usine qui produit ??galement les caf??s??Jacques Vabre??et??Caf?? Grand M??re.', 'https://fr.wikipedia.org/wiki/Carte_Noire', 3, 2, '2020-09-18 15:07:46.091152', NULL, 105),
     (235, 'fr', 'Princesses Disney', 'Dans  Mulan , quel est le nom du dragon, le gardien de la famille ?', 'Mushu', 'Yao', 'Shang', 'G??n??ral Li', 3, 'C''est Eddie Murphy qui campe la voix originale de Mushu, tandis que la voix fran??aise est assur??e par Jos?? Garcia.', 'https://fr.wikipedia.org/wiki/Mulan', 7, 3, '2020-09-18 21:59:37.49672', NULL, 235),
     (236, 'fr', 'Princesses Disney', 'Pour Disney, qui est Rajah, animal de compagnie??de la princesse Jasmine ?', 'Un tigre', 'Un raton-laveur', 'Un sanglier', 'Un oiseau', 3, 'Jasmine et Aladdin sont apparus en 2002 dans une bande-annonce du film  Lilo et Stitch .', 'https://fr.wikipedia.org/wiki/Jasmine_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 236),
     (237, 'fr', 'Princesses Disney', 'Dans  Cendrillon , quels animaux sont transform??s en chevaux de trait ?', 'Oies', 'Moutons',  'Souris', 'Lapins', 3, 'La composition des pantoufles de Cendrillon fait l''objet d''un d??bat r??current en Europe.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 3, '2020-09-18 21:59:37.49672', NULL, 237),
     (238, 'fr', 'Princesses Disney', 'La plastique de quelle mannequin a servi ?? cr??er les principaux traits de Pocahontas ?', 'Naomi Campbell', 'Kelly Brook', 'Katie Price', 'Sienna Miller', 3, 'Le personnage de Pocahontas s''inspire librement du personnage historique Matoaka ( Petite plume de neige ).', 'https://fr.wikipedia.org/wiki/Pocahontas_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 238),
     (239, 'fr', 'Princesses Disney', 'Quelle princesse Disney communique librement avec la nature et les animaux ?', 'Mulan', 'Merida', 'Tiana', 'Pocahontas',  3, 'Les sc??naristes du film ont invent?? une Pocahontas ??cologiste, volontaire et physiquement attirante.', 'https://fr.wikipedia.org/wiki/Pocahontas_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 239),
     (240, 'fr', 'Princesses Disney', 'Laquelle de ces princesses est tr??s souvent repr??sent??e dans sa robe de bal jaune or ?', 'Mulan','Belle',  'Tiana', 'Merida', 3, 'Depuis 2011, Belle est l''un des personnages principaux de la s??rie t??l??vis??e  Once Upon a Time .', 'https://fr.wikipedia.org/wiki/Belle_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 240),
     (241, 'fr', 'T??l??-r??alit??', 'Quel est le pr??nom du c??l??bre fianc?? de Nabilla, personnalit?? m??diatique franco-suisse ?', 'Thomas', 'Matthieu', 'Vincent', 'Micha??l', 1, 'En novembre 2013, Nabilla Benattia est devenue vedette de sa propre ??mission de t??l??r??alit??,  All?? Nabilla .', 'https://fr.wikipedia.org/wiki/Nabilla_Benattia', 8, 1, '2020-09-18 22:29:31.15674', NULL, 241),
     (242, 'fr', 'T??l??-r??alit??', 'De quelle ??mission de t??l??-r??alit?? diffus??e en 2001 Loana est-elle sortie grande gagnante ?', ' Loft Story ', ' Secret Story ', ' Nice People ', ' Bachelor ', 1, 'La renomm??e de Loana lui a permis de s''essayer aux m??tiers de styliste, chanteuse et pr??sentatrice de t??l??vision fran??aise.', 'https://fr.wikipedia.org/wiki/Loana_Petrucciani', 8, 1, '2020-09-18 22:29:31.15674', NULL, 242),
     (243, 'fr', 'T??l??-r??alit??', 'Dans quelle ??mission Denis Brogniart met-il les candidats ?? rude ??preuve en milieu hostile ?', ' Dropped ', ' Koh-Lanta ', ' P??kin Express ', ' Amazing Race ', 1, 'L''??mission  Koh-Lanta  fut d''abord pr??sent??e par Hubert Auriol, puis ensuite par Denis Brogniart ?? partir de 2002.', 'https://fr.wikipedia.org/wiki/Koh-Lanta', 8, 1, '2020-09-18 22:29:31.15674', NULL, 243),
     (244, 'fr', 'T??l??-r??alit??', 'Qui a remport?? la toute premi??re ??dition de la  Star Academy , pr??sent??e par Nikos sur TF1 ?','Mario', 'Nolwenn', 'Emma', 'Jenifer',  1, 'Jenifer est ??galement connue pour avoir fait partie du jury fran??ais des quatre premi??res saisons de  The Voice .', 'https://fr.wikipedia.org/wiki/Jenifer', 8, 1, '2020-09-18 22:29:31.15674', NULL, 244),
     (245, 'fr', 'T??l??-r??alit??', 'Quel beau gosse de la t??l?? s''est fait passer pour  Greg le millionnaire  en 2003 ?', 'Gr??gory Basso', 'Gr??gory Lemarchal', 'Gr??gory Peck', 'Gr??gory Fitoussi', 1, 'Cette ??mission met en sc??ne un faux millionnaire courtis?? par vingt pr??tendantes ignorant tout de son pass?? et de sa vraie vie.', 'https://fr.wikipedia.org/wiki/Greg_le_millionnaire', 8, 1, '2020-09-18 22:29:31.15674', NULL, 245),
     (246, 'fr', 'T??l??-r??alit??', 'Quelle a ??t?? la premi??re ??mission de t??l??-r??alit?? diffus??e en France ?', ' Loft Story ', ' Nice People ', ' La Ferme C??l??brit??s ', ' Incroyable talent ', 1, 'La production de l''??mission a co??t?? entre 80 et 150 millions, le b??n??fice de l''op??ration a avoisin?? les 200 millions de francs fran??ais.', 'https://fr.wikipedia.org/wiki/Loft_Story_(France)', 8, 1, '2020-09-18 22:29:31.15674', NULL, 246),
     (247, 'fr', 'T??l??-r??alit??', 'Qui a pr??sent?? avec panache la d??sormais c??l??bre  Star Academy  sur TF1 de 2001 ?? 2008 ?', 'Nikos Aliagas', 'Arthur', 'Cauet', 'Jean-Pierre Foucault', 1, 'Le 29 novembre 2012, Nikos Aliagas et sa compagne Tina Grigoriou ont donn?? naissance ?? une petite Agathe.', 'https://fr.wikipedia.org/wiki/Nikos_Aliagas', 8, 1, '2020-09-18 22:29:31.15674', NULL, 247),
     (248, 'fr', 'T??l??-r??alit??', 'Laquelle de ces ??missions de t??l??-r??alit?? poss??de un oeil dans son logo ?', ' Secret Story ', ' Master Chef ', ' Dilemme ', ' Nice People ', 1, ' Secret Story  reprend plus ou moins les principes de base de  Big Brother , ??mission de t??l?? r??alit?? allemande cr????e en 1997.', 'https://fr.wikipedia.org/wiki/Secret_Story', 8, 1, '2020-09-18 22:29:31.15674', NULL, 248),
     (249, 'fr', 'T??l??-r??alit??', 'Laquelle de ces ??missions de t??l??-r??alit?? est exclusivement consacr??e ?? la cuisine ?', ' MasterChef ', ' X-Factor ', ' Koh-Lanta ', ' Dropped ', 1, ' MasterChef  est une ??mission de t??l??-r??alit?? produite ?? l''origine au Royaume-Uni et d??clin??e depuis dans de multiples pays.', 'https://fr.wikipedia.org/wiki/MasterChef', 8, 1, '2020-09-18 22:29:31.15674', NULL, 249),
     (250, 'fr', 'T??l??-r??alit??', 'Quelle ??mission de t??l??-r??alit?? a donn?? naissance ?? l''??mission  Les Marseillais  ?', ' Secret Story ', ' Les Ch''tis ', ' Nouvelle Star ', ' Dilemme ', 1, 'L''??mission de t??l??-r??alit??  Les Marseillais  a accumul?? depuis sa premi??re saison soixante millions de t??l??spectateurs en France.', 'https://fr.wikipedia.org/wiki/Les_Ch''tis', 8, 1, '2020-09-18 22:29:31.15674', NULL, 250),
     (251, 'fr', 'T??l??-r??alit??', 'Qui a pr??sent?? l''??mission  P??kin Express  durant onze saisons cons??cutives ?', 'St??phane Rotenberg', 'Philippe Etchebest', 'St??phane Plaza', 'Thomas Sotto', 2, 'Le jeu t??l??vis??  P??kin Express  s''apparente un peu ?? l''??mission de t??l??-r??alit?? am??ricaine  The Amazing Race .', 'https://fr.wikipedia.org/wiki/P??kin_Express', 8, 2, '2020-09-18 22:29:31.15674', NULL, 251),
     (252, 'fr', 'T??l??-r??alit??', 'Quel est le point commun entre les L5, M. Pokora et Sheryfa Luna ?', ' Popstars ', ' Star Academy ', ' Nouvelle Star ', ' X-Factor ', 2, 'Sheryfa Luna est la seule artiste de RnB fran??ais ?? avoir obtenu deux num??ro un cons??cutifs au top single fran??ais.', 'https://fr.wikipedia.org/wiki/Sheryfa_Luna', 8, 2, '2020-09-18 22:29:31.15674', NULL, 252),
     (253, 'fr', 'T??l??-r??alit??', 'Quelle est la nationalit?? de Serena, gagnante de l''unique saison de l''??mission  Nice People  ?', 'Suisse',  'Italienne','Belge', 'Espagnole', 2, 'Serena Reinaldi a fait ses d??buts au cin??ma dans  Les Bronz??s 3, amis pour la vie , r??alis?? par Patrice Leconte.', 'https://fr.wikipedia.org/wiki/Nice_People', 8, 2, '2020-09-18 22:29:31.15674', NULL, 253),
     (254, 'fr', 'T??l??-r??alit??', 'Quelle ??mission de t??l??-r??alit?? diffus??e sur W9 a ??t?? remport??e par Jean-Charles ?', ' Dilemme ', ' Option ', ' Alternative ', ' Probl??me ', 2, 'Endemol intenta en 2011 un proc??s ?? ALJ Prod au motif d''une copie ill??gale de son ??mission  Secret Story .', 'https://fr.wikipedia.org/wiki/Dilemme_(??mission_de_t??l??vision)', 8, 2, '2020-09-18 22:29:31.15674', NULL, 254),
     (255, 'fr', 'T??l??-r??alit??', 'Quel membre du jury de la  Nouvelle Star  est pr??sent depuis le tout d??but de l''??mission ?', 'Dove Attia',  'Andr?? Manoukian', 'Philippe Manoeuvre', 'Marianne James', 2, ' Nouvelle Star  est bas??e sur le format ?? succ??s  Pop Idol  et produite par FremantleMedia et 19TV Ltd.', 'https://fr.wikipedia.org/wiki/Nouvelle_Star', 8, 2, '2020-09-18 22:29:31.15674', NULL, 255),
     (260, 'fr', 'T??l??-r??alit??', 'Dans quelle ??mission de t??l??-r??alit?? a-t-on pu retrouver un gentleman c??libataire ?', ' Bachelor ', ' Les Colocataires ', ' Op??ration S??duction ', ' Dilemme ', 2, ' Bachelor, le gentleman c??libataire  est une adaptation du programme  The Bachelor  diffus?? sur la cha??ne am??ricaine ABC.', 'https://fr.wikipedia.org/wiki/Bachelor,_le_gentleman_c??libataire', 8, 2, '2020-09-18 22:29:31.15674', NULL, 260),
     (261, 'fr', 'T??l??-r??alit??', 'Depuis quelle saison des  Anges de la t??l??-r??alit??  Nabilla est-elle apparue ?', 'Saison 4', 'Saison 3', 'Saison 2', 'Saison 5', 3, 'Apr??s Los Angeles, Miami et New York, c''est ?? Hawa??, aux ??tats-Unis, que l''??mission  Les Anges de la t??l??-r??alit??  s''est d??roul??e.', 'https://fr.wikipedia.org/wiki/Nabilla_Benattia', 8, 3, '2020-09-18 22:29:31.15674', NULL, 261),
     (262, 'fr', 'T??l??-r??alit??', 'Combien y a-t-il eu d''??ditions de la  Star Academy  en France ?', 'Neuf', 'Huit', 'Sept', 'Six', 3, 'Lors des sept premi??res saisons, les ??l??ves de la  Star Academy  logeaient dans le Ch??teau des Vives Eaux situ?? ?? Dammarie-les-Lys.', 'https://fr.wikipedia.org/wiki/Star_Academy_(France)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 262),
     (263, 'fr', 'T??l??-r??alit??', 'Quelle t??l??-r??alit?? d''enfermement diffus??e sur M6 a ??t?? remport??e par S??bastien ?',  ' Dilemme ', ' Les Colocataires ', ' Loft Story ', ' Nice People ', 3, 'Les audiences globalement d??cevantes ont ??t?? attribu??es notamment ?? la trop forte ressemblance avec  Loft Story .', 'https://fr.wikipedia.org/wiki/Les_Colocataires_(t??l??-r??alit??)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 263),
     (264, 'fr', 'T??l??-r??alit??', 'Qui a remport?? en 2005 l''??mission de t??l??-r??alit??  Premi??re compagnie  ?', 'Vincent Moscato',  'Nathalie Simon', 'Pascal Gentil', 'Jean Roucas', 3, 'L''??mission ??tait diffus??e chaque soir en quotidienne depuis la Guyane ?? Sinnamary, et chaque vendredi soir depuis Paris.', 'https://fr.wikipedia.org/wiki/Premi??re_Compagnie', 8, 3, '2020-09-18 22:29:31.15674', NULL, 264),
     (265, 'fr', 'T??l??-r??alit??', 'Le secret d''Alexandra dans la saison 2 de  Secret Story  ??tait??: ??Je suis...??', 'Une princesse', 'Pr??tre anglicane', 'Croque-mort', 'Une m??dium', 3, 'De son vrai nom Marie-Alexandra Obolensky, dite Alexandra, est arriv??e jusqu''en finale mais n''a pas remport?? la comp??tition.', 'https://fr.wikipedia.org/wiki/Saison_2_de_Secret_Story', 8, 3, '2020-09-18 22:29:31.15674', NULL, 265),
     (266, 'fr', 'T??l??-r??alit??', 'Quel jeu de t??l??-r??alit?? ??tait pr??sent?? en 2004 par Fr??d??rique Courtadon ?', ' Les Colocataires ', ' Secret Story ', ' Bachelor ', ' P??kin Express ', 3, 'Il a fallu attendre l''??t?? 2007 pour rencontrer une ??mission du m??me type :  Secret Story .', 'https://fr.wikipedia.org/wiki/Les_Colocataires_(t??l??-r??alit??)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 266),
     (267, 'fr', 'T??l??-r??alit??', 'Quel ancien cycliste a remport?? l''??mission  Je suis une c??l??brit??, sortez-moi de l??!  ?', 'Richard Virenque', 'Laurent Jalabert', 'Bernard Hinault', 'Lance Armstrong', 3, 'Malgr?? un battage m??diatique assez important, le jeu a re??u un accueil du public plus que mitig??.', 'https://fr.wikipedia.org/wiki/Je_suis_une_c??l??brit??,_sortez-moi_de_l??_!', 8, 3, '2020-09-18 22:29:31.15674', NULL, 267),
     (268, 'fr', 'T??l??-r??alit??', 'Qui a pr??sent?? la deuxi??me saison de l''??mission d??sormais culte  Mon incroyable fianc??  sur TF1 ?',  'Sandrine Qu??tier', 'C??line Catalaa', 'Elsa Fayer', 'Louise Bourgoin', 3, 'Pour la premi??re saison, l''??mission a r??alis?? un record d''audience absolu pour une deuxi??me partie de soir??e.', 'https://fr.wikipedia.org/wiki/Mon_incroyable_fianc??', 8, 3, '2020-09-18 22:29:31.15674', NULL, 268),
     (269, 'fr', 'T??l??-r??alit??', 'Qui fut la gagnante de l''??mission  Top Model  diffus??e en 2005 ?', 'Loana', 'Aliz??e', 'Karen', 'Adriana',  3, 'Cette ??mission de t??l??-r??alit?? avait pour but de trouver un mannequin pour remplacer la c??l??bre Adriana Karembeu.', 'https://fr.wikipedia.org/wiki/Top_Model_(??mission_de_t??l??vision)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 269),
     (136, 'fr', 'Stades de Ligue 1', 'L''AS Nancy-Lorraine ??volue dans un stade du nom de quel chapelier nanc??en ?', 'Marcel Picot', 'Gaston Petit', 'Robert Diochon', 'Andr?? Flamart', 2, 'Le stade devait accueillir l''Euro 2016, avec un projet de modernisation portant sa capacit?? ?? 32??000 places assises.', 'https://fr.wikipedia.org/wiki/Stade_Marcel-Picot', 4, 2, '2020-09-18 16:10:43.098468', NULL, 136),
     (137, 'fr', 'Stades de Ligue 1', 'Le stade Auguste-Bonal est aussi vieux que le club qu''il accueille depuis 1931 et qui est ?', 'AJ Auxerre', 'FC Lorient', 'Tours FC','FC Sochaux', 2, 'Le stade porte depuis 1945 le nom d''Auguste Bonal, qui ??tait un ancien dirigeant sochalien et qui fut tu?? par les??Allemands.', 'https://fr.wikipedia.org/wiki/Stade_Auguste-Bonal', 4, 2, '2020-09-18 16:10:43.098468', NULL, 137),
     (138, 'fr', 'Stades de Ligue 1', 'Quel nouveau nom a-t-on donn?? en 2015 au stade de la route de Lorient ?', 'Roazhon Park', 'Breizh Stadium', 'Stade Gwenn-ha-Du', 'Stade du Ray', 2, 'Bord?? par le paisible cours de la??Vilaine, le Roazhon Park se trouve au centre des installations du Stade rennais FC.', 'https://fr.wikipedia.org/wiki/Roazhon_Park', 4, 2, '2020-09-18 16:10:43.098468', NULL, 138),
     (139, 'fr', 'Stades de Ligue 1', 'En 1978, le stade de la Vall??e du Cher accompagna quel club ?', 'Tours FC', 'Angers SCO', 'Cannes', 'FC Lorient', 2, 'La premi??re ann??e, seule la premi??re tranche du stade fut ouverte, offrant ainsi une capacit?? d''environ 8??000 places.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Vall??e_du_Cher', 4, 2, '2020-09-18 16:10:43.098468', NULL, 139),
     (140, 'fr', 'Stades de Ligue 1', 'Quel est ?? ce jour le second stade de France de par sa capacit?? en nombre de supporters ?', 'Parc des Princes', 'Stade V??lodrome', 'Matmut-Atlantique', 'Allianz Riviera', 2, 'Juste avant la Coupe du monde de football de 1998, l''enceinte est pass??e ?? 60 000 places et n''a d??sormais plus de toit.', 'https://fr.wikipedia.org/wiki/Stade_V??lodrome', 4, 2, '2020-09-18 16:10:43.098468', NULL, 140),
     (141, 'fr', 'Stades de Ligue 1', 'L''Olympique lyonnais a quitt?? le stade Gerland pour quelle commune ?', 'Vaulx-en-Velin',  'D??cines-Charpieu', 'V??nissieux', 'Villeurbanne', 3, 'Le stade de Gerland accueille d??sormais les matchs de l''??quipe f??minine depuis que le stade de D??cines est op??rationnel.', 'https://fr.wikipedia.org/wiki/Olympique_lyonnais', 4, 3, '2020-09-18 16:10:43.098468', NULL, 141),
     (142, 'fr', 'Stades de Ligue 1', 'Quel autre nom porte ??galement le stade de la Beaujoire du FC Nantes ?', 'Jean Snaudeau', 'Marcel Saupin', 'Marcel Picot', 'Louis Fonteneau', 3, 'L''id??e de construire un nouveau stade de football ????Nantes??sera lanc??e ?? la fin des??ann??es 1970??par Louis Fonteneau.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Beaujoire', 4, 3, '2020-09-18 16:10:43.098468', NULL, 142),
     (143, 'fr', 'Stades de Ligue 1', 'O?? jouait l''OGC Nice avant d''utiliser l''Allianz Riviera depuis 2013 ?', 'Stade de La Bocca',  'Stade du Ray','Stade de Lorient', 'Stade Oc??ane', 3, 'Le terme Ray??correspond au nom du??quartier o?? se trouve le stade qui a accueilli les matchs de l''OGC Nice de 1927 ?? 2013.', 'https://fr.wikipedia.org/wiki/Stade_L??o-Lagrange_(Nice)', 4, 3, '2020-09-18 16:10:43.098468', NULL, 143),
     (144, 'fr', 'Stades de Ligue 1', 'Quel stade Le Mans FC a-t-il longtemps utilis?? avant le MMArena ?', 'Stade L??on-Boll??e', 'Stade de la Sarthe', 'Stade de Lorient', 'Stade Oc??ane', 3, 'L''enceinte portait le nom d''une personnalit?? mancelle (L??on Boll??e), fameux pionnier de la construction automobile du XIXe si??cle.', 'https://fr.wikipedia.org/wiki/Stade_L??on-Boll??e', 4, 3, '2020-09-18 16:10:43.098468', NULL, 144),
     (270, 'fr', 'T??l??-r??alit??', 'Qui a ??t?? l''animateur des  Anges de la t??l??-r??alit??  jusqu''en 2015 ?', 'S??bastien Cauet', 'Pascal Soetens','Matthieu Delormeau',  'Adrien Rohard', 3, 'Le principe de l''??mission est de faire cohabiter d''anciens candidats de t??l??-r??alit?? fran??aise dans une grande villa.', 'https://fr.wikipedia.org/wiki/Les_Anges_(??mission_de_t??l??vision)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 270),
     (176, 'fr', 'R??seaux sociaux', 'Quel r??seau??professionnel en ligne allemand revendique plusieurs millions de membres ?', ' XING ', ' Foursquare ', ' Viadeo ', ' Pinterest ', 3, 'Les r??seaux sociaux comme  Facebook  ou  Myspace  ne sont pas consid??r??s comme des concurrents directs.', 'https://fr.wikipedia.org/wiki/XING', 5, 3, '2020-09-18 18:20:46.777109', NULL, 176),
     (177, 'fr', 'R??seaux sociaux', 'Quelle application sociale est la plus populaire au Japon ?', ' Emoji ', ' LINE ', ' Viber ', ' Skype ', 3, 'La vente de produits d??riv??s, tels que les autocollants, jeux, figurines et peluches, constitue une partie significative des revenus de LINE.', 'https://fr.wikipedia.org/wiki/LINE_(logiciel)', 5, 3, '2020-09-18 18:20:46.777109', NULL, 177),
     (178, 'fr', 'R??seaux sociaux', 'Quel r??seau social chinois r??cemment cot?? en bourse s''appelait autrefois  Xiaonei  ?', ' Renren ', ' Panguso ', ' NetEase ', ' Baidu ', 3, ' Xiaonei  a ??t?? cr???? en d??cembre 2005 par des ??tudiants de l''Universit?? de Tsinghua, Wang Huiwen, Lai Binqiang et Jacky.', 'https://fr.wikipedia.org/wiki/Renren', 5, 3, '2020-09-18 18:20:46.777109', NULL, 178),
     (179, 'fr', 'R??seaux sociaux', 'Quel service de mise en relation d''annuaires sociaux vient du cofondateur de?? Napster  ?', ' LinkedIn ', ' Pinterest ',' Plaxo ',  ' Viadeo ', 3, 'Apr??s une perte brutale de notori??t?? entre 2007 et 2011,  Plaxo  a jet?? l''??ponge en 2011, fermant  Plaxo Pulse .', 'https://fr.wikipedia.org/wiki/Plaxo', 5, 3, '2020-09-18 18:20:46.777109', NULL, 179),
     (180, 'fr', 'R??seaux sociaux', 'Quel site Web de r??seautage social russe a ??t?? rachet?? par un proche de Vladimir Poutine ?', ' Yammer ', ' Plaxo ',  ' VK ',' Soup ', 3, '?? sa cr??ation, le nom du site ne devait faire aucune allusion ?? certaines cat??gories sociales d''utilisateurs.', 'https://fr.wikipedia.org/wiki/VKontakte', 5, 3, '2020-09-18 18:20:46.777109', NULL, 180),
     (181, 'fr', 'H??ros de Star Wars', 'Sur quelle plan??te d??sertique Anakin Skywalker est-il arriv?? ?? l''??ge de quatre ans ?', 'Naboo', 'Hoth', 'Endor', 'Tatooine', 1, 'George Lucas a utilis?? l''habitat traditionnel de??Tataouine??sans retouches pour la sc??ne o?? Anakin retourne voir sa m??re.', 'https://fr.wikipedia.org/wiki/Tatooine', 6, 1, '2020-09-18 21:10:50.252078', NULL, 181),
     (182, 'fr', 'H??ros de Star Wars', 'Quel l??gendaire guerrier Wookiee est depuis longtemps le fid??le compagnon d''Han Solo ?', 'Chewbacca', 'Palpatine', 'Watto', 'Jar Jar Binks', 1, 'Chewbacca poss??de un grand coeur et fait preuve d''une loyaut?? ind??fectible envers ses amis.', 'https://fr.wikipedia.org/wiki/Chewbacca', 6, 1, '2020-09-18 21:10:50.252078', NULL, 182),
     (183, 'fr', 'H??ros de Star Wars', 'Quel nom Obi-Wan Kenobi a-t-il adopt?? pendant des ann??es jusqu''au jour o?? il rencontra Luke ?', 'Ben', 'Tom', 'Sid', 'Ken', 1, 'Le vieil Obi-Wan Kenobi met Luke Skywalker sur le chemin de la Force avant d''??tre tu?? volontairement par Dark Vador.', 'https://fr.wikipedia.org/wiki/Obi-Wan_Kenobi', 6, 1, '2020-09-18 21:10:50.252078', NULL, 183),
     (185, 'fr', 'H??ros de Star Wars', 'Quel nom porte le robot qu''Anakin a construit ?? partir du corps d''un dro??de de protocole ?', 'R2-D2',  'C-3PO', 'T-1000', 'Daryl', 1, 'Ce dro??de protocolaire de forme humano??de  ma??trise plus de six millions de formes de communication .', 'https://fr.wikipedia.org/wiki/C-3PO', 6, 1, '2020-09-18 21:10:50.252078', NULL, 185),
     (229, 'fr', 'Princesses Disney', 'Quelle princesse Disney ne quitte pour ainsi dire jamais son arc et ses fl??ches ?',  'Tiana', 'Ariel', 'Merida', 'Jasmine', 2, 'Merida est le personnage principal du long m??trage d''animation  Rebelle , sorti en 2012.', 'https://fr.wikipedia.org/wiki/M??rida_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 229),
     (216, 'fr', 'Princesses Disney', 'De quelle mani??re le prince charmant r??veille-t-il Blanche-Neige ?', 'Par une gifle', 'Par une morsure', 'Par un chant', 'Par un baiser', 1, 'La version la plus connue de  Blanche-Neige  est celle de Jacob et Wilhelm Grimm, parue en 1812.', 'https://fr.wikipedia.org/wiki/Blanche-Neige', 7, 1, '2020-09-18 21:59:37.49672', NULL, 216),
     (217, 'fr', 'Princesses Disney', 'Quelle c??l??bre princesse du grand ??cran est empoisonn??e avec une pomme ?', 'Blanche-Neige', 'Cendrillon', 'Raiponce', 'Ariel', 1, 'Blanche-Neige est une princesse d''une tr??s grande beaut??, ce qui rend jalouse sa belle-m??re, la Reine.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_(Disney)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 217),
     (218, 'fr', 'Princesses Disney', 'Quelle h??ro??ne de Disney se voit refuser le droit de rester au bal apr??s minuit ?', 'Alice', 'Blanche-Neige',  'Cendrillon','Aurore', 1, 'Certaines versions de Cendrillon peuvent ??tre tr??s diff??rentes les unes des autres.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 1, '2020-09-18 21:59:37.49672', NULL, 218),
     (219, 'fr', 'Princesses Disney', '?? quelle heure les v??tements de Cendrillon redeviennent-ils ses haillons habituels ?', 'Minuit', 'Midi', 'Onze heures', 'Trois heures', 1, 'L''Occident conna??t surtout l''histoire de Cendrillon au travers des versions de Charles Perrault.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 1, '2020-09-18 21:59:37.49672', NULL, 219),
     (220, 'fr', 'Princesses Disney', 'Qui a ??t?? plac??e dans un cercueil de verre par des nains puis r??veill??e par un prince ?', 'Cendrillon', 'Esmeralda', 'Fiona', 'Blanche-Neige',  1, 'Blanche-Neige montre qu''il ne faut pas s''attacher ?? des choses ??ph??m??res telles la beaut?? et la jeunesse.', 'https://fr.wikipedia.org/wiki/Blanche-Neige', 7, 1, '2020-09-18 21:59:37.49672', NULL, 220),
     (221, 'fr', 'Princesses Disney', 'Quelle couleur est souvent associ??e ?? Aurore dans  La Belle au bois dormant  ?', 'Verte', 'Rose', 'Rouge', 'Bleue', 2, 'Le c??l??bre ch??teau de la princesse Aurore est utilis?? dans les parcs de Disneyland comme ic??ne de la zone Fantasyland.', 'https://fr.wikipedia.org/wiki/Aurore_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 221),
     (222, 'fr', 'Princesses Disney', 'Quelles aventures de Disney se d??roulent dans le nord de la Chine ?', ' Pocahontas ', ' Mulan ', ' Raiponce ', ' Rebelle ', 2, 'Le caract??re du personnage de Mulan est diff??rent des classiques Disney, notamment de celui des princesses.', 'https://fr.wikipedia.org/wiki/Fa_Mulan', 7, 2, '2020-09-18 21:59:37.49672', NULL, 222),
     (256, 'fr', 'T??l??-r??alit??', 'Avec qui Marjolaine s''affichait-elle dans une ??mission de t??l??-r??alit?? diffus??e en 2004 ?', 'Des fermiers', 'Des sportifs',  'Des millionnaires','Des animateurs', 2, 'Cette ??mission met en sc??ne quinze faux millionnaires courtisant Marjolaine Bui, l''une des pr??tendantes de  Greg le millionnaire .', 'https://fr.wikipedia.org/wiki/Marjolaine_et_les_Millionnaires', 8, 2, '2020-09-18 22:29:31.15674', NULL, 256),
     (257, 'fr', 'T??l??-r??alit??', 'Quelle cha??ne de la TNT fran??aise a diffus?? l''??mission  Les Marseillais ?? Rio  ?', 'W9', 'NT1', 'D8', 'M6', 2, 'Le programme suit les aventures d''une douzaine de candidats issus de la r??gion de Marseille et travaillant dans le monde de la nuit.', 'https://fr.wikipedia.org/wiki/Les_Marseillais', 8, 2, '2020-09-18 22:29:31.15674', NULL, 257),
     (258, 'fr', 'T??l??-r??alit??', 'De quelle ??mission de t??l??-r??alit?? Alexia Laroche-Joubert a-t-elle ??t?? la directrice ?', ' Star Academy ', ' Loft Story ', ' Secret Story ', ' Nice People ', 2, 'Alexia Laroche-Joubert est la fille de Patrick Laroche-Joubert, publicitaire, et de Martine Gabarra, grand reporter.', 'https://fr.wikipedia.org/wiki/Alexia_Laroche-Joubert', 8, 2, '2020-09-18 22:29:31.15674', NULL, 258),
     (259, 'fr', 'T??l??-r??alit??', 'Quelle soci??t?? fran??aise a produit l''??mission de t??l??-r??alit??  Secret Story  ?', 'Endemol', 'Arcadis', 'Sofina', 'Tele Atlas', 2, ' Secret Story  se d??roule chaque ann??e en ??t?? et s''??tend sur dix ?? quinze semaines.', 'https://fr.wikipedia.org/wiki/Secret_Story', 8, 2, '2020-09-18 22:29:31.15674', NULL, 259),
     (44, 'fr', 'Fourmis', 'Quel sexe aura obligatoirement une fourmi si son oeuf a la chance d''??tre f??cond?? ?','M??le', 'M??le ou femelle',  'Femelle', 'On ne sait pas', 2, 'Si l''oeuf est f??cond??, l''individu est alors diplo??de et l''oeuf donnera une femelle, s''il ne l''est pas, l''individu est haplo??de et forme un m??le.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 44),
     (47, 'fr', 'Fourmis', 'Quelles fourmis ?? l''abdomen gonfl?? deviennent des mets d??licieux en Australie ?', 'Pot-de-miel', 'Tisserandes', 'Charpenti??res', 'Moissonneuses', 2, 'Ces fourmis servent de r??servoir vivant aux autres fourmis de la colonie qui viennent leur donner le miellat.', 'https://fr.wikipedia.org/wiki/Fourmi_pot-de-miel', 1, 2, '2020-09-17 11:13:40.552188', NULL, 47),
     (48, 'fr', 'Fourmis', 'Quels produits chimiques sont utilis??s pour faciliter la communication entre les fourmis ?', 'Les ph??romones', 'Les neurotoxiques', 'Les biocides', 'Les glucides', 2, 'Les ph??romones agissent comme des messagers et jouent notamment un r??le dans l''attraction sexuelle.', 'https://fr.wikipedia.org/wiki/Ph??romone', 1, 2, '2020-09-17 11:13:40.552188', NULL, 48),
     (49, 'fr', 'Fourmis', 'Quelles fourmis sont charg??es d''??liminer les cadavres du nid ?', 'Les nettoyeuses', 'Les gu??risseuses', 'Les ouvri??res', 'Les guerri??res', 2, 'Les nettoyeuses sont souvent des ouvri??res en fin de vie ou des individus qui restent dans les endroits consacr??s aux d??chets.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 49),
     (50, 'fr', 'Fourmis', 'Quel pr??dateur est ??galement nomm?? le fourmilier g??ant ou grand fourmilier ?', 'Le hurleur', 'Le tamanoir', 'Le ragondin', 'Le saphir', 2, 'Le tamanoir est surtout terrestre, contrairement ?? d''autres fourmiliers ou paresseux, qui sont arboricoles ou semi-arboricole.', 'https://fr.wikipedia.org/wiki/Tamanoir', 1, 2, '2020-09-17 11:13:40.552188', NULL, 50),
     (56, 'fr', 'Fourmis', 'Quel est le record de long??vit?? d??tenu par une reine chez la fourmi noire des jardins ?', '28 ans', '25 ans', '22 ans', '19 ans', 3, 'Les m??les ont une vie tr??s br??ve et, ne sachant pas s''alimenter seuls, ils meurent d??s qu''ils se sont reproduits.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 56),
     (57, 'fr', 'Fourmis', 'Quel pourcentage des esp??ces de fourmis recens??es dans le monde vivent sans reine ?', '11??%', '21??%', '31??%', '1??%',  3, 'Ces fourmis vivent au sein de colonies tr??s r??duites dans lesquelles certaines ouvri??res se reproduisent.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 57),
     (58, 'fr', 'Fourmis', 'Quel terme utilise-t-on g??n??ralement pour d??signer les sons ??mis par les fourmis ?','Percussions', 'Bourdonnements', 'Stridulations', 'D??formations', 3, 'La stridulation permet d''??mettre une large gamme de signaux sonores (s??lection sexuelle, territorialit??, etc...).', 'https://fr.wikipedia.org/wiki/Stridulation', 1, 3, '2020-09-17 11:16:25.655314', NULL, 58),
     (59, 'fr', 'Fourmis', '?? combien de milliards d''individus estime-t-on le nombre de fourmis sur Terre ?', '7 millions', '10 millions', '4 millions', '1 million', 3, 'Les fourmis repr??senteraient 1 ?? 2 % du nombre d''esp??ces d''insectes, mais constitueraient pr??s de 20 % de leur biomasse.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 59),
     (60, 'fr', 'Fourmis', 'Quel??mammif??re??insectivore recouvert d''??cailles est un pr??dateur pour les fourmis ?', 'Ragondin', 'Saphir', 'Tamanoir', 'Pangolin',3, 'Les pangolins peuplent les for??ts et les savanes des r??gions tropicales et ??quatoriales d''Afrique et d''Asie du Sud-Est.', 'https://fr.wikipedia.org/wiki/Pangolin', 1, 3, '2020-09-17 11:16:25.655314', NULL, 60),
     (61, 'fr', 'Villes du monde', '?? quelle ville de France l''andouillette, le saucisson et Guignol vous font-ils penser ?', 'Lyon', 'Marseille', 'Nice', 'Cannes', 1, 'Lyon est en situation de carrefour g??ographique, au nord du couloir naturel de la??vall??e du Rh??ne.', 'https://fr.wikipedia.org/wiki/Lyon', 2, 1, '2020-09-17 11:19:41.273046', NULL, 61),
     (62, 'fr', 'Villes du monde', 'Quelle ville, capitale de la Gr??ce, comprend notamment le port du Pir??e ?', 'Ath??nes', 'Patras', 'Larissa', 'H??raklion', 1, 'Ath??nes est l''une des plus anciennes villes au monde, avec une pr??sence humaine attest??e d??s le??N??olithique.', 'https://fr.wikipedia.org/wiki/Ath??nes', 2, 1, '2020-09-17 11:19:41.273046', NULL, 62),
     (63, 'fr', 'Villes du monde', 'De quelle ville du Sud-Ouest de la France proviennent de c??l??bres pruneaux??AOC ?', 'Marmande', 'Tonneins',  'Agen', 'N??rac', 1, 'Le nom d''Agen est associ?? au??pruneau, dont la zone de production principale est essentiellement situ??e en??Lot-et-Garonne.', 'https://fr.wikipedia.org/wiki/Agen', 2, 1, '2020-09-17 11:19:41.273046', NULL, 63),
     (64, 'fr', 'Villes du monde', 'De quelle couleur sont les cabines t??l??phoniques de la ville de Londres ?',  'Verte', 'Rouge', 'Jaune', 'Blanche', 1, 'Ville touristique europ??enne par excellence, Londres fut fond??e il y a presque 2 000 ans par les Romains sous le nom de Londinium.', 'https://fr.wikipedia.org/wiki/Londres', 2, 1, '2020-09-17 11:19:41.273046', NULL, 64),
     (65, 'fr', 'Villes du monde', 'Quelle ville r??put??e pour la qualit?? de ses cigares est aussi la capitale de Cuba ?', 'La Havane', 'Santiago de Cuba', 'Guantanamo', 'Santa Clara', 1, 'L''emplacement actuel de la ville de La Havane se situe sur la c??te nord de l''??le de Cuba??et dans la partie ouest de celle-ci.', 'https://fr.wikipedia.org/wiki/La_Havane', 2, 1, '2020-09-17 11:19:41.273046', NULL, 65),
     (66, 'fr', 'Villes du monde', '?? la fois ville et province, de quel pays Bangkok est-elle la capitale ?', 'Tha??lande', 'Malaisie', 'Birmanie', 'Laos', 1, 'Le boom ??conomique asiatique des??ann??es 1980-1990??a amen?? de nombreuses multinationales ?? rapidement s''installer ?? Bangkok.', 'https://fr.wikipedia.org/wiki/Bangkok', 2, 1, '2020-09-17 11:19:41.273046', NULL, 66),
     (67, 'fr', 'Villes du monde', '?? quelle grande ville d''Afrique l''explorateur Savorgnan de Brazza a-t-il donn?? son nom ?','Kinshasa', 'Libreville', 'Nairobi',  'Brazzaville', 1, 'La ville de Brazzaville a ??t?? fond??e le 3 octobre 1880 ?? l''emplacement des anciens bourgs pr??coloniaux de??Nkuna.', 'https://fr.wikipedia.org/wiki/Brazzaville', 2, 1, '2020-09-17 11:19:41.273046', NULL, 67),
     (68, 'fr', 'Villes du monde', 'Quelle capitale est ??galement le centre politique et culturel de la Chine ?', 'P??kin', 'Shanghai', 'Hong Kong', 'Tokyo', 1, 'Situ??e ?? proximit?? de la??Grande Muraille, P??kin abrite des monuments c??l??bres comme la??Cit?? interdite??et le??Temple du ciel.', 'https://fr.wikipedia.org/wiki/P??kin', 2, 1, '2020-09-17 11:19:41.273046', NULL, 68),
     (69, 'fr', 'Villes du monde', 'Laquelle de ces quatre villes espagnoles ne poss??de pas un port de renom ?', 'Madrid', 'Barcelone', 'Malaga', 'Valence', 1, 'Situ??e en plein coeur du royaume d''Espagne, Madrid est la capitale mais aussi la ville la plus peupl??e de la??Communaut?? de Madrid.', 'https://fr.wikipedia.org/wiki/Liste_des_ports_en_Espagne', 2, 1, '2020-09-17 11:19:41.273046', NULL, 69),
     (70, 'fr', 'Villes du monde', 'Dans quel pays ?? forte densit?? de population la ville de Calcutta est-elle situ??e ?','Br??sil', 'Inde', 'Bangladesh', 'Birmanie', 1, 'Calcutta est connue pour avoir abrit?? la fondation de la congr??gation religieuse des Missionnaires de la Charit?? par M??re Teresa.', 'https://fr.wikipedia.org/wiki/Calcutta', 2, 1, '2020-09-17 11:19:41.273046', NULL, 70),
     (71, 'fr', 'Villes du monde', 'Quelle est la capitale ainsi que la plus grande ville du territoire ??gyptien ?', 'Alexandrie', 'Louxor', 'Suez', 'Le Caire', 2, 'Avec ses seize millions d\habitants, Le Caire est la plus grande ville du??Moyen-Orient??et la seconde ville d''Afrique derri??re Lagos.', 'https://fr.wikipedia.org/wiki/Le_Caire', 2, 2, '2020-09-17 11:24:13.752782', NULL, 71),
     (72, 'fr', 'Villes du monde', 'C??l??bre pour son industrie cin??matographique, dans quel pays se situe la ville de Bombay ?', 'N??pal', 'Inde', 'Pakistan', 'Sri Lanka', 2, 'Bombay forme avec les villes de Navi Mumbai, Bhiwandi, Kalyan, Ulhasnagar et Thane une agglom??ration de 18 500 000 habitants.', 'https://fr.wikipedia.org/wiki/Bombay', 2, 2, '2020-09-17 11:24:13.752782', NULL, 72),
     (73, 'fr', 'Villes du monde', 'Dans laquelle de ces villes peut-on contempler un c??l??bre pain de sucre ?', 'Brazzaville', 'La Havane','Rio de Janeiro', 'Le Caire', 2, 'Le??Christ R??dempteur??est une immense statue du??Christ??dominant la ville de??Rio de Janeiro, surplombant le mont du??Corcovado.', 'https://fr.wikipedia.org/wiki/Christ_R??dempteur', 2, 2, '2020-09-17 11:24:13.752782', NULL, 73),
     (74, 'fr', 'Villes du monde', 'Quelle capitale administrative des Pays-Bas est le si??ge de nombreuses institutions ?', 'La Haye', 'Amsterdam', 'Rotterdam', 'Utrecht', 2, 'La Haye est ??galement la ville o?? si??gent la??Cour internationale de justice, la??Cour p??nale internationale, Europol??et??Eurojust.', 'https://fr.wikipedia.org/wiki/La_Haye', 2, 2, '2020-09-17 11:24:13.752782', NULL, 74),
     (75, 'fr', 'Villes du monde', 'Combien y a-t-il de communes ?? Paris situ??es sur une boucle de la Seine ?', 'Une seule', '9', '13', '22', 2, 'D''apr??s le recensement de l''Insee, la commune de Paris comptait au 1er janvier 2012??plus de deux millions d''habitants.', 'https://fr.wikipedia.org/wiki/Paris', 2, 2, '2020-09-17 11:24:13.752782', NULL, 75),
     (76, 'fr', 'Villes du monde', 'Tripoli est une ville du Liban mais se trouve ??tre aussi la capitale de quel pays ?',  'Maroc', 'Soudan', 'Tunisie','Libye', 2, 'Tripoli est la plus grande ville, le principal port et le plus grand centre industriel, commercial et touristique de Libye.', 'https://fr.wikipedia.org/wiki/Tripoli_(Libye)', 2, 2, '2020-09-17 11:24:13.752782', NULL, 76),
     (77, 'fr', 'Villes du monde', 'Quelle ville est aussi importante pour l''Afrique que pour le monde arabe ?', 'Assouan', 'Le Caire', 'Alexandrie', 'Suez', 2, 'Centre n??vralgique de la ville moderne, la??place Tahrir??est devenue pour la plan??te l''embl??me de la??r??volution ??gyptienne de 2011.', 'https://fr.wikipedia.org/wiki/Le_Caire', 2, 2, '2020-09-17 11:24:13.752782', NULL, 77),
     (78, 'fr', 'Villes du monde', 'Avec ses nombreux canaux, sur les rives de quelle mer la ville de Venise est-elle situ??e ?', 'Adriatique', '??g??e', 'Ionienne', 'Noire', 2, 'Menac??e par le climat, Venise s''??tend sur un ensemble de 118 petites ??les s??par??es par un r??seau de canaux et reli??es par des ponts.', 'https://fr.wikipedia.org/wiki/Venise', 2, 2, '2020-09-17 11:24:13.752782', NULL, 78),
     (79, 'fr', 'Villes du monde', 'Dans quelle ville recense-t-on ?? ce jour le plus grand nombre de taxis au monde ?', 'New York', 'Londres', 'Tokyo', 'Brasilia', 2, 'Les c??l??bres taxis jaunes sont exploit??s par des soci??t??s priv??es, agr????es par la Commission de Taxi et Limousine de New York.', 'https://fr.wikipedia.org/wiki/Taxis_de_New_York', 2, 2, '2020-09-17 11:24:13.752782', NULL, 79),
     (80, 'fr', 'Villes du monde', 'Quelle capitale du N??pal ??tait une ??tape bien connue de la communaut?? hippies ?', 'Katmandou', 'Pokhara', 'Lalitpur', 'Dharan', 2, 'Katmandou ne poss??de pas de r??seau souterrain de canalisations et dispose d??s lors d''une alimentation en eau insuffisante.', 'https://fr.wikipedia.org/wiki/Katmandou', 2, 2, '2020-09-17 11:24:13.752782', NULL, 80),
     (81, 'fr', 'Villes du monde', 'Au bord de quoi la ville am??ricaine de Chicago a-t-elle ??t?? construite ?', 'Lac', 'Oc??an', 'Volcan', 'Faille', 3, 'La ville de Chicago, qui constitue le deuxi??me centre industriel des ??tats-Unis, appartient ?? la Ceinture des industries.', 'https://fr.wikipedia.org/wiki/Chicago', 2, 3, '2020-09-17 11:32:06.434555', NULL, 81),
     (82, 'fr', 'Villes du monde', 'Quelle est la nationalit?? des habitants de Ta??wan, aussi appel??e Formose ?', 'Japonaise', 'Cor??enne','Chinoise', 'N??palaise', 3, 'Le climat de Ta??wan est??tropical??au sud et??subtropical humide??au nord??: les ??t??s y sont chauds et les hivers relativement doux.', 'https://fr.wikipedia.org/wiki/Ta??wan_(??le)', 2, 3, '2020-09-17 11:32:06.434555', NULL, 82),
     (83, 'fr', 'Villes du monde', 'Combien y a-t-il environ d''habitants ?? Mexico, capitale et ville la plus peupl??e du Mexique ?', '16 millions', '12 millions', '20 millions','8 millions', 3, 'L''aire urbaine de Mexico, recens??e comme la troisi??me plus peupl??e du monde, s''??tale sur une surface de 60 km sur 100 km environ.', 'https://fr.wikipedia.org/wiki/Mexico', 2, 3, '2020-09-17 11:32:06.434555', NULL, 83),
     (84, 'fr', 'Villes du monde', 'Dans quelle r??gion historique d''Espagne se situe la c??l??bre ville de Barcelone ?',  'Andalousie', 'Castille', 'Galice','Catalogne', 3, 'Barcelone est la deuxi??me ville d''Espagne en termes de population, d''??conomie et d''activit??s et la onzi??me la plus peupl??e de l''UE.', 'https://fr.wikipedia.org/wiki/Barcelone', 2, 3, '2020-09-17 11:32:06.434555', NULL, 84),
     (85, 'fr', 'Villes du monde', 'Comment appelle-t-on le quartier arabe ou la m??dina d''Alger ?', 'Bled', 'Casbah', 'Souk', 'Torah', 3, 'L''histoire de la Casbah d''Alger remonte ?? l''Antiquit??, o?? elle fut d''abord un port??punique, puis??berb??re??et enfin romain.', 'https://fr.wikipedia.org/wiki/Casbah_d''Alger', 2, 3, '2020-09-17 11:32:06.434555', NULL, 85),
     (86, 'fr', 'Villes du monde', 'De quel pays Rangoun est-elle la plus grande ville en nombre d''habitants ?', 'Birmanie', 'Laos', 'Malaisie', 'Philippines', 3, 'Le nom de la capitale du pays (Rangoon/Rangoun) peut ??tre traduit comme fin de la discorde ou fin du conflit.', 'https://fr.wikipedia.org/wiki/Rangoun', 2, 3, '2020-09-17 11:32:06.434555', NULL, 86),
     (87, 'fr', 'Villes du monde', 'Dans quel pays se trouve Hammerfest, la ville la plus au nord de l''Europe ?', 'Norv??ge', 'Su??de', 'Finlande', '??cosse', 3, 'Situ??e dans le comt?? de Finnmark, on dit souvent d''Hammerfest qu''elle est la ville la plus septentrionale du monde.', 'https://fr.wikipedia.org/wiki/Hammerfest_(Norv??ge)', 2, 3, '2020-09-17 11:32:06.434555', NULL, 87),
     (88, 'fr', 'Villes du monde', 'Quelle capitale du Liberia est situ??e au bord de l''oc??an Atlantique ?', 'Monrovia', 'Nimba', 'Grand Bassa', 'Lofa', 3, 'Monrovia joue un grand r??le dans l''??conomie du pays en y assurant l''essentiel des exportations de??minerai de fer.', 'https://fr.wikipedia.org/wiki/Monrovia', 2, 3, '2020-09-17 11:32:06.434555', NULL, 88),
     (89, 'fr', 'Villes du monde', 'Dans quel pays peut-on d??ambuler dans les rues de Constantine, Oran ou encore Annaba ?', 'Alg??rie', 'Jordanie', 'Tunisie', 'Turquie', 3, 'Constantine est ??galement surnomm??e la ville des ponts suspendus, la ville du vieux rocher??ou encore la??ville des oul??mas.', 'https://fr.wikipedia.org/wiki/Constantine_(Alg??rie)', 2, 3, '2020-09-17 11:32:06.434555', NULL, 89),
     (90, 'fr', 'Villes du monde', '?? Hong Kong, quel funiculaire relie le quartier de Central ?? Victoria Peak ?', 'Peak Tram', 'Tsing Ma', 'Cross-Harbour', 'Octopus', 3, 'Le funiculaire est le moyen de transport qui offre aux touristes une des plus belles vues sur le port et les gratte-ciels de Hong Kong.', 'https://fr.wikipedia.org/wiki/Peak_Tram', 2, 3, '2020-09-17 11:32:06.434555', NULL, 90),
     (91, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne d??signe pas une boisson ??nergisante ?', 'Dark Dog', 'Monster Energy', 'Oasis', 'Red Bull', 1, 'La marque est aujourd''hui, en France, la premi??re marque de boisson aux fruits non gazeuse.', 'https://fr.wikipedia.org/wiki/Oasis_(boisson)', 3, 1, '2020-09-18 14:48:09.520789', NULL, 91),
     (92, 'fr', 'Boissons sans alcool', 'Quelle est la saveur du Champomy, appartenant ?? la marque Orangina Schweppes ?', 'Ananas','Pomme',  'Orange', 'Citron', 1, 'En 2013, Orangina Schweppes se hisse ?? la seconde place du march?? des boissons non-alcoolis??es en France.', 'https://fr.wikipedia.org/wiki/Orangina_Schweppes', 3, 1, '2020-09-18 14:48:09.520789', NULL, 92),
     (93, 'fr', 'Boissons sans alcool', 'Dans quelle r??gion de France le Breizh Cola a-t-il ??t?? cr???? et commercialis?? depuis 2002 ?', 'Gironde', 'Bretagne','Charente-Maritime', '??le-de-France', 1, 'Ce cola r??gional fran??ais tire son nom de sa premi??re composition, l''utilisation de??noix de kola, et du nom breton de la??Bretagne.', 'https://fr.wikipedia.org/wiki/Breizh_Cola', 3, 1, '2020-09-18 14:48:09.520789', NULL, 93),
     (94, 'fr', 'Boissons sans alcool', 'Quelle star a popularis?? dans les publicit??s de la marque Nespresso le slogan ??What esle?? ?', 'George Clooney', 'Bard Pitt', 'John Travolta', 'Tom Hanks', 1, 'En??2009, l''entreprise a r??alis?? un??chiffre d''affaires??de 1,94 milliard d''euros (2,77 milliards de francs suisses).', 'https://fr.wikipedia.org/wiki/Nespresso', 3, 1, '2020-09-18 14:48:09.520789', NULL, 94),
     (95, 'fr', 'Boissons sans alcool', 'Quelles sont les deux couleurs de la marque Coca-Cola et de la Coca-Cola Company ?', 'Rouge et blanche', 'Noire et verte', 'Bleue et orange', 'Jaune et bleue', 1, 'Ce nom provient de deux ingr??dients utilis??s pour sa composition originelle??: la feuille de??coca??et la??noix de kola.', 'https://fr.wikipedia.org/wiki/Coca-Cola', 3, 1, '2020-09-18 14:48:09.520789', NULL, 95),
     (106, 'fr', 'Boissons sans alcool', 'Laquelle des ces couleurs ne retrouve-t-on pas sur le logo de la marque Fanta ?', 'Noire', 'Blanche', 'Bleue', 'Orange', 2, 'Il existe environ 70 saveurs diff??rentes de Fanta, bien que la plupart ne soient commercialis??es que dans certaines parties du monde.', 'https://fr.wikipedia.org/wiki/Fanta', 3, 2, '2020-09-18 15:07:46.091152', NULL, 106),
     (107, 'fr', 'Boissons sans alcool', 'Quelle boisson est connue pour contenir du ginger ale, sorte de soda au gingembre ?', 'Canada Dry', '7 Up', 'Fanta', 'Gini', 2, 'Bien que Canada Dry soit originaire du??Canada, ses quartiers g??n??raux industriels sont actuellement situ??s au??Texas.', 'https://fr.wikipedia.org/wiki/Canada_Dry', 3, 2, '2020-09-18 15:07:46.091152', NULL, 107),
     (108, 'fr', 'Boissons sans alcool', 'Depuis 1972, quelle marque de caf?? utilise dans ses publicit??s un expert nomm?? ??gringo?? ?',  'Senseo', 'Necaf??', 'Caf?? Grand M??re','Jacques Vabre', 2, 'Le caf????Jacques Vabre??doit son nom ?? un ex-enseignant entr?? en??1946??dans le commerce de son beau-p??re.', 'https://fr.wikipedia.org/wiki/Jacques_Vabre', 3, 2, '2020-09-18 15:07:46.091152', NULL, 108),
     (109, 'fr', 'Boissons sans alcool', 'Pour quel jus de fruits Richard Gotainer a-t-il compos??  Y''a des fruits, y''a de l''eau  ?', 'Champomy', 'Banga', 'Oasis', 'Joker', 2, 'Cr????e en??1968??par??Pampryl, la marque Banga ??tait tr??s populaire dans les ann??es 1980.', 'https://fr.wikipedia.org/wiki/Banga_(boisson)', 3, 2, '2020-09-18 15:07:46.091152', NULL, 109),
     (110, 'fr', 'Boissons sans alcool', 'Si l''on vous parle de ??l''ami du petit-d??jeuner??, ?? quelle marque de caf?? pensez-vous ?', 'Malongo', 'Senseo', 'Maxwell','Ricor??',  2, 'Ricor?? est c??l??bre pour sa saga publicitaire, cr????e en 1981, autour d''une musique compos??e par Andr?? Georget.', 'https://fr.wikipedia.org/wiki/Ricor??', 3, 2, '2020-09-18 15:07:46.091152', NULL, 110),
     (111, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne d??signe pas une marque vendant du pastis sans alcool ?',  'Blancart','Pastis 51', 'Girard', 'Pastisade', 3, 'Elle se boit avec de l''eau fra??che et ??ventuellement des gla??ons dans la proportion de un volume de pastis pour cinq ou sept d''eau.', 'https://fr.wikipedia.org/wiki/Pastis_51', 3, 3, '2020-09-18 15:07:46.091152', NULL, 111),
     (112, 'fr', 'Boissons sans alcool', 'Quel ingr??dient se retrouve dans plusieurs boissons ??nergisantes de la marque Red Bull ?', 'Taurine', 'Glutamate', 'Coca??ne', 'Glycine', 3, 'La??taurine??est l''un des ingr??dients retardant l''arriv??e de la boisson dans certains pays, par application du??principe de pr??caution.', 'https://fr.wikipedia.org/wiki/Red_Bull_Energy_Drink', 3, 3, '2020-09-18 15:07:46.091152', NULL, 112),
     (113, 'fr', 'Boissons sans alcool', 'Dans sa recette initiale, quel ingr??dient le Coca-Cola contenait-il ?', 'De la coca??ne', 'De l''h??ro??ne', 'Du LSD', 'De la marijuana', 3, 'La premi??re recette anc??tre du Coca-Cola, le?? French Wine Coca , est invent??e par John Pemberton en 1885.', 'https://fr.wikipedia.org/wiki/Coca-Cola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 113),
     (114, 'fr', 'Boissons sans alcool', 'Dans quel pays la boisson gazeuse nomm??e  Applesin  remporte-t-elle un franc succ??s ?',  'Argentine', 'Canada', 'Cor??e du Sud','Islande', 3, 'Depuis 1955, la brasserie produit??Eglsl Appels??n, v??ritable exp??rience islandaise du soda ou orangeade.', 'https://fr.wikipedia.org/wiki/', 3, 3, '2020-09-18 15:07:46.091152', NULL, 114),
     (115, 'fr', 'Boissons sans alcool', 'La recette de quelle marque de cola est disponible et reproductible librement ?', 'OpenCola', 'Coco-Lala', 'FreeCola', 'Cola-Cola', 3, 'Quelques militants de l''??thique??FLOSS??ont commenc?? un projet OpenCola italien, mais sans but lucratif.', 'https://fr.wikipedia.org/wiki/OpenCola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 115),
     (116, 'fr', 'Boissons sans alcool', 'Laquelle de ces personnalit??s n''a jamais particip?? ?? une publicit?? pour la marque Pepsi ?', 'Zin??dine Zidane', 'Michael Jackson', 'David Beckham', 'Madonna', 3, 'En??2010, les ventes de Pepsi Cola en France ont progress?? de plus de 36??% sur les quatre premiers mois de l''ann??e 200.', 'https://fr.wikipedia.org/wiki/Pepsi-Cola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 116),
     (117, 'fr', 'Boissons sans alcool', 'Quelle boisson sans alcool est dor??e comme l''alcool et a un nom qui sonne comme l''alcool ?', 'Canada Dry', 'Pepsi', 'Sprite', 'Tropicana', 3, 'En 1934, Canada Dry fut l''une des premi??res marques ?? proposer des??comic books comme cadeau gratuit.', 'https://fr.wikipedia.org/wiki/Canada_Dry', 3, 3, '2020-09-18 15:07:46.091152', NULL, 117),
     (118, 'fr', 'Boissons sans alcool', 'En quelle ann??e la marque Pepsi a-t-elle ??t?? cr????e ?? New Bern, en Caroline du Nord ?', '1898', '1918', '1938', '1958', 3, 'Caleb D. Bradham, pharmacien??????New Bern, inventa une potion ?? base de??noix de cola??contre les troubles de la digestion.', 'https://fr.wikipedia.org/wiki/Pepsi-Cola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 118),
     (119, 'fr', 'Boissons sans alcool', 'Dans quelle ville am??ricaine la marque Minute Maid a-t-elle ??t?? cr????e en 1945 ?',  'Chicago', 'New York','Boston', 'Washington', 3, 'Plut??t que d''offrir son jus d''orange sous forme de poudre, la firme d??cida de cr??er un produit concentr????surgel??.', 'https://fr.wikipedia.org/wiki/Minute_Maid', 3, 3, '2020-09-18 15:07:46.091152', NULL, 119),
     (120, 'fr', 'Boissons sans alcool', 'En quelle ann??e la marque de boissons Schweppes a-t-elle ??t?? cr????e ?', '1783', '1883', '1983', '1683', 3, '?? partir d''avril 2014, la nouvelle ??g??rie de Schweppes devient??P??n??lope Cruz sur le th??me de la sensualit??.', 'https://fr.wikipedia.org/wiki/Schweppes', 3, 3, '2020-09-18 15:07:46.091152', NULL, 120),
     (121, 'fr', 'Stades de Ligue 1', 'Depuis 2014, la capacit?? du stade V??lodrome de Marseille a ??t?? port??e ?? combien de places ?', '67 394', '58 832', '49 634', '77 548', 1, 'Le stade V??lodrome, rebaptis?? Orange V??lodrome en juillet 2016, r??pond aux crit??res des??stades de cat??gorie 4??de l''UEFA.', 'https://fr.wikipedia.org/wiki/Stade_V??lodrome', 4, 1, '2020-09-18 16:10:43.098468', NULL, 121),
     (122, 'fr', 'Stades de Ligue 1', 'Quel club ??volue au stade Pierre-Mauroy de Villeneuve-d''Ascq ?', 'Valenciennes FC', 'RC Lens',  'LOSC Lille','Amiens SC', 1, 'Le toit mobile de 7 600 tonnes peut ??tre referm?? en trente minutes et sa pelouse se soul??ve et se d??place sur sa moiti??.', 'https://fr.wikipedia.org/wiki/Stade_Pierre-Mauroy', 4, 1, '2020-09-18 16:10:43.098468', NULL, 122),
     (123, 'fr', 'Stades de Ligue 1', 'Le stade Auguste-Delaune accueille les matchs de quel grand club ?', 'Stade de Reims', 'Stade brestois', 'Paris FC', 'AJ Auxerroise', 1, 'Le stade a ??t?? officiellement inaugur?? le??2 juin??1935??par le pr??sident de la R??publique??Albert Lebrun??sous le nom de??stade municipal.', 'https://fr.wikipedia.org/wiki/Stade_Auguste-Delaune', 4, 1, '2020-09-18 16:10:43.098468', NULL, 123),
     (124, 'fr', 'Stades de Ligue 1', 'Quel club de Ligue 1 est propri??taire du stade de l''Abb??-Deschamps ?', 'AC Ajaccio', 'AS Nancy-Lorraine', 'FC Lorient', 'AJ Auxerre', 1, 'L''AJ Auxerre??en est le propri??taire, seul club fran??ais dans ce cas avec l''AC Ajaccio, le??Gaz??lec Ajaccio??et l''Olympique lyonnais.', 'https://fr.wikipedia.org/wiki/Stade_de_l''Abb??-Deschamps', 4, 1, '2020-09-18 16:10:43.098468', NULL, 124),
     (125, 'fr', 'Stades de Ligue 1', 'Le stade des Costi??res a connu la premi??re Division avec quel club ?', 'N??mes Olympique', 'Tours FC', 'FC de Guengnon', 'RC Lens', 1, 'Trenti??me stade fran??ais au nombre de places propos??es, l''enceinte a ??t?? ??galement utilis??e pour des matchs de??rugby ?? XV.', 'https://fr.wikipedia.org/wiki/Stade_des_Costi??res', 4, 1, '2020-09-18 16:10:43.098468', NULL, 125),
     (126, 'fr', 'Stades de Ligue 1', 'Quel est le v??ritable nom??du stade de Furiani, utilis?? par le FC Bastia ?', 'Armand-Cesari', 'Victor-Lorenzi', 'Claude-Papi', 'Jean-Bouin', 1, 'Furiani reste ??galement dans les m??moires pour la catastrophe qui marqua la demi-finale de la??coupe de France de 1992.', 'https://fr.wikipedia.org/wiki/Stade_Armand-Cesari', 4, 1, '2020-09-18 16:10:43.098468', NULL, 126),
     (127, 'fr', 'Stades de Ligue 1', 'Le stade du Moustoir accueille le Festival interceltique mais aussi quel club r??sident ?',  'Stade Brestois 29', 'Vannes Olympique','FC Lorient', 'AJ Auxerre', 1, 'Le groupe??Supertramp??a ??galement donn?? un concert exceptionnel dans le stade du Moustoir en??1983.', 'https://fr.wikipedia.org/wiki/Stade_du_Moustoir', 4, 1, '2020-09-18 16:10:43.098468', NULL, 127),
     (128, 'fr', 'Stades de Ligue 1', 'Quelle grande enceinte sportive est ??galement le stade du Toulouse FC ?', 'Stadium municipal', 'Stade  Wallon', 'Palais des Sports', 'Matmut-Atlantique', 1, 'Situ?? sur l''??le du Ramier, on le surnomme le petit Wembley??en r??f??rence ?? son architecture proche du mythique stade anglais.', 'https://fr.wikipedia.org/wiki/Stadium_de_Toulouse', 4, 1, '2020-09-18 16:10:43.098468', NULL, 128),
     (129, 'fr', 'Stades de Ligue 1', 'Quel est le surnom du stade Geoffroy-Guichard, situ?? ?? Saint-??tienne ?', 'Le Chaudron', 'La Marmite', 'La Cuvette', 'Le Puits', 1, '?? l''origine, il s''agit en fait d''un vaste terrain de??40??000??m2??achet?? par??Geoffroy Guichard, fondateur des magasins??Casino.', 'https://fr.wikipedia.org/wiki/Stade_Geoffroy-Guichard', 4, 1, '2020-09-18 16:10:43.098468', NULL, 129),
     (130, 'fr', 'Stades de Ligue 1', 'A quoi le stade de la Mosson du Montpellier H??rault SC doit-il son nom ?', 'Un attaquant', 'Une rivi??re', 'Un chien', 'Une supportrice', 1, 'Lors d''orages c??venols, la rivi??re Mosson qui coule ?? proximit?? peut provoquer avec ses crues d''importants d??g??ts au stade.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Mosson', 4, 1, '2020-09-18 16:10:43.098468', NULL, 130),
     (131, 'fr', 'Stades de Ligue 1', 'Quel club ??volue au stade Bollaert-Delelis, initialement nomm?? stade F??lix-Bollaert ?', 'RC Lens', 'LOSC Lille', 'Amiens SC', 'Valenciennes FC', 2, 'Depuis??2013, le club est pr??sid?? par??Gervais Martel, qui avait d??j?? assur?? la pr??sidence du m??me club de??1988??????2012.', 'https://fr.wikipedia.org/wiki/Racing_Club_de_Lens', 4, 2, '2020-09-18 16:10:43.098468', NULL, 131),
     (132, 'fr', 'Stades de Ligue 1', 'Le stade de la Meinau est le stade de quelle grande ville de l''est de la France ?', 'Starsbourg', 'Mulhouse', 'Belfort', 'Colmar', 2, 'Principal????quipement sportif??de la ville, l''enceinte accueille ponctuellement d''autres ??v??nements sportifs ou culturels.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Meinau', 4, 2, '2020-09-18 16:10:43.098468', NULL, 132),
     (133, 'fr', 'Stades de Ligue 1', 'Sur quelle ??le a ??t?? construit le stade du FC Metz en 1923 ?',  'Saint-Germain', 'Saint-Martin', 'Saint-Julien', 'Saint-Symphorien', 2, 'Le??6 juin??2009,??Johnny Hallyday??y donne un concert pour sa derni??re??tourn??e  Tour 66 , devant plus de 35??000 personnes.', 'https://fr.wikipedia.org/wiki/Stade_Saint-Symphorien', 4, 2, '2020-09-18 16:10:43.098468', NULL, 133),
     (134, 'fr', 'Stades de Ligue 1', 'Quel est le joli nom du centre d''entra??nement du FC Nantes?? ?', 'Joneli??re', 'Piverdi??re', 'Lavandi??re', 'Canebi??re', 2, 'Les diff??rentes infrastructures du club sont regroup??es au sein du??Centre sportif Jos??-Arribas??(Centre sportif de La Joneli??re).', 'https://fr.wikipedia.org/wiki/La_Chapelle-sur-Erdre', 4, 2, '2020-09-18 16:10:43.098468', NULL, 134),
     (135, 'fr', 'Stades de Ligue 1', 'Le Havre AC a quitt?? le stade Jules-Deschaseaux pour rejoindre quelle enceinte ?', 'Stade Oc??ane', 'Stade Maritime', 'Stade de la Manche', 'Stade du Ray', 2, 'Le??Stade Oc??ane??est un??stade multifonction??de??25??178 places??assises pour le sport??et 33??000 pour les spectacles.', 'https://fr.wikipedia.org/wiki/Stade_Oc??ane', 4, 2, '2020-09-18 16:10:43.098468', NULL, 135),
     (145, 'fr', 'Stades de Ligue 1', 'Avec quel club le stade Louis-Dugaugez a-t-il d??couvert la Ligue 1 en 2000 ?', 'ESTAC Troyes', 'RC Lens', 'Stade de Reims', 'CS Sedan Ardennes', 3, 'La construction de la quatri??me et derni??re tribune a d??but?? le??26 avril??2001??et s''est termin??e le??13 septembre??2001.', 'https://fr.wikipedia.org/wiki/Stade_Louis-Dugauguez', 4, 3, '2020-09-18 16:10:43.098468', NULL, 145),
     (146, 'fr', 'Stades de Ligue 1', 'Quel est le surnom du stade Pierre-de-Couertin situ?? ?? Cannes ?','Rocca', 'Polka', 'Bocca',  'Bossa', 3, 'Ce stade ??tait ?? l''origine consacr?? ?? l''athl??tisme??et au??rugby??alors que le??football????voluait au??stade des Hesp??rides.', 'https://fr.wikipedia.org/wiki/Stade_Pierre-de-Coubertin_(Cannes)', 4, 3, '2020-09-18 16:10:43.098468', NULL, 146),
     (147, 'fr', 'Stades de Ligue 1', 'En 1980, le stade Yves-Jaguin a ??t?? remplac?? par quel autre stade ?', 'Roudourou', 'Roudoudou', 'Rouloulou', 'Rougoudou', 3, 'Le stade Yves-Jaguin a n??anmoins accueilli l''??quipe premi??re de l''En Avant de Guingamp??de 1921 ?? 1990.', 'https://fr.wikipedia.org/wiki/Stade_Yves-Jaguin', 4, 3, '2020-09-18 16:10:43.098468', NULL, 147),
     (148, 'fr', 'Stades de Ligue 1', 'Quels championnats le stade Gaston-Petit a-t-il accueilli en 2009, 2010 et 2011 ?', 'Duathlon', 'Triathlon', 'Volley-ball', 'Cricket', 3, 'Le??stade Gaston-Petit??de 17 072 places, inaugur?? en 1964, est un ??quipement sportif de la ville de??Ch??teauroux.', 'https://fr.wikipedia.org/wiki/Stade_Gaston-Petit', 4, 3, '2020-09-18 16:10:43.098468', NULL, 148),
     (149, 'fr', 'Stades de Ligue 1', 'Dans laquelle de ces villes ne trouve-t-on pas de stade Jean-Bouin ?',  'N??mes', 'Marseille', 'Lyon','Angers', 3, 'Jean Bouin est un athl??te fran??ais de course de fond d??tenteur de sept records du monde sur diff??rentes distances et dur??es.', 'https://fr.wikipedia.org/wiki/Stade_Jean-Bouin', 4, 3, '2020-09-18 16:10:43.098468', NULL, 149),
     (150, 'fr', 'Stades de Ligue 1', 'Quel est le nom du stade du Gaz??lec Ajaccio, le plus petit de la Ligue 1 en 2015 ?', 'Ange-Casanova', 'Armand-Cesari', 'Fran??ois-Coty', 'D??cines-Charpieu', 3, 'La capacit?? du stade fut port??e ?? 5??000 places en 2015 ?? la suite de la mont??e du club en Ligue 1.', 'https://fr.wikipedia.org/wiki/Stade_Ange-Casanova', 4, 3, '2020-09-18 16:10:43.098468', NULL, 150),
     (151, 'fr', 'R??seaux sociaux', 'Sur l''outil de microblogage  Twitter , combien de caract??res maximum peut contenir un tweet ?', '140', '255', '80', '500', 1, ' Twitter  a ??t?? cr???? le 21 mars 2006 par Jack Dorsey, Evan Williams, Biz Stone et Noah Glass.', 'https://fr.wikipedia.org/wiki/Twitter', 5, 1, '2020-09-18 18:20:46.777109', NULL, 151),
     (152, 'fr', 'R??seaux sociaux', 'Parmi ces r??seaux sociaux fort appr??ci??s, lequel a connu la plus forte croissance en 2014 ?',' SoundCloud ', ' Facebook ', ' LinkedIn ',  ' Pinterest ', 1, 'Le nom du site est un mot-valise des mots anglais  pin  et  interest  signifiant respectivement  ??pingler  et  int??r??t .', 'https://fr.wikipedia.org/wiki/Pinterest', 5, 1, '2020-09-18 18:20:46.777109', NULL, 152),
     (153, 'fr', 'R??seaux sociaux', 'Quel informaticien et chef d''entreprise am??ricain a invent??  Facebook  ?', 'Mark Zuckeberg', 'Larry Page', 'Steve Ballmer', 'Paul Allen', 1, 'Mark Zuckeberg est aujourd''hui le plus jeune milliardaire du monde derri??re son camarade Dustin Moskovitz.', 'https://fr.wikipedia.org/wiki/Facebook', 5, 1, '2020-09-18 18:20:46.777109', NULL, 153),
     (154, 'fr', 'R??seaux sociaux', 'R??cemment dipl??m??(e), sur quel r??seau social allez-vous probablement rechercher un job ?', ' LinkedIn ', ' Tinder ', ' Twich ', ' Reddit ', 1, 'Le site revendique plus de 400 millions de membres issus de 170 secteurs d''activit??s dans plus de 200 pays.', 'https://fr.wikipedia.org/wiki/LinkedIn', 5, 1, '2020-09-18 18:20:46.777109', NULL, 154),
     (155, 'fr', 'R??seaux sociaux', 'Que pouvez-vous principalement partager sur le site web  Flickr , d??velopp?? par Ludicorp ?', 'Des vid??os', 'Des adresses', 'Des photos', 'De la musique', 1, 'Sur  Flickr , un utilisateur d''un compte gratuit dispose d''un espace d''un t??raoctet pour stocker des photos et des vid??os.', 'https://fr.wikipedia.org/wiki/Flickr', 5, 1, '2020-09-18 18:20:46.777109', NULL, 155),
     (156, 'fr', 'R??seaux sociaux', 'Quelle c??l??brit?? de la t??l??vision a pris le selfie le plus ??retweet???? de l''histoire ?', 'Ellen DeGeneres', 'Kim Kardashian', 'Oprah Winfrey', 'Jenny McCarthy', 1, 'Ellen DeGeneres est une cousine ??loign??e de Catherine Middleton, duchesse de Cambridge et ??pouse de William.', 'https://fr.wikipedia.org/wiki/Ellen_DeGeneres', 5, 1, '2020-09-18 18:20:46.777109', NULL, 156),
     (157, 'fr', 'R??seaux sociaux', 'Avec  Instagram , on peut bien ??videmment prendre des photos, mais aussi r??aliser...', 'Une vid??o', 'Une pr??sentation', 'Un document texte', 'Une musique', 1, 'L''application et le service de partage  Instagram  ont ??t?? rachet??s par la soci??t??  Facebook  en 2012 pour plus d''un milliard de dollars.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 1, '2020-09-18 18:20:46.777109', NULL, 157),
     (158, 'fr', 'R??seaux sociaux', 'Quelle application de?? Twitter ??h??berge des vid??os??de 6 secondes tournant en boucle ?',  ' SoundCloud ', ' Instagram ', ' Vine ',' Viber ', 1, 'Comme sur  Twitter , il est possible d''accompagner son  Vine  d''une petite description ainsi que des mots-cl??s et de hashtag.', 'https://fr.wikipedia.org/wiki/Vine', 5, 1, '2020-09-18 18:20:46.777109', NULL, 158),
     (159, 'fr', 'R??seaux sociaux', '?? quel r??seau social am??ricain ??tes-vous accro si vous n''arr??tez pas de ??piner?? ?', ' Pinterest ', ' Tumblr ', ' Google + ', ' Facebook ', 1, ' Pinterest  propose ?? ses utilisateurs d''??pingler dans diff??rentes rubriques des images qui ont pu attirer leur attention.', 'https://fr.wikipedia.org/wiki/Pinterest', 5, 1, '2020-09-18 18:20:46.777109', NULL, 159),
     (160, 'fr', 'R??seaux sociaux', 'Quel r??seau social truste la premi??re place des r??seaux sociaux professionnels ?', ' LinkedIn ', ' Heeloo ', ' Movim ', ' Friendster ', 1, ' LinkedIn  constitue aujourd''hui un moyen efficace pour construire, d??velopper et enrichir son capital social.', 'https://fr.wikipedia.org/wiki/LinkedIn', 5, 1, '2020-09-18 18:20:46.777109', NULL, 160),
     (161, 'fr', 'R??seaux sociaux', 'Quel site communautaire tr??s actif est la source de nombreux documents post??s sur Internet ?', ' Lurker ',' Reddit ', ' Delicious ',  ' Twich ', 2, 'Le site  Reddit  est fort d''une communaut?? se retrouvant autour d''une culture propre ?? l''histoire du site.', 'https://fr.wikipedia.org/wiki/Reddit', 5, 2, '2020-09-18 18:20:46.777109', NULL, 161),
     (162, 'fr', 'R??seaux sociaux', 'Quel concurrent direct de  Snapchat  a ??t?? lanc?? par  Facebook  ?',' Private Messenger ',  ' Slingshot ', ' Whisper ', ' Facesnap ', 2, 'La particularit?? de cette application est l''existence d''une limite de temps de visualisation du m??dia envoy?? ?? ses destinataires.', 'https://fr.wikipedia.org/wiki/Snapchat', 5, 2, '2020-09-18 18:20:46.777109', NULL, 162),
     (163, 'fr', 'R??seaux sociaux', 'Fin 2014, combien d''utilisateurs comptait l''application  Instagram  depuis octobre 2010 ?', '200 millions', '300 millions', '100 millions', '400 millions', 2, 'En ao??t 2014, Instagram a lanc??  Hyperlapse , une application vid??o permettant de r??aliser des time-lapse.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 2, '2020-09-18 18:20:46.777109', NULL, 163),
     (164, 'fr', 'R??seaux sociaux', 'Quel ??tait en 2014 le pourcentage d''internautes fran??ais inscrits sur les r??seaux sociaux ?', '37??%', '65??%', '80??%', '50??%', 2, 'La  r??gle de 150  ou  nombre de Dunbar  affirme que la taille d''un r??seau social originel est limit?? ?? environ 150 membres.', 'https://fr.wikipedia.org/wiki/R??seau_social', 5, 2, '2020-09-18 18:20:46.777109', NULL, 164),
     (165, 'fr', 'R??seaux sociaux', 'En quelle ann??e a ??t?? fond??  Twitter , outil de microblogage g??r?? par l''entreprise Twitter Inc ?',  '2002', '2004', '2006','2008', 2, ' Twitter  a ??t?? cr???? ?? San Francisco au sein de la startup  Odeo  fond??e par Noah Glass et Evan Williams.', 'https://fr.wikipedia.org/wiki/Twitter', 5, 2, '2020-09-18 18:20:46.777109', NULL, 165),
     (166, 'fr', 'R??seaux sociaux', 'Quel m??dia social permet d''indiquer o?? l''on se trouve et de recommander des sorties ?', ' Foursquare ', ' Viadeo ', ' Piwie ', ' Kaki ', 2, 'L''aspect ludique de  Foursquare  vient du fait qu''il est possible ?? l''utilisateur de gagner des points et d''accumuler des badges.', 'https://fr.wikipedia.org/wiki/Foursquare', 5, 2, '2020-09-18 18:20:46.777109', NULL, 166),
     (167, 'fr', 'R??seaux sociaux', 'Quelle agence de renseignement, ??quivalent de la DGSE, a ouvert son compte  Twitter  en 2014 ?', 'CIA', 'MI6', 'NSA', 'KGB', 2, 'La CIA a influenc?? parfois de fa??on d??cisive l''histoire politique des ??tats dans lesquels elle est intervenue.', 'https://fr.wikipedia.org/wiki/Central_Intelligence_Agency', 5, 2, '2020-09-18 18:20:46.777109', NULL, 167),
     (168, 'fr', 'R??seaux sociaux', 'Qu''allez-vous ??changer si une Youtubeuse vous propose de faire un ??swap?? ?', 'Des messages',  'Des cadeaux','Des vid??os', 'Des blagues', 2, 'La plupart des vid??os du site ou les cha??nes YouTube peuvent ??tre visualis??es par tous les internautes.', 'https://fr.wikipedia.org/wiki/YouTube', 5, 2, '2020-09-18 18:20:46.777109', NULL, 168),
     (169, 'fr', 'R??seaux sociaux', 'Combien de photos sont environ partag??es chaque jour sur le r??seau  Instagram  ?',  '45 millions', '35 millions', '55 millions', '25 millions', 2, 'La publicit?? est un enjeu important pour  Instagram  et plus encore pour  Facebook , propri??taire du r??seau.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 2, '2020-09-18 18:20:46.777109', NULL, 169),
     (170, 'fr', 'R??seaux sociaux', 'Quelle plate-forme de microblogage accueille 300 millions de visiteurs uniques mensuels ?', ' Tumblr ', ' Reddit ', ' Tinder ', ' Pinterest ', 2, 'L''inscription sur Tumblr est gratuite et ne n??cessite qu''une adresse e-mail, un nom d''utilisateur et un mot de passe.', 'https://fr.wikipedia.org/wiki/Tumblr', 5, 2, '2020-09-18 18:20:46.777109', NULL, 170),
     (171, 'fr', 'R??seaux sociaux', 'Quel r??seau social cherche ?? s''adapter aux particularit??s culturelles de chaque pays ?', ' Viadeo ', ' Piwie ', ' Kaki ', ' Foursquare ', 3, 'Pour ses membres,  Viadeo  est aussi un outil de gestion de r??putation en ligne et de  personal branding .', 'https://fr.wikipedia.org/wiki/Viadeo', 5, 3, '2020-09-18 18:20:46.777109', NULL, 171),
     (172, 'fr', 'R??seaux sociaux', 'Pour combien de dollars  Facebook  a-t-il rachet?? l''application mobile  Whatsapp  ?', '19 milliards', '850 millions', '220 millions', '650 000', 3, ' Whatsapp  a ??t?? rachet?? par  Facebook  en f??vrier 2014 pour environ 19 milliards de dollars, dont 15 milliards en actions.', 'https://fr.wikipedia.org/wiki/WhatsApp', 5, 3, '2020-09-18 18:20:46.777109', NULL, 172),
     (173, 'fr', 'R??seaux sociaux', 'Quel ancien r??seau social made in France??se revendiquait comme ??tant LE tchat business ?',  ' Foursquare ', ' Viadeo ', ' Piwie ',' XING ', 3, ' Piwie  mettait en relation tous ceux qui souhaitaient cr??er une entreprise avec ceux qui cherchaient un associ??.', 'https://fr.wikipedia.org/wiki/R??seau_social', 5, 3, '2020-09-18 18:20:46.777109', NULL, 173),
     (174, 'fr', 'R??seaux sociaux', 'En 2014, quel lieu tr??s touristique a ??t?? le plus partag?? sur  Instagram  ?', 'Le Taj Mahal', 'Le Louvre', 'Time Square',  'Disneyland',3, ' Instagram  a subi de nombreuses critiques ?? cause de sa politique de censure, jug??e disproportionn??e.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 3, '2020-09-18 18:20:46.777109', NULL, 174),
     (175, 'fr', 'R??seaux sociaux', 'Quel ancien r??seau social aujourd''hui disparu ??tait orient?? 100??% geek et jeux vid??o ?', ' Piwie ', ' Kipi ', ' Foursquare ', ' Viadeo ', 3, 'De plus en plus de r??seaux sociaux privatifs se cr??ent sur le net, formant ainsi en quelque sorte des clubs  priv??s .', 'https://fr.wikipedia.org/wiki/R??seau_social', 5, 3, '2020-09-18 18:20:46.777109', NULL, 175);

-- 

INSERT INTO "quiz_has_subcategory" ("subcategory_id", "quizzes_id", "created_at", "id") VALUES 
    (11, 1, '2020-09-18 14:35:54.402069', 1),
    (11, 2, '2020-09-18 14:35:54.402069', 2),
    (11, 3, '2020-09-18 14:35:54.402069', 3),
    (11, 4, '2020-09-18 14:35:54.402069', 4),
    (11, 5, '2020-09-18 14:35:54.402069', 5),
    (11, 6, '2020-09-18 14:35:54.402069', 6),
    (11, 7, '2020-09-18 14:35:54.402069', 7),
    (11, 8, '2020-09-18 14:35:54.402069', 8),
    (11, 9, '2020-09-18 14:35:54.402069', 9),
    (11, 10, '2020-09-18 14:35:54.402069', 10),
    (11, 11, '2020-09-18 14:35:54.402069', 11),
    (11, 12, '2020-09-18 14:35:54.402069', 12),
    (11, 13, '2020-09-18 14:35:54.402069', 13),
    (11, 14, '2020-09-18 14:35:54.402069', 14),
    (11, 15, '2020-09-18 14:35:54.402069', 15),
    (11, 16, '2020-09-18 14:35:54.402069', 16),
    (11, 17, '2020-09-18 14:35:54.402069', 17),
    (11, 18, '2020-09-18 14:35:54.402069', 18),
    (11, 19, '2020-09-18 14:35:54.402069', 19),
    (11, 20, '2020-09-18 14:35:54.402069', 20),
    (11, 21, '2020-09-18 14:35:54.402069', 21),
    (11, 22, '2020-09-18 14:35:54.402069', 22),
    (11, 23, '2020-09-18 14:35:54.402069', 23),
    (11, 24, '2020-09-18 14:35:54.402069', 24),
    (11, 25, '2020-09-18 14:35:54.402069', 25),
    (11, 26, '2020-09-18 14:35:54.402069', 26),
    (11, 27, '2020-09-18 14:35:54.402069', 27),
    (11, 28, '2020-09-18 14:35:54.402069', 28),
    (11, 29, '2020-09-18 14:35:54.402069', 29),
    (11, 30, '2020-09-18 14:35:54.402069', 30),
    (12, 31, '2020-09-18 14:35:54.402069', 31),
    (12, 32, '2020-09-18 14:40:28.968446', 32),
    (12, 33, '2020-09-18 14:40:28.968446', 33),
    (12, 34, '2020-09-18 14:40:28.968446', 34),
    (12, 35, '2020-09-18 14:40:28.968446', 35),
    (12, 36, '2020-09-18 14:40:28.968446', 36),
    (12, 37, '2020-09-18 14:40:28.968446', 37),
    (12, 38, '2020-09-18 14:40:28.968446', 38),
    (12, 39, '2020-09-18 14:40:28.968446', 39),
    (12, 40, '2020-09-18 14:40:28.968446', 40),
    (12, 41, '2020-09-18 14:40:28.968446', 41),
    (12, 42, '2020-09-18 14:40:28.968446', 42),
    (12, 43, '2020-09-18 14:40:28.968446', 43),
    (12, 44, '2020-09-18 14:40:28.968446', 44),
    (12, 45, '2020-09-18 14:40:28.968446', 45),
    (12, 46, '2020-09-18 14:40:28.968446', 46),
    (12, 47, '2020-09-18 14:40:28.968446', 47),
    (12, 48, '2020-09-18 14:40:28.968446', 48),
    (12, 49, '2020-09-18 14:40:28.968446', 49),
    (12, 50, '2020-09-18 14:40:28.968446', 50),
    (12, 51, '2020-09-18 14:40:28.968446', 51),
    (12, 52, '2020-09-18 14:40:28.968446', 52),
    (12, 53, '2020-09-18 14:40:28.968446', 53),
    (12, 54, '2020-09-18 14:40:28.968446', 54),
    (12, 55, '2020-09-18 14:40:28.968446', 55),
    (12, 56, '2020-09-18 14:40:28.968446', 56),
    (12, 57, '2020-09-18 14:40:28.968446', 57),
    (12, 58, '2020-09-18 14:40:28.968446', 58),
    (12, 59, '2020-09-18 14:40:28.968446', 59),
    (12, 60, '2020-09-18 14:40:28.968446', 60),
    (16, 61, '2020-09-18 14:44:07.69807', 61),
    (16, 62, '2020-09-18 14:44:07.69807', 62),
    (16, 63, '2020-09-18 14:44:07.69807', 63),
    (16, 64, '2020-09-18 14:44:07.69807', 64),
    (16, 65, '2020-09-18 14:44:07.69807', 65),
    (16, 66, '2020-09-18 14:44:07.69807', 66),
    (16, 67, '2020-09-18 14:44:07.69807', 67),
    (16, 68, '2020-09-18 14:44:07.69807', 68),
    (16, 69, '2020-09-18 14:44:07.69807', 69),
    (16, 70, '2020-09-18 14:44:07.69807', 70),
    (16, 71, '2020-09-18 14:44:07.69807', 71),
    (16, 72, '2020-09-18 14:44:07.69807', 72),
    (16, 73, '2020-09-18 14:44:07.69807', 73),
    (16, 74, '2020-09-18 14:44:07.69807', 74),
    (16, 75, '2020-09-18 14:44:07.69807', 75),
    (16, 76, '2020-09-18 14:44:07.69807', 76),
    (16, 77, '2020-09-18 14:44:07.69807', 77),
    (16, 78, '2020-09-18 14:44:07.69807', 78),
    (16, 79, '2020-09-18 14:44:07.69807', 79),
    (16, 80, '2020-09-18 14:44:07.69807', 80),
    (16, 81, '2020-09-18 14:44:07.69807', 81),
    (16, 82, '2020-09-18 14:44:07.69807', 82),
    (16, 83, '2020-09-18 14:44:07.69807', 83),
    (16, 84, '2020-09-18 14:44:07.69807', 84),
    (16, 85, '2020-09-18 14:44:07.69807', 85),
    (16, 86, '2020-09-18 14:44:07.69807', 86),
    (16, 87, '2020-09-18 14:44:07.69807', 87),
    (16, 88, '2020-09-18 14:44:07.69807', 88),
    (16, 89, '2020-09-18 14:44:07.69807', 89),
    (16, 90, '2020-09-18 14:44:07.69807', 90),
    (20, 91, '2020-09-18 15:00:32.242722', 91),
    (20, 92, '2020-09-18 15:00:32.242722', 92),
    (20, 93, '2020-09-18 15:00:32.242722', 93),
    (20, 94, '2020-09-18 15:00:32.242722', 94),
    (20, 95, '2020-09-18 15:00:32.242722', 95),
    (20, 96, '2020-09-18 15:00:32.242722', 96),
    (20, 97, '2020-09-18 15:00:32.242722', 97),
    (20, 98, '2020-09-18 15:00:32.242722', 98),
    (20, 99, '2020-09-18 15:00:32.242722', 99),
    (20, 100, '2020-09-18 15:00:32.242722', 100),
    (20, 101, '2020-09-18 16:01:10.860299', 101),
    (20, 102, '2020-09-18 16:01:10.860299', 102),
    (20, 103, '2020-09-18 16:01:10.860299', 103),
    (20, 104, '2020-09-18 16:01:10.860299', 104),
    (20, 105, '2020-09-18 16:01:10.860299', 105),
    (20, 106, '2020-09-18 16:01:10.860299', 106),
    (20, 107, '2020-09-18 16:01:10.860299', 107),
    (20, 108, '2020-09-18 16:01:10.860299', 108),
    (20, 109, '2020-09-18 16:01:10.860299', 109),
    (20, 110, '2020-09-18 16:01:10.860299', 110),
    (20, 111, '2020-09-18 16:01:10.860299', 111),
    (20, 112, '2020-09-18 16:01:10.860299', 112),
    (20, 113, '2020-09-18 16:01:10.860299', 113),
    (20, 114, '2020-09-18 16:01:10.860299', 114),
    (20, 115, '2020-09-18 16:01:10.860299', 115),
    (20, 116, '2020-09-18 16:01:10.860299', 116),
    (20, 117, '2020-09-18 16:01:10.860299', 117),
    (20, 118, '2020-09-18 16:01:10.860299', 118),
    (20, 119, '2020-09-18 16:01:10.860299', 119),
    (20, 120, '2020-09-18 16:01:10.860299', 120),
    (25, 121, '2020-09-18 18:06:09.997789', 121),
    (25, 122, '2020-09-18 18:09:49.90753', 122),
    (25, 123, '2020-09-18 18:09:49.90753', 123),
    (25, 124, '2020-09-18 18:09:49.90753', 124),
    (25, 125, '2020-09-18 18:09:49.90753', 125),
    (25, 126, '2020-09-18 18:09:49.90753', 126),
    (25, 127, '2020-09-18 18:09:49.90753', 127),
    (25, 128, '2020-09-18 18:09:49.90753', 128),
    (25, 129, '2020-09-18 18:09:49.90753', 129),
    (25, 130, '2020-09-18 18:09:49.90753', 130),
    (25, 131, '2020-09-18 18:09:49.90753', 131),
    (25, 132, '2020-09-18 18:09:49.90753', 132),
    (25, 133, '2020-09-18 18:09:49.90753', 133),
    (25, 134, '2020-09-18 18:09:49.90753', 134),
    (25, 135, '2020-09-18 18:09:49.90753', 135),
    (25, 136, '2020-09-18 18:09:49.90753', 136),
    (25, 137, '2020-09-18 18:09:49.90753', 137),
    (25, 138, '2020-09-18 18:09:49.90753', 138),
    (25, 139, '2020-09-18 18:09:49.90753', 139),
    (25, 140, '2020-09-18 18:09:49.90753', 140),
    (25, 141, '2020-09-18 18:09:49.90753', 141),
    (25, 142, '2020-09-18 18:09:49.90753', 142),
    (25, 143, '2020-09-18 18:09:49.90753', 143),
    (25, 144, '2020-09-18 18:09:49.90753', 144),
    (25, 145, '2020-09-18 18:09:49.90753', 145),
    (25, 146, '2020-09-18 18:09:49.90753', 146),
    (25, 147, '2020-09-18 18:09:49.90753', 147),
    (25, 148, '2020-09-18 18:09:49.90753', 148),
    (25, 149, '2020-09-18 18:09:49.90753', 149),
    (25, 150, '2020-09-18 18:09:49.90753', 150),
    (28, 151, '2020-09-18 19:01:22.735487', 151),
    (28, 152, '2020-09-18 19:04:17.354219', 152),
    (28, 153, '2020-09-18 19:04:17.354219', 153),
    (28, 154, '2020-09-18 19:04:17.354219', 154),
    (28, 155, '2020-09-18 19:04:17.354219', 155),
    (28, 156, '2020-09-18 19:04:17.354219', 156),
    (28, 157, '2020-09-18 19:04:17.354219', 157),
    (28, 158, '2020-09-18 19:04:17.354219', 158),
    (28, 159, '2020-09-18 19:04:17.354219', 159),
    (28, 160, '2020-09-18 19:04:17.354219', 160),
    (28, 161, '2020-09-18 19:04:17.354219', 161),
    (28, 162, '2020-09-18 19:04:17.354219', 162),
    (28, 163, '2020-09-18 19:04:17.354219', 163),
    (28, 164, '2020-09-18 19:04:17.354219', 164),
    (28, 165, '2020-09-18 19:04:17.354219', 165),
    (28, 166, '2020-09-18 19:04:17.354219', 166),
    (28, 167, '2020-09-18 19:04:17.354219', 167),
    (28, 168, '2020-09-18 19:04:17.354219', 168),
    (28, 169, '2020-09-18 19:04:17.354219', 169),
    (28, 170, '2020-09-18 19:04:17.354219', 170),
    (28, 171, '2020-09-18 19:04:17.354219', 171),
    (28, 172, '2020-09-18 19:04:17.354219', 172),
    (28, 173, '2020-09-18 19:04:17.354219', 173),
    (28, 174, '2020-09-18 19:04:17.354219', 174),
    (28, 175, '2020-09-18 19:04:17.354219', 175),
    (28, 176, '2020-09-18 19:04:17.354219', 176),
    (28, 177, '2020-09-18 19:04:17.354219', 177),
    (28, 178, '2020-09-18 19:04:17.354219', 178),
    (28, 179, '2020-09-18 19:04:17.354219', 179),
    (28, 180, '2020-09-18 19:04:17.354219', 180),
    (8, 181, '2020-09-18 21:54:12.248452', 181),
    (8, 182, '2020-09-18 21:54:12.248452', 182),
    (8, 183, '2020-09-18 21:54:12.248452', 183),
    (8, 184, '2020-09-18 21:54:12.248452', 184),
    (8, 185, '2020-09-18 21:54:12.248452', 185),
    (8, 186, '2020-09-18 21:54:12.248452', 186),
    (8, 187, '2020-09-18 21:54:12.248452', 187),
    (8, 188, '2020-09-18 21:54:12.248452', 188),
    (8, 189, '2020-09-18 21:54:12.248452', 189),
    (8, 190, '2020-09-18 21:54:12.248452', 190),
    (8, 191, '2020-09-18 21:54:12.248452', 191),
    (8, 192, '2020-09-18 21:54:12.248452', 192),
    (8, 193, '2020-09-18 21:54:12.248452', 193),
    (8, 194, '2020-09-18 21:54:12.248452', 194),
    (8, 195, '2020-09-18 21:54:12.248452', 195),
    (8, 196, '2020-09-18 21:54:12.248452', 196),
    (8, 197, '2020-09-18 21:54:12.248452', 197),
    (8, 198, '2020-09-18 21:54:12.248452', 198),
    (8, 199, '2020-09-18 21:54:12.248452', 199),
    (8, 200, '2020-09-18 21:54:12.248452', 200),
    (8, 201, '2020-09-18 21:54:12.248452', 201),
    (8, 202, '2020-09-18 21:54:12.248452', 202),
    (8, 203, '2020-09-18 21:54:12.248452', 203),
    (8, 204, '2020-09-18 21:54:12.248452', 204),
    (8, 205, '2020-09-18 21:54:12.248452', 205),
    (8, 206, '2020-09-18 21:54:12.248452', 206),
    (8, 207, '2020-09-18 21:54:12.248452', 207),
    (8, 208, '2020-09-18 21:54:12.248452', 208),
    (8, 209, '2020-09-18 21:54:12.248452', 209),
    (8, 210, '2020-09-18 21:54:12.248452', 210),
    (5, 211, '2020-09-18 22:23:50.090147', 211),
    (5, 212, '2020-09-18 22:23:50.090147', 212),
    (5, 213, '2020-09-18 22:23:50.090147', 213),
    (5, 214, '2020-09-18 22:23:50.090147', 214),
    (5, 215, '2020-09-18 22:23:50.090147', 215),
    (5, 216, '2020-09-18 22:23:50.090147', 216),
    (5, 217, '2020-09-18 22:23:50.090147', 217),
    (5, 218, '2020-09-18 22:23:50.090147', 218),
    (5, 219, '2020-09-18 22:23:50.090147', 219),
    (5, 220, '2020-09-18 22:23:50.090147', 220),
    (5, 221, '2020-09-18 22:23:50.090147', 221),
    (5, 222, '2020-09-18 22:23:50.090147', 222),
    (5, 223, '2020-09-18 22:23:50.090147', 223),
    (5, 224, '2020-09-18 22:23:50.090147', 224),
    (5, 225, '2020-09-18 22:23:50.090147', 225),
    (5, 226, '2020-09-18 22:23:50.090147', 226),
    (5, 227, '2020-09-18 22:23:50.090147', 227),
    (5, 228, '2020-09-18 22:23:50.090147', 228),
    (5, 229, '2020-09-18 22:23:50.090147', 229),
    (5, 230, '2020-09-18 22:23:50.090147', 230),
    (5, 231, '2020-09-18 22:23:50.090147', 231),
    (5, 232, '2020-09-18 22:23:50.090147', 232),
    (5, 233, '2020-09-18 22:23:50.090147', 233),
    (5, 234, '2020-09-18 22:23:50.090147', 234),
    (5, 235, '2020-09-18 22:23:50.090147', 235),
    (5, 236, '2020-09-18 22:23:50.090147', 236),
    (5, 237, '2020-09-18 22:23:50.090147', 237),
    (5, 238, '2020-09-18 22:23:50.090147', 238),
    (5, 239, '2020-09-18 22:23:50.090147', 239),
    (5, 240, '2020-09-18 22:23:50.090147', 240),
    (31, 241, '2020-09-18 23:20:58.932687', 241),
    (31, 242, '2020-09-18 23:20:58.932687', 242),
    (31, 243, '2020-09-18 23:20:58.932687', 243),
    (31, 244, '2020-09-18 23:20:58.932687', 244),
    (31, 245, '2020-09-18 23:20:58.932687', 245),
    (31, 246, '2020-09-18 23:20:58.932687', 246),
    (31, 247, '2020-09-18 23:20:58.932687', 247),
    (31, 248, '2020-09-18 23:20:58.932687', 248),
    (31, 249, '2020-09-18 23:20:58.932687', 249),
    (31, 250, '2020-09-18 23:20:58.932687', 250),
    (31, 251, '2020-09-18 23:20:58.932687', 251),
    (31, 252, '2020-09-18 23:20:58.932687', 252),
    (31, 253, '2020-09-18 23:20:58.932687', 253),
    (31, 254, '2020-09-18 23:20:58.932687', 254),
    (31, 255, '2020-09-18 23:20:58.932687', 255),
    (31, 256, '2020-09-18 23:20:58.932687', 256),
    (31, 257, '2020-09-18 23:20:58.932687', 257),
    (31, 258, '2020-09-18 23:20:58.932687', 258),
    (31, 259, '2020-09-18 23:20:58.932687', 259),
    (31, 260, '2020-09-18 23:20:58.932687', 260),
    (31, 261, '2020-09-18 23:20:58.932687', 261),
    (31, 262, '2020-09-18 23:20:58.932687', 262),
    (31, 263, '2020-09-18 23:20:58.932687', 263),
    (31, 264, '2020-09-18 23:20:58.932687', 264),
    (31, 265, '2020-09-18 23:20:58.932687', 265),
    (31, 266, '2020-09-18 23:20:58.932687', 266),
    (31, 267, '2020-09-18 23:20:58.932687', 267),
    (31, 268, '2020-09-18 23:20:58.932687', 268),
    (31, 269, '2020-09-18 23:20:58.932687', 269),
    (31, 270, '2020-09-18 23:20:58.932687', 270);


--

INSERT INTO "subcategory" ("id", "title", "created_at", "updated_at", "color") VALUES 
 (1, 'Animaux c??l??bres', '2020-09-18 13:46:45.987518', NULL, '#511515'),
 (5, 'Princesses Disney', '2020-09-18 13:46:45.987518', NULL, '#bd7ec9'),
 (7, 'Com??dies Fran??aises', '2020-09-18 13:46:45.987518', NULL, '#c14040'),
 (8, 'H??ros de Star Wars', '2020-09-18 13:46:45.987518', NULL, '#081214'),
 (11, 'Animaux en vrac', '2020-09-18 13:46:45.987518', NULL, '#02354d'),
 (12, 'Les Fourmis', '2020-09-18 13:46:45.987518', NULL, '#160505'),
 (16, 'Villes du Monde', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (20, 'Boissons sans alcool', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (25, 'Stades de Ligue 1', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (28, 'R??seaux sociaux', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (31, 'T??l?? r??alit??', '2020-09-18 13:46:45.987518', NULL, '#327bf6');

--

INSERT INTO "tag" ("id", "title", "color", "created_at", "updated_at") VALUES 
    (1, 'Animaux', '#e2e537', '2020-09-18 12:04:53.17534', NULL),
    (2, 'G??ographie', '#43a536', '2020-09-18 12:04:53.17534', NULL),
    (3, 'Gastronomie', '#e5af44', '2020-09-18 12:04:53.17534', NULL),
    (4, 'Sports', '#3551a3', '2020-09-18 12:04:53.17534', NULL),
    (6, 'Cin??ma', '#449de5', '2020-09-18 12:04:53.17534', NULL),
    (7, 'Cin??ma pour enfants', '#ef8bdd', '2020-09-18 12:04:53.17534', NULL),
    (8, 'T??l??vision', '#38aa95', '2020-09-18 12:22:09.794955', NULL),
    (5, 'Soci??t??', '#b4bbc4', '2020-09-18 12:04:53.17534', NULL);

-- 

SELECT pg_catalog.setval('public.score_id_seq', 24, true);


SELECT pg_catalog.setval('public.quiz_answer_id_seq', 270, true);


SELECT pg_catalog.setval('public.quiz_has_subcategory_id_seq', 270, true);


SELECT pg_catalog.setval('public.quiz_id_seq', 270, true);


SELECT pg_catalog.setval('public.subcategory_id_seq', 34, true);


SELECT pg_catalog.setval('public.users_id_seq', 1, false);



ALTER TABLE "answer"
    ADD CONSTRAINT "answer_pkey" PRIMARY KEY (id);

--

ALTER TABLE "quiz_has_subcategory"
    ADD CONSTRAINT "quiz_has_subcategory_pkey "PRIMARY KEY (id);

--

ALTER TABLE "subcategory"
    ADD CONSTRAINT "subcategory_pkey" PRIMARY KEY (id);

--

ALTER TABLE "users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY (id);

--

ALTER TABLE "quiz_has_subcategory"
    ADD CONSTRAINT "quiz_has_subcategory_quizzes_id_fkey" FOREIGN KEY ("quizzes_id") REFERENCES "quiz"(id);

--

ALTER TABLE "quiz_has_subcategory"
    ADD CONSTRAINT "quiz_has_subcategory_subcategory_id_fkey " FOREIGN KEY ("subcategory_id") REFERENCES "subcategory" (id);

COMMIT;