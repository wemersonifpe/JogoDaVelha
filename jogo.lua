--jogo={jogador1,jogador2,tabuleiro}


local tabuleiro = require("Tabuleiro")
local jogador = require("jogador")

local jogo = {jogador1, jogador2, tabuleiro, jogadordaVez}

function jogo:novojogo()

	novoj = {}
	novoj = setmetatable(novoj, {__index = jogo})
	novoj.tabuleiro = tabuleiro:mostrarTabuleiro()
	novoj.jogador1 = jogador:definirJogadores()
	novoj.jogador1.jogada = "O"
	novoj.jogador1.pontos = 0
	novoj.jogador2 = jogador:definirJogadores()
	novoj.jogador2.jogada = "X"
	novoj.jogador2.pontos = 0
	novoj.jogadordaVez = jogador:definirJogadores()
	novoj.jogadordaVez.jogada = "O"

	return novoj

end


function jogo:vez()
	if (novoj.jogador1.jogada == novoj.jogadordaVez.jogada) then
		novoj.jogadordaVez = novoj.jogador2
	else
		novoj.jogadordaVez = novoj.jogador1
	end
end

function jogo:verificarValor(linha,coluna)
	if linha ~= nil and coluna ~= nil then
		local jogadaValida=((linha>=1 and linha<=3) and (coluna>=1 and coluna<=3)) and (tabuleiro.tab[linha][coluna] == " ")
		if jogadaValida then
			return true
		end
	end
	return false
end


function jogo:realizarJogada(linha,coluna,jogada)
	if jogo:verificarValor(linha,coluna) then
		tabuleiro.tab[linha][coluna] = jogada
		return true
	end
	return false

end

function jogo:quemGanhou()
	if tabuleiro:verificarLinha() == true then
		print("Parabéns Jogador " .. novoj.jogadordaVez.jogada .. " Voce Ganhou")
		print()
		jogo:pontuacao()
		print("Obrigado Por Jogar".."\n")
		return true
	elseif tabuleiro:verificarColuna() == true then
		print("Parabéns Jogador " .. novoj.jogadordaVez.jogada .. " Voce Ganhou")
		print()
		jogo:pontuacao()
		print("Obrigado Por Jogar".."\n")
		return true
	elseif tabuleiro:vericarDiagonais() == true then
		print("Parabéns Jogador " .. novoj.jogadordaVez.jogada .. " Voce Ganhou")
		print()
		jogo:pontuacao()
		print("Obrigado Por Jogar".."\n")
		return true
	elseif tabuleiro:verificarEmpate() == true then
		print("------------------O Jogo deu empate----------------------")
		print()
		return true
	else
		return false
	end
end

function jogo:pontuacao()
	if novoj.jogadordaVez.jogada == "X" then
		novoj.jogador2.pontos = novoj.jogador2.pontos+1
	else
		novoj.jogador1.pontos = novoj.jogador1.pontos+1
	end
	print("Jogador "..novoj.jogador2.jogada.." pontuacao: "..novoj.jogador2.pontos)
	print("Jogador "..novoj.jogador1.jogada.." pontuacao: "..novoj.jogador1.pontos.."\n")
end

function jogo:iniciar()

		print("Bem Vindo ao Jogo da Velha!")
		print()
        print(tabuleiro.mostrarTabuleiro())

		fim = true

	while fim do

		print("Sua Vez Jogador: " .. novoj.jogadordaVez.jogada)
		print("Linha")
		local linha = io.read()
		print("Coluna")
		local coluna = io.read()
		coluna = tonumber(coluna)
		linha = tonumber(linha)
		print()
		if jogo:realizarJogada(linha, coluna, novoj.jogadordaVez.jogada) then
			print(tabuleiro:mostrarTabuleiro())
			print()
			if jogo:quemGanhou() then
				print("Se deseja jogar novamente?".."\n SIM digite 1: ".."\n NÃO digite 0: ")
				local reinicia = io.read()
				reinicia = tonumber(reinicia)
				if reinicia == 1 then
					tabuleiro:zerarTabuleiro()
					jogo:iniciar()
				elseif reiniciar == 0 then
					break
				end
				fim = false
			else
				novoj:vez()
			end
		else
			print("A posição digitada não é valida")
		end

	end
end

--return jogo
print(jogo.novojogo())
print(jogo.iniciar())

