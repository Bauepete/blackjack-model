struct Dealer {
    var numberOfCardsOnStack = 312
    
//    private var cardsOnStack
    
    mutating func dealOneCard() -> Card? {
        numberOfCardsOnStack -= 1
        return nil
    }
}
