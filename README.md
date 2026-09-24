# 📚 Sistema de Gerenciamento de Biblioteca

Projeto desenvolvido para a disciplina de Introdução a Banco de Dados,
do curso de Ciência da Computação.

## 💡 Proposta de Inovação

A inovação escolhida para o projeto foi a Gamificação.

O sistema de biblioteca possui um sistema de pontos, níveis e
conquistas para aumentar a interação dos usuários com a aplicação.

O aluno recebe pontos ao realizar determinadas atividades, podendo
aumentar seu nível e desbloquear conquistas.

### Exemplos

- Realizar um empréstimo: +10 pontos.
- Devolver um livro dentro do prazo: +20 pontos.
- Realizar 5 devoluções dentro do prazo: conquista "Leitor Responsável".
- Alcançar 200 pontos: conquista "Leitor Frequente".

## 🗄️ Atualização do Banco de Dados

Foram adicionadas estruturas para permitir a implementação da
gamificação.

### ALUNO

A tabela possui os campos `pontos` e `nivel`, utilizados para
armazenar a pontuação e o nível do aluno.

### CONQUISTA

Armazena as conquistas disponíveis no sistema.

### ALUNO_CONQUISTA

Relaciona os alunos com as conquistas desbloqueadas.

## 📊 Diagrama Entidade-Relacionamento

```mermaid
erDiagram

    ALUNO {
        INT id_aluno PK
        VARCHAR nome
        VARCHAR email
        INT pontos
        INT nivel
    }

    AUTOR {
        INT id_autor PK
        VARCHAR nome
    }

    LIVRO {
        INT id_livro PK
        VARCHAR titulo
        INT ano_publicacao
        BOOLEAN disponivel
    }

    LIVRO_AUTOR {
        INT id_livro PK, FK
        INT id_autor PK, FK
    }

    EMPRESTIMO {
        INT id_emprestimo PK
        INT id_aluno FK
        INT id_livro FK
        DATE data_emprestimo
        DATE data_devolucao
        BOOLEAN devolvido
    }

    CONQUISTA {
        INT id_conquista PK
        VARCHAR nome
        VARCHAR descricao
        INT pontos_necessarios
    }

    ALUNO_CONQUISTA {
        INT id_aluno PK, FK
        INT id_conquista PK, FK
        DATE data_conquista
    }

    ALUNO ||--o{ EMPRESTIMO : realiza
    LIVRO ||--o{ EMPRESTIMO : possui
    LIVRO ||--o{ LIVRO_AUTOR : possui
    AUTOR ||--o{ LIVRO_AUTOR : escreve
    ALUNO ||--o{ ALUNO_CONQUISTA : desbloqueia
    CONQUISTA ||--o{ ALUNO_CONQUISTA : possui
