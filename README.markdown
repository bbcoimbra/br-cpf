# BR::CPF ![Travis-ci status](https://secure.travis-ci.org/bbcoimbra/br-cnpj.png?branch#master)

Lib implementada em C (gera uma lib compilada nativamente) que calcula e valida CPFs.
Recomendada para Validar CPFs ou Gerar CPFs quando o sistema requer que sejam feitas mais de 1000 Validações/Gerações por segundo.

## Instalação

 sudo gem install br-cpf

## Exemplos

### Usar
 require 'rubygems'
 require 'br/cpf'

### Validar

```ruby
 BR::CPF.valid? '00000000191'
  #> true

 BR::CPF.valid? 12345678909
  #> true

 BR::CPF.valid? 12345678900
  #> false
```

### Gerar CPF

```ruby
	raiz = 1
	BR::CPF.new(raiz).to_s
	#> '00000000191'
```

## Benchmark sobre uma implementação puro Ruby
Comparação de validação com a brcpfcnpj (Brazilian Rails)

```bash
$ cat benchmark.rb
```

```ruby
	require "rubygems"
	require "br/cpf"
	require "brcpfcnpj"
	require "benchmark"

	[1, 10, 100, 1000, 10_000, 100_000, 1_000_000].each do |n|
		puts "Teste com n # #{n}"
		Benchmark.bm do |x|
			x.report { n.times { BR::CPF.valid?(rand(999_999_999_99).to_s.rjust(11, '0')) } }
			x.report { n.times { Cpf.new(rand(999_999_999_99).to_s.rjust(11, '0')).valido? } }
		end
	end
```

Resultados

```
  Teste com n = 1
    user     system      total        real
    0.000000   0.000000   0.000000 (  0.000053)
    0.000000   0.000000   0.000000 (  0.000243)
  Teste com n = 10
    user     system      total        real
    0.000000   0.000000   0.000000 (  0.000080)
    0.000000   0.000000   0.000000 (  0.001187)
  Teste com n = 100
    user     system      total        real
    0.000000   0.000000   0.000000 (  0.002193)
    0.020000   0.000000   0.020000 (  0.011373)
  Teste com n = 1000
    user     system      total        real
    0.020000   0.000000   0.020000 (  0.017329)
    0.150000   0.000000   0.150000 (  0.169375)
  Teste com n = 10000
    user     system      total        real
    0.100000   0.000000   0.100000 (  0.094112)
    1.490000   0.010000   1.500000 (  1.512164)
  Teste com n = 100000
    user     system      total        real
    0.850000   0.000000   0.850000 (  0.874577)
    15.050000   0.010000  15.060000 ( 15.193196)
  Teste com n = 1000000
    user     system      total        real
    8.570000   0.010000   8.580000 (  8.631888)
    150.620000   0.210000 150.830000 (152.158936)
```

## Desvantagens
Por precisar compilar a extensão em C, acaba incompatível com sistemas que não tem um compilador em C (Windows).

E quando o ritmo de comparação for menor que 1000 por segundo a diferença é pequena, por volta de de 0.15 segundos. Talvez o acumulo de dependência não valha a pena.

## Copyright

Copyright (c) 2010 Bruno Coimbra. Veja o arquivo LICENSE para mais detalhes.
