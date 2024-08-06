-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Out-2022 às 18:43
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locadoratrash`
--

-- --------------------------------------------------------

CREATE DATABASE locadoratrash;

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `locadoratrash`.`clientes` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `locadoratrash`.`clientes` (`id`, `nome`, `email`, `telefone`, `status`) VALUES
(1, 'Cleber Silva', 'cleber_silva@gmail.com', '11012345678', 'ATIVO'),
(2, 'Julia Pessoa', 'ju.pessoa@gmail.com', '1133333543', 'ATIVO'),
(3, 'Marcia Neves', 'neves.marcia75@gmail.com', '11000005', 'ATIVO'),
(4, 'João Herinque', 'ja1herique@gmail.com', '1177444770', 'ATIVO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_filmes`
--

CREATE TABLE `locadoratrash`.`clientes_filmes` (
  `id` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `idFilme` bigint(20) NOT NULL,
  `dtaluga` varchar(60) DEFAULT NULL,
  `dtdevolve` varchar(60) DEFAULT NULL,
  `observacao` varchar(240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes_filmes`
--

INSERT INTO `locadoratrash`.`clientes_filmes` (`id`, `idCliente`, `idFilme`, `dtaluga`, `dtdevolve`, `observacao`) VALUES
(1, 4, 4, '07/03/2022', '12/03/2022', 'DENTRO DO PRAZO'),
(2, 2, 3, '15/04/2022', '25/04/2022', 'FORA DO PRAZO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `filmes`
--

CREATE TABLE `locadoratrash`.`filmes` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(300) DEFAULT NULL,
  `genero` varchar(180) DEFAULT NULL,
  `ano` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `filmes`
--

INSERT INTO `locadoratrash`.`filmes` (`id`, `nome`, `genero`, `ano`) VALUES
(1, 'Jogador Nº 1', 'Ficção científica, Ação', '2018'),
(2, 'Jurassic World: O Mundo dos Dinossauros', ' Ação, Ficção científica', '2015'),
(3, 'Star Wars: Episódio IV – Uma Nova Esperança', 'Ficção científica', '1977'),
(4, 'O Sexto Sentido', 'Terror', '1999'),
(5, 'E.T. O Extraterrestre', 'Aventura, Ficção científica', '1982');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `locadoratrash`.`usuarios` (
  `id` bigint(20) NOT NULL,
  `login` varchar(120) DEFAULT NULL,
  `senha` varchar(120) DEFAULT NULL,
  `status` varchar(80) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `locadoratrash`.`usuarios` (`id`, `login`, `senha`, `status`, `tipo`) VALUES
(1, 'root', 'root', 'ATIVO', 'ADM'),
(2, 'admin', 'admin', 'ATIVO', 'ADM'),
(3, 'func', 'func', 'ATIVO', 'FUNC');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `locadoratrash`.`clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes_filmes`
--
ALTER TABLE `locadoratrash`.`clientes_filmes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Clientes_Filmes_Clientes_idx` (`idCliente`),
  ADD KEY `fk_Clientes_Filmes_Filmes1_idx` (`idFilme`);

--
-- Índices para tabela `filmes`
--
ALTER TABLE `locadoratrash`.`filmes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `locadoratrash`.`usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `locadoratrash`.`clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `clientes_filmes`
--
ALTER TABLE `locadoratrash`.`clientes_filmes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `filmes`
--
ALTER TABLE `locadoratrash`.`filmes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `locadoratrash`.`usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `clientes_filmes`
--
ALTER TABLE `locadoratrash`.`clientes_filmes`
  ADD CONSTRAINT `fk_Clientes_Filmes_Clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clientes_Filmes_Filmes` FOREIGN KEY (`idFilme`) REFERENCES `filmes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
