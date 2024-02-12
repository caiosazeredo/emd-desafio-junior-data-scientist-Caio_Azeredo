#Código em resposta a pergunta 1
import basedosdados as bd

query =""" SELECT COUNT(*) AS total_chamados
FROM datario.administracao_servicos_publicos.chamado_1746
WHERE DATE(data_inicio) = '2023-04-01';"""

billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#Codigo em resposta a pergunta 2
import basedosdados as bd

query = "SELECT tipo AS tipo_de_reclamacao, COUNT(*) AS quantidade_reclamacoes FROM datario.administracao_servicos_publicos.chamado_1746 WHERE DATE(data_inicio) = '2023-04-01' GROUP BY tipo ORDER BY quantidade_reclamacoes DESC LIMIT 1;"

billing_project_id = "able-balm-346015"

df = bd.read_sql(query=query,
                 billing_project_id=billing_project_id,
                 reauth=True)

print(df.to_string(index=False))

#Codigo em resposta a pergunta 3
import basedosdados as bd

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
import basedosdados as bd

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