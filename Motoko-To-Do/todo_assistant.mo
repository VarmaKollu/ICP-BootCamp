import Hash "mo:base/Hash";
import Map "mo:base/Map";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor Assistant {

  type ToDo = { description: Text; completed: Bool };

  // Efficiently store and manage to-do items
  var todos = Map.HashMap<Nat, ToDo>(0, Nat.equal, Text.hash); // Optimized hash function
  var nextId : Nat = 0;

  // Add a new to-do item
  public func addTodo(description: Text) : async Nat {
    let id = nextId;
    todos.put(id, { description = description; completed = false });
    nextId += 1;
    id
  };

  // Mark a to-do item as completed
  public func completeTodo(id: Nat) : async () {
    if let todo = todos.get(id) { 
      todos.put(id, { todo with completed = true });
    } 
  };

  // Get a formatted list of all to-dos
  public query func showTodos() : async Text {
    var output = "\n___TO-DOs___";
    for (id, todo) in todos.entries() { // Iterate directly for efficiency
      output #= "\n[\(id)] " # todo.description;
      if (todo.completed) { output #= " ✔"; }
    };
    output #= "\n"
  };

  // Remove completed to-dos
  public func clearCompleted() : async () {
    todos = todos.filter(func(id, todo) : Bool { !todo.completed }); 
  };
}
