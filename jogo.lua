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
	novoj.jogador2 = jogador:definirJogadores()
	novoj.jogador2.jogada = "X"
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

function jogo:reiniciar()
	print("Se deseja jogar novamente, digite 1:")
	local reinicia = io.read('*number')
	if reinicia == 1 then
		tabuleiro:zerarTabuleiro()
		jogo:iniciar()
	end
end

function jogo:iniciar()

		print("Bem Vindo ao Jogo da Velha!")
		print()
        print(tabuleiro.mostrarTabuleiro())

		cont =0



	repeat

	fim = false

		print("Sua Vez Jogador: " .. novoj.jogadordaVez.jogada)
		print("Linha")
		local linha = io.read("*number")
		print("Coluna")
		local coluna = io.read("*number")
		print()
		if tabuleiro:realizarJogada(linha, coluna, novoj.jogadordaVez.jogada) then
			print(tabuleiro:mostrarTabuleiro())
			print()
			if tabuleiro:verificarLinha() == true then
				print("Parabéns Jogador " .. novoj.jogadordaVez.jogada .. " Voce Ganhou")
				print()
				print("Obrigado Por Jogar")
				print(jogo:reiniciar())
				fim = true
			elseif tabuleiro:verificarColuna() == true then
				print("Parabéns Jogador " .. novoj.jogadordaVez.jogada .. " Voce Ganhou")
				print()
				print("Obrigado Por Jogar")
				print(jogo:reiniciar())
				fim = true
			elseif tabuleiro:vericarDiagonais() == true then
				print("Parabéns Jogador " .. novoj.jogadordaVez.jogada .. " Voce Ganhou")
				print()
				print("Obrigado Por Jogar")
				print(jogo:reiniciar())
				fim = true
			elseif tabuleiro:verificarEmpate() == true then
				print("------------------O Jogo deu empate----------------------")
				print()
				print(jogo:reiniciar())
				fim = true
			else
				novoj:vez()
			end
		else
			print("A posição digitada não é valida")
		end
		cont = cont + 1

	until (fim)
end

--return jogo
print(jogo.novojogo())
print(jogo.iniciar())

