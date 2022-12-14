struct Dealer {
    var numberOfCardsOnStack: Int {
        get {
            cardsOnStack.count
        }
    }
        
    private let maximalNumberOfDecks = 8
    
    private var cardsOnStack: [Card] = []
        
    init?(usingDecks numberOfDecks: Int = 6,
          shufflingWith shuffleFunc: ([Card]) -> [Card] = { stack in stack.shuffled() }) {
        
        guard numberOfDecks >= 1 && numberOfDecks <= maximalNumberOfDecks else { return nil }
        addToStack(numberOfDecks)
        cardsOnStack = shuffleFunc(cardsOnStack)
    }
    
    fileprivate mutating func addToStack(_ numberOfDecks: Int) {
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
