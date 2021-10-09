create database testepgdb;

\c testepgdb;

create table pessoas (
	id serial,
	nome varchar(255) not null,
	endereco varchar(255),
	cep bigint,
	telefone varchar(17),
	renda float,
	situacao smallint,
	constraint pk_pessoas primary key(id)
);

create table pessoasfisicas (
	id int,
	cpf bigint not null,
	nascto date,
	constraint pk_pessoasfisicas primary key(id)
);

alter table pessoasfisicas add constraint fk_pessoasfisicas_pessoas foreign key (id) references pessoas(id);

create table pessoasjuridicas(
	id int,
	cnpj bigint not null, 
	nome_fantasia varchar(255),
	constraint pk_pessoasjuridicas primary key(id)
);

alter table pessoasjuridicas add constraint fk_pessoasjuridicas_pessoas foreign key (id) references pessoas(id);

create table contascomuns(
	numero bigint,
	abertura timestamp not null,
	fechamento timestamp,
	situacao smallint,
	senha int,
	saldo double precision,
	constraint pk_contascomuns primary key(numero)
);

create table pessoas_contascomuns (
	idpessoa int,
	idcontacomum bigint,
	constraint pk_pessoas_contascomuns primary key(idpessoa, idcontacomum)
);

alter table pessoas_contascomuns add constraint fk_pessoas_contascomuns_pessoas foreign key (idpessoa) references pessoas(id);

alter table pessoas_contascomuns add constraint fk_pessoas_contascomuns_contascomuns foreign key (idcontacomum) references contascomuns(numero);
