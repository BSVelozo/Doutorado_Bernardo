# Doutorado Bernardo Saraiva Velozo
# Realizado no Laboratorio de Bioinformatica - UFRJ pelo PPGBq

Scripts durante a etapa :

1° - extrair_linhas_com_cell_membrana.pl

Descrição: 
Esse script em perl lê o arquivo de saída do DeepLoc2.1, que é um .csv, e extrai as linhas que possuem a palavra "Cell membrane" que identifica a proteína como sendo de membrana.

Utilização:
perl ./extrair_linhas_com_cell_membrana.pl Arquivo_de_Saída.csv

2° - extrair_proteinas_baseado_no_header.pl

Descrição: 
Esse script em perl lê o arquivo de saída do DeepLoc2.1 e compara a coluna 1 com o identificadores com um outro arquivo que se encontram as sequências fasta das proteínas. Ao encontrar um match entre o identificador no arquivo de saída e o header do arquivo .fasta ele coloca o header e a proteína num outro arquivo.

Utilização:
perl ./extrair_proteinas_baseado_no_header.pl Arquivo_do_DeepLoc2.1.csv Arquivo_com_as_Proteínas.fasta

3° - excluir_sequencias.pl

Descrição:
Esse script em perl lê o arquivo com somente os headers de identificação do fasta e compara com um arquivo multifasta. Se o header for encontrado nesse arquivo multifasta a sequencia e header vai ser excluido do arquivo. O nome dos arquivo a serem utilizados devem ser atualizados ao abrir o script.

Utilização:
perl ./excluir_sequencias.pl

4° - Compara_Headers.pl

Descrição:
Esse script compara dois arquivos que possuem headers de arquivos fasta. Caso o header se encontre nos dois arquivos ele vai ser copiado para um terceiro arquivo que possui todos os identificadores que estão presentes nos dois arquivos.

Utilização:
perl ./Compara_Headers.pl Identificadores1.txt Identificadores2.txt Identificadores_Nos_Dois_Arquivos.txt

5° - Extrair_sequencias.pl

Descrição:
Esse script em perl compara um arquivo com identificadores de uma seqeuncia .fasta com um outro arquivo multifasta que inclui os identificadores e suas sequencias. Em seguida o script pega as sequencias e seu identificadores que foram encontrados e colocam num arquivo outro arquivo.

Utilização:
perl ./Extrair_sequencias.pl headers.txt multifasta.fasta saida.fasta

6° - split_fasta.pl

Descrição:
Esse script separa um arquivo multifasta em arquivos fasta individuais.

Utilização:
perl ./split_fasta.pl
