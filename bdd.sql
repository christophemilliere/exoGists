-- phpMyAdmin SQL Dump
-- version 4.4.1.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 25 Août 2015 à 12:47
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `exoGist_development`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'facebook', '2015-08-24 14:45:48', '2015-08-24 14:45:48'),
(2, 'ruby', '2015-08-24 14:47:04', '2015-08-24 14:47:04');

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `companies`
--

INSERT INTO `companies` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`) VALUES
(1, 'brandcelebrities@gmail.com', '$2a$10$RxiTm6SfhhQWehxriIhf6eds0lPT3bzqFyKPUqa35Kn/pAJgQNVOK', NULL, NULL, NULL, 3, '2015-08-25 10:15:44', '2015-08-25 08:32:15', '127.0.0.1', '127.0.0.1', '2015-08-24 15:23:33', '2015-08-25 10:15:44');

-- --------------------------------------------------------

--
-- Structure de la table `gists`
--

CREATE TABLE `gists` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gists_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `gists`
--

INSERT INTO `gists` (`id`, `name`, `user`, `avatar`, `gists_id`, `company_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'gistfile1.js', 'christophemilliere', 'https://avatars.githubusercontent.com/u/918182?v=3', 'e8cf352b8d2012f9c496', 1, 2, '2015-08-24 17:16:30', '2015-08-24 18:54:13'),
(2, 'gistfile1.txt', 'christophemilliere', 'https://avatars.githubusercontent.com/u/918182?v=3', 'b73412680af824faae78', 1, 2, '2015-08-24 17:16:34', '2015-08-25 09:38:09'),
(3, 'gistfile1.txt', 'christophemilliere', 'https://avatars.githubusercontent.com/u/918182?v=3', 'e69e0ed900431232810f', 1, NULL, '2015-08-24 17:16:42', '2015-08-24 17:16:42'),
(4, 'gistfile1.txt', 'christophemilliere', 'https://avatars.githubusercontent.com/u/918182?v=3', '1ea36800ae373662a498', 1, NULL, '2015-08-24 17:16:47', '2015-08-24 17:16:47'),
(5, 'gistfile1.txt', 'christophemilliere', 'https://avatars.githubusercontent.com/u/918182?v=3', '5901312', 1, NULL, '2015-08-24 17:16:55', '2015-08-24 17:16:55');

-- --------------------------------------------------------

--
-- Structure de la table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20150823172305'),
('20150823190125'),
('20150823190936');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_companies_on_email` (`email`),
  ADD UNIQUE KEY `index_companies_on_reset_password_token` (`reset_password_token`);

--
-- Index pour la table `gists`
--
ALTER TABLE `gists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_gists_on_company_id` (`company_id`),
  ADD KEY `index_gists_on_category_id` (`category_id`);

--
-- Index pour la table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `gists`
--
ALTER TABLE `gists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `gists`
--
ALTER TABLE `gists`
  ADD CONSTRAINT `fk_rails_7e0edc54c3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_rails_cd0ca74489` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);
