# emd-desafio-junior-data-scientist-Caio_Azeredo
////////////////////////////////////////////////////////////////////////
o arquivo analise_sql.sql, que inclui uma série de consultas SQL para análise de chamados de serviços públicos na cidade do Rio de Janeiro. As consultas são formuladas para serem executadas no Google BigQuery e extraem insights específicos de um dataset contendo registros de chamados, informações sobre bairros e eventos no Rio.

Instruções para Execução
Pré-requisitos
Para executar as consultas SQL neste arquivo, você precisará:

Ter uma conta Google com acesso ao Google Cloud Platform.
Ter permissões adequadas para acessar o dataset datario no BigQuery.
As tabelas administracao_servicos_publicos.chamado_1746 e turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos devem existir no seu projeto BigQuery.

Como Rodar as Consultas
Faça login no Google Cloud Console.
Acesse o BigQuery Console.
No BigQuery Console, selecione o projeto apropriado onde o dataset datario está hospedado.
Carregue o arquivo analise_sql.sql no editor de consultas do BigQuery ou copie e cole o conteúdo do arquivo no editor.
Execute cada consulta individualmente para obter as respostas para as perguntas listadas.

Estrutura do Arquivo
O arquivo analise_sql.sql está estruturado da seguinte maneira:

Comentários iniciados com -- descrevem a pergunta e a resposta esperada.
Cada bloco de consulta SQL é destinado a responder a uma pergunta específica do questionário.
Suporte
Para dúvidas relacionadas ao uso do BigQuery, consulte a documentação oficial do BigQuery. Caso encontre dificuldades com as permissões ou acesso aos datasets, entre em contato com o administrador do seu projeto no Google Cloud.

////////////////////////////////////////////////////////////////////////

Configuração do Ambiente para rodar analise_python.sql
Para executar os scripts, é necessário que você tenha o Python instalado em sua máquina, bem como algumas bibliotecas específicas.

Pré-requisitos
Python 3.x
Pip (gerenciador de pacotes do Python)
Dependências
Os scripts dependem das seguintes bibliotecas Python:

basedosdados: para interagir com o BigQuery e realizar consultas SQL.
pandas: para manipulação de dados e análise.
Para instalar essas bibliotecas, execute o seguinte comando no terminal:

pip install basedosdados pandas

Execução dos Scripts
Antes de executar os scripts, você precisa definir uma variável de ambiente com seu ID de projeto de cobrança do BigQuery:

export GOOGLE_CLOUD_PROJECT=seu_id_de_projeto
Para executar um script, navegue até o diretório onde o arquivo analise_python.sql está localizado e execute o seguinte comando:

python analise_python.sql


Nota Importante
Certifique-se de que você tem permissões adequadas e que o seu projeto de cobrança do Google Cloud está configurado corretamente para evitar cobranças inesperadas.

Suporte
Para suporte adicional, verifique a documentação oficial do Basedosdados e do Pandas.



////////////////////////////////////////////////////

O arquivo Links das visualizações informativas dos dados.txt fornece links para visualizações informativas dos dados relacionados a um questionário sobre chamados do serviço público 1746 no Rio de Janeiro. As visualizações foram criadas usando o Looker Studio (anteriormente conhecido como Google Data Studio) e oferecem uma representação gráfica das análises realizadas.

Como Utilizar as Visualizações
Clique nos links fornecidos para acessar cada visualização. Dentro do Looker Studio, você pode interagir com os gráficos e filtros para explorar os dados de maneiras diferentes. Cada visualização é customizada para fornecer as informações mais relevantes para a pergunta correspondente.

Erro ao Acessar Visualizações
Se você encontrar um erro de configuração ao tentar visualizar os relatórios, siga estas etapas:

Certifique-se de estar logado com a conta Google correta que tem permissão para acessar os relatórios.
Verifique se não há restrições de acesso aos dados que alimentam os relatórios. Se necessário, entre em contato com o administrador dos dados para solicitar acesso.