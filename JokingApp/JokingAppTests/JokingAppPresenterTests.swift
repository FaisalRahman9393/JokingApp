//
//  JokingAppTests.swift
//  JokingAppTests
//
//  Created by Faisal Rahman on 09/11/2019.
//  Copyright © 2019 Faisal Rahman. All rights reserved.
//

import XCTest
import JokingFramework
@testable import JokingApp

class JokingAppTests: XCTestCase {
    
    var dummyJokesToolkit: DummySuccessfulJokeToolkit!
    var homePresenter: HomePresenter!
    var jokeSearchPresenter: JokeSearchPresenter!
    var jokeListPresenter: JokeListPresenter!
    
    var dummyHomeViewController: DummyHomeViewController!
    var dummyjokeSearchViewController: DummyJokeSearchViewController!
    var dummyjokeListViewController: DummyJokeListViewController!

    override func setUp() {
        dummyJokesToolkit = DummySuccessfulJokeToolkit()
        
        dummyHomeViewController = DummyHomeViewController()
        dummyjokeSearchViewController = DummyJokeSearchViewController()
        dummyjokeListViewController = DummyJokeListViewController()

        //TODO: rethink dependency injection/ approach in order to prevent the need to pass in real UIViewControllers
        homePresenter = HomePresenter(dummyHomeViewController, dummyJokesToolkit)
        jokeSearchPresenter = JokeSearchPresenter(dummyjokeSearchViewController, dummyJokesToolkit)
        jokeListPresenter = JokeListPresenter(dummyjokeListViewController, dummyJokesToolkit)

    }
    
    func testHomePresenter_showsARandomJokeWhenRequested() {
        homePresenter.randomJokeButtonPressed()
        
        XCTAssertTrue(dummyHomeViewController.titlePresented == "testRandomJoke")
    }
    
    func testSearchPresenter_showsACustomJokeWhenRequested() {
        jokeSearchPresenter.jokeSearchPressed(name: "Faisal Rahman")
        
        XCTAssertTrue(dummyjokeSearchViewController.updatedText == "testCustomJoke")
    }
    
    func testjokeListPresenter_showsAListOfJokesWhenRequested() {
        let expect = expectation(description: "initialized")

        jokeListPresenter.fetchJokeBatch { (joke) in
            XCTAssertTrue(joke[0].joke == "testBatchJoke1")
            XCTAssertTrue(joke[1].joke == "testBatchJoke2")
            
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
        
    }
    

}



class DummyHomeViewController: HomeViewController {
    
    var messagePresented = ""
    var titlePresented = ""
    
    override func presentMessage(messageToShow: String, title: String) {
        self.messagePresented = messageToShow
        self.titlePresented = title
    }
    
}

class DummyJokeSearchViewController: JokeSearchViewController {
    
    var messagePresented = ""
    var titlePresented = ""
    var updatedText = ""
    
    
    override func updateTextLabel(message: String) {
        self.updatedText = message
    }
    
    override func presentMessage(messageToShow: String, title: String) {
        self.messagePresented = messageToShow
        self.title = title
    }
    
}

class DummyJokeListViewController: JokeListViewController {
    
    var jokeRetrived = [String]()
    var messageRetrived = ""
    var titleRetrived = ""

    override func presentMessage(messageToShow: String, title: String) {
        self.messageRetrived = messageToShow
        self.title = title
    }
    
    override func updateTableWithNewJokes() {
        self.delegate?.fetchJokeBatch(success: { jokes in
            for joke in jokes {
                self.jokeRetrived.append(joke.joke)
            }
        })
    }
    
}
