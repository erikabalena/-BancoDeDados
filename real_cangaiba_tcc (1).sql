-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Ago-2023 às 01:32
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `real_cangaiba_tcc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clubes`
--

CREATE TABLE `clubes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `fundacao` date DEFAULT NULL,
  `estadio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clubes`
--

INSERT INTO `clubes` (`id`, `nome`, `fundacao`, `estadio`) VALUES
(1, 'Clube A', '1990-01-01', 'Estádio A'),
(2, 'Clube B', '1985-05-15', 'Estádio B');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gols`
--

CREATE TABLE `gols` (
  `id` int(11) NOT NULL,
  `partida_id` int(11) DEFAULT NULL,
  `jogador_id` int(11) DEFAULT NULL,
  `minuto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `gols`
--

INSERT INTO `gols` (`id`, `partida_id`, `jogador_id`, `minuto`) VALUES
(1, 1, 1, 30),
(2, 1, 2, 45),
(3, 2, 3, 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores`
--

CREATE TABLE `jogadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `posicao` varchar(50) DEFAULT NULL,
  `clube_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jogadores`
--

INSERT INTO `jogadores` (`id`, `nome`, `idade`, `posicao`, `clube_id`) VALUES
(1, 'Jogador 1', 25, 'Atacante', 1),
(2, 'Danilo', 28, ' Goleiro ', 1),
(3, 'Jogador 3', 23, 'Zagueiro', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `partidas`
--

CREATE TABLE `partidas` (
  `id` int(11) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `estadio` varchar(100) DEFAULT NULL,
  `clube_casa_id` int(11) DEFAULT NULL,
  `clube_visitante_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `partidas`
--

INSERT INTO `partidas` (`id`, `data_hora`, `estadio`, `clube_casa_id`, `clube_visitante_id`) VALUES
(1, '2023-08-15 15:00:00', 'Morumbi', 1, 2),
(2, '2023-08-18 16:30:00', ' Arena', 2, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `gols`
--
ALTER TABLE `gols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partida_id` (`partida_id`),
  ADD KEY `jogador_id` (`jogador_id`);

--
-- Índices para tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clube_id` (`clube_id`);

--
-- Índices para tabela `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clube_casa_id` (`clube_casa_id`),
  ADD KEY `clube_visitante_id` (`clube_visitante_id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `gols`
--
ALTER TABLE `gols`
  ADD CONSTRAINT `gols_ibfk_1` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id`),
  ADD CONSTRAINT `gols_ibfk_2` FOREIGN KEY (`jogador_id`) REFERENCES `jogadores` (`id`);

--
-- Limitadores para a tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD CONSTRAINT `jogadores_ibfk_1` FOREIGN KEY (`clube_id`) REFERENCES `clubes` (`id`);

--
-- Limitadores para a tabela `partidas`
--
ALTER TABLE `partidas`
  ADD CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`clube_casa_id`) REFERENCES `clubes` (`id`),
  ADD CONSTRAINT `partidas_ibfk_2` FOREIGN KEY (`clube_visitante_id`) REFERENCES `clubes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
