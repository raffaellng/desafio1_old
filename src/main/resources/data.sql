CREATE TABLE Cliente(
    Id INTEGER PRIMARY KEY,
    NomeCliente VARCHAR(100),
    CPF VARCHAR(14),
    DataNascimento TIMESTAMP,
    Email VARCHAR(100),
    DataCriacao TIMESTAMP,
    DataAlteracao TIMESTAMP
);

CREATE TABLE Endereco (
    Id INTEGER PRIMARY KEY,
    IdCliente INTEGER REFERENCES Cliente(Id),
    Rua VARCHAR(100),
    Numero INTEGER,
    Complemento VARCHAR(20),
    CEP INTEGER,
    Estado VARCHAR(2),
    Pais varchar(20),
    DataCriacao TIMESTAMP,
    DataAlteracao TIMESTAMP
);

CREATE TABLE Banco(
    Id INTEGER PRIMARY KEY,
    IdCliente INTEGER REFERENCES Cliente(Id),
    Instituicao varchar(100),
    TipoConta varchar(10),
    Agencia INTEGER(4),
    Conta INTEGER(8),
    Saldo INTEGER(8),
    Usuario varchar(50),
    Senha VARCHAR(max),
    status BIT,
    DataCriacao TIMESTAMP,
    DataAlteracao TIMESTAMP
);

CREATE TABLE Chaves(
    Id INTEGER PRIMARY KEY,
    TipoChave varchar(50),
    Descricao varchar(100),
    DataCriacao TIMESTAMP,
    Status BIT
);

CREATE TABLE UsuarioChave(
    id INTEGER PRIMARY KEY,
    IdCliente INTEGER REFERENCES Cliente(Id),
    IdBanco INTEGER REFERENCES Banco(Id),
    IdChaves INTEGER REFERENCES Chaves(Id),
    Status bit,
    DataCriacao TIMESTAMP
);

CREATE TABLE Transacoes(
    Id INTEGER PRIMARY KEY,
    ChaveTrasacao varchar(max),
    Valor integer (8),
    DataTransacao TIMESTAMP,
    UsuarioOrigem INTEGER REFERENCES UsuarioChave(id),
    UsuarioDestino INTEGER REFERENCES UsuarioChave(id)
);