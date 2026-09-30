# Portal do Laboratório de Robótica - IFMS Campus Campo Grande

Repositório: https://github.com/RhyanSKomm/Atividade-LP

Portal web desenvolvido para o Laboratório de Robótica do IFMS - Campus Campo Grande.

O sistema permite consultar informações sobre o laboratório, estudantes e atividades, além de realizar a manutenção dos principais registros utilizados pelo portal.

## Funcionalidades

### Portal público

- Página inicial
- Página sobre o laboratório
- Listagem de estudantes
- Detalhes dos estudantes
- Listagem de atividades
- Detalhes das atividades
- Visualização dos participantes das atividades
- Interface disponível em português, inglês, espanhol e francês

### Área administrativa

- Cadastro de estudantes
- Listagem de estudantes
- Edição de estudantes
- Exclusão de estudantes
- Cadastro de atividades
- Listagem de atividades
- Edição de atividades
- Exclusão de atividades
- Associação de estudantes às atividades
- Seleção dos períodos letivos das atividades
- Listagem dos participantes de cada atividade

## Tecnologias utilizadas

- Java
- JSP
- Servlet
- JDBC
- DAO
- JSTL
- Maven
- PostgreSQL
- Apache Tomcat 9
- Bootstrap 5
- HTML
- CSS
- JavaScript

## Arquitetura

O projeto utiliza separação em camadas.

### Model

Representa as entidades utilizadas pela aplicação.

### DAO

Responsável pelo acesso ao banco de dados e execução dos comandos SQL.

### Controller

Servlets responsáveis pelo processamento das requisições HTTP.

### View

Páginas JSP responsáveis pela apresentação das informações.

## Internacionalização

A aplicação possui suporte aos seguintes idiomas:

- Português - pt_BR
- Inglês - en_US
- Espanhol - es_ES
- Francês - fr_FR

As traduções são armazenadas nos arquivos `.properties` dentro de:

src/main/resources/resources/

## Banco de dados

O projeto utiliza PostgreSQL.

As principais tabelas são:

- estudante
- coordenador
- atividade
- periodo_letivo
- atividade_periodo
- participacao
- conquista

## Relacionamentos

Um coordenador pode coordenar várias atividades.

Uma atividade pode estar relacionada a vários períodos letivos.

Um estudante pode participar de várias atividades.

Uma atividade pode possuir vários estudantes participantes.

A tabela `participacao` realiza o relacionamento entre estudantes e atividades.

A tabela `atividade_periodo` realiza o relacionamento entre atividades e períodos letivos.

## Como executar

1. Instale o Java.
2. Instale e configure o Apache Tomcat 9.
3. Instale o PostgreSQL.
4. Crie o banco de dados do projeto.
5. Execute o script SQL disponível no repositório.
6. Configure a conexão utilizada pela aplicação.
7. Importe o projeto Maven na IDE.
8. Configure o Tomcat 9 no projeto.
9. Execute a aplicação pelo servidor.
10. Acesse o endereço local disponibilizado pelo Tomcat.

## Integrantes

- Rhyan Santiago Komm
- Stevan Meneghello Helpis

## Instituição

Instituto Federal de Mato Grosso do Sul - IFMS  
Campus Campo Grande

## Disciplina

Desenvolvimento Web / Back-end

## Projeto

Portal do Laboratório de Robótica - IFMS Campus Campo Grande
