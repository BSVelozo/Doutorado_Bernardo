#!/usr/bin/perl
use strict;
use warnings;

# Verifica se o arquivo de entrada foi passado como argumento
if (@ARGV != 1) {
    die "Uso: $0 arquivo.csv\n";
}

my $input_file = $ARGV[0];
my $output_file = "linhas_membrana.csv";

# Abre o arquivo de entrada para leitura
open(my $in_fh, '<', $input_file) or die "N�o foi poss�vel abrir o arquivo '$input_file': $!";

# Abre o arquivo de sa�da para escrita
open(my $out_fh, '>', $output_file) or die "N�o foi poss�vel criar o arquivo '$output_file': $!";

# L� a primeira linha (cabe�alho)
my $header = <$in_fh>;
chomp $header;

# Divide o cabe�alho pelos separadores de v�rgula
my @headers = split(",", $header);

# Verifica se a segunda coluna � "Localizations"
if ($headers[1] ne "Localizations") {
    die "A segunda coluna n�o � 'Localizations'. Verifique o formato do arquivo.\n";
}

# Escreve o cabe�alho no arquivo de sa�da
print $out_fh "$header\n";

# Percorre cada linha do arquivo de entrada
while (my $line = <$in_fh>) {
    chomp $line;

    # Divide a linha pelos separadores de v�rgula
    my @columns = split(",", $line);

    # Verifica se a c�lula da coluna "Localizations" cont�m "Cell membrane"
    if (defined $columns[1] && $columns[1] =~ /Cell membrane/i) {
        print $out_fh "$line\n";  # Escreve a linha no arquivo de sa�da
    }
}

# Fecha os arquivos
close($in_fh);
close($out_fh);

print "Linhas com 'Cell membrane' na coluna 'Localizations' foram salvas no arquivo '$output_file'.\n";
