
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE IF NOT EXISTS DATABASE sisgesc;
USE sisgesc;
--
-- Estrutura para tabela `dim_aluno`
--

CREATE TABLE `dim_aluno` (
  `sk_aluno` int(11) NOT NULL,
  `nk_id_aluno` int(11) DEFAULT NULL,
  `nome_aluno` varchar(150) DEFAULT NULL,
  `status_aluno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_aluno`
--

INSERT INTO `dim_aluno` (`sk_aluno`, `nk_id_aluno`, `nome_aluno`, `status_aluno`) VALUES
(1, 1, 'Thomas Dias Batista', 'Ativo'),
(2, 2, 'Lucas Ferreira Santos', 'Ativo'),
(3, 3, 'Juliana Mendes Costa', 'Ativo'),
(4, 4, 'Gabriel Rocha Almeida', 'Trancado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_curso`
--

CREATE TABLE `dim_curso` (
  `sk_curso` int(11) NOT NULL,
  `nk_id_curso` int(11) DEFAULT NULL,
  `nome_curso` varchar(200) DEFAULT NULL,
  `modalidade` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_curso`
--

INSERT INTO `dim_curso` (`sk_curso`, `nk_id_curso`, `nome_curso`, `modalidade`) VALUES
(1, 1, 'ADS', 'Presencial'),
(2, 2, 'Engenharia de Software', 'EAD');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_professor`
--

CREATE TABLE `dim_professor` (
  `sk_professor` int(11) NOT NULL,
  `nk_id_professor` int(11) DEFAULT NULL,
  `nome_professor` varchar(150) DEFAULT NULL,
  `titulacao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_professor`
--

INSERT INTO `dim_professor` (`sk_professor`, `nk_id_professor`, `nome_professor`, `titulacao`) VALUES
(1, 1, 'Carlos Roberto Silva', 'Doutorado'),
(2, 2, 'Ana Paula Oliveira', 'Mestrado'),
(3, 3, 'Marcos Vinícius Souza', 'Doutorado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_tempo`
--

CREATE TABLE `dim_tempo` (
  `sk_tempo` int(11) NOT NULL,
  `data_referencia` date DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `trimestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_tempo`
--

INSERT INTO `dim_tempo` (`sk_tempo`, `data_referencia`, `mes`, `ano`, `trimestre`) VALUES
(1, '2026-04-11', 4, 2026, 2),
(2, '2026-04-10', 4, 2026, 2),
(3, '2026-04-08', 4, 2026, 2),
(4, '2026-04-25', 4, 2026, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fato_sisgesc`
--

CREATE TABLE `fato_sisgesc` (
  `sk_aluno` int(11) DEFAULT NULL,
  `sk_professor` int(11) DEFAULT NULL,
  `sk_curso` int(11) DEFAULT NULL,
  `sk_tempo` int(11) DEFAULT NULL,
  `nota_media` decimal(4,2) DEFAULT NULL,
  `total_faltas` int(11) DEFAULT NULL,
  `valor_pago` decimal(10,2) DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fato_sisgesc`
--

INSERT INTO `fato_sisgesc` (`sk_aluno`, `sk_professor`, `sk_curso`, `sk_tempo`, `nota_media`, `total_faltas`, `valor_pago`, `dias_atraso`) VALUES
(1, 1, 1, 1, 9.50, 2, 1000.00, 1),
(2, 1, 1, 2, 8.75, 4, 1000.00, 0),
(3, 3, 1, 3, 7.20, 1, 1000.00, -2),
(4, 2, 2, 4, 4.50, 32, 850.00, 15);

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
  `status_aluno` varchar(20) DEFAULT 'Ativo',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_aluno`
--

INSERT INTO `tb_aluno` (`pk_aluno`, `nome_aluno`, `cpf_aluno`, `email_aluno`, `data_nascimento_aluno`, `status_aluno`, `data_criacao`) VALUES
(1, 'Thomas Dias Batista', '12345678901', 'thomas.d@estudante.com', '2007-02-22', 'Ativo', '2026-04-25 18:11:57'),
(2, 'Lucas Ferreira Santos', '11122233344', 'lucas.ferreira@estudante.com', '2005-08-15', 'Ativo', '2026-04-25 18:11:57'),
(3, 'Juliana Mendes Costa', '55566677788', 'ju.mendes@estudante.com', '2004-03-12', 'Ativo', '2026-04-25 18:11:57'),
(4, 'Gabriel Rocha Almeida', '98765432100', 'gabriel.rocha@estudante.com', '2003-11-30', 'Trancado', '2026-04-25 18:11:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_curso`
--

CREATE TABLE `tb_curso` (
  `pk_curso` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `modalidade` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_curso`
--

INSERT INTO `tb_curso` (`pk_curso`, `nome`, `modalidade`) VALUES
(1, 'ADS', 'Presencial'),
(2, 'Engenharia de Software', 'EAD');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_falta`
--

CREATE TABLE `tb_falta` (
  `pk_falta` int(11) NOT NULL,
  `fk_matricula` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_falta`
--

INSERT INTO `tb_falta` (`pk_falta`, `fk_matricula`, `quantidade`) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 1),
(4, 4, 32);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `pk_funcionario` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`pk_funcionario`, `nome`, `cargo`) VALUES
(1, 'Carlos Roberto Silva', 'Professor'),
(2, 'Ana Paula Oliveira', 'Professor'),
(3, 'Marcos Vinícius Souza', 'Professor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_matricula`
--

CREATE TABLE `tb_matricula` (
  `pk_matricula` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `fk_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_matricula`
--

INSERT INTO `tb_matricula` (`pk_matricula`, `fk_aluno`, `fk_turma`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_mensalidade`
--

CREATE TABLE `tb_mensalidade` (
  `pk_mensalidade` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_mensalidade`
--

INSERT INTO `tb_mensalidade` (`pk_mensalidade`, `fk_aluno`, `valor`, `data_vencimento`) VALUES
(1, 1, 1000.00, '2026-04-10'),
(2, 2, 1000.00, '2026-04-10'),
(3, 3, 1000.00, '2026-04-10'),
(4, 4, 850.00, '2026-04-10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_nota`
--

CREATE TABLE `tb_nota` (
  `pk_nota` int(11) NOT NULL,
  `fk_matricula` int(11) NOT NULL,
  `nota` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_nota`
--

INSERT INTO `tb_nota` (`pk_nota`, `fk_matricula`, `nota`) VALUES
(1, 1, 9.50),
(2, 2, 8.75),
(3, 3, 7.20),
(4, 4, 4.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pagamento`
--

CREATE TABLE `tb_pagamento` (
  `pk_pagamento` int(11) NOT NULL,
  `fk_mensalidade` int(11) NOT NULL,
  `data_pagamento` date NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_pagamento`
--

INSERT INTO `tb_pagamento` (`pk_pagamento`, `fk_mensalidade`, `data_pagamento`, `valor_pago`) VALUES
(1, 1, '2026-04-11', 1000.00),
(2, 2, '2026-04-10', 1000.00),
(3, 3, '2026-04-08', 1000.00),
(4, 4, '2026-04-25', 850.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_professor`
--

CREATE TABLE `tb_professor` (
  `pk_professor` int(11) NOT NULL,
  `fk_funcionario` int(11) NOT NULL,
  `titulacao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_professor`
--

INSERT INTO `tb_professor` (`pk_professor`, `fk_funcionario`, `titulacao`) VALUES
(1, 1, 'Doutorado'),
(2, 2, 'Mestrado'),
(3, 3, 'Doutorado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_turma`
--

CREATE TABLE `tb_turma` (
  `pk_turma` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_turma`
--

INSERT INTO `tb_turma` (`pk_turma`, `fk_professor`, `fk_curso`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

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
-- Índices de tabela `dim_professor`
--
ALTER TABLE `dim_professor`
  ADD PRIMARY KEY (`sk_professor`);

--
-- Índices de tabela `dim_tempo`
--
ALTER TABLE `dim_tempo`
  ADD PRIMARY KEY (`sk_tempo`);

--
-- Índices de tabela `fato_sisgesc`
--
ALTER TABLE `fato_sisgesc`
  ADD KEY `sk_aluno` (`sk_aluno`),
  ADD KEY `sk_professor` (`sk_professor`),
  ADD KEY `sk_curso` (`sk_curso`),
  ADD KEY `sk_tempo` (`sk_tempo`);

--
-- Índices de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD PRIMARY KEY (`pk_aluno`),
  ADD UNIQUE KEY `cpf_aluno` (`cpf_aluno`),
  ADD UNIQUE KEY `email_aluno` (`email_aluno`);

--
-- Índices de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  ADD PRIMARY KEY (`pk_curso`);

--
-- Índices de tabela `tb_falta`
--
ALTER TABLE `tb_falta`
  ADD PRIMARY KEY (`pk_falta`),
  ADD KEY `fk_matricula` (`fk_matricula`);

--
-- Índices de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`pk_funcionario`);

--
-- Índices de tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  ADD PRIMARY KEY (`pk_matricula`),
  ADD KEY `fk_aluno` (`fk_aluno`),
  ADD KEY `fk_turma` (`fk_turma`);

--
-- Índices de tabela `tb_mensalidade`
--
ALTER TABLE `tb_mensalidade`
  ADD PRIMARY KEY (`pk_mensalidade`),
  ADD KEY `fk_aluno` (`fk_aluno`);

--
-- Índices de tabela `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD PRIMARY KEY (`pk_nota`),
  ADD KEY `fk_matricula` (`fk_matricula`);

--
-- Índices de tabela `tb_pagamento`
--
ALTER TABLE `tb_pagamento`
  ADD PRIMARY KEY (`pk_pagamento`),
  ADD KEY `fk_mensalidade` (`fk_mensalidade`);

--
-- Índices de tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  ADD PRIMARY KEY (`pk_professor`),
  ADD KEY `fk_funcionario` (`fk_funcionario`);

--
-- Índices de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD PRIMARY KEY (`pk_turma`),
  ADD KEY `fk_professor` (`fk_professor`),
  ADD KEY `fk_curso` (`fk_curso`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dim_aluno`
--
ALTER TABLE `dim_aluno`
  MODIFY `sk_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `dim_curso`
--
ALTER TABLE `dim_curso`
  MODIFY `sk_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `dim_professor`
--
ALTER TABLE `dim_professor`
  MODIFY `sk_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `dim_tempo`
--
ALTER TABLE `dim_tempo`
  MODIFY `sk_tempo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  MODIFY `pk_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  MODIFY `pk_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_falta`
--
ALTER TABLE `tb_falta`
  MODIFY `pk_falta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `pk_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  MODIFY `pk_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_mensalidade`
--
ALTER TABLE `tb_mensalidade`
  MODIFY `pk_mensalidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_nota`
--
ALTER TABLE `tb_nota`
  MODIFY `pk_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_pagamento`
--
ALTER TABLE `tb_pagamento`
  MODIFY `pk_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  MODIFY `pk_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  MODIFY `pk_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `fato_sisgesc`
--
ALTER TABLE `fato_sisgesc`
  ADD CONSTRAINT `fato_sisgesc_ibfk_1` FOREIGN KEY (`sk_aluno`) REFERENCES `dim_aluno` (`sk_aluno`),
  ADD CONSTRAINT `fato_sisgesc_ibfk_2` FOREIGN KEY (`sk_professor`) REFERENCES `dim_professor` (`sk_professor`),
  ADD CONSTRAINT `fato_sisgesc_ibfk_3` FOREIGN KEY (`sk_curso`) REFERENCES `dim_curso` (`sk_curso`),
  ADD CONSTRAINT `fato_sisgesc_ibfk_4` FOREIGN KEY (`sk_tempo`) REFERENCES `dim_tempo` (`sk_tempo`);

--
-- Restrições para tabelas `tb_falta`
--
ALTER TABLE `tb_falta`
  ADD CONSTRAINT `tb_falta_ibfk_1` FOREIGN KEY (`fk_matricula`) REFERENCES `tb_matricula` (`pk_matricula`);

--
-- Restrições para tabelas `tb_matricula`
--
ALTER TABLE `tb_matricula`
  ADD CONSTRAINT `tb_matricula_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`),
  ADD CONSTRAINT `tb_matricula_ibfk_2` FOREIGN KEY (`fk_turma`) REFERENCES `tb_turma` (`pk_turma`);

--
-- Restrições para tabelas `tb_mensalidade`
--
ALTER TABLE `tb_mensalidade`
  ADD CONSTRAINT `tb_mensalidade_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`);

--
-- Restrições para tabelas `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD CONSTRAINT `tb_nota_ibfk_1` FOREIGN KEY (`fk_matricula`) REFERENCES `tb_matricula` (`pk_matricula`);

--
-- Restrições para tabelas `tb_pagamento`
--
ALTER TABLE `tb_pagamento`
  ADD CONSTRAINT `tb_pagamento_ibfk_1` FOREIGN KEY (`fk_mensalidade`) REFERENCES `tb_mensalidade` (`pk_mensalidade`);

--
-- Restrições para tabelas `tb_professor`
--
ALTER TABLE `tb_professor`
  ADD CONSTRAINT `tb_professor_ibfk_1` FOREIGN KEY (`fk_funcionario`) REFERENCES `tb_funcionario` (`pk_funcionario`);

--
-- Restrições para tabelas `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD CONSTRAINT `tb_turma_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `tb_professor` (`pk_professor`),
  ADD CONSTRAINT `tb_turma_ibfk_2` FOREIGN KEY (`fk_curso`) REFERENCES `tb_curso` (`pk_curso`);
COMMIT;


