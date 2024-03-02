CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    email VARCHAR(80) NOT NULL,
    tipo_logradouro VARCHAR(40) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    situacao ENUM('Ativo', 'Inativo') NOT NULL,
    id_responsavel INT,
    FOREIGN KEY (id_responsavel) REFERENCES responsavel_financeiro(id_responsavel)
);

CREATE TABLE professor (
    id_professor INT PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    email VARCHAR(80) NOT NULL,
    tipo_logradouro VARCHAR(40) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE coordenador (
    id_coordenador INT PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    email VARCHAR(80) NOT NULL,
    tipo_logradouro VARCHAR(40) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE disciplina (
    id_disciplina INT PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(80) NOT NULL,
    carga_horaria INT NOT NULL,
    periodo VARCHAR(80) NOT NULL
);

CREATE TABLE aluno_curso (
    id_aluno INT PRIMARY KEY NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(80) NOT NULL,
    carga_horaria_total INT NOT NULL,
    periodo VARCHAR(80) NOT NULL,
    id_coordenador INT,
    FOREIGN KEY (id_coordenador) REFERENCES coordenador(id_coordenador)
);

CREATE TABLE curso_disciplina (
    id_curso INT NOT NULL,
    id_disciplina INT NOT NULL,
    PRIMARY KEY (id_curso, id_disciplina),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

CREATE TABLE responsavel_financeiro (
    id_responsavel INT PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(80),
    tipo_logradouro VARCHAR(40) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT PRIMARY KEY NOT NULL,
    id_responsavel INT NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    valor_devido DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    data_vencimento DATE NOT NULL,
    id_fpagamento INT NOT NULL,
    tipo_desconto_id INT,
    FOREIGN KEY (id_responsavel) REFERENCES responsavel_financeiro(id_responsavel),
    FOREIGN KEY (id_fpagamento) REFERENCES forma_pagamento(id_fpagamento),
    FOREIGN KEY (tipo_desconto_id) REFERENCES tipo_desconto(id_desconto),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE forma_pagamento (
    id_fpagamento INT PRIMARY KEY NOT NULL,
    descfpagamento VARCHAR(100) NOT NULL
);

CREATE TABLE tipo_desconto (
    id_desconto INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL
);