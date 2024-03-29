# Motoko To-Do List Smart Contract

This repository contains a simple yet functional smart contract implementation for managing a to-do list, built using the Motoko programming language.

## Features

* **Add To-Dos:** Create new to-do entries with text descriptions.
* **Complete To-Dos:** Mark existing to-do items as completed.
* **View To-Dos:** Generate a formatted list of all to-dos, including their completion status.
* **Clear Completed:** Remove completed to-do items from the list.  

1. **Prerequisites:**
   * DFINITY SDK ([https://dfinity.org/developers/](https://dfinity.org/developers/))

2. **Build:**
   ```bash
   dfx build todo_assistant
   ```

3. **Deploy:**
   ```bash
   dfx canister install todo_assistant
   ```

**Usage**

* **View to-dos:**
   ```bash
   dfx canister call todo_assistant showTodos
   ```

* **Add to-do:**
   ```bash
   dfx canister call todo_assistant addTodo '(description: "Write project proposal")' 
   ```

* **Mark as complete:**
   ```bash
   dfx canister call todo_assistant completeTodo '(id: 1)' 
   ```

* **Clear completed:**
   ```bash
   dfx canister call todo_assistant clearCompleted
   ```


## Example

```motoko
// After deployment, use the provided canister ID 
let todoCanister = principal "<your_canister_id>";

// Add a new task
let addResult = await todoCanister.addTodo("Write a blog post");

// Show tasks
let todos = await todoCanister.showTodos();
print(todos);

// Mark task as completed (use the ID returned from addTodo)
await todoCanister.completeTodo(addResult);
```
