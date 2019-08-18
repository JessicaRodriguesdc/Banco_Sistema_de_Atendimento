-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18-Ago-2019 às 19:49
-- Versão do servidor: 10.1.40-MariaDB
-- versão do PHP: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistema_de_atendimento`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idAtendimento` int(11) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `qtd_de_pecas` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atendimento`
--

INSERT INTO `atendimento` (`idAtendimento`, `data_hora`, `qtd_de_pecas`, `valor`, `idUsuario`) VALUES
(1, '2019-08-17 00:00:00', 18, 400, 1),
(2, '2018-05-24 15:22:01', 8, 80, 3),
(3, '2019-08-18 23:59:59', 4, 40, 4),
(4, '2019-10-18 18:04:37', 10, 100, 2),
(5, '2019-10-18 12:09:00', 16, 350, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `nome` text,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `data_hora`, `nome`, `Email`) VALUES
(1, '2019-08-16 10:06:45', 'Carli', 'carli@gmail.com'),
(2, '2018-05-24 15:22:01', 'Zas', 'zas@gmail.com'),
(3, '2019-08-18 23:59:59', 'ruam', 'ruam@gmail.com'),
(4, '2019-10-18 18:04:37', 'Costa', 'costa@gmail.com'),
(5, '2019-10-18 12:09:00', 'Luny', 'luny@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` text,
  `Email` varchar(255) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `Email`, `data_hora`, `idEmpresa`) VALUES
(1, 'Jessica', 'jessica@gmail.com', '2019-08-16 23:45:45', 5),
(2, 'Ricardo', 'ricardo@gmail.com', '2019-09-14 05:22:01', 4),
(3, 'Emily', 'emily@gmail.com', '2019-11-18 13:29:00', 1),
(4, 'Victoria', 'victoria@gmail.com', '2019-10-18 18:04:37', 1),
(5, 'Emanual', 'emanuel@gmail.com', '2017-01-01 00:00:00', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idAtendimento`),
  ADD KEY `FK_idUsuario` (`idUsuario`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `FK_idEmpresa` (`idEmpresa`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `FK_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_idEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
