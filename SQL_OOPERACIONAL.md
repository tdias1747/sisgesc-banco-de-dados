**CREATE DATABASE IF NOT EXISTS sisgesc;**

**USE sisgesc;**



**SET FOREIGN\_KEY\_CHECKS = 0;**



**--LIMPEZA DE DADOS (Padrão)**



**DROP TABLE IF EXISTS tb\_carga\_horaria\_docente, tb\_vinculos\_professor\_disciplina, tb\_professor, tb\_funcionario;**

**DROP TABLE IF EXISTS tb\_inadimplencia, tb\_contas\_receber, tb\_pagamento, tb\_mensalidade, tb\_contrato\_educacional;**

**DROP TABLE IF EXISTS tb\_horario\_grade, tb\_falta, tb\_nota, tb\_matricula, tb\_turma, tb\_disciplina, tb\_curso, tb\_aluno;**

**DROP TABLE IF EXISTS fato\_desempenho, fato\_frequencia, fato\_financeiro, dim\_aluno, dim\_professor, dim\_curso, dim\_tempo;**



**SET FOREIGN\_KEY\_CHECKS = 1;**



**--CRIAÇÃO DE TABELAS OPERACIONAIS (vindo do oltp)**



**CREATE TABLE tb\_aluno (**

&#x20; **pk\_aluno INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **nome\_aluno VARCHAR(150) NOT NULL,**

&#x20; **cpf\_aluno VARCHAR(11) NOT NULL UNIQUE,**

&#x20; **email\_aluno VARCHAR(200) NOT NULL UNIQUE,**

&#x20; **data\_nascimento\_aluno DATE NOT NULL,**

&#x20; **telefone\_aluno VARCHAR(20),**

&#x20; **status\_aluno VARCHAR(20) DEFAULT 'Ativo' CHECK (status\_aluno IN ('Ativo', 'Trancado', 'Formado', 'Desligado')),**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_curso (**

&#x20; **pk\_curso INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **nome VARCHAR(200) NOT NULL,**

&#x20; **modalidade VARCHAR(20) NOT NULL CHECK (modalidade IN ('Presencial', 'EAD')),**

&#x20; **carga\_horaria\_curso INT NOT NULL,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_disciplina (**

&#x20; **pk\_disciplina INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_curso INT NOT NULL,**

&#x20; **nome VARCHAR(200) NOT NULL,**

&#x20; **carga\_horaria INT NOT NULL,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_curso) REFERENCES tb\_curso(pk\_curso)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_funcionario (**

&#x20; **pk\_funcionario INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **nome VARCHAR(150) NOT NULL,**

&#x20; **cpf VARCHAR(11) NOT NULL UNIQUE,**

&#x20; **cargo VARCHAR(100) NOT NULL,**

&#x20; **salario DECIMAL(10,2) NOT NULL CHECK (salario > 0),**

&#x20; **data\_admissao DATE NOT NULL,**

&#x20; **status\_func VARCHAR(20) DEFAULT 'Ativo',**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_professor (**

&#x20; **pk\_professor INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_funcionario INT NOT NULL UNIQUE,**

&#x20; **titulacao VARCHAR(50) NOT NULL,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_funcionario) REFERENCES tb\_funcionario(pk\_funcionario)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_turma (**

&#x20; **pk\_turma INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_disciplina INT NOT NULL,**

&#x20; **fk\_professor INT NOT NULL,**

&#x20; **fk\_curso INT NOT NULL,**

&#x20; **semestre VARCHAR(6) NOT NULL,**

&#x20; **ano INT NOT NULL,**

&#x20; **vaga\_max INT DEFAULT 40,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_disciplina) REFERENCES tb\_disciplina(pk\_disciplina),**

&#x20; **FOREIGN KEY (fk\_professor) REFERENCES tb\_professor(pk\_professor),**

&#x20; **FOREIGN KEY (fk\_curso) REFERENCES tb\_curso(pk\_curso)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_matricula (**

&#x20; **pk\_matricula INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_aluno INT NOT NULL,**

&#x20; **fk\_turma INT NOT NULL,**

&#x20; **data\_matricula DATE DEFAULT (CURRENT\_DATE),**

&#x20; **status\_matr VARCHAR(20) DEFAULT 'Ativa',**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_aluno) REFERENCES tb\_aluno(pk\_aluno),**

&#x20; **FOREIGN KEY (fk\_turma) REFERENCES tb\_turma(pk\_turma)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_nota (**

&#x20; **pk\_nota INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_matricula INT NOT NULL,**

&#x20; **nota DECIMAL(4,2) NOT NULL CHECK (nota BETWEEN 0 AND 10),**

&#x20; **tipo\_avaliacao VARCHAR(50),**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_matricula) REFERENCES tb\_matricula(pk\_matricula)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_falta (**

&#x20; **pk\_falta INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_matricula INT NOT NULL,**

&#x20; **quantidade INT NOT NULL,**

&#x20; **data\_falta DATE,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_matricula) REFERENCES tb\_matricula(pk\_matricula)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_horario\_grade (**

&#x20; **pk\_grade INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_turma INT NOT NULL,**

&#x20; **dia\_semana VARCHAR(15),**

&#x20; **horario\_inicio TIME,**

&#x20; **horario\_fim TIME,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_turma) REFERENCES tb\_turma(pk\_turma)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**





**CREATE TABLE tb\_contrato\_educacional (**

&#x20; **pk\_contrato INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_aluno INT NOT NULL,**

&#x20; **fk\_curso INT NOT NULL,**

&#x20; **valor\_total DECIMAL(10,2) NOT NULL,**

&#x20; **status\_finan VARCHAR(20) DEFAULT 'Vigente',**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_aluno) REFERENCES tb\_aluno(pk\_aluno),**

&#x20; **FOREIGN KEY (fk\_curso) REFERENCES tb\_curso(pk\_curso)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_mensalidade (**

&#x20; **pk\_mensalidade INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_contrato INT NOT NULL,**

&#x20; **fk\_aluno INT NOT NULL,**

&#x20; **valor DECIMAL(10,2) NOT NULL,**

&#x20; **data\_vencimento DATE NOT NULL,**

&#x20; **status\_mensal VARCHAR(20) DEFAULT 'Pendente',**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_contrato) REFERENCES tb\_contrato\_educacional(pk\_contrato),**

&#x20; **FOREIGN KEY (fk\_aluno) REFERENCES tb\_aluno(pk\_aluno)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_pagamento (**

&#x20; **pk\_pagamento INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_mensalidade INT NOT NULL,**

&#x20; **data\_pagamento DATE NOT NULL,**

&#x20; **valor\_pago DECIMAL(10,2) NOT NULL,**

&#x20; **forma\_pagamento VARCHAR(50) DEFAULT 'Cartão',**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_mensalidade) REFERENCES tb\_mensalidade(pk\_mensalidade)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_contas\_receber (**

&#x20; **pk\_conta INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_mensalidade INT NOT NULL,**

&#x20; **valor\_devido DECIMAL(10,2),**

&#x20; **status\_conta VARCHAR(20) DEFAULT 'Aberto',**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_mensalidade) REFERENCES tb\_mensalidade(pk\_mensalidade)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_inadimplencia (**

&#x20; **pk\_inadimplencia INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_aluno INT NOT NULL,**

&#x20; **fk\_mensalidade INT NOT NULL,**

&#x20; **dias\_atraso INT DEFAULT 0,**

&#x20; **valor\_multa DECIMAL(10,2) DEFAULT 0.00,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_aluno) REFERENCES tb\_aluno(pk\_aluno),**

&#x20; **FOREIGN KEY (fk\_mensalidade) REFERENCES tb\_mensalidade(pk\_mensalidade)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**





**CREATE TABLE tb\_vinculos\_professor\_disciplina (**

&#x20; **pk\_vinculo INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_professor INT NOT NULL,**

&#x20; **fk\_disciplina INT NOT NULL,**

&#x20; **status\_vinculo VARCHAR(20) DEFAULT 'Ativo',**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_professor) REFERENCES tb\_professor(pk\_professor),**

&#x20; **FOREIGN KEY (fk\_disciplina) REFERENCES tb\_disciplina(pk\_disciplina)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**



**CREATE TABLE tb\_carga\_horaria\_docente (**

&#x20; **pk\_carga INT NOT NULL AUTO\_INCREMENT PRIMARY KEY,**

&#x20; **fk\_professor INT NOT NULL,**

&#x20; **horas\_aula INT NOT NULL,**

&#x20; **horas\_pesquisa INT DEFAULT 0,**

&#x20; **data\_criacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP,**

&#x20; **ultima\_atualizacao TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP,**

&#x20; **FOREIGN KEY (fk\_professor) REFERENCES tb\_professor(pk\_professor)**

**) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;**







