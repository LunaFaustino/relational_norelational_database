select * from alunos;

declare
ra number := 1;
nome varchar2(30) := 'João Maria';
begin

insert into alunos values (ra,nome);
commit;
end;

create procedure PRD_INSERT_ALUNOS(pRa alunos.ra%type,pNome alunos.nome%type) as
begin

insert into alunos values (pRa,pNome);

commit;
end;

begin
PRD_INSERT_ALUNOS(4,'Rafael');
end;

call prd_insert_alunos(6,'Gustavo');
exec prd_insert_alunos(8,'Emerson');
execute prd_insert_alunos(9,'Thais');

select * from alunos order by ra;

create procedure PRD_DELETE_ALUNOS(pRa alunos.ra%type) as
begin

delete from alunos where ra = pra;

commit;
end;

call prd_delete_alunos(9);

select * from alunos order by ra;

create procedure PRD_UPDATE_ALUNOS(pRa alunos.ra%type, pNome alunos.nome%type) as
begin

update alunos set nome = pNome where ra = pRa; 

commit;
end;

call prd_update_alunos(8,'Emerson Faustino');

select * from endereco_cliente;
select max (seq_endereco_cliente) from endereco_cliente;
create sequence seq_endereco_cliente start with 402;
select * from cliente;
select * from cidade;

INSERT INTO endereco_cliente (
    seq_endereco_cliente,
    cod_tipo_endereco,
    cod_cliente,
    des_endereco,
    num_endereco,
    des_complemento,
    num_cep,
    des_bairro,
    cod_cidade,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    seq_endereco_cliente.nextval,
    2,
    57,
    'Avenida Dom Pedro I',
    161,
    'Casa',
    09991000,
    'Conceição',
    231,
    'S',
    sysdate,
    null
);

CREATE PROCEDURE prd_insert_endereco (
    pcodend     endereco_cliente.cod_tipo_endereco%TYPE,
    pcodcliente endereco_cliente.cod_cliente%TYPE,
    pdesend     endereco_cliente.des_endereco%TYPE,
    pnumend     endereco_cliente.num_endereco%TYPE,
    pdescompl   endereco_cliente.des_complemento%TYPE,
    pcep        endereco_cliente.num_cep%TYPE,
    pbairro     endereco_cliente.des_bairro%TYPE,
    pcodcid     endereco_cliente.cod_cidade%TYPE,
    pstatus     endereco_cliente.sta_ativo%TYPE,
    psdatacad   endereco_cliente.dat_cadastro%TYPE,
    psdatacanc  endereco_cliente.dat_cancelamento%TYPE
) AS
BEGIN
    INSERT INTO endereco_cliente VALUES (
        seq_endereco_cliente.nextval,
        pcodend,
        pcodcliente,
        pdesend,
        pnumend,
        pdescompl,
        pcep,
        pbairro,
        pcodcid,
        pstatus,
        psdatacad,
        psdatacanc
    );

    COMMIT;
END;

CREATE PROCEDURE prd_update_endereco (
    pcodend     endereco_cliente.cod_tipo_endereco%TYPE,
    pcodcliente endereco_cliente.cod_cliente%TYPE,
    pdesend     endereco_cliente.des_endereco%TYPE,
    pnumend     endereco_cliente.num_endereco%TYPE,
    pdescompl   endereco_cliente.des_complemento%TYPE,
    pcep        endereco_cliente.num_cep%TYPE,
    pbairro     endereco_cliente.des_bairro%TYPE,
    pcodcid     endereco_cliente.cod_cidade%TYPE,
    pstatus     endereco_cliente.sta_ativo%TYPE,
    psdatacad   endereco_cliente.dat_cadastro%TYPE,
    psdatacanc  endereco_cliente.dat_cancelamento%TYPE
) AS
BEGIN
    update endereco_cliente set
        cod_tipo_endereco = pcodend,
        cod_cliente = pcodcliente,
        des_endereco = pdesend,
        num_endereco = pnumend,
        des_complemento = pdescompl,
        num_cep = pcep,
        des_bairro = pbairro,
        cod_cidade = pcodcid,
        sta_ativo = pstatus,
        dat_cadastro = psdatacad,
        dat_cancelamento = psdatacanc where cod_cliente = pcodcliente;
    COMMIT;
END;