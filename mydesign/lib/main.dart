import 'package:flutter/material.dart';

void main() {
  runApp(GradesPageApp());
}

class GradesPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GradesPage(),
    );
  }
}

class GradesPage extends StatefulWidget {
  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  List<Map<String, String>> grades = [
    {'grade': 'PP2', 'createdBy': 'LearnSoft Support'},
    {'grade': 'PP1', 'createdBy': 'Gumato Roba'},
  ];

  List<bool> gradeVisibility = [true, true]; // To keep track of visibility of each grade

  void _addGrade(String grade, String createdBy) {
    setState(() {
      grades.add({'grade': grade, 'createdBy': createdBy});
      gradeVisibility.add(true); // Set default visibility to true for the new grade
    });
  }

  void _showAddGradeDialog() {
    final TextEditingController gradeController = TextEditingController();
    final TextEditingController createdByController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Grade'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: gradeController,
                decoration: InputDecoration(labelText: 'Grade'),
              ),
              TextField(
                controller: createdByController,
                decoration: InputDecoration(labelText: 'Created By'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addGrade(gradeController.text, createdByController.text);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _createAction() {
    // Implement your create action here
    print("Create action");
  }

  void _exportAction() {
    // Implement your export action here
    print("Export action");
  }

  void _printAction() {
    // Implement your print action here
    print("Print action");
  }

  void _resetAction() {
    // Implement your reset action here
    print("Reset action");
  }

  void _reloadAction() {
    // Implement your reload action here
    print("Reload action");
  }

  void _viewGrade(int index) {
    // Toggle visibility of the grade
    setState(() {
      gradeVisibility[index] = !gradeVisibility[index];
    });
  }

  void _editGrade(int index, String newGrade, String newCreatedBy) {
    // Implement edit grade action here
    setState(() {
      grades[index] = {'grade': newGrade, 'createdBy': newCreatedBy};
    });
  }

  void _deleteGrade(int index) {
    // Implement delete grade action here
    setState(() {
      grades.removeAt(index);
      gradeVisibility.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grades Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCard('Enrolment', Colors.black),
                _buildCard('Grade Roster', Colors.black),
                _buildCard('Student Profile', Colors.black),
                _buildCard('Streams', Colors.black),
                _buildCard('Grades', Colors.orange),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionRowFromRightToLeft(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _showAddGradeDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        'Add New',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Search: '),
                        Container(
                          width: 200,
                          height: 38,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildTableHeader(),
                  ...grades.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, String> grade = entry.value;
                    return _buildTableRow(grade['grade']!, grade['createdBy']!, index);
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(8),
      width: 90, // Increased width by 2cm (20 pixels)
      height: 42,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20), // 2 cm border radius
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildActionRowFromRightToLeft() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionColumn(),
      ],
    );
  }

  Widget _buildActionColumn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildActionRow('Create', Icons.add, _createAction),
        _buildActionRow('Export', Icons.file_download, _exportAction),
        _buildActionRow('Print', Icons.print, _printAction),
        _buildActionRow('Reset', Icons.refresh, _resetAction),
        _buildActionRow('Reload', Icons.replay, _reloadAction),
      ],
    );
  }

  Widget _buildActionRow(String label, IconData icon, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
          ),
          SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: _buildSortableColumnHeader('Grade')),
          Expanded(child: _buildSortableColumnHeader('Created By')),
          Expanded(child: Center(child: Text('Actions'))),
        ],
      ),
    );
  }

  Widget _buildSortableColumnHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        Column(
          children: [
            Icon(Icons.arrow_upward, size: 16),
            Icon(Icons.arrow_downward, size: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildTableRow(String grade, String createdBy, int index) {
    return Visibility(
      visible: gradeVisibility[index],
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            Expanded(child: Center(child: Text(grade))),
            Expanded(child: Center(child: Text(createdBy))),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        _viewGrade(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditGradeDialog(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteGrade(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditGradeDialog(int index) {
    final TextEditingController gradeController = TextEditingController(text: grades[index]['grade']);
    final TextEditingController createdByController = TextEditingController(text: grades[index]['createdBy']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Grade'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: gradeController,
                decoration: InputDecoration(labelText: 'Grade'),
              ),
              TextField(
                controller: createdByController,
                decoration: InputDecoration(labelText: 'Created By'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _editGrade(index, gradeController.text, createdByController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
