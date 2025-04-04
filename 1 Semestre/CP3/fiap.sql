set SERVEROUTPUT on;

select * from pedido;
select * from cliente;
SELECT * from historico_pedido;

create or replace procedure listar_pedidos_cliente (cod number) is
    CURSOR cur_pedidos IS
    SELECT
        a.cod_cliente,
        a.cod_pedido,
        b.val_total_pedido
    FROM
             pedido a
        INNER JOIN historico_pedido b ON a.cod_pedido = b.cod_pedido
        INNER JOIN cliente          c ON a.cod_cliente = c.cod_cliente
    WHERE
        a.cod_cliente = cod;

BEGIN
    FOR x IN cur_pedidos LOOP
        dbms_output.put_line('Código do cliente: ' || x.cod_cliente || ' - Valor total do pedido R$' ||x.val_total_pedido);
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Cliente não tem pedidos');
END;

call listar_pedidos_cliente(92);

