struct Dealer {
    var numberOfCardsOnStack: Int {
        get {
            cardsOnStack.count
        }
    }
    
    private var cardsOnStack: [Card] = []
    
    init() {
        for _ in 1 ... 6 {
            appendOneDeck()
        }
    }
    
    fileprivate mutating func appendOneDeck() {
        for rank in Card.Rank.allCases {
            appendAllCardsOf(of: rank)
        }
    }
    
    fileprivate mutating func appendAllCardsOf(of rank: Card.Rank) {
        for suit in Card.Suit.allCases {
            cardsOnStack.append(Card(rank: rank, suit: suit))
        }
    }
    
    mutating func dealOneCard() -> Card? {
        let cardToReturn = cardsOnStack[0]
        cardsOnStack.removeFirst()
        return cardToReturn
    }
}
