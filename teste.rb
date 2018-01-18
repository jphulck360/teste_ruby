# Nome: João Paulo Saraiva Farias
# Data: 18/01/2018

@maiores = [1,3,5,7,8,10,12] # representa meses com 31 dias
@menores = [4,6,9,11] # representa meses com 30 dias

def positivo(dia,mes,ano,hora,minuto,valor)

	while valor > 0
		if minuto == 59
			minuto = 0
			if hora == 23
				hora = 0

				r1 = "#{@maiores.include?(mes)}"
				r2 = "#{@menores.include?(mes)}"

				if mes == 2
					if dia == 28
						dia = 1
						mes = 3
					elsif dia < 28
						dia += 1
					end
				elsif r1 == "true"
					if dia < 31
						dia += 1
					elsif dia == 31
						dia = 1
						if mes == 12
							mes = 1
							ano += 1
						else
							mes += 1
						end 
					end
				elsif r2 == "true"
					if dia < 30
						dia += 1
					elsif dia == 30
						dia = 1
						mes += 1
					end
				end

			else
				hora += 1
			end
		else
			minuto += 1
		end
		valor -= 1
		#puts "Dia: #{dia}/#{mes}/#{ano} #{hora}:#{minuto}"
	end
		puts "Dia: #{dia}/#{mes}/#{ano} #{hora}:#{minuto}"
end



def negativo(dia,mes,ano,hora,minuto,valor)

	while valor > 0
		if minuto == 0
			minuto = 59
			if hora == 0
				hora = 23

				r1 = "#{@maiores.include?(mes)}"
				r2 = "#{@menores.include?(mes)}"

				mes_ant_1 = "#{@maiores.include?(mes-1)}"
				mes_ant_2 = "#{@menores.include?(mes-1)}"

				if mes == 3
					if dia == 1
						dia = 28
						mes = 2
					elsif dia > 1
						dia -= 1
					end
				elsif r1 == "true"
					
					if dia > 1
						dia -= 1
					elsif dia == 1	
						if mes_ant_1 == "true"
							dia = 31
						else
							dia = 30
						end

						if mes == 1
							mes = 12
							ano -= 1
						else
							mes -= 1
						end 
					end

				elsif r2 == "true"

					if dia > 1
						dia -= 1
					elsif dia == 1
						
						if mes_ant_2 == "true"
							dia = 30
						else
							dia = 31
						end

						if mes == 1
							mes = 12
							ano -= 1
						else
							mes -= 1
						end 
					end
				end

			else
				hora -= 1
			end
		else
			minuto -= 1
		end
		valor -= 1
		#puts "Dia: #{dia}/#{mes}/#{ano} #{hora}:#{minuto}"
	end
		puts "Data: #{dia}/#{mes}/#{ano} #{hora}:#{minuto}"
end



def change_date(data,op,valor)

	dados = data.split(/\W+/)
	dia = dados[0]
	mes = dados[1]
	ano = dados[2]
	hora = dados[3]
	minuto = dados[4]

	novo_dia = dia.to_i
	novo_mes = mes.to_i
	novo_ano = ano.to_i
	nova_hora = hora.to_i
	novo_minuto = minuto.to_i

	retorna_ano = novo_ano.integer?

	if (0..59) === novo_minuto && (00..23) === nova_hora && (1..31) === novo_dia && (1..12) === novo_mes && retorna_ano == true
		if op == "+"
			puts "Operação Positiva"
			positivo(novo_dia,novo_mes,novo_ano,nova_hora,novo_minuto,valor)
		elsif op == "-"
			puts "Operação Negativa"
			negativo(novo_dia,novo_mes,novo_ano,nova_hora,novo_minuto,valor)
		else
			puts "Erro no sinal de operação"
		end
	else
		puts "Dados inválidos"
	end
end


# Dados inseridos para teste

# Operação Positiva
puts "#{change_date("01/12/2010 22:00",'+',3000)}"

# Operação Negativa
puts "#{change_date("01/12/2010 22:00",'-',3000)}"