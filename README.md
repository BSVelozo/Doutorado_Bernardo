# Doutorado_Bernardo
Scripts que foram utilizados durante o mestrado.

1° - extrair_linhas_com_cell_membrana.pl
Esse script lê o arquivo de saída do DeepLoc2.1, que é um .csv, e extrai as linhas que possuem a palavra "Cell membrane" que identifica a proteína como sendo de membrana.

Utilização:
perl ./extrair_linhas_com_cell_membrana.pl Arquivo_de_Saída.csv

2° - extrair_proteinas_baseado_no_header.pl
Esse script lê o arquivo de saída do DeepLoc2.1 e compara a coluna 1 com o identificadores com um outro arquivo que se encontram as sequências fasta das proteínas. Ao encontrar um match entre o identificador no arquivo de saída e o header do arquivo .fasta ele coloca o header e a proteína num outro arquivo.

Utilização:
perl ./extrair_proteinas_baseado_no_header.pl Arquivo_do_DeepLoc2.1.csv Arquivo_com_as_Proteínas.fasta
