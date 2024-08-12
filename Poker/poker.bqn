⟨Deltas, Group⟩ ⇐ •Import "../../bqn-code/lib/fun.bqn"

# Helper Functions
HasAce   ← ∨´12=13|⊢
HasKing  ← ∨´11=13|⊢
NOfAKind ← {⊑𝕨∊≠¨⊔∧13|𝕩}

# Predicate Poker Functions
IsFlush         ← ∧´·⊑⊸=13⊸|
IsStraight      ← {∧´1=Deltas∧13|𝕩} # misses A-5
IsStraightFlush ← IsStraight ∧ IsFlush
IsRoyalFlush    ← IsStraightFlush ∧ HasAce ∧ HasKing
IsFullHouse     ← {2‿3≡∧≠¨Group∧13|𝕩}
IsOnePair       ← 2⊸NOfAKind
IsTwoPair       ← {1‿2‿2≡∧≠¨Group∧13|𝕩}
IsThreeOfAKind  ← 3⊸NOfAKind
IsFourOfAKind   ← 4⊸NOfAKind

# Poker Hand
PokerHand ← {
    IsRoyalFlush    𝕩 ? "Royal Flush"    ;
    IsStraightFlush 𝕩 ? "Straight Flush" ;
    IsFourOfAKind   𝕩 ? "4 of a Kind"    ;
    IsFullHouse     𝕩 ? "Full House"     ;
    IsFlush         𝕩 ? "Flush"          ;
    IsStraight      𝕩 ? "Straight"       ;
    IsThreeOfAKind  𝕩 ? "3 of a Kind"    ;
    IsTwoPair       𝕩 ? "Two Pair"       ;
    IsOnePair       𝕩 ? "Pair"           ;
                        "High Card"
}

# Printing
GenerateHand ← •rand.Range¨⥊⟜52
FmtVal       ← {8>𝕩?•Fmt 2+𝕩;⊑"TJQKA"⊏˜8|𝕩}
FmtHand      ← ∧13⊸(("♠♥♦♣"⊏˜⌊∘÷˜)∾¨(FmtVal¨|))

# Tests
hands ← GenerateHand¨ 10⥊5
•Show¨ (PokerHand⋈FmtHand)¨ hands
