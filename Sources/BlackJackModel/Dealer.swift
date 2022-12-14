struct Dealer {
    var numberOfCardsOnStack: Int {
        get {
            cardsOnStack.count
        }
    }
    
    private var cardsOnStack: [Card] = []
    
    init(usingDecks numberOfDecks: Int = 6) {
        for _ in 1 ... numberOfDecks {
            appendOneDeck()
        }
    }
    
    fileprivate mutating func appendOneDeck() {
        for rank in Card.Rank.allCases {
            appendAllCards(of: rank)
        }
    }
    
    fileprivate mutating func appendAllCards(of rank: Card.Rank) {
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
