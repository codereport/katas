board     ← 9⥊'.'
wins      ← 8‿3⥊0‿4‿8‿0‿1‿2‿3‿4‿5‿6‿7‿8‿0‿3‿6‿1‿4‿7‿2‿5‿8‿2‿4‿6
FmtBoard  ← 3‿3⊸⥊
HasWinner ← {∨´⥊∧´⎉1"XO"=⌜wins⊏𝕩}
Switch    ← {'X'=𝕩?'O';'X'}

PlayTurn ← {
     •Out "Player "∾𝕩∾"'s Turn:"
     •Out "Please enter row (1, 2, 3):" ⋄ row ← •BQN •GetLine@
     •Out "Please enter col (1, 2, 3):" ⋄ col ← •BQN •GetLine@
     n     ← +´3‿1×¯1+row⋈col
     board ↩ 𝕩⌾(n⊸⊑)board
     •Show FmtBoard board
     HasWinner board ? •Out "Player "∾𝕩∾" Wins!"
                     ; 𝕊 Switch 𝕩
}

Start ← { •Out "TicTacToe – BQN" ⋄ PlayTurn 𝕩 }
Start 'X'
