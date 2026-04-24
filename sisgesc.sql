
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




CREATE DATABASE IF NOT EXISTS sisgesc;
USE sisgesc;


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

-- --------------------------------------------------------



CREATE TABLE `tb_carga_horaria_docente` (
  `pk_carga` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  `ano` int(11) NOT NULL,
  `horas_aula` int(11) NOT NULL,
  `horas_pesquisa` int(11) DEFAULT 0,
  `horas_extensao` int(11) DEFAULT 0,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `tb_conta_receber` (
  `pk_conta` int(11) NOT NULL,
  `fk_mensalidade` int(11) NOT NULL,
  `valor_devido` decimal(10,2) NOT NULL,
  `valor_recebido` decimal(10,2) DEFAULT 0.00,
  `status` varchar(20) DEFAULT 'aberto',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `tb_contrato_educacional` (
  `pk_contrato` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'vigente',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `tb_curso` (
  `pk_curso` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `modalidade` varchar(20) NOT NULL,
  `carga_horaria_total` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'ativo',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `tb_disciplina` (
  `pk_disciplina` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `ementa` text DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `tb_falta` (
  `pk_falta` int(11) NOT NULL,
  `fk_matricula` int(11) NOT NULL,
  `data_falta` date NOT NULL,
  `justificativa` text DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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


CREATE TABLE `tb_grade_horaria` (
  `pk_grade` int(11) NOT NULL,
  `fk_turma` int(11) NOT NULL,
  `dia_semana` varchar(15) NOT NULL,
  `horario_inicio` time NOT NULL,
  `horario_fim` time NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `tb_inadimplencia` (
  `pk_inadimplencia` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `fk_mensalidade` int(11) NOT NULL,
  `dias_atraso` int(11) NOT NULL,
  `valor_multa` decimal(10,2) DEFAULT 0.00,
  `status` varchar(20) DEFAULT 'pendente',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `tb_matricula` (
  `pk_matricula` int(11) NOT NULL,
  `fk_aluno` int(11) NOT NULL,
  `fk_turma` int(11) NOT NULL,
  `data_matricula` date NOT NULL,
  `status` varchar(20) DEFAULT 'ativa',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `tb_mensalidade` (
  `pk_mensalidade` int(11) NOT NULL,
  `fk_contrato` int(11) NOT NULL,
  `mes_referencia` int(11) NOT NULL,
  `ano_referencia` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL,
  `status` varchar(20) DEFAULT 'pendente',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `tb_nota` (
  `pk_nota` int(11) NOT NULL,
  `fk_matricula` int(11) NOT NULL,
  `tipo_avaliacao` varchar(50) NOT NULL,
  `nota` decimal(4,2) NOT NULL,
  `data_avaliacao` date NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `tb_pagamento` (
  `pk_pagamento` int(11) NOT NULL,
  `fk_mensalidade` int(11) NOT NULL,
  `data_pagamento` date NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `tb_professor` (
  `pk_professor` int(11) NOT NULL,
  `fk_funcionario` int(11) NOT NULL,
  `titulacao` varchar(50) DEFAULT NULL,
  `area_atuacao` varchar(200) DEFAULT NULL,
  `regime_trabalho` varchar(30) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `tb_turma` (
  `pk_turma` int(11) NOT NULL,
  `fk_disciplina` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  `ano` int(11) NOT NULL,
  `horario` varchar(100) NOT NULL,
  `sala` varchar(50) DEFAULT NULL,
  `vaga_max` int(11) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



CREATE TABLE `tb_vinculo_professor_disciplina` (
  `pk_vinculo` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `fk_disciplina` int(11) NOT NULL,
  `semestre` varchar(6) NOT NULL,
  `ano` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'ativo',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `tb_aluno`
  ADD PRIMARY KEY (`pk_aluno`),
  ADD UNIQUE KEY `cpf_aluno` (`cpf_aluno`),
  ADD UNIQUE KEY `email_aluno` (`email_aluno`);


ALTER TABLE `tb_carga_horaria_docente`
  ADD PRIMARY KEY (`pk_carga`),
  ADD KEY `fk_professor` (`fk_professor`);


ALTER TABLE `tb_conta_receber`
  ADD PRIMARY KEY (`pk_conta`),
  ADD KEY `fk_mensalidade` (`fk_mensalidade`);


ALTER TABLE `tb_contrato_educacional`
  ADD PRIMARY KEY (`pk_contrato`),
  ADD KEY `fk_aluno` (`fk_aluno`),
  ADD KEY `fk_curso` (`fk_curso`);


ALTER TABLE `tb_curso`
  ADD PRIMARY KEY (`pk_curso`);


ALTER TABLE `tb_disciplina`
  ADD PRIMARY KEY (`pk_disciplina`),
  ADD KEY `fk_curso` (`fk_curso`);


ALTER TABLE `tb_falta`
  ADD PRIMARY KEY (`pk_falta`),
  ADD KEY `fk_matricula` (`fk_matricula`);


ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`pk_funcionario`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`);


ALTER TABLE `tb_grade_horaria`
  ADD PRIMARY KEY (`pk_grade`),
  ADD KEY `fk_turma` (`fk_turma`);


ALTER TABLE `tb_inadimplencia`
  ADD PRIMARY KEY (`pk_inadimplencia`),
  ADD KEY `fk_aluno` (`fk_aluno`),
  ADD KEY `fk_mensalidade` (`fk_mensalidade`);


ALTER TABLE `tb_matricula`
  ADD PRIMARY KEY (`pk_matricula`),
  ADD KEY `fk_aluno` (`fk_aluno`),
  ADD KEY `fk_turma` (`fk_turma`);


ALTER TABLE `tb_mensalidade`
  ADD PRIMARY KEY (`pk_mensalidade`),
  ADD KEY `fk_contrato` (`fk_contrato`);


ALTER TABLE `tb_nota`
  ADD PRIMARY KEY (`pk_nota`),
  ADD KEY `fk_matricula` (`fk_matricula`);


ALTER TABLE `tb_pagamento`
  ADD PRIMARY KEY (`pk_pagamento`),
  ADD KEY `fk_mensalidade` (`fk_mensalidade`);


ALTER TABLE `tb_professor`
  ADD PRIMARY KEY (`pk_professor`),
  ADD KEY `fk_funcionario` (`fk_funcionario`);


ALTER TABLE `tb_turma`
  ADD PRIMARY KEY (`pk_turma`),
  ADD KEY `fk_disciplina` (`fk_disciplina`),
  ADD KEY `fk_professor` (`fk_professor`);


ALTER TABLE `tb_vinculo_professor_disciplina`
  ADD PRIMARY KEY (`pk_vinculo`),
  ADD KEY `fk_professor` (`fk_professor`),
  ADD KEY `fk_disciplina` (`fk_disciplina`);


ALTER TABLE `tb_aluno`
  MODIFY `pk_aluno` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_carga_horaria_docente`
  MODIFY `pk_carga` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_conta_receber`
  MODIFY `pk_conta` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_contrato_educacional`
  MODIFY `pk_contrato` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_curso`
  MODIFY `pk_curso` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_disciplina`
  MODIFY `pk_disciplina` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_falta`
  MODIFY `pk_falta` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_funcionario`
  MODIFY `pk_funcionario` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_grade_horaria`
  MODIFY `pk_grade` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_inadimplencia`
  MODIFY `pk_inadimplencia` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_matricula`
  MODIFY `pk_matricula` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_mensalidade`
  MODIFY `pk_mensalidade` int(11) NOT NULL AUTO_INCREMENT;

MENT de tabela `tb_nota`
--
ALTER TABLE `tb_nota`
  MODIFY `pk_nota` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_pagamento`
  MODIFY `pk_pagamento` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_professor`
  MODIFY `pk_professor` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_turma`
  MODIFY `pk_turma` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_vinculo_professor_disciplina`
  MODIFY `pk_vinculo` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tb_carga_horaria_docente`
  ADD CONSTRAINT `tb_carga_horaria_docente_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `tb_professor` (`pk_professor`);


ALTER TABLE `tb_conta_receber`
  ADD CONSTRAINT `tb_conta_receber_ibfk_1` FOREIGN KEY (`fk_mensalidade`) REFERENCES `tb_mensalidade` (`pk_mensalidade`);


ALTER TABLE `tb_contrato_educacional`
  ADD CONSTRAINT `tb_contrato_educacional_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`),
  ADD CONSTRAINT `tb_contrato_educacional_ibfk_2` FOREIGN KEY (`fk_curso`) REFERENCES `tb_curso` (`pk_curso`);


ALTER TABLE `tb_disciplina`
  ADD CONSTRAINT `tb_disciplina_ibfk_1` FOREIGN KEY (`fk_curso`) REFERENCES `tb_curso` (`pk_curso`);


ALTER TABLE `tb_falta`
  ADD CONSTRAINT `tb_falta_ibfk_1` FOREIGN KEY (`fk_matricula`) REFERENCES `tb_matricula` (`pk_matricula`);


ALTER TABLE `tb_grade_horaria`
  ADD CONSTRAINT `tb_grade_horaria_ibfk_1` FOREIGN KEY (`fk_turma`) REFERENCES `tb_turma` (`pk_turma`);


ALTER TABLE `tb_inadimplencia`
  ADD CONSTRAINT `tb_inadimplencia_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`),
  ADD CONSTRAINT `tb_inadimplencia_ibfk_2` FOREIGN KEY (`fk_mensalidade`) REFERENCES `tb_mensalidade` (`pk_mensalidade`);


ALTER TABLE `tb_matricula`
  ADD CONSTRAINT `tb_matricula_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `tb_aluno` (`pk_aluno`),
  ADD CONSTRAINT `tb_matricula_ibfk_2` FOREIGN KEY (`fk_turma`) REFERENCES `tb_turma` (`pk_turma`);


ALTER TABLE `tb_mensalidade`
  ADD CONSTRAINT `tb_mensalidade_ibfk_1` FOREIGN KEY (`fk_contrato`) REFERENCES `tb_contrato_educacional` (`pk_contrato`);


ALTER TABLE `tb_nota`
  ADD CONSTRAINT `tb_nota_ibfk_1` FOREIGN KEY (`fk_matricula`) REFERENCES `tb_matricula` (`pk_matricula`);

ALTER TABLE `tb_pagamento`
  ADD CONSTRAINT `tb_pagamento_ibfk_1` FOREIGN KEY (`fk_mensalidade`) REFERENCES `tb_mensalidade` (`pk_mensalidade`);


ALTER TABLE `tb_professor`
  ADD CONSTRAINT `tb_professor_ibfk_1` FOREIGN KEY (`fk_funcionario`) REFERENCES `tb_funcionario` (`pk_funcionario`);


ALTER TABLE `tb_turma`
  ADD CONSTRAINT `tb_turma_ibfk_1` FOREIGN KEY (`fk_disciplina`) REFERENCES `tb_disciplina` (`pk_disciplina`),
  ADD CONSTRAINT `tb_turma_ibfk_2` FOREIGN KEY (`fk_professor`) REFERENCES `tb_professor` (`pk_professor`);


ALTER TABLE `tb_vinculo_professor_disciplina`
  ADD CONSTRAINT `tb_vinculo_professor_disciplina_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `tb_professor` (`pk_professor`),
  ADD CONSTRAINT `tb_vinculo_professor_disciplina_ibfk_2` FOREIGN KEY (`fk_disciplina`) REFERENCES `tb_disciplina` (`pk_disciplina`);
COMMIT;

