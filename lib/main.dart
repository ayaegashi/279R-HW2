// The main.dart file is run when the program starts

// Import material dart as a package
import 'package:flutter/material.dart';

// Define a Todo element
class Todo {
  // Define what a Todo element looks like and which fields are required (both)
  Todo({required this.name, required this.checked});
  // final variables are initialized at runtime and can only be assigned a value once
  final String name;
  bool checked;
}

// The StatelessWidget class is a widget that doesn't require a mutable state
// The TodoItem defines the representation for a single todo item in the list
class TodoItem extends StatelessWidget {
  TodoItem({
    // These elements are passed to it from _TodoListState
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  // This recieves a boolean to see if the item is checked off or not
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      // If the boolean is True then the text will be displayed with a line through it
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  // Widget that when clicked will invoke onTodoChaged
  // Displayed as a circle with the first letter of the todo item
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}

// A new instance of TodoList is created at the start of the program (see TodoApp class)
// A StatefulWidget is useful for dynamic components, and is defined by extending two classes, StatefulWidget and State
// The TodoList class will be the actual todo list and will control the state of all the individual todo items in it
class TodoList extends StatefulWidget {
  @override
  // Calls _TodoListState
  _TodoListState createState() => new _TodoListState();
}

// This class works with the TodoList class and handles the app's changing states
// A subclass of State, it defines the build() method
// Contains the list and the app's logic
class _TodoListState extends State<TodoList> {
  // Whenver the user edits a field controlled by TextEditingController, the controller updates the value of the text field and notifies listeners
  final TextEditingController _textFieldController = TextEditingController();
  // Creates a list of Todo instances
  final List<Todo> _todos = <Todo>[];

  @override
  // Defining the build function, whose job is to describe the widget in terms of other, lower-level widgets
  Widget build(BuildContext context) {
    // Another container that wraps and gives access to a number of other widgets
    // Scaffold will expand to take up the entire screen
    return new Scaffold(
      // Creates a bar at the top of the screen (blue by default)
      appBar: new AppBar(
        // Adds a title to the bar at the top of the screen
        title: new Text('Todo list'),
      ),
      // Creates the todo list
      body: ListView(
        // Styles the todo list
        padding: EdgeInsets.symmetric(vertical: 8.0),
        // Todo items are children of the list
        // Map all the todos in the state and return a TodoItem for each
        // Each child is an instance of the TodoItem class, defined above
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            // Function for allowing the user to check and uncheck the todo items
            onTodoChanged: _handleTodoChange,
          );
        }).toList(),
      ),
      // Define the add button at the bottom of the screen to allow users to create a todo item
      floatingActionButton: FloatingActionButton(
          // Creates a popup
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  // When a user clicks on a todo item it will go from checked to unchecked, and vice versa
  void _handleTodoChange(Todo todo) {
    // When setState is called, the build method is also called
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  // Defines behavior for when a user clicks the "add" button
  void _addTodoItem(String name) {
    setState(() {
      // Adds the user's input as a Todo to _todos, a list iterated through in _TodoListState's build method
      _todos.add(Todo(name: name, checked: false));
    });
    // Clears the text input field
    _textFieldController.clear();
  }

  // displayDialog function is invoked when the floatingActionButton (add button) is clicked
  // The Future class contains the result of an asynchronous task
  // In this case, the Future is a text string after the user has typed it
  Future<void> _displayDialog() async {
    // Return a dialog
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          // Render a TextField widget
          content: TextField(
            // uses the _textFieldController defined above
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              // When the add button is clicked, the dialog will close and _addTodoItem is invoked
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}

// TodoApp is the class for the whole application
// A stateless widget is useful for composing elements of the UI that do not change
// For TodoApp, the title of the page is constant
// TodoApp is the skeleton encompassing the rest of the app
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // A MaterialApp is a pre-defined flutter class, and is the main component of the app
    // By using MaterialApp, the app can access a number of other widgets and properties
    return new MaterialApp(
      title: 'Todo list',
      // MaterialApp first tries to through the app through the home property
      // On build, the app will create a new instance of the TodoList class
      home: new TodoList(),
    );
  }
}

// This main function is invoked when the program starts
void main() => runApp(new TodoApp());
