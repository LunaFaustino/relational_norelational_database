select * from endereco_cliente;

CREATE or REPLACE PROCEDURE prd_delete_endereco (
    pcodcliente endereco_cliente.cod_cliente%TYPE
) AS
BEGIN
    DELETE FROM endereco_cliente
    WHERE
        cod_cliente = pcodcliente;
    COMMIT;
END;

call prd_delete_endereco(1);

CREATE OR REPLACE PROCEDURE prd_delete_vendas AS
    contador NUMBER := 0;
BEGIN
    FOR x IN (
        SELECT
            *
        FROM
            tb_vendas
    ) LOOP
        DELETE FROM tb_vendas
        WHERE
            ordernumber = x.ordernumber;

        IF MOD(contador, 100) = 0 THEN
            contador := contador + 1;
            COMMIT;
        END IF;

    END LOOP;
END;

call prd_delete_vendas();

select * from T_VENDAS;
select * from T_VENDAS where 1=2;

create table tb_vendas as select * from pf1788.tabela_de_vendas where 1=2;
insert into tb_vendas select * from pf1788.tabela_de_vendas;
select * from tb_vendas;

DECLARE
    minhaexc EXCEPTION;
    n NUMBER := 10;
BEGIN
    FOR i IN 1..n LOOP
        dbms_output.put_line(i * n);
        IF i * 2 = 10 THEN
            RAISE minhaexc;
        END IF;
    END LOOP;
EXCEPTION
    WHEN minhaexc THEN
        raise_application_error(-20001, 'Você caiu na exceção');
END;

select * from pedido;

create PROCEDURE prd_insert_pedido (
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
) AS BEGIN
insert into pedido values
    ( v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12 );
    if
    v6 > sysdate
    then
