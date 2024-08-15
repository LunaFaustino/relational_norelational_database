SELECT DISTINCT
    cod_tipo_endereco
FROM
    pf1788.endereco_cliente;
    
SELECT
    *
FROM
    pf1788.endereco_cliente;
    
SELECT DISTINCT
    cod_tipo_endereco,
    COUNT(1)
FROM
    pf1788.endereco_cliente
GROUP BY
    cod_tipo_endereco

SELECT
    COUNT(1),
    des_bairro
FROM
    pf1788.endereco_cliente
GROUP BY
    des_bairro

SELECT
    COUNT(1),
    des_bairro
FROM
    pf1788.endereco_cliente
GROUP BY
    des_bairro
HAVING
    COUNT(1) > 5

SELECT
    COUNT(1),
    des_bairro
FROM
    pf1788.endereco_cliente
WHERE
    des_bairro = 'Cidade Nova'
GROUP BY
    des_bairro

-- grant all on endereco_cliente to public;
-- revoke all on endereco_cliente to public;

-- PL SQL

set serveroutput on;

DECLARE
    v_nome  VARCHAR2(30);
    v_idade NUMBER := 24;
BEGIN
    v_nome := 'Luna';
    dbms_output.put_line('Nome: ' || v_nome || ' Idade: ' || v_idade);
END;

DECLARE
    v_number1 number := 10;
    v_number2 number := 8;
BEGIN
    dbms_output.put_line(v_number1 / v_number2);
END;

DECLARE
    v_salario1 number := 1412;
    v_25 number := (v_salario1 * 25) / 100;
    v_salario2 number := v_salario1 + v_25;
BEGIN
    dbms_output.put_line('O novo salário mínimo será de: R$' || v_salario2);
END;

DECLARE
    v_salario number := 1412;
BEGIN
    dbms_output.put_line('O novo salário mínimo será de: R$' || to_char((v_salario*1.25), 9990.990));
END;

DECLARE
    v_dolar number := 45;
BEGIN
    dbms_output.put_line('45 dólares em reais: R$' || to_char((v_dolar*5.48), 9990.990));
END;