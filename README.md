# 0x01. Flutter - Flutter Intro
## Details
Novice By: Youssef Belhadj Weight: 1Project over - took place fromMar 22, 2023 12:00 AMto Mar 25, 2023 12:00 AMManual QA review was done by onApr 1, 2023 3:15 AM#### In a nutshell…
* Manual QA review:          0.0/19 mandatory      
* Altogether:         0.0%* Mandatory: 0.0%
* Optional: no optional tasks

* [Rick and Morty API](https://intranet.hbtn.io/rltoken/3JC-FnRel9hFVzEFHiNAuQ) 

* [List View Flutter](https://intranet.hbtn.io/rltoken/5PU_tKg7LU1AuK_ch4QJLA) 

* [Grid View Flutter](https://intranet.hbtn.io/rltoken/axkCPqgfOWGleja6e6tiCg) 

* [Future Builder](https://intranet.hbtn.io/rltoken/voTFRX2zsBlAcyR9FGRkEw) 

## Setup Flutter
[Install Flutter](https://intranet.hbtn.io/rltoken/fRg3_57nW2Q4bthqxJVmnQ) 

[How to Install Flutter on Windows](https://intranet.hbtn.io/rltoken/338lXGJdtmI4xAidmkoByA) 

[How to Install Flutter on macOS](https://intranet.hbtn.io/rltoken/nyy_5fw3FYHkfavvuiTv1A) 

[Setup Flutter in Visual Studio Code](https://intranet.hbtn.io/rltoken/_tDILBGQmsOK4VSpG_Sxlg) 

## Tasks
### 0. My First Flutter Project
          mandatory         Progress vs Score           Score: 0.00% (Checks completed: 0.00%)         Task Body Create a flutter project inside the task directory
Inside   ` lib/main.dart `   paste the following code:
```bash
import 'package:flutter/material.dart';
import 'package:rick_and_morty/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

```
Create a new file   ` lib/models.dart `  . Inside the file create a new class   ` Character `   with these attributes:
* “name” : String
* “img” : String
* “id” : int
Create a new class constructor that accepts one argument   ` json `   that initialises the class attributes with their corresponding values :
* “name” : json[“name”]
* “img” : json[“image”]
* “id” : json[“id”]

* Constructor prototype :   ` Character.fromJson(Map<String, dynamic> json) ` 

Create a new file   ` lib/home_screen.dart `   :Inside   ` lib/home_screen.dart `   create a new StatelessWidget   ` HomeScreen `  .
Inside   ` HomeScreen `  :Create a function   ` fetchBbCharacters() `   that returns a list of all Rick and Morty Characters.
Override the   ` build() `   function:Function prototype:   ` Widget build(BuildContext context) ` 
Returns:   ` Scaffold() `  Inside the scaffold add an appBar with text “Rick and Morty”
Set scaffold body to   ` FutureBuilder() `   where the future argument is the data returned by   ` fetchBbCharacters() `   and the builder argument is a function that accepts two arguments context and snapshot and returns:
* If snapshot contains data :  ` GridView.builder() ` 
* If snapshot returns an error : center widget with text “Error”
* If snapshot is still loading : center widget with  ` circularProgressIndicator() ` 
Create a new file   ` lib/character_tile.dart `  :- Inside   ` lib/character_tile.dart `   create a new StatelessWidget   ` CharacterTile `  :
Inside   ` CharacterTile `  :Add class attribute :
* “character” : “Character()”
Override the   ` build() `   function:Function prototype:   ` Widget build(BuildContext context) `  Returns   ` GridTile() `  Edit the   ` GridView.builder() `   and the   ` GridTile() `   widgets to look as follows:
 ![](https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/5d2d62bf3d4cb1d248785fa23f6d5e0643c04006.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20230508%2Feu-west-3%2Fs3%2Faws4_request&X-Amz-Date=20230508T010306Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=0eb5cb0fb80d41afd8c1436ae5f923b91df9fda27884cd73513ddcf3ebaf6140) 

 Task URLs  Github information Repo:
* GitHub repository:  ` holbertonschool-flutter_intro ` 
* Directory:  ` Rick_and_Morty ` 
 Self-paced manual review  Panel footer - Controls 
### 1. Episodes Screen
          mandatory         Progress vs Score           Score: 0.00% (Checks completed: 0.00%)         Task Body Complete what you have built in the last task inside it:
Create a new file   ` lib/episodes_screen.dart `  :
* Inside  ` lib/episodes_screen.dart `  create a new StatelessWidget  ` EpisodesScreen `  with this attribute:
“id” : int
* Inside  ` EpisodesScreen ` :
Create a new function   ` fetchEpisodes(id) `   that returns the episodes for the character corresponding to that id
* Override the  ` build() `  function :
Function prototype:   ` Widget build(BuildContext context) ` 
Returns   ` Scaffold() ` 
Set scaffold body to   ` FutureBuilder() `   where the future argument is the data returned by   ` fetchEpisodes(id) `   and the builder argument is a function that accepts two arguments context and snapshot and returns:
* If snapshot contains data :  ` ListView.Builder() ` 
* If snapshot returns an error : center widget with text “Error”
* If snapshot is still loading : center widget with  ` circularProgressIndicator() ` 
Set the   ` itemBuilder `   function inside   ` ListView() `   to return a   ` ListTile() `   with the title being the episodes corresponding to that index
* Inside  ` CharacterTile ` :
Wrap the image with a   ` GestureDetector() `   and set it to navigate to   ` EpisodesScreen(id) `   while passing the selected character’s id when taped
Now when clicking on a character’s tile it will navigate to this screen:
 ![](https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/118c19d808263756804566c23ceefacf6a16e3bd.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20230508%2Feu-west-3%2Fs3%2Faws4_request&X-Amz-Date=20230508T010306Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=df9300ca19c85fdf1f40101b8e421fd9977d8a954c16709e5f82768c29acc6ac) 

 Task URLs  Github information Repo:
* GitHub repository:  ` holbertonschool-flutter_intro ` 
* Directory:  ` Rick_and_Morty ` 
 Self-paced manual review  Panel footer - Controls 
Ready for a new manual review