tabuleiro = {
	tab={{" "," "," "},
		{" "," "," "},
		{" "," "," "}}
}

function tabuleiro:mostrarTabuleiro()
	r = ""
		for linha=1, #tabuleiro.tab do
			for coluna=1, 3 do
				r = r..tabuleiro.tab[linha][coluna]
				if coluna == 3 then
				r = r .. "\n"
				end
				if coluna < 3 then
				r = r .. "|"
				end
			end
			if linha<3 then
			r=r.."_____".."\n"
			end
		end
		return r
end

function tabuleiro:zerarTabuleiro()
	for linha=1, 3 do
		for coluna=1, 3 do
			tabuleiro.tab[linha][coluna]=" "
		end
	end
end

function tabuleiro:vericarDiagonais()

	--verifica diagonais

	if tabuleiro.tab[1][1]=="X" and tabuleiro.tab[1][2]=="X" and tabuleiro.tab[1][3]=="X" then
		return true
	elseif tabuleiro.tab[1][1]=="O" and tabuleiro.tab[2][2]=="O" and tabuleiro.tab[3][3]=="O" then
		return true
	elseif tabuleiro.tab[1][3]=="X" and tabuleiro.tab[2][2]=="X" and tabuleiro.tab[3][1]=="X" then
		return true
	elseif tabuleiro.tab[1][3]=="O" and tabuleiro.tab[2][2]=="O" and tabuleiro.tab[3][1]=="O" then
		return true
	end

	return false
end

function tabuleiro:verificarLinha()
	--verifica linhas
	for i=1, 3 do
		if tabuleiro.tab[i][1]=="X" and tabuleiro.tab[i][2]=="X" and tabuleiro.tab[i][3]=="X" then
			return true
		elseif tabuleiro.tab[i][1]=="O" and tabuleiro.tab[i][2]=="O" and tabuleiro.tab[i][3]=="O" then
			return true
		end
	end
	return false
end

function tabuleiro:verificarColuna()
	--verificar colunas
	for i=1., 3 do
		if tabuleiro.tab[1][i]=="X" and tabuleiro.tab[2][i]=="X" and tabuleiro.tab[3][i]=="X" then
			return true
		elseif tabuleiro.tab[1][i]=="O" and tabuleiro.tab[2][i]=="O" and tabuleiro.tab[3][i]=="O" then
			return true
		end
	end
end

function tabuleiro:verificarEmpate()
	for i=1, 3 do
		for j=1, 3 do
			if tabuleiro.tab[i][j]==" " then
				return false
			end
		end
	end
	return true
end

function tabuleiro:valida(linha,coluna)
	if type(linha) == "number" and type(coluna) == "number" then
		return true
	end
	return false
end

function tabuleiro:realizarJogada(linha,coluna,jogada)
	if tabuleiro:valida(linha,coluna) then
		local jogadaValida=((linha>=1 and linha<=3) and (coluna>=1 and coluna<=3)) and (tabuleiro.tab[linha][coluna] == " ")
		if jogadaValida then
			tabuleiro.tab[linha][coluna] = jogada
			return true
		end
		return false
	end
	return false
end

return tabuleiro


