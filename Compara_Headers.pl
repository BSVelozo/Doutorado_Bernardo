#!/usr/bin/perl
use strict;
use warnings;

# Verificar se os arquivos foram passados como argumento
if (@ARGV != 3) {
    die "Uso: $0 <arquivo1> <arquivo2> <arquivo_saida>\n";
}

my ($file1, $file2, $output_file) = @ARGV;

# Ler o primeiro arquivo e armazenar os headers em um hash
my %headers1;
open(my $fh1, '<', $file1) or die "N�o foi poss�vel abrir o arquivo '$file1': $!";
while (my $line = <$fh1>) {
    chomp $line;
    $headers1{$line} = 1;
}
close($fh1);

# Abrir o segundo arquivo e o arquivo de sa�da
open(my $fh2, '<', $file2) or die "N�o foi poss�vel abrir o arquivo '$file2': $!";
open(my $fh_out, '>', $output_file) or die "N�o foi poss�vel criar o arquivo de sa�da '$output_file': $!";

# Verificar quais headers est�o presentes em ambos os arquivos
while (my $line = <$fh2>) {
    chomp $line;
    if (exists $headers1{$line}) {
        print $fh_out "$line\n";  # Escrever no arquivo de sa�da
    }
}

# Fechar os arquivos
close($fh2);
close($fh_out);

print "Compara��o completa! Os headers comuns foram salvos em '$output_file'.\n";
