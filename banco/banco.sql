CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    pontos INT DEFAULT 0,
    nivel INT DEFAULT 1
);

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE livro_autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    devolvido BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

CREATE TABLE conquista (
    id_conquista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    pontos_necessarios INT NOT NULL
);

CREATE TABLE aluno_conquista (
    id_aluno INT,
    id_conquista INT,
    data_conquista DATE NOT NULL,
    PRIMARY KEY (id_aluno, id_conquista),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_conquista) REFERENCES conquista(id_conquista)
);

INSERT INTO aluno (nome, email, pontos, nivel)
VALUES
('João da Silva', 'joao@email.com', 120, 2),
('Maria Oliveira', 'maria@email.com', 250, 3);

INSERT INTO autor (nome)
VALUES
('Machado de Assis'),
('J. K. Rowling'),
('George Orwell');

INSERT INTO livro (titulo, ano_publicacao)
VALUES
('Dom Casmurro', 1899),
('Harry Potter e a Pedra Filosofal', 1997),
('1984', 1949);

INSERT INTO conquista
(nome, descricao, pontos_necessarios)
VALUES
('Primeiro Empréstimo', 'Realizou seu primeiro empréstimo.', 10),
('Leitor Responsável', 'Realizou 5 devoluções dentro do prazo.', 100),
('Leitor Frequente', 'Alcançou 200 pontos no sistema.', 200);
