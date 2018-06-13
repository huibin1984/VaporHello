import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Hello Controller
    let helloController = HelloController()
    router.get("greet", use: helloController.greet)
    router.get("users", Int.parameter, use: helloController.users)
    router.get("user", use: helloController.getUser)
    router.post("login", use: helloController.login)
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
