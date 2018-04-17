local jogador = {jogada}

function jogador:definirJogadores()

	novoJogador={nome="", jogada = "", pontos =0}

	novoJogador = setmetatable(novoJogador,{_index = jogador})

	novoJogador.jogada = ""

	return novoJogador
end
--jogador.definirJogadores()
return jogador
