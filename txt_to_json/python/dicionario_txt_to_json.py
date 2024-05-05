'''
Instituto Federal do Tocantins - Campus Araguaína
04 de maio de 2024, sábado.
Alunos: Beatriz Coelho, Juan Felipe Alves Flores, Sara Ghabrielly, Samylla Marinho.
Professor: Walisson Pereira de Sousa.
Curso: Análise e Desenvolvimento de Sistemas.
Disciplina: Estrutura de Dados II.
Período: 3º

OBS: Realize a execução do arquivo Python com o terminal dentro da pasta txt_to_json/python, para que o diretório relativo funcione corretamente.
'''

# Biblioteca para trabalhar com arquivos JSON.
import json

# Caminho do destino do arquivo PDF.
destinoTxt = "../text/dicionario.txt"
# Caminho do destino do arquivo JSON.
destinoJson = "../json/dicionario.json"

# Lista para armazenar todas as linhas do documento de texto.
linhasDocumento = []

# Abre o arquivo de texto como modo de leitura.
with open(destinoTxt, 'r', encoding='UTF-8') as leitor_txt:
    # Lê todas as linhas do documento e armazena na variável.
    linhasDocumento = leitor_txt.readlines()

# Lista para armazenar as linhas que representam palavras do dicionário.
linhasComPalavras = [] 

# Interação nas linhas do documento lido anteriormente.
for linha in linhasDocumento:
    # Verifica se a linha contêm os dois-pontos, que representa uma linha para o dicionário.
    if (linha.__contains__(":")):
        # Adiciona a linha do dicionário na lista de linhas com palavras..
        linhasComPalavras.append(linha)

# Lista para armazenar os mapas de cada palavra do dicionário.
palavrasMap = []

# Interação nas linhas com palavras de dicionários.
for linhaPalavra in linhasComPalavras:
    # Dividindo a linha em uma array, onde antes do dois pontos é a chave, e depois é o significado.
    palavraLista = str(linhaPalavra).split(":")

    # Map para adicionar na lista do dicionário.
    palavraMap = {
        'palavra': palavraLista[0].strip(),
        'significado': palavraLista[1].strip()
    }

    # Adicionando na lista de mapas de palavras do dicionário.
    palavrasMap.append(palavraMap)

# Abre o arquivo JSON especificado, para criação/escrita.
with open(destinoJson, 'w', encoding='UTF-8') as escritor_json:
    # Realiza a cópia dos dados para o arquivo JSON.
    json.dump(palavrasMap, escritor_json, indent=4, ensure_ascii=False)

# Informa ao usuário que a conversão ocorreu com sucesso.
print("Conversão realizada com sucesso.")
