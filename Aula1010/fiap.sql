set SERVEROUTPUT on;

select * from pedido;

CREATE OR REPLACE PROCEDURE prc_insere_pedido_rm552473 (
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
    pedidoentrega EXCEPTION;
    pedidosys EXCEPTION;
    valor0 EXCEPTION;
BEGIN
    IF v6 > v8 THEN
        RAISE pedidoentrega;
    ELSIF v6 > sysdate THEN
        RAISE pedidosys;
    ELSIF v9 <= 0 THEN
        RAISE valor0;
    ELSE
        INSERT INTO pedido VALUES (v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12);
        COMMIT;
    END IF;
EXCEPTION
    WHEN pedidoentrega THEN
        raise_application_error(-20001, 'Data do pedido superior a data de entrega'); ROLLBACK;
    WHEN pedidosys THEN
        raise_application_error(-20002, 'Data do pedido superior a data de hoje'); ROLLBACK;
    WHEN valor0 THEN
        raise_application_error(-20003, 'Valor do pedido precisa ser maior que 0'); ROLLBACK;
END;

call prc_insere_pedido_rm552473(1,null,1,1,16,TO_DATE('10-OCT-24', 'DD-MON-YY'),null,TO_DATE('12-OCT-24', 'DD-MON-YY'), 0, 320.20, null, 'pendente');

select * from pedido where cod_pedido = 0;
select * from pedido;

create or replace function FUN_CONSULTA_PED_RM552473(p_codpedido number) return varchar2 is
v_status_pedido varchar2(50);
begin 
select status into v_status_pedido from pedido where cod_pedido = p_codpedido;
return v_status_pedido;
end;

select FUN_CONSULTA_PED_RM552473(131093) from dual;

select * from pedido;

create or replace function FUN_TOTAL_PEDIDO_RM552473(p_codcliente number) return number is 
v_total_pedido number;
begin
select SUM(val_total_pedido) into v_total_pedido from pedido where cod_cliente = p_codcliente;
return v_total_pedido;
end;

select FUN_TOTAL_PEDIDO_RM552473(1) from dual;

CREATE OR REPLACE function FUN_INSERE_NF2_RM552473 (
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
    pedidoentrega EXCEPTION;
    pedidosys EXCEPTION;
    valor0 EXCEPTION;
BEGIN
    IF v6 > v8 THEN
        RAISE pedidoentrega;
    ELSIF v6 > sysdate THEN
        RAISE pedidosys;
    ELSIF v9 <= 0 THEN
        RAISE valor0;
    ELSE
        INSERT INTO pedido VALUES (v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12);
        COMMIT;
    END IF;
EXCEPTION
    WHEN pedidoentrega THEN
        raise_application_error(-20001, 'Data do pedido superior a data de entrega'); ROLLBACK;
    WHEN pedidosys THEN
        raise_application_error(-20002, 'Data do pedido superior a data de hoje'); ROLLBACK;
    WHEN valor0 THEN
        raise_application_error(-20003, 'Valor do pedido precisa ser maior que 0'); ROLLBACK;
END;