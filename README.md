# Doutorado Bernardo Saraiva Velozo  
## Laboratório de Bioinformática - UFRJ, PPGBq  

Scripts desenvolvidos durante o doutorado:  

### 1. extrair_linhas_com_cell_membrana.pl  

**Descrição:**  
Este script, escrito em Perl, lê o arquivo de saída do DeepLoc2.1 (.csv) e extrai as linhas que contêm a expressão "Cell membrane", que identifica proteínas de membrana.  

**Uso:**  
```bash
perl ./extrair_linhas_com_cell_membrana.pl Arquivo_de_Saída.csv
```  

### 2. extrair_proteinas_baseado_no_header.pl  

**Descrição:**  
Este script compara os identificadores da coluna 1 de um arquivo de saída do DeepLoc2.1 com os cabeçalhos de um arquivo FASTA que contém as sequências proteicas. Quando encontra uma correspondência, copia o cabeçalho e a sequência proteica para um novo arquivo.  

**Uso:**  
```bash
perl ./extrair_proteinas_baseado_no_header.pl Arquivo_do_DeepLoc2.1.csv Arquivo_com_as_Proteínas.fasta
```  

### 3. excluir_sequencias.pl  

**Descrição:**  
Este script lê um arquivo contendo cabeçalhos de identificação e os compara com um arquivo multifasta. Se um cabeçalho for encontrado no arquivo multifasta, tanto o cabeçalho quanto a sequência correspondente são excluídos. Os nomes dos arquivos devem ser atualizados diretamente no script antes de sua execução.  

**Uso:**  
```bash
perl ./excluir_sequencias.pl
```  

### 4. Compara_Headers.pl  

**Descrição:**  
Este script compara os cabeçalhos de dois arquivos FASTA. Se um cabeçalho estiver presente em ambos os arquivos, ele será copiado para um terceiro arquivo, contendo todos os identificadores compartilhados entre os dois arquivos.  

**Uso:**  
```bash
perl ./Compara_Headers.pl Identificadores1.txt Identificadores2.txt Identificadores_Nos_Dois_Arquivos.txt
```  

### 5. Extrair_sequencias.pl  

**Descrição:**  
Este script compara um arquivo contendo identificadores de sequências FASTA com um arquivo multifasta. As sequências e seus respectivos identificadores encontrados são extraídos e gravados em um novo arquivo.  

**Uso:**  
```bash
perl ./Extrair_sequencias.pl headers.txt multifasta.fasta saida.fasta
```  

### 6. split_fasta.pl  

**Descrição:**  
Este script divide um arquivo multifasta em vários arquivos FASTA individuais.  

**Uso:**  
```bash
perl ./split_fasta.pl
```  

### 7. Extrair_Sequencias_DeepTmHmm.pl  

**Descrição:**  
Este script compara um arquivo de identificadores com sufixos de tipo proteico (gerados pelo DeepTmHMM) com um arquivo multifasta e cria um terceiro arquivo contendo apenas as proteínas e seus identificadores correspondentes, preservando o tipo de proteína no identificador.  

**Uso:**  
```bash
perl ./Extrair_Sequencias_DeepTmHmm.pl arquivo_identificadores.3line arquivo_multifasta.fasta arquivo_resultado.fasta
```

---

Esse formato está mais
