# Flutter to-do app

Based off of https://daily-dev-tips.com/posts/build-a-todo-list-app-with-flutter/, the code of which is in https://github.com/rebelchris/flutter/tree/todolist

## How to Run

[] Make sure you have Flutter installed properly. See https://docs.flutter.dev/get-started/install for how to install the Flutter SDK.

[] Clone this repository to your machine or download a zip file of the code. 

[] Open your terminal and change directories into flutter-todolist (the main directory for this project). In your terminal, run "flutter run".

## Reflection

**What are the significant software concepts that this combination of technologies has that each previous set of technologies did not? Or that they handle significantly differently?**

Similarly to the HTML, CSS, and Javascript todo app I implemented two weeks ago, this app is not connected to any backend and so every time the user refreshes their page, their todo items are erased. However, I imagine that it would not be too difficult to connect a backend such as MongoDB.

One aspect of Flutter that feels very novel compared to the other combinations of technologies we have tried is that Flutter comes with a number of preset classes and properties. In this todo app, almost every class extends from a StatelessWidget, StatefulWidget, or some other class. Beyond this, there were also a number of premade concepts such as the TextEditingController that are used in this implementation. For an experienced Flutter programmer, I think this would be very handy as every time they create a new class they don't have to start from scratch (as in Javascript, for example), but can rely on a suite of basic functionalities. However, for beginning users or no-experts reading someone else's Flutter code, I found that Flutter's heavy reliance on its own vocabulary made it difficult to parse exactly what was going on.

Lastly, while programming in Flutter, I found it very convenient how the web app refreshes automatically with every save. I think this makes the development process very smooth. However, I can imagine it might be less useful with a much larger app if each refresh took significantly longer.

## Sources

https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html

https://www.geeksforgeeks.org/materialapp-class-in-flutter/

https://docs.flutter.dev/development/ui/interactive#:~:text=A%20stateful%20widget%20is%20dynamic,are%20examples%20of%20stateful%20widgets.

