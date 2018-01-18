

# site: rubular.com
# (\d{2})\/(\d{2})\/(\d{4})

day = 1
month = 1
year = 2018

hour = 12
min = 00

signal = '+'
num = 580000

def verif(dia,mes,ano,hora,minuto,op,valor)

	@maiores = [1,3,5,7,8,10,12]
	@menores = [4,6,9,11]

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
		puts "Dia: #{dia} / #{mes} / #{ano} / #{hora}:#{minuto}"
	end
end

#puts verif(day,month,year,hour,min,signal,num)

def testar(data,op,valor)

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
	else
		puts "Dados inválidos"
	end

	minuto = novo_minuto.to_s
	hora = nova_hora.to_s
	dia = novo_dia.to_s
	mes = novo_mes.to_s
	ano = novo_ano.to_s

	puts dia+"/"+mes+"/"+ano+" "+hora+":"+minuto
end

puts "#{testar("01/12/2010 22:00",'+',3000)}"