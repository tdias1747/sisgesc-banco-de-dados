-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/04/2026 às 01:55
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sisgesc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_aluno`
--

CREATE TABLE `dim_aluno` (
  `sk_aluno` int(11) NOT NULL,
  `nk_aluno` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_aluno`
--

INSERT INTO `dim_aluno` (`sk_aluno`, `nk_aluno`, `nome`) VALUES
(1, 1, 'Thomas Dias'),
(2, 2, 'Beatriz Rocha'),
(3, 3, 'Carlos Souza'),
(4, 4, 'Daniela Batista');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_curso`
--

CREATE TABLE `dim_curso` (
  `sk_curso` int(11) NOT NULL,
  `nk_curso` int(11) NOT NULL,
  `nome_curso` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_curso`
--

INSERT INTO `dim_curso` (`sk_curso`, `nk_curso`, `nome_curso`) VALUES
(1, 1, 'ADS'),
(2, 2, 'Gestão de TI'),
(3, 3, 'Ciência de Dados');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_tempo`
--

CREATE TABLE `dim_tempo` (
  `sk_tempo` int(11) NOT NULL,
  `data` date NOT NULL,
  `mes` int(2) NOT NULL,
  `ano` int(4) NOT NULL,
  `semestre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_tempo`
--

INSERT INTO `dim_tempo` (`sk_tempo`, `data`, `mes`, `ano`, `semestre`) VALUES
(1, '2026-04-24', 4, 2026, '2026/1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fato_financeiro`
--

CREATE TABLE `fato_financeiro` (
  `fk_aluno` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  `fk_tempo` int(11) NOT NULL,
  `valor_receita` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fato_financeiro`
--

INSERT INTO `fato_financeiro` (`fk_aluno`, `fk_curso`, `fk_tempo`, `valor_receita`) VALUES
(1, 1, 1, 15000.00),
(2, 2, 1, 12500.00),
(3, 3, 1, 18000.00),
(4, 1, 1, 15000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_aluno`
--

CREATE TABLE `tb_aluno` (
  `pk_aluno` int(11) NOT NULL,
  `nome_aluno` varchar(150) NOT NULL,
  `cpf_aluno` varchar(11) NOT NULL,
  `email_aluno` varchar(200) NOT NULL,
  `data_nascimento_aluno` date NOT NULL,
  `status_aluno` varchar(20) DEFAULT 'ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_aluno`
--

INSERT INTO `tb_aluno` (`pk_aluno`, `nome_aluno`, `cpf_aluno`, `email_aluno`, `data_nascimento_aluno`, `status_aluno`) VALUES
(1, 'Thomas Dias', '12345678901', 'thomasdias@email.com', '2000-01-01', 'ativo'),
(2, 'Beatriz Rocha', '23456789012', 'beatrizrocha@email.com', '1999-05-15', 'ativo'),
(3, 'Carlos Souza', '34567890123', 'carlossouza@email.com', '2001-10-20', 'ativo'),
(4, 'Daniela Batista', '45678901234', 'daniela@email.com', '1998-03-12', 'ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contrato_educacional`
--

CREATE TABLE `tb_contrato_educacional` (
  `pk_contrato` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_curso`
--

CREATE TABLE `tb_curso` (
  `pk_curso` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `modalidade` varchar(20) NOT NULL,
  `carga_horaria_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_curso`
--

INSERT INTO `tb_curso` (`pk_curso`, `nome`, `modalidade`, `carga_horaria_total`) VALUES
(1, 'ADS', 'Presencial', 2000),
(2, 'Gestão de TI', 'EAD', 1800),
(3, 'Ciência de Dados', 'Presencial', 2400);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_disciplina`
--

CREATE TABLE `tb_disciplina` (
  `pk_disciplina` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `pk_funcionario` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `salario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_matricula`
--

CREATE TABLE `tb_matricula` (
  `pk_matricula` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `fk_turma` int(11) NOT NULL,
  `data_matricula` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_mensalidade`
--

CREATE TABLE `tb_mensalidade` (
  `pk_mensalidade` int(11) NOT NULL,
  `fk_contrato` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_professor`
--

CREATE TABLE `tb_professor` (
  `pk_professor` int(11) NOT NULL,
  `fk_funcionario` int(11) NOT NULL,
  `titulacao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_turma`
--

CREATE TABLE `tb_turma` (
  `pk_turma` int(11) NOT NULL,
  `fk_disciplina` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `semestre` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `dim_aluno`
--
ALTER TABLE `dim_aluno`
  ADD PRIMARY KEY (`sk_aluno`);

--
-- Índices de tabela `dim_curso`
--
ALTER TABLE `dim_curso`
  ADD PRIMARY KEY (`sk_curso`);

--
-- Índices de tabela `dim_tempo`
--
ALTER TABLE `dim_tempo`
  ADD PRIMARY KEY (`sk_tempo`);

--
-- Índices de tabela `fato_financeiro`
--
ALTER TABLE `fato_financeiro`
  ADD KEY `fk_fato_aluno` (`fk_aluno`),
  ADD KEY `fk_fato_curso` (`fk_curso`),
  ADD KEY `fk_fato_tempo` (`fk_tempo`);

--
-- Índices de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD PRIMARY KEY (`pk_aluno`),
  ADD UNIQUE KEY `cpf_aluno` (`cpf_aluno`),
  ADD UNIQUE KEY `email_aluno` (`email_aluno`);

--
-- Índices de tabela `tb_contrato_educacional`
--
ALTER TABLE `tb_contrato_educacional`
  ADD PRIMARY KEY (`pk_contrato`),
  ADD KEY `fk_cont_aluno` (`fk_aluno`),
  ADD KEY `fk_cont_curso` (`fk_curso`);

--
-- Índices de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  ADD PRIMARY KEY (`pk_curso`);

--
-- Índices de tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  ADD PRIMARY KEY (`pk_disciplina`),
  ADD KEY `fk_disc_curso` (`fk_curso`);

--
-- Índices de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`pk_funcionario`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  ADD PRIMARY KEY (`pk_matricula`),
  ADD KEY `fk_mat_aluno` (`fk_aluno`),
  ADD KEY `fk_mat_turma` (`fk_turma`);

--
-- Índices de tabela `tb_mensalidade`
--
ALTER TABLE `tb_mensalidade`
  ADD PRIMARY KEY (`pk_mensalidade`),
  ADD KEY `fk_mens_cont` (`fk_contrato`);

--
-- Índices de tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  ADD PRIMARY KEY (`pk_professor`),
  ADD KEY `fk_prof_func` (`fk_funcionario`);

--
-- Índices de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD PRIMARY KEY (`pk_turma`),
  ADD KEY `fk_turma_disc` (`fk_disciplina`),
  ADD KEY `fk_turma_prof` (`fk_professor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dim_aluno`
--
ALTER TABLE `dim_aluno`
  MODIFY `sk_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `dim_curso`
--
ALTER TABLE `dim_curso`
  MODIFY `sk_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `dim_tempo`
--
ALTER TABLE `dim_tempo`
  MODIFY `sk_tempo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  MODIFY `pk_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_contrato_educacional`
--
ALTER TABLE `tb_contrato_educacional`
  MODIFY `pk_contrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  MODIFY `pk_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  MODIFY `pk_disciplina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `pk_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  MODIFY `pk_matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_mensalidade`
--
ALTER TABLE `tb_mensalidade`
  MODIFY `pk_mensalidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  MODIFY `pk_professor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  MODIFY `pk_turma` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `fato_financeiro`
--
ALTER TABLE `fato_financeiro`
  ADD CONSTRAINT `fk_fato_aluno` FOREIGN KEY (`fk_aluno`) REFERENCES `dim_aluno` (`sk_aluno`),
  ADD CONSTRAINT `fk_fato_curso` FOREIGN KEY (`fk_curso`) REFERENCES `dim_curso` (`sk_curso`),
  ADD CONSTRAINT `fk_fato_tempo` FOREIGN KEY (`fk_tempo`) REFERENCES `dim_tempo` (`sk_tempo`);

--
-- Restrições para tabelas `tb_contrato_educacional`
--
ALTER TABLE `tb_contrato_educacional`
  ADD CONSTRAINT `fk_cont_aluno` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`),
  ADD CONSTRAINT `fk_cont_curso` FOREIGN KEY (`fk_curso`) REFERENCES `tb_curso` (`pk_curso`);

--
-- Restrições para tabelas `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  ADD CONSTRAINT `fk_disc_curso` FOREIGN KEY (`fk_curso`) REFERENCES `tb_curso` (`pk_curso`);

--
-- Restrições para tabelas `tb_matricula`
--
ALTER TABLE `tb_matricula`
  ADD CONSTRAINT `fk_mat_aluno` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`),
  ADD CONSTRAINT `fk_mat_turma` FOREIGN KEY (`fk_turma`) REFERENCES `tb_turma` (`pk_turma`);

--
-- Restrições para tabelas `tb_mensalidade`
--
ALTER TABLE `tb_mensalidade`
  ADD CONSTRAINT `fk_mens_cont` FOREIGN KEY (`fk_contrato`) REFERENCES `tb_contrato_educacional` (`pk_contrato`);

--
-- Restrições para tabelas `tb_professor`
--
ALTER TABLE `tb_professor`
  ADD CONSTRAINT `fk_prof_func` FOREIGN KEY (`fk_funcionario`) REFERENCES `tb_funcionario` (`pk_funcionario`);

--
-- Restrições para tabelas `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD CONSTRAINT `fk_turma_disc` FOREIGN KEY (`fk_disciplina`) REFERENCES `tb_disciplina` (`pk_disciplina`),
  ADD CONSTRAINT `fk_turma_prof` FOREIGN KEY (`fk_professor`) REFERENCES `tb_professor` (`pk_professor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
