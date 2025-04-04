set serveroutput on;

select * from t_vendas;

SELECT
    CASE
        WHEN dealsize = 'Small'  THEN
            'Pequeno Porte'
        WHEN dealsize = 'Medium' THEN
            'Médio Porte'
        WHEN dealsize = 'Large'  THEN
            'Grande Porte'
    END tamanhoempresa
FROM
    t_vendas;

SELECT
    COUNT(1) tamanhoempresa,
    CASE
        WHEN dealsize = 'Small'  THEN
            'Pequeno Porte'
        WHEN dealsize = 'Medium' THEN
            'Médio Porte'
        WHEN dealsize = 'Large'  THEN
            'Grande Porte'
    END      tamanhoempresa
FROM
    t_vendas
GROUP BY
    CASE
        WHEN dealsize = 'Small'  THEN
            'Pequeno Porte'
        WHEN dealsize = 'Medium' THEN
            'Médio Porte'
        WHEN dealsize = 'Large'  THEN
            'Grande Porte'
    END;

DECLARE
    tamanho NUMBER;
    empresa VARCHAR2(30);
BEGIN
    SELECT
        COUNT(1) tamanhoempresa,
        CASE
            WHEN dealsize = 'Small'  THEN
                'Pequeno Porte'
            WHEN dealsize = 'Medium' THEN
                'Médio Porte'
            WHEN dealsize = 'Large'  THEN
                'Grande Porte'
        END      tamanhoempresa
    INTO
        tamanho,
        empresa
    FROM
        t_vendas
    WHERE
        dealsize = 'Small'
    GROUP BY
        CASE
            WHEN dealsize = 'Small'  THEN
                'Pequeno Porte'
            WHEN dealsize = 'Medium' THEN
                'Médio Porte'
            WHEN dealsize = 'Large'  THEN
                'Grande Porte'
        END;

    dbms_output.put_line('Atualmente o banco de dados possui ' ||tamanho|| ' empresas de ' || lower(empresa));
END;

CREATE TABLE alunos (
    ra   NUMBER,
    nome VARCHAR2(50)
)

INSERT INTO alunos VALUES (
    1,
    'Maria Souza'
);

INSERT INTO alunos VALUES (
    2,
    'João dos Santos'
);

INSERT INTO alunos VALUES (
    3,
    'José da Silva'
);

COMMIT;

SELECT
    *
FROM
    alunos;

DECLARE
    rm    NUMBER := &matricula;
    aluno VARCHAR2(50) := '&Nome';
BEGIN
    INSERT INTO alunos VALUES (
        rm,
        aluno
    );

    COMMIT;
    SELECT
        *
    FROM
        alunos;

END;



DECLARE
    rm    NUMBER := &matricula;
    aluno VARCHAR2(50) := '&Nome';
BEGIN
    UPDATE alunos
    SET
        nome = aluno
    WHERE
        ra = rm;

    COMMIT;
    SELECT
        *
    FROM
        alunos;

END;

SELECT * FROM alunos;

declare

rm number := &Matricula;

begin

delete from alunos where ra = rm;

end;
/
select * from alunos;

declare

v_contador number(2):=1;

begin

loop
    dbms_output.put_line(v_contador);
    v_contador := v_contador +1;
    exit when v_contador > 20;
    end loop;
end;

declare

v_contador number(2):=1;

begin

while v_contador <20 loop
    dbms_output.put_line(v_contador);
    v_contador := v_contador +1;
    end loop;
end;

declare

v_contador number(2):=1;

begin

for v_contador in 1..20 loop
    dbms_output.put_line(v_contador);
    end loop;
end;

declare

numero number:= &Tabuada;

begin

for multiplicador in 1..10 loop
    dbms_output.put_line(numero*multiplicador);
    end loop;
end;

declare

begin

for numero in 1..10 loop
    if mod(numero,2) = 0 then
    dbms_output.put_line(numero || ' é par');
    else
    dbms_output.put_line(numero || ' é impar');
    end if;
    end loop;
end;
