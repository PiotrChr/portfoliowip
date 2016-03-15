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
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bio`
--
ALTER TABLE `bio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `workId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `scripts`
--
ALTER TABLE `scripts`
ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `scripts`
--
ALTER TABLE `scripts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `work`
--
ALTER TABLE `work`
ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
