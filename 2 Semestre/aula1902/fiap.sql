CREATE OR REPLACE PACKAGE pkg_exemplo AS
    v_count NUMBER := 0;  -- variável pública
    FUNCTION fun_valida_nome2 (
        p_nome IN VARCHAR2
    ) RETURN BOOLEAN;  -- função pública
    CURSOR cursor_vendas_publi IS
    SELECT
        *
    FROM
        tabela_vendas; --cursor público
    PROCEDURE prc_insere_produtos_novos; -- producedure sem parâmetros

    PROCEDURE prc_insere_pedido (
        p_cod_pedido             pedido.cod_pedido%TYPE,
        p_cod_pedido_relacionado pedido.cod_pedido%TYPE,
        p_cod_cliente            pedido.cod_cliente%TYPE,
        p_cod_usuario            pedido.cod_usuario%TYPE,
        p_cod_vendedor           pedido.cod_vendedor%TYPE,
        p_dat_pedido             pedido.dat_pedido%TYPE,
        p_dat_cancelamento       pedido.dat_cancelamento%TYPE,
        p_dat_entrega            pedido.dat_entrega%TYPE,
        p_val_total_pedido       pedido.val_total_pedido%TYPE,
        p_val_desconto           pedido.val_desconto%TYPE,
        p_seq_endereco_cliente   pedido.seq_endereco_cliente%TYPE
    );  -- procedimento público
END pkg_exemplo;

CREATE OR REPLACE PACKAGE BODY pkg_exemplo AS

    CURSOR cursor_vendas IS
    SELECT
        *
    FROM
        tabela_vendas; -- cursor privado

    FUNCTION fun_valida_nome2 (
        p_nome IN VARCHAR2
    ) RETURN BOOLEAN IS
    BEGIN
        IF
            length(p_nome) > 3
            AND NOT regexp_like(p_nome, '[0-9]')
        THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END fun_valida_nome2;

    PROCEDURE prc_insere_produtos_novos AS
    BEGIN
        FOR x IN cursor_vendas LOOP
            INSERT INTO produtos_novos (
                ordernumber,
                quantityordered,
                priceeach,
                orderlinenumber,
                sales,
                orderdate,
                status,
                qtr_id,
                month_id,
                year_id,
                productline,
                msrp,
                productcode,
                customername,
                phone,
                addressline1,
                addressline2,
                city,
                state,
                postalcode,
                country,
                territory,
                contactlastname,
                contactfirstname,
                dealsize
            ) VALUES (
                x.ordernumber,
                x.quantityordered,
                x.priceeach,
                x.orderlinenumber,
                x.sales,
                x.orderdate,
                x.status,
                x.qtr_id,
                x.month_id,
                x.year_id,
                x.productline,
                x.msrp,
                x.productcode,
                x.customername,
                x.phone,
                x.addressline1,
                x.addressline2,
                x.city,
                x.state,
                x.postalcode,
                x.country,
                x.territory,
                x.contactlastname,
                x.contactfirstname,
                x.dealsize
            );

            COMMIT;
        END LOOP;
    END prc_insere_produtos_novos;

    PROCEDURE prc_insere_pedido (
        p_cod_pedido             pedido.cod_pedido%TYPE,
        p_cod_pedido_relacionado pedido.cod_pedido%TYPE,
        p_cod_cliente            pedido.cod_cliente%TYPE,
        p_cod_usuario            pedido.cod_usuario%TYPE,
        p_cod_vendedor           pedido.cod_vendedor%TYPE,
        p_dat_pedido             pedido.dat_pedido%TYPE,
        p_dat_cancelamento       pedido.dat_cancelamento%TYPE,
        p_dat_entrega            pedido.dat_entrega%TYPE,
        p_val_total_pedido       pedido.val_total_pedido%TYPE,
        p_val_desconto           pedido.val_desconto%TYPE,
        p_seq_endereco_cliente   pedido.seq_endereco_cliente%TYPE
    ) IS
    BEGIN
        INSERT INTO produtos_novos (
            cod_pedido,
            cod_pedido_relacionado,
            cod_cliente,
            cod_usuario,
            cod_vendedor,
            dat_pedido,
            dat_cancelamento,
            dat_entrega,
            val_total_pedido,
            val_desconto,
            seq_endereco_cliente
        ) VALUES (
            p_cod_pedido,
            p_cod_pedido_relacionado,
            p_cod_cliente,
            p_cod_usuario,
            p_cod_vendedor,
            p_dat_pedido,
            p_dat_cancelamento,
            p_dat_entrega,
            p_val_total_pedido,
            p_val_desconto,
            p_seq_endereco_cliente
        );

        COMMIT;
    END prc_insere_pedido;

END pkg_exemplo;


CREATE OR REPLACE PACKAGE BODY pkg_exemplo AS

    CURSOR cursor_vendas IS
    SELECT
        *
    FROM
        tabela_vendas; -- cursor privado

    FUNCTION fun_valida_nome2 (
        p_nome IN VARCHAR2
    ) RETURN BOOLEAN IS
    BEGIN
        IF
            length(p_nome) > 3
            AND NOT regexp_like(p_nome, '[0-9]')
        THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END fun_valida_nome2;

    PROCEDURE prc_insere_produtos_novos AS
    BEGIN
        FOR x IN cursor_vendas LOOP
            INSERT INTO produtos_novos (
                ordernumber,
                quantityordered,
                priceeach,
                orderlinenumber,
                sales,
                orderdate,
                status,
                qtr_id,
                month_id,
                year_id,
                productline,
                msrp,
                productcode,
                customername,
                phone,
                addressline1,
                addressline2,
                city,
                state,
                postalcode,
                country,
                territory,
                contactlastname,
                contactfirstname,
                dealsize
            ) VALUES (
                x.ordernumber,
                x.quantityordered,
                x.priceeach,
                x.orderlinenumber,
                x.sales,
                x.orderdate,
                x.status,
                x.qtr_id,
                x.month_id,
                x.year_id,
                x.productline,
                x.msrp,
                x.productcode,
                x.customername,
                x.phone,
                x.addressline1,
                x.addressline2,
                x.city,
                x.state,
                x.postalcode,
                x.country,
                x.territory,
                x.contactlastname,
                x.contactfirstname,
                x.dealsize
            );

            COMMIT;
        END LOOP;
    END prc_insere_produtos_novos;

    PROCEDURE prc_insere_pedido (
        p_cod_pedido             pedido.cod_pedido%TYPE,
        p_cod_pedido_relacionado pedido.cod_pedido%TYPE,
        p_cod_cliente            pedido.cod_cliente%TYPE,
        p_cod_usuario            pedido.cod_usuario%TYPE,
        p_cod_vendedor           pedido.cod_vendedor%TYPE,
        p_dat_pedido             pedido.dat_pedido%TYPE,
        p_dat_cancelamento       pedido.dat_cancelamento%TYPE,
        p_dat_entrega            pedido.dat_entrega%TYPE,
        p_val_total_pedido       pedido.val_total_pedido%TYPE,
        p_val_desconto           pedido.val_desconto%TYPE,
        p_seq_endereco_cliente   pedido.seq_endereco_cliente%TYPE
    ) IS
    BEGIN
        INSERT INTO pedidos_novos (
            cod_pedido,
            cod_pedido_relacionado,
            cod_cliente,
            cod_usuario,
            cod_vendedor,
            dat_pedido,
            dat_cancelamento,
            dat_entrega,
            val_total_pedido,
            val_desconto,
            seq_endereco_cliente
        ) VALUES (
            p_cod_pedido,
            p_cod_pedido_relacionado,
            p_cod_cliente,
            p_cod_usuario,
            p_cod_vendedor,
            p_dat_pedido,
            p_dat_cancelamento,
            p_dat_entrega,
            p_val_total_pedido,
            p_val_desconto,
            p_seq_endereco_cliente
        );

        COMMIT;
    END prc_insere_pedido;

END pkg_exemplo;

CALL pkg_exemplo.prc_insere_produtos_novos()

SELECT
    *
FROM
    produtos_novos;

TRUNCATE TABLE produtos_novos;

CALL pkg_exemplo.prc_insere_pedido(10010, 5555, 55888, 5555, 6658,
                                  sysdate, sysdate + 10, sysdate + 1, 20000, 5,
                                  55544); 

select * from pedidos_novos;