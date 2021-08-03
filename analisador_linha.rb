class AnalisadorLinha
  attr_accessor :linha, :palavras, :frequencia

  def initialize (linha, conteudo)
    @linha = linha
    @conteudo = conteudo
    @palavras = contador(@conteudo)
  end

  def contador(conteudo)
    frequencia = Hash.new(0)
    maior_frequencia = 0

    words = conteudo.split(" ")
    
    words.each do |palavra|
      if frequencia.has_key? palavra
        frequencia[palavra] += 1
      else
        frequencia[palavra] = 1
      end
      if frequencia[palavra] > maior_frequencia
        maior_frequencia = frequencia[palavra]
      end
    end
    @frequencia = maior_frequencia
    frequencia.select {
        |_, value| value == maior_frequencia
    }
  end
end

arquivo = File.open('texto.txt', 'r')
linha = File.readlines(arquivo)

array = []
linha.each_with_index do |n, i| 
  array.push(AnalisadorLinha.new(i+1, n)) 
end 
array.each do |i| 
  puts "Linha #{i.linha} Palavra: #{i.palavras.keys} Frequencia: #{i.frequencia}"
end

# Escreva uma classe chamada AnalisadorLinha que armazene em seus atributos de instancia o número da linha,
# o seu conteúdo, a(s) palavra(s) com mais frequência nessa linha. No plural pois pode dar empate. O construtor
# desta classe apenas receberá, via parâmetro, o número e o conteúdo da linha. A classe deverá ter um método
# para gerar a analise dessa frequencia.
# Em seguida, escreva um programa que leia o conteúdo de um arquivo texto e para cada linha lida do arquivo, crie 
# uma instancia de AnalisadorLinha. Guarde essas instancias em um array. No final, imprima, a partir das instancias
# criadas, quais são as palavras que aparecem com mais frequencia, em cada linha analisada. Imprima também, a sua frequencia.

