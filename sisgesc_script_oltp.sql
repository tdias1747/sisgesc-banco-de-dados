

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";





--
-- Estrutura para tabela `dim_aluno`
--

CREATE TABLE `dim_aluno` (
  `sk_aluno` int(11) NOT NULL,
  `nk_id_aluno` int(11) DEFAULT NULL,
  `nome_aluno` varchar(150) DEFAULT NULL,
  `status_aluno` varchar(20) DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_aluno`
--

INSERT INTO `dim_aluno` (`sk_aluno`, `nk_id_aluno`, `nome_aluno`, `status_aluno`, `data_matricula`, `data_saida`) VALUES
(1, 1, 'Thomas Dias Batista', 'ativo', '2026-04-25', NULL),
(2, 2, 'Fernando Pessoa', 'ativo', '2026-04-25', NULL);

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
(1, 1, 'Análise e Desenvolvimento de Sistemas', 'Presencial'),
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
(1, 1, 'Ricardo Montalban', 'Doutorado'),
(2, 2, 'Helena Troia', 'Mestrado'),
(3, 3, 'Beatriz Portinari', 'Doutorado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_tempo`
--

CREATE TABLE `dim_tempo` (
  `sk_tempo` int(11) NOT NULL,
  `data_referencia` date DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `semestre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_tempo`
--

INSERT INTO `dim_tempo` (`sk_tempo`, `data_referencia`, `mes`, `ano`, `semestre`) VALUES
(1, '2026-04-10', 4, 2026, '1º Sem'),
(2, '2026-04-15', 4, 2026, '1º Sem');

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
  `dias_atraso` int(11) DEFAULT NULL,
  `horas_totais_docente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fato_sisgesc`
--

INSERT INTO `fato_sisgesc` (`sk_aluno`, `sk_professor`, `sk_curso`, `sk_tempo`, `nota_media`, `total_faltas`, `valor_pago`, `dias_atraso`, `horas_totais_docente`) VALUES
(1, 1, 1, 1, 9.50, 0, 1250.00, 0, 50),
(2, 1, 1, 2, 7.00, 0, 1000.00, 5, 50);

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
  `telefone_aluno` varchar(20) DEFAULT NULL,
  `endereco_aluno` varchar(300) DEFAULT NULL,
  `status_aluno` varchar(20) DEFAULT 'ativo',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_aluno`
--

INSERT INTO `tb_aluno` (`pk_aluno`, `nome_aluno`, `cpf_aluno`, `email_aluno`, `data_nascimento_aluno`, `telefone_aluno`, `endereco_aluno`, `status_aluno`, `data_criacao`, `ultima_atualizacao`) VALUES
(1, 'Thomas Dias Batista', '99988877766', 'thomas.d@estudante.com', '2007-02-22', NULL, NULL, 'ativo', '2026-04-25 15:28:07', '2026-04-25 15:28:07'),
(2, 'Fernando Pessoa', '44433322211', 'fernando.p@estudante.com', '2005-10-12', NULL, NULL, 'ativo', '2026-04-25 15:28:07', '2026-04-25 15:28:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contrato_educacional`
--

CREATE TABLE `tb_contrato_educacional` (
  `pk_contrato` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_contrato_educacional`
--

INSERT INTO `tb_contrato_educacional` (`pk_contrato`, `fk_aluno`, `fk_curso`, `data_inicio`, `valor_total`) VALUES
(1, 1, 1, '2026-02-01', 15000.00),
(2, 2, 2, '2026-02-01', 12000.00);

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
(1, 'Análise e Desenvolvimento de Sistemas', 'Presencial', 2000),
(2, 'Engenharia de Software', 'EAD', 2400);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_disciplina`
--

CREATE TABLE `tb_disciplina` (
  `pk_disciplina` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `carga_horaria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_disciplina`
--

INSERT INTO `tb_disciplina` (`pk_disciplina`, `fk_curso`, `nome`, `carga_horaria`) VALUES
(1, 1, 'Banco de Dados II', 80),
(2, 2, 'Qualidade de Software', 60);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `pk_funcionario` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `data_admissao` date NOT NULL,
  `status` varchar(20) DEFAULT 'ativo',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`pk_funcionario`, `nome`, `cpf`, `email`, `cargo`, `salario`, `data_admissao`, `status`, `data_criacao`, `ultima_atualizacao`) VALUES
(1, 'Ricardo Montalban', '11122233344', 'ricardo.m@sisgesc.edu.br', 'Professor Titular', 8200.00, '2021-03-10', 'ativo', '2026-04-25 15:28:02', '2026-04-25 15:28:02'),
(2, 'Helena Troia', '55566677788', 'helena.t@sisgesc.edu.br', 'Professor Associado', 7800.00, '2022-01-15', 'ativo', '2026-04-25 15:28:02', '2026-04-25 15:28:02'),
(3, 'Beatriz Portinari', '33344455566', 'beatriz.p@sisgesc.edu.br', 'Professor Adjunto', 7500.00, '2023-02-01', 'ativo', '2026-04-25 15:28:02', '2026-04-25 15:28:02');

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

--
-- Despejando dados para a tabela `tb_matricula`
--

INSERT INTO `tb_matricula` (`pk_matricula`, `fk_aluno`, `fk_turma`, `data_matricula`) VALUES
(1, 1, 1, '2026-02-01'),
(2, 2, 1, '2026-02-05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_mensalidade`
--

CREATE TABLE `tb_mensalidade` (
  `pk_mensalidade` int(11) NOT NULL,
  `fk_contrato` int(11) NOT NULL,
  `mes_referencia` int(11) NOT NULL,
  `ano_referencia` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_mensalidade`
--

INSERT INTO `tb_mensalidade` (`pk_mensalidade`, `fk_contrato`, `mes_referencia`, `ano_referencia`, `valor`, `data_vencimento`) VALUES
(1, 1, 4, 2026, 1250.00, '2026-04-10'),
(2, 2, 4, 2026, 1000.00, '2026-04-10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_nota`
--

CREATE TABLE `tb_nota` (
  `pk_nota` int(11) NOT NULL,
  `fk_matricula` int(11) NOT NULL,
  `tipo_avaliacao` varchar(50) NOT NULL,
  `nota` decimal(4,2) NOT NULL,
  `data_avaliacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_nota`
--

INSERT INTO `tb_nota` (`pk_nota`, `fk_matricula`, `tipo_avaliacao`, `nota`, `data_avaliacao`) VALUES
(1, 1, 'A1', 9.50, '2026-04-15'),
(2, 2, 'A1', 7.00, '2026-04-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pagamento`
--

CREATE TABLE `tb_pagamento` (
  `pk_pagamento` int(11) NOT NULL,
  `fk_mensalidade` int(11) NOT NULL,
  `data_pagamento` date NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_pagamento`
--

INSERT INTO `tb_pagamento` (`pk_pagamento`, `fk_mensalidade`, `data_pagamento`, `valor_pago`, `forma_pagamento`) VALUES
(1, 1, '2026-04-10', 1250.00, 'PIX'),
(2, 2, '2026-04-15', 1000.00, 'Cartão');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_professor`
--

CREATE TABLE `tb_professor` (
  `pk_professor` int(11) NOT NULL,
  `fk_funcionario` int(11) NOT NULL,
  `titulacao` varchar(50) DEFAULT NULL,
  `area_atuacao` varchar(200) DEFAULT NULL,
  `regime_trabalho` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_professor`
--

INSERT INTO `tb_professor` (`pk_professor`, `fk_funcionario`, `titulacao`, `area_atuacao`, `regime_trabalho`) VALUES
(1, 1, 'Doutorado', 'Sistemas Operacionais', 'Integral'),
(2, 2, 'Mestrado', 'Engenharia de Software', 'Parcial'),
(3, 3, 'Doutorado', 'Banco de Dados', 'Integral');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_turma`
--

CREATE TABLE `tb_turma` (
  `pk_turma` int(11) NOT NULL,
  `fk_disciplina` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  `ano` int(11) NOT NULL,
  `horario` varchar(100) NOT NULL,
  `vaga_max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_turma`
--

INSERT INTO `tb_turma` (`pk_turma`, `fk_disciplina`, `fk_professor`, `semestre`, `ano`, `horario`, `vaga_max`) VALUES
(1, 1, 1, '2026/1', 2026, '19:00 - 22:30', 40);

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
-- Índices de tabela `tb_contrato_educacional`
--
ALTER TABLE `tb_contrato_educacional`
  ADD PRIMARY KEY (`pk_contrato`),
  ADD KEY `fk_aluno` (`fk_aluno`),
  ADD KEY `fk_curso` (`fk_curso`);

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
  ADD KEY `fk_curso` (`fk_curso`);

--
-- Índices de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`pk_funcionario`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`);

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
  ADD KEY `fk_contrato` (`fk_contrato`);

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
  ADD KEY `fk_disciplina` (`fk_disciplina`),
  ADD KEY `fk_professor` (`fk_professor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dim_aluno`
--
ALTER TABLE `dim_aluno`
  MODIFY `sk_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `sk_tempo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  MODIFY `pk_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_contrato_educacional`
--
ALTER TABLE `tb_contrato_educacional`
  MODIFY `pk_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  MODIFY `pk_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  MODIFY `pk_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `pk_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  MODIFY `pk_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_mensalidade`
--
ALTER TABLE `tb_mensalidade`
  MODIFY `pk_mensalidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_nota`
--
ALTER TABLE `tb_nota`
  MODIFY `pk_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_pagamento`
--
ALTER TABLE `tb_pagamento`
  MODIFY `pk_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  MODIFY `pk_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  MODIFY `pk_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Restrições para tabelas `tb_contrato_educacional`
--
ALTER TABLE `tb_contrato_educacional`
  ADD CONSTRAINT `tb_contrato_educacional_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`),
  ADD CONSTRAINT `tb_contrato_educacional_ibfk_2` FOREIGN KEY (`fk_curso`) REFERENCES `tb_curso` (`pk_curso`);

--
-- Restrições para tabelas `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  ADD CONSTRAINT `tb_disciplina_ibfk_1` FOREIGN KEY (`fk_curso`) REFERENCES `tb_curso` (`pk_curso`);

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
  ADD CONSTRAINT `tb_mensalidade_ibfk_1` FOREIGN KEY (`fk_contrato`) REFERENCES `tb_contrato_educacional` (`pk_contrato`);

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
  ADD CONSTRAINT `tb_turma_ibfk_1` FOREIGN KEY (`fk_disciplina`) REFERENCES `tb_disciplina` (`pk_disciplina`),
  ADD CONSTRAINT `tb_turma_ibfk_2` FOREIGN KEY (`fk_professor`) REFERENCES `tb_professor` (`pk_professor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
