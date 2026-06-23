create database ExplAIner;

use ExplAIner;

create table aluno(
    id_aluno int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(120) unique not null,
    senha varchar(255) not null,
    data_nascimento date,
    pontos int default 0,
    foguinho int default 0
)engine=innodb;

create table tema(
    id_tema int auto_increment primary key,
    materia varchar(60) not null,
    nome varchar(100) not null
)engine=innodb;

create table questao(
    id_questao int auto_increment primary key,
    enunciado text not null,
    alternativa_correta char(1),
    id_tema int not null,
    foreign key(id_tema) references tema(id_tema)
)engine=innodb;

create table alternativa(
    id_alternativa int auto_increment primary key,
    descricao varchar(255) not null,
    letra char(1) not null,
    id_questao int not null,
    foreign key(id_questao) references questao(id_questao)
)engine=innodb;

create table desafio(
    id_desafio int auto_increment primary key,
    nome varchar(100),
    dificuldade varchar(20),
    pontuacao int,
    quantidade_questoes int,
    data_criacao date
)engine=innodb;

create table desafio_questao(
    id_desafio int,
    id_questao int,
    primary key(id_desafio,id_questao),
    foreign key(id_desafio) references desafio(id_desafio),
    foreign key(id_questao) references questao(id_questao)
)engine=innodb;

create table aluno_desafio(
    id_aluno int,
    id_desafio int,
    data_realizacao date,
    pontuacao_obtida int,
    concluido boolean,
    primary key(id_aluno,id_desafio),
    foreign key(id_aluno) references aluno(id_aluno),
    foreign key(id_desafio) references desafio(id_desafio)
)engine=innodb;


create table ranking(
    id_ranking int auto_increment primary key,
    classificacao int,
    pontos int,
    id_aluno int not null,
    foreign key(id_aluno) references aluno(id_aluno)
)engine=innodb;