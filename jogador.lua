local jogador = {}

function jogador:definirJogadores()

	novoJogador={nome="", jogada = "", pontos =0}

	novoJogador = setmetatable(novoJogador,{_index = jogador})

	return novoJogador
end

return jogador
