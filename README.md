# JokingApp

This is a simple Chuck Norris jokes app that consumes a restful api from http://www.icndb.com/. This project was built using xCode 10.3 and refined for xCode 11.  

### To build the project:

1. clone this repo 
1. open either the xcodeproj files inside the JokingApp/JokingApp or JokingApp/JokingFramework
Alternatively you can also open the xcworkspace file which will launch both the framework and the app. 

### The project includes:

# A JokingApp for iOS

A simple iOS app that uses the iOS coordinator architecture. The app imports the JokingFramework as a dependency using a Port/ Adapter pattern. The app's presenter and controllers are tested and the JokingFramework is mocked. The views are all adaptable and use AutoLayout.   

# A JokingFramework

An XCode framework which contains only business logic and no UI related code. This framework has an internal and an external initialism. The internal initialiser is used for TDD based tests. This accepts protocols so that objects can be mocked easily so that no "real" objects are being run in tests which should make the tests run faster. The purpose of the public initialiser is only for instantiation and injects "real" objects through to the internal initialiser. 

The framework provides a simple API that is used to communicate with ICNDB. To use the framework, simply clone this project and add the framework to your project. The framework can be used the following way after importing: 


**To initialise the framework:**

```let jokesToolkit = JokesToolkit()```

```jokesToolkit.initialise```

**To Fetch a random chuck norris joke:**

```func fetchRandomJoke(success: @escaping (Joke) -> Void, failure: @escaping (JokeFetchingError) -> Void)```
on success, a provided Joke object is expected to be passed in

on failure: a provided JokeFetchingError is expected to be passed in

**To Fetch a custom joke with a first and last name:**

```func fetchACustomJoke(firstName: String, lastName: String, success: @escaping (Joke) -> Void, failure: @escaping (JokeFetchingError) -> Void)```
first name and last name: Strings of first and last name to use in custom joke

on success block: a provided Joke object is expected to be passed in

on failure block: a provided JokeFetchingError is expected to be passed in

**To Fetch a batch of chuck norris jokes:**

```public func batchFetchRandomJokes(numberOfJokes: Int, success: @escaping ([Joke]) -> Void, failure: @escaping (JokeFetchingError) -> Void)```
numberOfJokes: An Int where you specify the amount of jokes to fetch from the ICNDB

on success, a provided Joke object is expected to be passed in

on failure: a provided JokeFetchingError is expected to be passed in

## Tests are located in:

* JokingApp/JokingApp/JokingAppTests for the iOS App
* JokingApp/JokingFramework/JokingFrameworkTests for the framework
