import 'package:flutter/material.dart';

Widget commentChild(data) {
  return ListView(
    children: [
      for (var i = 0; i < data.length; i++)
        Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () async {
                // Display the image in large form.
                print("Comment Clicked");
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
              ),
            ),
            title: Text(
              data[i]['name'],
              style: TextStyle(fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 30
              ),
            ),
            subtitle: Text(data[i]['message'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            ),
          ),
        )
    ],
  );
}
