class Calculadora
    attr_accessor :a, :b, :historico

    def initialize
        @historico = {}
    end

    [:somar, :subtrair, :multiplicar, :dividir].each do |operacao|
        define_method operacao do |a, b|
            if operacao.to_s == "somar"
                soma = a + b
                @historico[:somar] = "A: #{a} + B: #{b} = #{soma}"
                puts "#{a.to_i} + #{b.to_i} = #{soma.to_i}"
            elsif operacao.to_s == "subtrair"
                subtrair = a - b
                @historico[:subtrair] = "A: #{a} - B: #{b} = #{subtrair}"
                puts "#{a.to_i} - #{b.to_i} = #{subtrair.to_i}"
            elsif operacao.to_s == "multiplicar"
                multiplicar = a * b
                @historico[:multiplicar] = "A: #{a} * B: #{b} = #{multiplica}"
                puts "#{a} * #{b} = #{'%.2f' % multiplicar}"
            elsif operacao.to_s == "dividir"
                if b.zero?
                    puts "Erro! divisão por zero"
                else
                    dividir = a / b
                    @historico[:dividir] = "A: #{a} / B: #{b} = #{divide}"
                    puts "#{a} / #{b} = #{'%.2f' % dividir}"
                end
            end
        end
        @historico
    end

    def apagar_historico
        if @historico.empty?
            puts "Histórico vazio!"
        else
            @historico = {}
            puts "Histórico apagado!"
        end
    end
end

def entradas
    print "Número 1: "
    a = gets.chomp.to_f
    print "Número 2: "
    b = gets.chomp.to_f
    return a, b
end

def mostrar_historico(calc)
    puts "Histórico de operações"
    if calc.historico.any?
        calc.historico.each do |op, resultado|
            puts "#{op.capitalize}: #{resultado}"
        end
    else
        puts "Nenhuma operação foi realizada!"
    end
end

def limpar_tela
    system('clear') || system('cls')
end


def tempo(segundos)
    total_segundos = segundos.to_f
    while total_segundos > 0
      sleep(0.1)
      total_segundos -= 0.1
    end
end

def menu
    limpar_tela
    puts ""
    puts "Calculadora Simples"
    puts ""
    tempo(1)
    calc = Calculadora.new
    loop do
        puts "=========menu========="
        puts "1 - Somar"
        puts "2 - Subtrair"
        puts "3 - Multiplicar"
        puts "4 - Dividir"
        puts "5 - Histórico"
        puts "6 - Apagar histórico"
        puts "0 - Sair"
        print "Escolha: "

        escolha = gets.chomp.to_i

        limpar_tela
        if escolha == 1
            limpar_tela
            puts "Somar"
            a, b = entradas
            limpar_tela
            calc.somar(a, b)
            puts "tecle Enter para Proseguir"
            gets
            limpar_tela
        elsif escolha == 2
            limpar_tela
            puts "Subtrair"
            a, b = entradas
            limpar_tela
            calc.subtrair(a, b)
            puts "tecle Enter para Proseguir"
            gets
            limpar_tela
        elsif escolha == 3
            limpar_tela
            puts "Multiplicar"
            a, b = entradas
            limpar_tela
            calc.multiplicar(a, b)
            puts "tecle Enter para Proseguir"
            gets
            limpar_tela
        elsif escolha == 4
            limpar_tela
            puts "Dividir"
            a, b = entradas
            limpar_tela
            calc.dividir(a, b)
            puts "tecle Enter para Proseguir"
            gets
            limpar_tela
        elsif escolha == 5
            mostrar_historico(calc)
        elsif escolha == 6
            calc.apagar_historico
        elsif escolha == 0
            puts "Saindo..."
            tempo(1.5)
            return
        else
            puts "Escolha inválida! Tente novamente"
        end
    end
end

menu