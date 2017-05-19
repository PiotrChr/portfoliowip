
--
-- Table structure for table `bio`
--

CREATE TABLE IF NOT EXISTS `bio` (
  `id` int(11) NOT NULL,
  `title_en` varchar(100) CHARACTER SET utf8 NOT NULL,
  `content_en` text CHARACTER SET utf8 NOT NULL,
  `content_de` text CHARACTER SET utf8 NOT NULL,
  `content_pl` text CHARACTER SET utf8 NOT NULL,
  `title_de` varchar(100) CHARACTER SET utf8 NOT NULL,
  `title_pl` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin2;

--
-- Dumping data for table `bio`
--

INSERT INTO `bio` (`id`, `title_en`, `content_en`, `content_de`, `content_pl`, `title_de`, `title_pl`) VALUES
(4, 'General overview', '<p>My name is Piotr Chrusciel and I specialize in making aesthetic websites and applications based on HTML5 mark-up and CSS3 style sheets compatible with W3C standards. All my sites are hand coded thoroughly and with passion. For further development I use such programming languages as PHP, MySQL and Ajax, and since introduction of JQuery, I&#x27;m just in love with possibilities and simplicity that is coming with this JavaScript library.\r\n</p><p>\r\nFor designing the interfaces my &#x22;weapons of choice&#x22; are mostly Adobe Photoshop and Blender3d. I was using also Flash with its ActionScript, but since JQuery I don&#x27;t see a need anymore.</p>', '<p>Mein Name ist Piotr Chrusciel und ich bin Experte in der Erstellung HTML5-basierter &#xE4;sthetischer Webseiten und Applikationen sowie CSS3-Formatvorlagen, die mit W3C Standards kompatibel sind. Alle meine Seiten sind sorgf&#xE4;ltig und mit Leidenschaft von Hand kodiert. Im Hinblick auf eine Weiterentwicklung benutze ich Programmiersprachen wie PHP, MySQL und Ajax. Seit der Einf&#xFC;hrung von JQuery bin ich begeistert von den M&#xF6;glichkeiten und der Einfachheit, die diese JavaScript-Bibliothek mit sich bringt.</p><p>\r\n\r\nMeine Instrumente um die Schnittstellen zu entwerfen sind &#xFC;berwiegend Adobe Photoshop und Blender3d. Ich habe au&#xDF;erdem Flash und sein ActionScript benutzt, jedoch sehe ich seit JQuery darin keinen Nutzen mehr.</p>', 'content pl', 'Allgemeine &#xDC;bersicht', 'tytul pl'),
(5, 'Philosophy', '<p>I was always impressed by simplicity of Apple and Jonathan Ive&#x27;s designs therefore I always try to make my designs that way. Since CSS3 is using alpha channels, gradients and other useful methods, when I have an opportunity I prefer using it without any help from external images.\r\nI believe in simplicity and aesthetics, but first of all I believe in content.\r\n</p>', '<p>\r\nIch war schon immer fasziniert von der Schlichtheit von Apple und Jonathan Ive&#x27;s Designs. Daher habe ich stets versucht, meine Entw&#xFC;rfe auf diese Weise zu erstellen. Seit CSS3 Alpha Channels, Gradienten und andere n&#xFC;tzliche Methoden verwendet, bevorzuge ich, wenn m&#xF6;glich, deren Nutzung ohne die Hilfe externer Bilder. Ich glaube an Schlichtheit und &#xC4;sthetik, vor allem aber glaube ich an Inhalt.\r\n</p>', 'content pl', 'Philosophie', 'tytul pl'),
(6, 'Longform biography in 3rd person', '<p>For Piotr, interests with IT and Web technology appeared in early middle school. Curious about how the web works he started to gain knowledge about how to make a working website by his own. First, using premade templates, slowly understanding how the markup language works. After a year he took a part in competition for a school&#x27;s patron website, from which he got commendation. In the next years his further development gave him opportunity to work as an apprentice for Henkel Polska with the main computer scientist. He was designing and managing there databases based on MySQL, using mostly PHP, HTML and CSS.\r\n</p><p>\r\nIn the meantime he took various part time jobs on the place and as well abroad (i.e. Netherlands), most of the time working physically. After graduation in 2006, he moved to Cracow (PL) and began studies on University of Science and Technology with &#x22;Computer Science in Engineering&#x22; major. In this time he took notice for Apple hardware and software technology. He was amazed of its aesthetics and functionality and soon after he bought himself a new Macbook. Although expensive, he thinks till this day, it was the best spent money he ever had. In the &#x27;turbulent&#x27;, study period of his life he started to work as a web developer officially, as a freelancer. He made several web sites, applications, portals, phpBB based forums and many other.\r\n</p><p>\r\nMeanwhile, the introduction of HTML5 and JQuery had made a strong impact on the web development foundation. Aware of its possibilities he started to learn new markup and JavaScript library syntax. In 2010 he got a job in the &#x22;Kraken diving center&#x22; as main scientist. He was managing there existing database, and portal framework and as well hardware and software issues. While not be able to finish studies due to financial problems he finally moved near Brunswick (Braunschweig DE) in September 2012.\r\n</p><p>\r\nAll this with Pink Floyd, Doors, Hendrix, guitar and basketball accompaniment.</p>', '<p>Piotrs interesse an IT- und Web-Technologie wurde in den fr&#xFC;hen Jahren des Gymnasiums geweckt. Neugierig, wie das Internet funktioniert, begann er, sich selbst das Wissen dar&#xFC;ber wie man eine funktionierende Webseite erstellt anzueignen. Zun&#xE4;chst erarbeitet er sich allm&#xE4;hlich das Verst&#xE4;ndnis &#xFC;ber die Arbeitsweise von Mark-up Sprachen, indem er vorgefertigte Templates benutzte. Nahc einem Jahr nahm er an einem Wettbewerb f&#xFC;r eine Schul-Webseite teil, f&#xFC;r die er gro&#xDF;es Lob erntete. In den n&#xE4;chsten Jahren erlaubte ihm seine au&#xDF;ergew&#xF6;hnliche Entwicklung die M&#xF6;glichkeit als ein Praktikant bei der Firma Henkel Polen mit deren Chefprogrammierer zusammenzuarbeiten. Hier entwarf und programmierte er MySQL-basierte Datenbanken unter Nutzung von zumeist PHP, HTML und CSS.\r\n</p><p>\r\nMittlerweile arbeitet er in einigen Teilzeitjobs in Polen sowie im Ausland (z. B. in den Niederlanden). Nach dem Abitur im Jahr 2006 zog er nach Krakau und begann sein Studium an der Universit&#xE4;t f&#xFC;r Wissenschaft und Technologie mit dem Hauptfach Informatik im Ingenieurwesen. Hier wurde seine Aufmerksamkeit erstmals auf Apple Hard- und Software gelenkt. Piotr war angetan von dessen &#xC4;sthetik und Funktionalit&#xE4;t und kurz darauf kaufte er sich sein erstes Macbook. Obwohl teuer, ist er bis heute davon &#xFC;berzeugt, dass dies die sinnvollste Investition seines Lebens war. W&#xE4;hrend der turbulenten Studienzeit begann er seine T&#xE4;tigkeit als freier Webentwickler. Er erstellte zahlreiche Webseiten, Applikationen, Portale, phpBB-basierte Foren und vieles mehr.\r\n</p><p>\r\nMittlerweile hat die Einf&#xFC;hrung von HTML5 und JQuery einen gro&#xDF;en Einfluss auf die Webentwicklung. Dessen M&#xF6;glichkeiten bewusst, begann er das neue Markup und JavaScript Bibliothek Syntax zu lernen. 2010 bekam Piotr eine Anstellung im &#x201E;Kraken Tauchzentrum&#x201C; als Hauptentwickler. Er betreute existierende Datenbanken sowie Portal Framework und k&#xFC;mmerte sich um s&#xE4;mtliche Hard- und Softwarebelange. Aus finanziellen Gr&#xFC;nden musste er sein Studium abbrechen und zog im September 2012 in die N&#xE4;he von Braunschweig, begleitet von Pink Floyd, Doors, Hendrix, Gitarre und Basketball.</p>', 'content pl', 'Ausf&#xFC;hrlicher Lebenslauf', 'longform');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL,
  `entry` varchar(100) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `title_en` varchar(100) NOT NULL,
  `title_de` varchar(100) NOT NULL,
  `title_pl` varchar(100) NOT NULL,
  `content_de` text NOT NULL,
  `content_en` text NOT NULL,
  `content_pl` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `entry`, `time`, `date`, `title_en`, `title_de`, `title_pl`, `content_de`, `content_en`, `content_pl`) VALUES
(1, 'News', '13:13:16', '0000-00-00', 'Begginnings', '', '', '<p>\r\nNunc convallis laoreet massa ut varius. Vivamus nec congue turpis, ut egestas ex. Aliquam at dui non risus euismod vehicula vitae ut nibh. Aenean eu pellentesque mi. Donec dictum libero est, nec pharetra lorem ultrices sed. Integer eu massa laoreet nisl euismod mollis. Donec ultricies tristique tincidunt. Donec nec quam et est faucibus malesuada.\r\n</p>', '<p>\r\nVivamus eu odio eu massa aliquet dapibus at ut ipsum. Nunc augue magna, interdum sit amet tortor ac, tincidunt faucibus erat. Sed ullamcorper, sem vel tempus facilisis, risus lorem vulputate diam, in aliquam diam quam eu libero. Duis facilisis urna eu venenatis molestie. Etiam viverra pharetra risus non dignissim. Mauris feugiat pellentesque odio. Etiam at massa leo. Proin sed suscipit augue. Ut ut egestas lacus. Sed efficitur dui sit amet ipsum tristique, eu tempus eros pulvinar. Donec pellentesque mi sit amet purus pharetra sagittis. Ut eget ullamcorper elit, vel scelerisque neque.\r\n</p>', '<p>\r\nDonec lacinia consectetur ante, lobortis lacinia lectus luctus ac. Sed dictum erat quis tellus malesuada, vel tempus lectus molestie. Duis et turpis aliquam, tristique arcu mollis, dapibus sapien. Mauris sollicitudin eros dolor, tempor faucibus erat fermentum ac. Nullam consequat a odio quis hendrerit. Sed semper faucibus sapien ut ultrices. Praesent interdum iaculis libero a iaculis. Sed dignissim rhoncus massa ut fermentum. Quisque quis dignissim erat. Ut enim felis, sodales finibus volutpat in, pharetra at tortor.\r\n</p>'),
(2, 'new script', '09:29:41', '0000-00-00', 'New Title', '', '', 'Some content in DE', 'Some content in En', 'Some content in PL');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `workId` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin2;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `fileName`, `workId`) VALUES
(1, 'Hello world', 'onlinebusiness1.png', 1),
(2, 'Hello world 2', 'onlinebusiness2.png', 1),
(3, 'Hello man', 'onlinebusiness3.png', 1),
(4, 'hello', 'd&dit1.png', 2),
(5, 'hello', 'd&dit2.png', 2),
(6, 'hello', 'd&dit3.png', 2),
(7, 'hello', 'd&dit4.png', 2),
(8, 'hello', 'd&dit5.png', 2),
(9, 'hello', 'sjauto1.png', 3),
(10, 'hello', 'sjauto2.png', 3),
(11, 'hello', 'sjauto3.png', 3),
(12, 'hello', 'sjauto4.png', 3),
(13, 'hello', 'nowodworski1.png', 4),
(14, 'hello', 'nowodworski2.png', 4),
(15, 'hello', 'nowodworski3.png', 4),
(16, 'hello', 'nowodworski4.png', 4),
(17, 'hello', 'irenagajewska1.png', 5),
(18, 'hello', 'irenagajewska2.png', 5),
(19, 'hello', 'pytony1.png', 6),
(20, 'hello', 'pytony2.png', 6),
(21, 'hello', 'pytony3.png', 6),
(22, 'hello', 'pytony4.png', 6),
(23, 'hello', 'danuta1.png', 7),
(24, 'hello', 'danuta2.png', 7),
(25, 'hello', 'other1.png', 8),
(26, 'hello', 'other2.png', 8);

-- --------------------------------------------------------

--
-- Table structure for table `scripts`
--

CREATE TABLE IF NOT EXISTS `scripts` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(100) NOT NULL,
  `techniques` varchar(100) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `description_en` text NOT NULL,
  `description_de` text NOT NULL,
  `description_pl` text NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scripts`
--

INSERT INTO `scripts` (`id`, `title`, `subtitle`, `techniques`, `thumbnail`, `description_en`, `description_de`, `description_pl`, `link`) VALUES
(1, 'New script', 'script subtitle', 'php,js,mysql', 'thumbnail.png', 'description in en', 'description in de', 'description in pl', 'www.google.pl'),
(2, 'New script', 'script subtitle', 'php,js,mysql', 'thumbnail.png', 'description in en', 'description in de', 'description in pl', 'www.google.pl'),
(3, 'New script', 'script subtitle', 'php,js,mysql', 'thumbnail.png', 'description in en', 'description in de', 'description in pl', 'www.google.pl'),
(4, 'New script', 'script subtitle', 'php,js,mysql', 'thumbnail.png', 'description in en', 'description in de', 'description in pl', 'www.google.pl');

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `id` int(11) NOT NULL,
  `title_en` varchar(100) NOT NULL,
  `title_de` varchar(100) NOT NULL,
  `title_pl` varchar(100) NOT NULL,
  `content_en` text NOT NULL,
  `content_de` text NOT NULL,
  `content_pl` text NOT NULL,
  `main_image` varchar(100) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin2;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`id`, `title_en`, `title_de`, `title_pl`, `content_en`, `content_de`, `content_pl`, `main_image`, `time`) VALUES
(1, 'Orcadian Online Business', '', '', 'content in en', 'content in german', 'content in polish', 'onlinebusiness1.png', '2015-02-17 07:10:11'),
(2, 'D&D IT Ltd.', 'D&D IT Ltd.', 'D&D IT Ltd.', 'content in en', 'content in de', 'content in pl', 'd&dit2.png', '2015-02-23 06:33:27'),
(3, 'the sjAuto', 'the sjAuto', 'the sjAuto', ' <p class="languages"><span>languages: </span><span>php, mysql, html, jquery, css, ajax</span></p>\n            <p class="resources"><span>resources: </span> <span>stock images</span></p>\n            <p class="work_content">Motorization portal for NL client. Never finished. I used here some registration methods, account validation, pm senders and many other like. Effects are based on jquery, links go through ajax requests.</p>', 'content de', 'content pl', 'sjauto1.png', '2015-02-23 07:16:15'),
(4, 'Nowodworski Estates', 'Nowodworski Estates', 'Nowodworski Estates', '<p class="languages"><span>languages: </span><span>php, mysql, css, jquery, json, html</span></p>\n            <p class="resources"><span>resources: </span> <span>stack images, client images, tinyMCE rich text editor, cu3ox flash image slider</span></p>\n            <p class="work_content">Website for polish estate agency "Nowodworski Estates". Site + custom CMS.\n\n</p>', 'content de', 'content pl', 'nowodworski1.png', '2015-02-19 09:00:25'),
(5, 'Irena Gajewska', 'Irena Gajewska', 'Irena Gajewska', 'content en', 'content de', 'content pl', 'irenagajewska2.png', '2015-02-23 12:29:15'),
(6, 'pytony.com.pl', 'pytony.com.pl', 'pytony.com.pl', '<p class="languages"><span>languages: </span><span>php, mysql, html, \njquery, css, ajax</span></p>\n            <p class="resources"><strong>resources: </strong> <span>clients images, rich text \neditor, json file uploader</span></p>\n            <p class="work_content">Simple website about snakes. Made off charge for my friend. \nI used here html, css, jquery, ajax, php, mysql.\nSite came with customly designed for this project. For smooth work, I have used there ajax for content upload, rich text editors and json multiple file uplaoad.\n</p>', 'content de', 'content pl', 'pytony1.png', '2015-02-18 07:19:20'),
(7, 'Danuta C. website', 'Danuta C. website', 'Danuta C. website', '<p class="languages"><span>languages: </span><span>php, html5, css3, javscript, ajax, json</span></p>\n            <p class="resources"><span>resources: </span> <span>stock images, private images, </span></p>\n            <p class="work_content">Personal homepage made for my mother. She''s professional linguist. Master degree germanist and polonist. \nFor the project, jquery UI came with great help here. I fell in love with easing funcitons.</p>', 'content de', 'content pl', 'danuta1.png', '2015-02-10 12:30:00'),
(8, 'other projects & ''wip''', 'other projects & ''wip''', 'other projects & ''wip''', '\n            <p class="languages"><span>languages: </span><span>none</span></p>\n            <p class="resources"><span>resources: </span> <span>various</span></p>\n            <p class="work_content">Other projects made in Photoshop and Blender3d. \n\n</p>\n', 'content de', 'content pl', 'other2.png', '2015-02-11 09:22:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bio`
--
ALTER TABLE `bio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scripts`
--
ALTER TABLE `scripts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bio`
--
ALTER TABLE `bio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `scripts`
--
ALTER TABLE `scripts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
