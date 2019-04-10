import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'An Example of Navigator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _todoItemList = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            size: 24,
          ),
          onPressed: () {},
        ),
        title: Text('Todo List Example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 24,
            ),
            onPressed: _addNewTodoItem,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: index.isOdd ? Colors.grey[100] : Colors.white,
              ),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 30,
                    maxHeight: 30,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  _todoItemList[index].title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  _todoItemList[index].description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                onTap: () async {
                  _modifyTodoItem(index);
                },
              ),
            );
          },
          itemCount: _todoItemList.length,
        ),
      ),
    );
  }

  void _addNewTodoItem() async {
    var todoItem = await Navigator.push(
      context,
      MaterialPageRoute<Todo>(
        builder: (BuildContext context) {
          return TodoItemPage();
        },
      ),
    );
    if (todoItem != null) {
      setState(() {
        _todoItemList.add(todoItem);
      });
    }
  }

  void _modifyTodoItem(int index) async {
    var todoItem = await Navigator.push(
      context,
      MaterialPageRoute<Todo>(
        builder: (BuildContext context) =>
            TodoItemPage(item: _todoItemList[index]),
      ),
    );
    if (todoItem != null) {
      setState(() {
        _todoItemList[index] = todoItem;
      });
    }
  }
}

class TodoItemPage extends StatefulWidget {
  final Todo item;

  TodoItemPage({Key key, this.item}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItemPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final myTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      titleController.text = widget.item.title;
      descController.text = widget.item.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.item == null ? 'Add new Todo item' : 'Modify Todo item'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title',
              style: myTextStyle,
            ),
            TextField(
              controller: titleController,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Content',
              style: myTextStyle,
            ),
            TextField(
              controller: descController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('Clear'),
                  onPressed: () {
                    print('Reseting TextFields...');
                    titleController.text = '';
                    descController.text = '';
                  },
                ),
                RaisedButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    var todoItem = Todo(
                      title: titleController.text,
                      description: descController.text,
                    );
                    Navigator.pop(context, todoItem);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo({this.title, this.description});

  @override
  String toString() {
    return 'Todo {title: $title, description: $description}';
  }
}
