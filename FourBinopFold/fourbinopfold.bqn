Add ← +
Sub ← -
Mul ← ×
Div ← ⌊⌾-÷

binops ← Add‿Div‿Sub‿Mul

FourBinopFold ← {
    b ← 𝕨
    1⊑{⟨j,x⟩𝕊⟨i,y⟩: ⋄ op ← i⊑b ⋄ ⟨j,y Op x⟩ }´⌽(↕∘≠⋈¨⊢)𝕩
}

•Show Add‿Div‿Sub‿Mul FourBinopFold ⟨1, 2, 3, 4, 5⟩ # ¯15
•Show Sub‿Div‿Add‿Mul FourBinopFold ⟨1, 2, 3, 4, 5⟩ #  20

# Results From C++ File:
# 1 + 2 / 3 - 4 * 5 = -15
# 1 - 2 / 3 + 4 * 5 = 20
