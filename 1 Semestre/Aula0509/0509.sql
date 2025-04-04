@ 'C:\Users\labsfiap\Downloads\relational_norelational_database\Aula0509\SCRIPT_MODELO_PEDIDO(1).SQL';

INSERT INTO PAIS SELECT * FROM PF1788.PAIS;
INSERT INTO ESTADO SELECT * FROM PF1788.ESTADO;
ALTER TABLE CIDADE MODIFY NOM_CIDADE VARCHAR2(40);
INSERT INTO CIDADE SELECT * FROM PF1788.CIDADE;
INSERT INTO ENDERECO_CLIENTE SELECT * FROM PF1788.ENDERECO_CLIENTE;
INSERT INTO TIPO_ENDERECO SELECT * FROM PF1788.TIPO_ENDERECO;
INSERT INTO CLIENTE SELECT * FROM PF1788.CLIENTE;
INSERT INTO USUARIO SELECT * FROM PF1788.USUARIO;
INSERT INTO VENDEDOR SELECT * FROM PF1788.VENDEDOR;
INSERT INTO PRODUTO SELECT * FROM PF1788.PRODUTO;
INSERT INTO PRODUTO_COMPOSTO SELECT * FROM PF1788.PRODUTO_COMPOSTO;
INSERT INTO TIPO_MOVIMENTO_ESTOQUE SELECT * FROM PF1788.TIPO_MOVIMENTO_ESTOQUE;
INSERT INTO ESTOQUE SELECT * FROM PF1788.ESTOQUE;
INSERT INTO ESTOQUE_PRODUTO SELECT * FROM PF1788.ESTOQUE_PRODUTO;
INSERT INTO MOVIMENTO_ESTOQUE SELECT * FROM PF1788.MOVIMENTO_ESTOQUE;
INSERT INTO CLIENTE_VENDEDOR SELECT * FROM PF1788.CLIENTE_VENDEDOR;
alter table pedido add status varchar2(30);
INSERT INTO PEDIDO SELECT * FROM PF1788.PEDIDO;
INSERT INTO HISTORICO_PEDIDO SELECT * FROM PF1788.HISTORICO_PEDIDO;
INSERT INTO ITEM_PEDIDO SELECT * FROM PF1788.ITEM_PEDIDO;

select * from movimento_estoque;
select sum(qtd_movimentacao_estoque) from movimento_estoque;

set serveroutput on;

DECLARE
BEGIN
    FOR x IN (
        SELECT
            a.cod_produto,
            b.nom_produto,
            SUM(qtd_movimentacao_estoque) qtd
        FROM
                 movimento_estoque a
            INNER JOIN produto b ON a.cod_produto = b.cod_produto
        WHERE
            a.cod_produto = 1
        GROUP BY
            a.cod_produto,
            b.nom_produto
    ) LOOP
        dbms_output.put_line('O produto de código '
                            || x.cod_produto
                            || ' com descrição '
                            || x.nom_produto
                            || ' tem o total de: '
                            || x.qtd
                            || ' produtos no estoque');
    END LOOP;
END;

select * from historico_pedido;
select * from cliente;

declare
begin
    for x in (
        select
        hp.cod_cliente codigo,
        cli.nom_cliente nome,
        round(avg(val_total_pedido),2) media
        from 
        historico_pedido hp inner join cliente cli
        on hp.cod_cliente = cli.cod_cliente
        where hp.cod_cliente = &Cliente
        group by
        hp.cod_cliente,
        cli.nom_cliente
    ) loop
        dbms_output.put_line('Cliente ' || x.nome || ' de código ' || x.codigo || ' tem uma média de R$' || x.media);
    end loop;
end;

declare
begin
select
end;
select * from produto_composto where sta_ativo = 'S';