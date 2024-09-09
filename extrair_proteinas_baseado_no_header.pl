#!/usr/bin/perl
use strict;
use warnings;

# Verifica se os arquivos foram passados como argumentos
if (@ARGV != 2) {
    die "Uso: $0 arquivo.csv arquivo.fasta\n";
}

my ($csv_file, $fasta_file) = @ARGV;
my $output_file = "proteinas_extraidas.fasta";

# Abre o arquivo CSV para leitura
open(my $csv_fh, '<', $csv_file) or die "N�o foi poss�vel abrir o arquivo CSV '$csv_file': $!";

# Ignora a primeira linha (t�tulo da coluna)
my $header_line = <$csv_fh>;

# L� todos os identificadores de prote�nas do CSV e armazena em um hash
my %protein_ids;
while (my $line = <$csv_fh>) {
    chomp $line;
    # Supondo que cada linha tem um identificador na primeira coluna, sem delimitadores espec�ficos
    my @columns = split(/\s+/, $line);  # Divide por espa�os ou tabula��es
    $protein_ids{$columns[0]} = 1;      # Armazena o identificador da primeira coluna
}
close($csv_fh);

# Abre o arquivo FASTA para leitura
open(my $fasta_fh, '<', $fasta_file) or die "N�o foi poss�vel abrir o arquivo FASTA '$fasta_file': $!";

# Abre o arquivo de sa�da para escrita
open(my $out_fh, '>', $output_file) or die "N�o foi poss�vel criar o arquivo de sa�da '$output_file': $!";

# Vari�veis para armazenar temporariamente o header e a sequ�ncia da prote�na
my $header = '';
my $sequence = '';

# Percorre o arquivo FASTA
while (my $line = <$fasta_fh>) {
    chomp $line;
    
    if ($line =~ /^>(\S+)/) {  # Se a linha come�a com '>', � um header
        # Se j� temos um header e uma sequ�ncia, verificamos o match
        my $identifier = $1;  # Extrai o identificador ap�s o '>'

        if ($header && exists $protein_ids{$header}) {
            # Escreve o header e a sequ�ncia no arquivo de sa�da
            print $out_fh ">$header\n$sequence\n";
        }
        
        # Atualiza o header com o novo identificador
        $header = $identifier;
        $sequence = '';  # Reseta a sequ�ncia para a nova entrada
    } else {
        # Concatena a sequ�ncia (pode ser dividida em v�rias linhas no arquivo FASTA)
        $sequence .= $line;
    }
}

# Verifica a �ltima sequ�ncia ap�s o loop
if ($header && exists $protein_ids{$header}) {
    print $out_fh ">$header\n$sequence\n";
}

# Fecha os arquivos
close($fasta_fh);
close($out_fh);

print "Prote�nas extra�das foram salvas no arquivo '$output_file'.\n";
