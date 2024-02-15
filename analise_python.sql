#Código em resposta a pergunta 1
#Resposta: O total de chamados abertos no dia 01/04/2023 é 73.
import basedosdados as bd
import pandas as pd 
query =""" SELECT COUNT(*) AS total_chamados
FROM datario.administracao_servicos_publicos.chamado_1746
WHERE DATE(data_inicio) = '2023-04-01';"""

billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#Codigo em resposta a pergunta 2
#Resposta: o tipo de chamado que teve mais reclamações no dia 01/04/2023: Poluição sonora com 24 chamados
import basedosdados as bd
import pandas as pd 
query = "SELECT tipo AS tipo_de_reclamacao, COUNT(*) AS quantidade_reclamacoes FROM datario.administracao_servicos_publicos.chamado_1746 WHERE DATE(data_inicio) = '2023-04-01' GROUP BY tipo ORDER BY quantidade_reclamacoes DESC LIMIT 1;"

billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#Codigo em resposta a pergunta 3
#Resposta: os nomes dos 3 bairros que mais tiveram chamados abertos nesse dia: Engenho de Dentro, Leblon, Campo Grande.
import basedosdados as bd
import pandas as pd 
query = """
SELECT b.nome AS nome_bairro, COUNT(c.id_chamado) AS quantidade_chamados
FROM datario.administracao_servicos_publicos.chamado_1746 AS c
JOIN datario.dados_mestres.bairro AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.nome
ORDER BY quantidade_chamados DESC
LIMIT 3;

"""
billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#Codigo em resposta a pergunta 4
#Resposta: o nome da subprefeitura com mais chamados abertos nesse dia: Zona Norte
import basedosdados as bd
import pandas as pd 
query = """
SELECT b.subprefeitura, COUNT(c.id_chamado) AS quantidade_chamados
FROM datario.administracao_servicos_publicos.chamado_1746 AS c
JOIN datario.dados_mestres.bairro AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.subprefeitura
ORDER BY quantidade_chamados DESC
LIMIT 1;
"""
billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))
#Codigo em resposta a pergunta 5

import basedosdados as bd
import pandas as pd 
query = """
SELECT c.id_chamado, c.data_inicio, c.id_bairro
FROM datario.administracao_servicos_publicos.chamado_1746 AS c
LEFT JOIN datario.dados_mestres.bairro AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
AND (c.id_bairro IS NULL OR b.subprefeitura IS NULL OR b.subprefeitura = '');
"""
billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#Resposta: Existe sim, 1. Ao executar o comando a seguir, percebi que todos os chamados com tipo "Ônibus" não tem um bairro ou subprefeitura associado, sendo então uma particularidade desse tipo de chamado.

#Codigo em resposta a pergunta 6
#Resposta:

import basedosdados as bd
import pandas as pd 
query = """
SELECT COUNT(*) AS total_chamados
FROM datario.administracao_servicos_publicos.chamado_1746
WHERE subtipo = 'Perturbação do sossego'
AND data_inicio BETWEEN '2022-01-01' AND '2023-12-31';
"""
billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#Código em resposta a pergunta 7

import basedosdados as bd
import pandas as pd

query = """
SELECT c.*
FROM datario.administracao_servicos_publicos.chamado_1746 AS c
JOIN datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos AS e
ON c.data_inicio BETWEEN e.data_inicial AND e.data_final
WHERE c.subtipo = 'Perturbação do sossego'
AND e.evento IN ('Reveillon', 'Carnaval', 'Rock in Rio')
"""

billing_project_id = "able-balm-346015"


df = bd.read_sql(query=query, billing_project_id=billing_project_id, reauth=True)

# Função para imprimir o cabeçalho
def print_header():
    print(f"{'ID Chamado':<15} | {'Data Início':<15} | {'Data Fim':<15} | {'ID Bairro':<12} | {'ID Territorialidade':<20} | {'ID Logradouro':<15} | {'Número Logradouro':<20} | {'ID Unidade Organizacional':<25} | {'Nome Unidade Organizacional':<30} | ...")
    print("-" * 220)

# Verifica se o DataFrame não está vazio
if not df.empty:
    # Itera sobre cada linha do DataFrame e imprime as informações
    for index, row in df.iterrows():
        print_header()  # Imprime o cabeçalho para cada linha
        data_inicio = row['data_inicio'].date() if pd.notnull(row['data_inicio']) else 'N/A'
        data_fim = row['data_fim'].date() if pd.notnull(row['data_fim']) else 'N/A'
        print(f"{str(row['id_chamado']):<15} | {str(data_inicio):<15} | {str(data_fim):<15} | {str(row['id_bairro']):<12} | {str(row['id_territorialidade']):<20} | {str(row['id_logradouro']):<15} | {str(row['numero_logradouro']):<20} | {str(row['id_unidade_organizacional']):<25} | {str(row['nome_unidade_organizacional']):<30} | ...")
        print("=" * 220)  # Separador para a próxima linha de dados
else:
    print("Nenhum resultado encontrado.")

#código em resposta a pergunta 8
#Resposta: Carnaval:197 chamados; Rock in Rio: 518 chamados; Reveillon: 79 chamados
import basedosdados as bd
import pandas as pd
query = """
SELECT e.evento, COUNT(c.id_chamado) AS total_chamados
FROM datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos AS e
JOIN datario.administracao_servicos_publicos.chamado_1746 AS c
ON c.data_inicio BETWEEN e.data_inicial AND e.data_final
AND c.subtipo = 'Perturbação do sossego'
GROUP BY e.evento;
"""
billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#código em resposta a pergunta 9
#Resposta: Rock in Rio com uma média diária de 76.5 chamados
import basedosdados as bd
import pandas as pd
query = """
SELECT 
    e.evento,
    COUNT(c.id_chamado) / (DATE_DIFF(e.data_final, e.data_inicial, DAY) + 1) AS media_diaria
FROM 
    datario.administracao_servicos_publicos.chamado_1746 AS c
JOIN 
    datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos AS e 
    ON c.data_inicio BETWEEN e.data_inicial AND e.data_final
WHERE 
    c.subtipo = 'Perturbação do sossego'
GROUP BY 
    e.evento,
    e.data_inicial,
    e.data_final
ORDER BY 
    media_diaria DESC
LIMIT 1;
"""
billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#código em resposta a pergunta 10
#Resposta:Reveillon - media_diaria_evento:26.333333333333332; Carnaval - media_diaria_evento: 49.25;	Rock in Rio: media_diaria_evento: 132.0.
#Média Total de chamados 2022/2023: 58.0931506849315
import basedosdados as bd
import pandas as pd
query = """
WITH EventosDias AS (
    SELECT 
        evento,
        MIN(data_inicial) AS data_inicial,
        MAX(data_final) AS data_final,
        SUM(DATE_DIFF(data_final, data_inicial, DAY) + 1) AS duracao_evento
    FROM 
        datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos
    WHERE 
        evento IN ('Reveillon', 'Carnaval', 'Rock in Rio')
    GROUP BY evento
),
ChamadosDuranteEventos AS (
    SELECT 
        e.evento,
        COUNT(c.id_chamado) AS chamados,
        e.duracao_evento
    FROM 
        EventosDias e
    JOIN 
        datario.administracao_servicos_publicos.chamado_1746 c 
        ON c.data_inicio >= e.data_inicial AND c.data_inicio <= e.data_final
        AND c.subtipo = 'Perturbação do sossego'
    GROUP BY e.evento, e.duracao_evento
),
MediaTotalChamados AS (
    SELECT 
        'Média Total de Chamados 2022/2023' AS descricao,
        COUNT(*) * 1.0 / (DATE_DIFF(DATE '2023-12-31', DATE '2022-01-01', DAY) + 1) AS media_diaria_periodo
    FROM 
        datario.administracao_servicos_publicos.chamado_1746
    WHERE 
        subtipo = 'Perturbação do sossego'
        AND data_inicio BETWEEN '2022-01-01' AND '2023-12-31'
)
SELECT 
    evento AS Nome,
    'Evento Específico' AS Tipo,
    chamados / duracao_evento AS Valor
FROM 
    ChamadosDuranteEventos
UNION ALL
SELECT 
    descricao AS Nome,
    'Média Período' AS Tipo,
    media_diaria_periodo AS Valor
FROM 
    MediaTotalChamados;

"""
billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))