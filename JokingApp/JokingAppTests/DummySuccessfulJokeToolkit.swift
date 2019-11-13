
import Foundation
@testable import JokingApp
import JokingFramework

class DummySuccessfulJokeToolkit: JokesToolkitPort {
    
    func getACustomJoke(firstName: String, lastName: String, success: @escaping (Joke) -> Void, failure: @escaping (JokeFetchingError) -> Void) {
        
        let joke = Joke(
            jokeID: 111,
            joke: "testCustomJoke",
            jokeCategory: ["testCustomJokeCat"])
        
        success(joke)
    }
    
    func getARandomJoke(success: @escaping (Joke) -> Void, failure: @escaping (JokeFetchingError) -> Void) {
        let joke = Joke(
            jokeID: 111,
            joke: "testRandomJoke",
            jokeCategory: ["testRandomJokeCat"])
        
        success(joke)
    }
    
    func getABatchOfSevenRandomJokes(success: @escaping ([Joke]) -> Void, failure: @escaping (JokeFetchingError) -> Void) {
        let joke1 = Joke(
            jokeID: 111,
            joke: "testBatchJoke1",
            jokeCategory: ["testBatchJokeCat1"])
        
        let joke2 = Joke(
            jokeID: 111,
            joke: "testBatchJoke2",
            jokeCategory: ["testBatchJokeCat2"])
        
        let jokes = [joke1,joke2]
        success(jokes)
    }
    
    
}
