CREATE TABLE pedidos_novos
    AS
        SELECT
            *
        FROM
            pedido;

ALTER TABLE pedidos_novos ADD estado VARCHAR2(30);

CREATE OR REPLACE TRIGGER trg_pedido BEFORE
    INSERT ON pedidos_novos
    FOR EACH ROW
BEGIN
    IF :new.estado IS NULL THEN
        :new.estado := 'Novo Pedido';
    END IF;
END;

SELECT
    *
FROM
    pedidos_novos;

INSERT INTO pedidos_novos (
    cod_pedido,
    cod_cliente,
    estado
) VALUES (
    3000,
    2000,
    NULL
);

UPDATE pedidos_novos set cod_pedido = 1234 where cod_pedido = 3000;

delete pedidos_novos where cod_pedido = 1234;

SELECT
    *
FROM
    pedidos_novos
WHERE
    cod_pedido = 3000;

CREATE TABLE tb_auditoria (
    id       NUMBER
        GENERATED ALWAYS AS IDENTITY,
    tabela   VARCHAR2(30),
    operacao VARCHAR2(30),
    data     DATE,
    usuario  VARCHAR2(30)
)

CREATE OR REPLACE TRIGGER tgr_auditoria AFTER
    INSERT OR UPDATE OR DELETE ON pedidos_novos
    FOR EACH ROW
DECLARE
    operacao     VARCHAR2(30);
    nome_usuario VARCHAR2(100);
BEGIN
  -- Determina a operação realizada (INSERT, UPDATE ou DELETE)
    IF inserting THEN
        operacao := 'INSERT';
    ELSIF updating THEN
        operacao := 'UPDATE';
    ELSIF deleting THEN
        operacao := 'DELETE';
    END IF;

  -- Obtém o nome de usuário da sessão atual
    nome_usuario := sys_context('USERENV', 'SESSION_USER');

  -- Registra a auditoria na tabela de auditoria
    INSERT INTO tb_auditoria (
        tabela,
        operacao,
        data,
        usuario
    ) VALUES (
        'PEDIDO_NOVOS',
        operacao,
        sysdate,
        nome_usuario
    );

END;

select * from tb_auditoria;

select * from pedido;

create or replace trigger trg_data_entrega after update on pedido
begin 
if :new.dat_entrega != :old.dat_entrega then
    insert into