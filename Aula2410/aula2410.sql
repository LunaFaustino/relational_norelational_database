CREATE TABLE historico (
    cod_produto       NUMBER,
    nome_produto      VARCHAR2(50),
    data_movimentacao DATE
);

select * from produto where cod_produto = 48;

DECLARE
    v_codigo produto.cod_produto%TYPE := 48;
    CURSOR cur_emp IS
    SELECT
        nom_produto
    FROM
        produto
    WHERE
        cod_produto = v_codigo;

BEGIN
    FOR x IN cur_emp LOOP
        INSERT INTO historico VALUES (
            v_codigo,
            x.nom_produto,
            sysdate
        );

        COMMIT;
    END LOOP;
END;

DECLARE
    CURSOR c_consulta_cliente IS
    SELECT
        cod_cliente,
        nom_cliente
    FROM
        cliente;

BEGIN
    FOR x IN c_consulta_cliente LOOP
        dbms_output.put_line('Cliente: '
                             || x.cod_cliente
                             || 'Nome: '
                             || x.nom_cliente);
    END LOOP;
END;

SELECT * FROM pedido;
select * from item_pedido;

create procedure prc_valida_total_pedido(cod pedido.cod_pedido%type) as

cursor c_consulta_pedido is select * from pedido where cod_pedido = cod;
cursor c_itens_pedido is select * from item_pedido where cod_pedido = cod;

begin
for x in c_consulta_pedido loop


