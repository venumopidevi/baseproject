-- 
-- Structure for table `AuthAssignment`
-- 

DROP TABLE IF EXISTS `AuthAssignment`;
CREATE TABLE IF NOT EXISTS `AuthAssignment` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `AuthAssignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Data for table `AuthAssignment`
-- 

INSERT INTO `AuthAssignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
  ('Admin', '1', NULL, 'N;'),
  ('Admin', '14', '', 'N;'),
  ('Author', '2', '', 'N;'),
  ('Editor', '2', NULL, 'N;'),
  ('Member', '13', '', 'N;'),
  ('task_roles', '1', '', 'N;'),
  ('task_roles', '13', '', 'N;'),
  ('task_roles', '14', '', 'N;'),
  ('task_roles', '2', '', 'N;');

-- 
-- Structure for table `AuthItem`
-- 

DROP TABLE IF EXISTS `AuthItem`;
CREATE TABLE IF NOT EXISTS `AuthItem` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Data for table `AuthItem`
-- 

INSERT INTO `AuthItem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
  ('Admin', '2', 'Site Admin', '', 'N;'),
  ('Author', '2', 'Author', '', 'N;'),
  ('Editor', '2', 'Editor', '', 'N;'),
  ('Guest', '2', 'Site Guest', '', 'N;'),
  ('Member', '2', 'Site Member', '', 'N;'),
  ('op_application_modules_language_controllers_index_index', '0', 'op_application_modules_language_controllers_index_index', '', 'N;'),
  ('op_backend_controllers_site_contact', '0', 'op_backend_controllers_site_contact', '', 'N;'),
  ('op_backend_controllers_site_error', '0', 'op_backend_controllers_site_error', '', 'N;'),
  ('op_backend_controllers_site_index', '0', 'op_backend_controllers_site_index', '', 'N;'),
  ('op_backend_controllers_site_login', '0', 'op_backend_controllers_site_login', '', 'N;'),
  ('op_backend_controllers_site_logout', '0', 'op_backend_controllers_site_logout', '', 'N;'),
  ('op_common_modules_users_controllers_index_adduser', '0', 'op_common_modules_users_controllers_index_adduser', '', 'N;'),
  ('op_common_modules_users_controllers_index_delete', '0', 'op_common_modules_users_controllers_index_delete', '', 'N;'),
  ('op_common_modules_users_controllers_index_edit', '0', 'op_common_modules_users_controllers_index_edit', '', 'N;'),
  ('op_common_modules_users_controllers_index_index', '0', 'op_common_modules_users_controllers_index_index', '', 'N;'),
  ('op_common_modules_users_controllers_index_viewuser', '0', 'op_common_modules_users_controllers_index_viewuser', '', 'N;'),
  ('op_common_modules_users_controllers_login_facebooklogin', '0', 'op_common_modules_users_controllers_login_facebooklogin', '', 'N;'),
  ('op_common_modules_users_controllers_login_index', '0', 'op_common_modules_users_controllers_login_index', '', 'N;'),
  ('op_common_modules_users_controllers_login_lostpassword', '0', 'op_common_modules_users_controllers_login_lostpassword', '', 'N;'),
  ('op_common_modules_users_controllers_login_reset', '0', 'op_common_modules_users_controllers_login_reset', '', 'N;'),
  ('op_common_modules_users_controllers_register_index', '0', 'op_common_modules_users_controllers_register_index', '', 'N;'),
  ('op_common_modules_users_controllers_roles_addauthitem', '0', 'op_common_modules_users_controllers_roles_addauthitem', '', 'N;'),
  ('op_common_modules_users_controllers_roles_batch', '0', 'op_common_modules_users_controllers_roles_batch', '', 'N;'),
  ('op_common_modules_users_controllers_roles_editauthitem', '0', 'op_common_modules_users_controllers_roles_editauthitem', '', 'N;'),
  ('op_common_modules_users_controllers_roles_index', '0', 'op_common_modules_users_controllers_roles_index', '', 'N;'),
  ('op_common_modules_users_controllers_roles_viewauthitem', '0', 'op_common_modules_users_controllers_roles_viewauthitem', '', 'N;'),
  ('op_frontend_controllers_site_aboutus', '0', 'op_frontend_controllers_site_aboutus', '', 'N;'),
  ('op_frontend_controllers_site_contact', '0', 'op_frontend_controllers_site_contact', '', 'N;'),
  ('op_frontend_controllers_site_error', '0', 'op_frontend_controllers_site_error', '', 'N;'),
  ('op_frontend_controllers_site_index', '0', 'op_frontend_controllers_site_index', '', 'N;'),
  ('op_frontend_controllers_site_login', '0', 'op_frontend_controllers_site_login', '', 'N;'),
  ('op_frontend_controllers_site_logout', '0', 'op_frontend_controllers_site_logout', '', 'N;'),
  ('Superadmin', '2', 'Super Admin', '', 'N;'),
  ('task_application_modules_language_controllers_index', '1', 'task_application_modules_language_controllers_index', '', 'N;'),
  ('task_backend_controllers_site', '1', 'task_backend_controllers_site', '', 'N;'),
  ('task_common_modules_users_controllers_index', '1', 'task_common_modules_users_controllers_index', '', 'N;'),
  ('task_common_modules_users_controllers_login', '1', 'task_common_modules_users_controllers_login', '', 'N;'),
  ('task_common_modules_users_controllers_register', '1', 'task_common_modules_users_controllers_register', '', 'N;'),
  ('task_common_modules_users_controllers_roles', '1', 'task_common_modules_users_controllers_roles', '', 'N;'),
  ('task_frontend_controllers_site', '1', 'task_frontend_controllers_site', '', 'N;'),
  ('task_roles', '1', 'Task Manage User Roles', '', 'N;');

-- 
-- Structure for table `AuthItemChild`
-- 

DROP TABLE IF EXISTS `AuthItemChild`;
CREATE TABLE IF NOT EXISTS `AuthItemChild` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `AuthItemChild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AuthItemChild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Data for table `AuthItemChild`
-- 

INSERT INTO `AuthItemChild` (`parent`, `child`) VALUES
  ('Admin', 'Author'),
  ('Admin', 'Editor'),
  ('Admin', 'Guest'),
  ('Admin', 'Member'),
  ('task_application_modules_language_controllers_index', 'op_application_modules_language_controllers_index_index'),
  ('task_backend_controllers_site', 'op_backend_controllers_site_contact'),
  ('task_backend_controllers_site', 'op_backend_controllers_site_error'),
  ('task_backend_controllers_site', 'op_backend_controllers_site_index'),
  ('task_backend_controllers_site', 'op_backend_controllers_site_login'),
  ('task_backend_controllers_site', 'op_backend_controllers_site_logout'),
  ('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_adduser'),
  ('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_delete'),
  ('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_edit'),
  ('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_index'),
  ('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_viewuser'),
  ('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_facebooklogin'),
  ('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_index'),
  ('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_lostpassword'),
  ('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_reset'),
  ('task_common_modules_users_controllers_register', 'op_common_modules_users_controllers_register_index'),
  ('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_addauthitem'),
  ('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_batch'),
  ('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_editauthitem'),
  ('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_index'),
  ('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_viewauthitem'),
  ('task_frontend_controllers_site', 'op_frontend_controllers_site_aboutus'),
  ('task_frontend_controllers_site', 'op_frontend_controllers_site_contact'),
  ('task_frontend_controllers_site', 'op_frontend_controllers_site_error'),
  ('task_frontend_controllers_site', 'op_frontend_controllers_site_index'),
  ('task_frontend_controllers_site', 'op_frontend_controllers_site_login'),
  ('task_frontend_controllers_site', 'op_frontend_controllers_site_logout'),
  ('Admin', 'Superadmin'),
  ('Admin', 'task_frontend_controllers_site'),
  ('Admin', 'task_roles');

-- 
-- Structure for table `Message`
-- 

DROP TABLE IF EXISTS `Message`;
CREATE TABLE IF NOT EXISTS `Message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(16) NOT NULL DEFAULT '',
  `translation` text,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 
-- Data for table `Message`
-- 

INSERT INTO `Message` (`id`, `language`, `translation`) VALUES
  ('1', 'hi', 'छिपे हुए दिमाग'),
  ('1', 'kr', 'Hidden Brains'),
  ('1', 'ru', 'Скрытые Мозги'),
  ('2', 'hi', 'प्रशासन'),
  ('2', 'kr', 'Admin'),
  ('2', 'ru', 'Админ'),
  ('3', 'hi', 'घर'),
  ('3', 'kr', 'Home'),
  ('3', 'ru', 'дома'),
  ('4', 'hi', 'के बारे में'),
  ('4', 'kr', 'About'),
  ('4', 'ru', 'о'),
  ('5', 'hi', 'संपर्क'),
  ('5', 'kr', 'Contact'),
  ('5', 'ru', 'связаться'),
  ('6', 'hi', 'लॉगिन'),
  ('6', 'kr', 'Login'),
  ('6', 'ru', 'Войти'),
  ('7', 'hi', 'यह सूचकांक पृष्ठ है ...'),
  ('7', 'kr', 'This is index Page...'),
  ('7', 'ru', 'Это индекс почте ...'),
  ('8', 'hi', 'यह हमारे बारे में पृष्ठ ...'),
  ('8', 'kr', 'This is About Us Page...'),
  ('8', 'ru', 'Это страница О нас ...');

-- 
-- Structure for table `Session`
-- 

DROP TABLE IF EXISTS `Session`;
CREATE TABLE IF NOT EXISTS `Session` (
  `id` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Data for table `Session`
-- 

INSERT INTO `Session` (`id`, `expire`, `data`) VALUES
  ('242l02ife8sh4p1pviea01g2e2', '1361975598', ''),
  ('9o2f5irobft4uknlkprtfl7se0', '1361966817', 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a343a2276617761223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a333b5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e636170746368617c733a343a2263666e65223b5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
  ('inu22qgtbnhsblnagfmn4gec06', '1361967631', 0x5969692e4343617074636861416374696f6e2e37663439643434362e736974652e636170746368617c733a363a22666163616b6d223b5969692e4343617074636861416374696f6e2e37663439643434362e736974652e63617074636861636f756e747c693a313b6769695f5f72657475726e55726c7c733a32343a222f6261736570726f6a6563742f6261636b656e642f676969223b6769695f5f69647c733a353a227969696572223b6769695f5f6e616d657c733a353a227969696572223b6769695f5f7374617465737c613a303a7b7d5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a343a226a757865223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a333b736573736f696e707265666978636f6d6d6f6e5f5f69647c733a313a2231223b736573736f696e707265666978636f6d6d6f6e5f5f6e616d657c733a31373a2261646d696e40636f6d70616e792e636f6d223b736573736f696e707265666978636f6d6d6f6e6e616d657c733a31333a2241646d696e6973747261746f72223b736573736f696e707265666978636f6d6d6f6e757365726e616d657c733a31333a2241646d696e6973747261746f72223b736573736f696e707265666978636f6d6d6f6e73656f6e616d657c733a31333a2261646d696e6973747261746f72223b736573736f696e707265666978636f6d6d6f6e656d61696c7c733a31373a2261646d696e40636f6d70616e792e636f6d223b736573736f696e707265666978636f6d6d6f6e726f6c657c733a353a2241646d696e223b736573736f696e707265666978636f6d6d6f6e697341646d696e7c623a313b736573736f696e707265666978636f6d6d6f6e5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d),
  ('vtkk0thdv6lhol3unc3p2daeg4', '1362028491', 0x7573657273657373696f6e5f5f5f72657475726e55726c7c733a34373a222f76656e752f6261736570726f6a6563742f6261636b656e642f736974652f706167652f3f766965773d61626f7574223b);

-- 
-- Structure for table `SourceMessage`
-- 

DROP TABLE IF EXISTS `SourceMessage`;
CREATE TABLE IF NOT EXISTS `SourceMessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 
-- Data for table `SourceMessage`
-- 

INSERT INTO `SourceMessage` (`id`, `category`, `message`) VALUES
  ('1', 'global', 'Hidden Brains'),
  ('2', 'global', 'Admin'),
  ('3', 'global', 'Home'),
  ('4', 'global', 'About'),
  ('5', 'global', 'Contact'),
  ('6', 'global', 'Login'),
  ('7', 'global', 'This is index Page...'),
  ('8', 'global', 'This is About Us Page...');

-- 
-- Structure for table `cache`
-- 

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `id` char(128) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `value` longblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Data for table `cache`
-- 

INSERT INTO `cache` (`id`, `expire`, `value`) VALUES
  ('61ab893617cfba5837f5c98ec2c87223', '1446183009', 0x613a323a7b693a303b4f3a31373a22434d7973716c5461626c65536368656d61223a393a7b733a31303a22736368656d614e616d65223b4e3b733a343a226e616d65223b733a343a2275736572223b733a373a227261774e616d65223b733a363a22607573657260223b733a31303a227072696d6172794b6579223b733a323a226964223b733a31323a2273657175656e63654e616d65223b733a303a22223b733a31313a22666f726569676e4b657973223b613a303a7b7d733a373a22636f6c756d6e73223b613a31353a7b733a323a226964223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a323a226964223b733a373a227261774e616d65223b733a343a2260696460223b733a393a22616c6c6f774e756c6c223b623a303b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a313b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a313b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a383a22757365726e616d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a383a22757365726e616d65223b733a373a227261774e616d65223b733a31303a2260757365726e616d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31313a227661726368617228343529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a34353b733a393a22707265636973696f6e223b693a34353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a383a2270617373776f7264223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a383a2270617373776f7264223b733a373a227261774e616d65223b733a31303a226070617373776f726460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a343a2273616c74223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a343a2273616c74223b733a373a227261774e616d65223b733a363a226073616c7460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31373a2270617373776f72645f7374726174656779223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31373a2270617373776f72645f7374726174656779223b733a373a227261774e616d65223b733a31393a226070617373776f72645f737472617465677960223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31313a227661726368617228353029223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a35303b733a393a22707265636973696f6e223b693a35303b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a32313a2272657175697265735f6e65775f70617373776f7264223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a32313a2272657175697265735f6e65775f70617373776f7264223b733a373a227261774e616d65223b733a32333a226072657175697265735f6e65775f70617373776f726460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31303a2274696e79696e74283129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a313b733a393a22707265636973696f6e223b693a313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a353a22656d61696c223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a353a22656d61696c223b733a373a227261774e616d65223b733a373a2260656d61696c60223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31343a226c6f67696e5f617474656d707473223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31343a226c6f67696e5f617474656d707473223b733a373a227261774e616d65223b733a31363a22606c6f67696e5f617474656d70747360223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31303a226c6f67696e5f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31303a226c6f67696e5f74696d65223b733a373a227261774e616d65223b733a31323a22606c6f67696e5f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a383a226c6f67696e5f6970223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a383a226c6f67696e5f6970223b733a373a227261774e616d65223b733a31303a22606c6f67696e5f697060223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31313a227661726368617228333229223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a33323b733a393a22707265636973696f6e223b693a33323b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31343a2276616c69646174696f6e5f6b6579223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31343a2276616c69646174696f6e5f6b6579223b733a373a227261774e616d65223b733a31363a226076616c69646174696f6e5f6b657960223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a393a226372656174655f6964223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a393a226372656174655f6964223b733a373a227261774e616d65223b733a31313a22606372656174655f696460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31313a226372656174655f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31313a226372656174655f74696d65223b733a373a227261774e616d65223b733a31333a22606372656174655f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a393a227570646174655f6964223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a393a227570646174655f6964223b733a373a227261774e616d65223b733a31313a22607570646174655f696460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31313a227570646174655f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31313a227570646174655f74696d65223b733a373a227261774e616d65223b733a31333a22607570646174655f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d7d733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d693a313b4e3b7d),
  ('f7525e945b4b53083b7c9bd8811cc16f', '1446197882', 0x613a323a7b693a303b4f3a31373a22434d7973716c5461626c65536368656d61223a393a7b733a31303a22736368656d614e616d65223b4e3b733a343a226e616d65223b733a31333a2274626c5f6d6967726174696f6e223b733a373a227261774e616d65223b733a31353a226074626c5f6d6967726174696f6e60223b733a31303a227072696d6172794b6579223b733a373a2276657273696f6e223b733a31323a2273657175656e63654e616d65223b4e3b733a31313a22666f726569676e4b657973223b613a303a7b7d733a373a22636f6c756d6e73223b613a323a7b733a373a2276657273696f6e223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a373a2276657273696f6e223b733a373a227261774e616d65223b733a393a226076657273696f6e60223b733a393a22616c6c6f774e756c6c223b623a303b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a313b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31303a226170706c795f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31303a226170706c795f74696d65223b733a373a227261774e616d65223b733a31323a22606170706c795f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d7d733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d693a313b4e3b7d);

-- 
-- Structure for table `comments`
-- 

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `owner_name` varchar(50) NOT NULL,
  `owner_id` int(12) NOT NULL,
  `comment_id` int(12) NOT NULL AUTO_INCREMENT,
  `parent_comment_id` int(12) DEFAULT NULL,
  `creator_id` int(12) DEFAULT NULL,
  `user_name` varchar(128) DEFAULT NULL,
  `user_email` varchar(128) DEFAULT NULL,
  `comment_text` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `owner_name` (`owner_name`,`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 
-- Data for table `comments`
-- 

INSERT INTO `comments` (`owner_name`, `owner_id`, `comment_id`, `parent_comment_id`, `creator_id`, `user_name`, `user_email`, `comment_text`, `create_time`, `update_time`, `status`) VALUES
  ('comment', '1', '1', '1', '1', 'admin', 'admin@gmail.com', 'comment text', '1', '1', '1'),
  ('Comment', '110', '2', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020478', NULL, '0'),
  ('Comment', '110', '3', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020482', NULL, '0'),
  ('Comment', '110', '4', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020483', NULL, '0'),
  ('Comment', '110', '5', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020483', NULL, '0'),
  ('Comment', '110', '6', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020483', NULL, '0'),
  ('Comment', '110', '7', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020483', NULL, '0'),
  ('Comment', '110', '8', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020484', NULL, '0'),
  ('Comment', '110', '9', '0', NULL, 'admin', 'admin@gmail.com', 'admin comment text', '1361020489', NULL, '0');

-- 
-- Structure for table `dashboard_page`
-- 

DROP TABLE IF EXISTS `dashboard_page`;
CREATE TABLE IF NOT EXISTS `dashboard_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Structure for table `dashboard_portlet`
-- 

DROP TABLE IF EXISTS `dashboard_portlet`;
CREATE TABLE IF NOT EXISTS `dashboard_portlet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dashboard` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Structure for table `forum`
-- 

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_forum_forum` (`parent_id`),
  CONSTRAINT `FK_forum_forum` FOREIGN KEY (`parent_id`) REFERENCES `forum` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 
-- Data for table `forum`
-- 

INSERT INTO `forum` (`id`, `parent_id`, `title`, `description`, `listorder`, `is_locked`) VALUES
  ('1', NULL, 'Announcements', 'Announcements', '0', '1'),
  ('2', '1', 'New releases', 'Announcements about new releases', '10', '0'),
  ('3', NULL, 'Support', '', '20', '0'),
  ('4', '3', 'Installation and configuration', 'ProblemsProblems with installation and/or configuration, incompatibility issues, etc.', '10', '0'),
  ('5', '3', 'Bugs', 'Things not working at all, or not as they should', '20', '0'),
  ('6', '3', 'Missing features', 'Fetures you think should be included in a future release', '30', '0'),
  ('7', '6', 'missing', 'custom', '2', '0'),
  ('8', NULL, 'venu', 'venu', '11', '0'),
  ('9', NULL, 'missing', 'test', '11', '1'),
  ('10', NULL, 'new forum test', 'new forum test', '13', '0');

-- 
-- Structure for table `forumuser`
-- 

DROP TABLE IF EXISTS `forumuser`;
CREATE TABLE IF NOT EXISTS `forumuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `signature` text,
  `firstseen` int(10) unsigned NOT NULL,
  `lastseen` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteid` (`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 
-- Data for table `forumuser`
-- 

INSERT INTO `forumuser` (`id`, `siteid`, `name`, `signature`, `firstseen`, `lastseen`) VALUES
  ('1', 'admin', 'admin', NULL, '0', '0'),
  ('2', 'demo', 'demo', NULL, '0', '0'),
  ('3', '1', 'angel', NULL, '1360937566', '1360937566'),
  ('4', '14', 'peter', NULL, '1361274846', '1361274846'),
  ('5', '15', 'jhony', NULL, '1361276879', '1361277309');

-- 
-- Structure for table `language`
-- 

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language_primary` enum('Yes','No') CHARACTER SET utf8 DEFAULT NULL,
  `language_status` enum('Active','Inactive') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Data for table `language`
-- 

INSERT INTO `language` (`language_id`, `language_title`, `language_code`, `language_image`, `language_primary`, `language_status`) VALUES
  ('6', 'English', 'en', 'lang_en.jpg', 'Yes', 'Active'),
  ('10', 'Gujarati', 'gu', 'lang_gu.jpg', 'No', 'Active'),
  ('11', 'Russian', 'ru', 'lang_ru.jpg', 'No', 'Active'),
  ('12', 'Hindi', 'hi', 'lang_hi.jpg', 'No', 'Active'),
  ('14', 'Urdu', 'ur', 'lang_ur.jpg', 'No', 'Active'),
  ('15', 'English', 'en', 'lang_en.png', 'Yes', 'Active'),
  ('16', 'हिन्दी', 'hi', 'lang_hi.gif', 'No', 'Active'),
  ('18', 'русский', 'ru', 'lang_ru.png', 'No', 'Active'),
  ('19', 'Korean', 'kr', 'lang_kr.jpg', 'No', 'Active');

-- 
-- Structure for table `tbl_comments`
-- 

DROP TABLE IF EXISTS `tbl_comments`;
CREATE TABLE IF NOT EXISTS `tbl_comments` (
  `owner_name` varchar(50) NOT NULL,
  `owner_id` int(12) NOT NULL,
  `comment_id` int(12) NOT NULL AUTO_INCREMENT,
  `parent_comment_id` int(12) DEFAULT NULL,
  `creator_id` int(12) DEFAULT NULL,
  `user_name` varchar(128) DEFAULT NULL,
  `user_email` varchar(128) DEFAULT NULL,
  `comment_text` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `owner_name` (`owner_name`,`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Structure for table `tbl_migration`
-- 

DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Data for table `tbl_migration`
-- 

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
  ('m000000_000000_base', '1359783009'),
  ('m120805_131754_user_table_migration', '1359783012');

-- 
-- Structure for table `thread`
-- 

DROP TABLE IF EXISTS `thread`;
CREATE TABLE IF NOT EXISTS `thread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL,
  `subject` varchar(120) NOT NULL,
  `is_sticky` tinyint(1) unsigned NOT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL,
  `view_count` bigint(20) unsigned NOT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_thread_forum` (`forum_id`),
  CONSTRAINT `FK_thread_forum` FOREIGN KEY (`forum_id`) REFERENCES `forum` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 
-- Data for table `thread`
-- 

INSERT INTO `thread` (`id`, `forum_id`, `subject`, `is_sticky`, `is_locked`, `view_count`, `created`) VALUES
  ('1', '2', 'First release', '1', '1', '34', '0'),
  ('2', '5', 'Subject is allowed to be blank when creating a new thread', '0', '0', '4', '0'),
  ('3', '5', 'Post date is not set', '0', '1', '16', '0'),
  ('4', '5', 'Forum view does not show correct last post', '0', '1', '10', '1349540563'),
  ('5', '6', 'User signatures', '0', '0', '1', '1349570366'),
  ('6', '6', 'BB Code', '0', '0', '3', '1349570413'),
  ('7', '5', 'Attachments', '0', '0', '21', '1349578699'),
  ('8', '8', 'hello', '0', '0', '2', '1361277871'),
  ('9', '10', 'politics', '0', '0', '2', '1361278415');

-- 
-- Structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(155) NOT NULL DEFAULT '',
  `seoname` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(155) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `joined` int(10) NOT NULL DEFAULT '0',
  `passwordreset` char(40) DEFAULT NULL,
  `data` text,
  `role` char(30) NOT NULL DEFAULT '',
  `ipaddress` char(30) NOT NULL DEFAULT '',
  `fbuid` int(10) NOT NULL DEFAULT '0',
  `fbtoken` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 
-- Data for table `users`
-- 

INSERT INTO `users` (`id`, `username`, `seoname`, `email`, `password`, `joined`, `passwordreset`, `data`, `role`, `ipaddress`, `fbuid`, `fbtoken`) VALUES
  ('1', 'Administrator', 'administrator', 'admin@company.com', '1ea6e931749f195b7606790f6172ce0e52f102cc', '1361436249', NULL, NULL, 'Admin', '127.0.0.1', '0', '');

