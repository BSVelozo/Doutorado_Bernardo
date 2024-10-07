#!/usr/bin/perl
use strict;
use warnings;

my $input_file = 'gencode.fasta';  # Substitua pelo nome do seu arquivo multifasta

open my $fh, '<', $input_file or die "N�o foi poss�vel abrir o arquivo '$input_file': $!";

my $output_file;
while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /^>(.*)/) {  # Verifica se a linha come�a com '>'
        if ($output_file) {
            close OUT;  # Fecha o arquivo anterior se houver
        }
        $output_file = $1 . '.fasta';  # Define o novo nome do arquivo
        open OUT, '>', $output_file or die "N�o foi poss�vel criar o arquivo '$output_file': $!";
        print OUT "$line\n";  # Escreve o cabe�alho da nova sequ�ncia
    } else {
        print OUT "$line\n";  # Escreve a sequ�ncia
    }
}

close $fh;
close OUT if $output_file;  # Fecha o �ltimo arquivo se existir
