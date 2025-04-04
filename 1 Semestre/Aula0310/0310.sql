CREATE or replace PROCEDURE prd_insert_pedido (
    v1  pedido.cod_pedido%TYPE,
    v2  pedido.cod_pedido_relacionado%TYPE,
    v3  pedido.cod_cliente%TYPE,
    v4  pedido.cod_usuario%TYPE,
    v5  pedido.cod_vendedor%TYPE,
    v6  pedido.dat_pedido%TYPE,
    v7  pedido.dat_cancelamento%TYPE,
    v8  pedido.dat_entrega%TYPE,
    v9  pedido.val_total_pedido%TYPE,
    v10 pedido.val_desconto%TYPE,
    v11 pedido.seq_endereco_cliente%TYPE,
    v12 pedido.status%TYPE
) AS
    data_invalida EXCEPTION;
BEGIN
    IF v6 < sysdate THEN
        RAISE data_invalida;
    ELSE
        INSERT INTO pedido VALUES (
            v1,
            v2,
            v3,
            v4,
            v5,
            v6,
            v7,
            v8,
            v9,
            v10,
            v11,
            v12); COMMIT;
    END IF;
EXCEPTION
    WHEN data_invalida THEN
        raise_application_error(-20001, 'Data do pedido superior a data atual');
        ROLLBACK;
END;

call prd_insert_pedido(1,null,1,1,16,03-11-24, null,06-11-24, 3200.12, 320.20, null, 'pendente');

select * from pedido;

CREATE FUNCTION fx_fgts (
    p_sal NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN p_sal * 0.08;
END;

select fx_fgts(1000) from dual;

set SERVEROUTPUT on;

create or replace procedure prd_calcular_fgts(valor number) is
salario number; --retornar o salário descontado o fgts
begin
salario := fx_fgts(valor);
dbms_output.put_line('O valor do FGTS de um salário de R$' || valor || ' é de R$' || salario);
end;

call prd_calcular_fgts(2000);

select * from produto;

CREATE or replace PROCEDURE prd_insere_produto (
    v1 produto.cod_produto%TYPE,
    v2 produto.nom_produto%TYPE,
    v3 produto.cod_barra%TYPE,
    v4 produto.sta_ativo%TYPE,
    v5 produto.dat_cadastro%TYPE,
    v6 produto.dat_cancelamento%TYPE
) IS
    nomeinvalido EXCEPTION;
BEGIN
    IF
       REGEXP_LIKE(v2, '[0-9]') or length(v2) < 3
    THEN
        RAISE nomeinvalido;
    END IF;
    INSERT INTO produto VALUES (
        v1,
        v2,
        v3,
        v4,
        v5,
        v6
    );
    COMMIT;
EXCEPTION
    WHEN nomeinvalido THEN
        dbms_output.put_line('O nome do produto não pode conter números e deve ter no mínimo 3 letras');
        ROLLBACK;
END;

select * from cliente;

CREATE OR REPLACE PROCEDURE prd_insere_cliente (
    v1 cliente.cod_cliente%TYPE,
    v2 cliente.nom_cliente%TYPE,
    v3 cliente.des_razao_social%TYPE,
    v4 cliente.tip_pessoa%TYPE,
    v5 cliente.num_cpf_cnpj%TYPE,
    v6 cliente.dat_cadastro%TYPE,
    v7 cliente.dat_cancelamento%TYPE,
    v8 cliente.sta_ativo%TYPE
) IS
    nomeinvalido EXCEPTION;
BEGIN
    IF regexp_like(v2, '[0-9]') OR length(v2) < 3 THEN
        RAISE nomeinvalido;
    END IF;

    INSERT INTO cliente VALUES (
        v1,
        v2,
        v3,
        v4,
        v5,
        v6,
        v7,
        v8
    );
    COMMIT;
EXCEPTION
    WHEN nomeinvalido THEN
        dbms_output.put_line('O nome do produto não pode conter números e deve ter no mínimo 3 letras');
        ROLLBACK;
END;

create or replace FUNCTION fx_validaNome
