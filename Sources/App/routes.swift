import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
   // Basic "It works" example
     router.get { req in
         return "It works!"
     }
     // Basic "Hello, world!" example
     router.get("hello") { req in
         return "Hello, youtube!"
     }
     /* Greet message one parameter which we will get from url */
     router.get("greet", String.parameter) { (request) -> String in
         let name = try request.parameters.next(String.self)
         return "Namaste \(name)"
     }
     /* Greet message two parameter which we will get from url */
     router.get("welcome", String.parameter, String.parameter) { (request) -> String in
            let firstName = try request.parameters.next(String.self)
            let lastName = try request.parameters.next(String.self)
            return "Namaste \(firstName) \(lastName)"
     }
     
     let loginAPIController = LoginAPIController()
     try loginAPIController.boot(router: router)
     let signUpAPIController = SignUpAPIController()
     try signUpAPIController.boot(router: router)
     
     // Example of configuring a controller
     // TODO:: For now commenting not required.
    /* let todoController = TodoController()
     router.get("todos", use: todoController.index)
     router.post("todos", use: todoController.create)
     router.delete("todos", Todo.parameter, use: todoController.delete) */
}
