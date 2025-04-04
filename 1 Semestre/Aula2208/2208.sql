set serveroutput on;

declare

    v_valor number := &DigiteValorDoCarro;
    
begin

    dbms_output.put_line('Ficariam 10 parcelas de: R$' || (v_valor*1.03)/10);
    
end;

DECLARE
    v_valor1  NUMBER := &digitevalordocarro;
    v_entrada NUMBER := ( v_valor1 * 0.20 );
    v_valor2  NUMBER := v_valor1 - v_entrada;
BEGIN
    dbms_output.put_line('O valor da entrada ser� R$' || v_entrada);
    dbms_output.put_line('O pagamento em 6 parcelas ficar� R$'
                         ||(v_valor2 * 1.10) / 6);
    dbms_output.put_line('O pagamento em 12 parcelas ficar� R$'
                         ||(v_valor2 * 1.15) / 12);
    dbms_output.put_line('O pagamento em 18 parcelas ficar� R$'
                         ||(v_valor2 * 1.20) / 18);
END;

DECLARE
    genero VARCHAR2(20) := '&DigiteumValor';
BEGIN
    IF upper(genero) = 'M' THEN
        dbms_output.put_line('O g�nero informado � masculino');
    ELSIF upper(genero) = 'F' THEN
        dbms_output.put_line('O g�nero informado � feminino');
    ELSE
        dbms_output.put_line('O valor digitado inv�lido');
    END IF;
END;

DECLARE
    numero NUMBER := &digite;
BEGIN
    IF MOD(numero,2) = 0 THEN
        dbms_output.put_line('O n�mero � par');
    ELSE
        dbms_output.put_line('O n�mero � impar');
    END IF;
END;

select * from t_vendas;
