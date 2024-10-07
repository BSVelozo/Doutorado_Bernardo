#!/usr/bin/perl
use strict;
use warnings;

# Verificar se os arquivos foram passados como argumento
if (@ARGV != 3) {
    die "Uso: $0 <headers.txt> <multifasta.fasta> <saida.fasta>\n";
}

my ($headers_file, $multifasta_file, $output_file) = @ARGV;

# Ler os headers e armazen�-los em um hash (removendo o s�mbolo '>')
my %headers;
open(my $fh_headers, '<', $headers_file) or die "N�o foi poss�vel abrir o arquivo '$headers_file': $!";
while (my $line = <$fh_headers>) {
    chomp $line;
    $line =~ s/^>//;  # Remove o '>' do in�cio da linha
    $headers{$line} = 1 if $line ne '';  # Adicionar somente headers n�o vazios
}
close($fh_headers);

# Abrir o arquivo multifasta e o arquivo de sa�da
open(my $fh_multifasta, '<', $multifasta_file) or die "N�o foi poss�vel abrir o arquivo '$multifasta_file': $!";
open(my $fh_out, '>', $output_file) or die "N�o foi poss�vel criar o arquivo de sa�da '$output_file': $!";

my $current_header = '';
my $current_sequence = '';

while (my $line = <$fh_multifasta>) {
    chomp $line;
    if ($line =~ /^>(\S+)/) {
        # Se j� temos um header e uma sequ�ncia, escrevemos no arquivo de sa�da
        if ($current_header && exists $headers{$current_header}) {
            print $fh_out ">$current_header\n$current_sequence\n";
        }
        # Atualizar o header atual
        $current_header = $1;
        $current_sequence = '';  # Reiniciar a sequ�ncia
    } else {
        # Adicionar a linha � sequ�ncia atual
        $current_sequence .= $line;
    }
}

# Verificar se a �ltima sequ�ncia deve ser escrita
if ($current_header && exists $headers{$current_header}) {
    print $fh_out ">$current_header\n$current_sequence\n";
}

# Fechar os arquivos
close($fh_multifasta);
close($fh_out);

print "Extra��o completa! As sequ�ncias foram salvas em '$output_file'.\n";
