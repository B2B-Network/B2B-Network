import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController userNameController =
      TextEditingController(text: 'JohnDoe');
  TextEditingController firstNameController =
      TextEditingController(text: 'John');
  TextEditingController lastNameController = TextEditingController(text: 'Doe');
  TextEditingController emailController =
      TextEditingController(text: 'john.doe@example.com');
  TextEditingController countryController = TextEditingController(text: 'USA');
  TextEditingController stateController =
      TextEditingController(text: 'California');
  TextEditingController cityController =
      TextEditingController(text: 'San Francisco');
  TextEditingController mobileNumberController =
      TextEditingController(text: '+1 123-456-7890');
  TextEditingController dobController =
      TextEditingController(text: '1990-01-01');
  TextEditingController categoryController = TextEditingController();
  TextEditingController bioController =
      TextEditingController(text: 'Passionate about coding');
  TextEditingController servicesController =
      TextEditingController(text: 'Software Development');
  TextEditingController businessNameController =
      TextEditingController(text: 'JohnDoe Tech');

  List<String> categories = [
    'Retail',
    'Hospitality',
    'Technology',
    'Healthcare',
    'Finance',
    'Real Estate',
    'Manufacturing',
    'Agriculture',
    'Transportation',
    'Education',
    'Entertainment',
    'Consulting',
    'Marketing',
    'Food and Beverage',
    'Construction',
    'Energy',
    'Automotive',
    'Fashion',
    'Environmental Services',
    'Legal Services',
    'Others',
  ];
  String selectedCategory = 'Retail';
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0245A3),
          title: Text("Edit Profile"),
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'User Name',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // First Name
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'First Name',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Last Name
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Last Name',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Email
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Country
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: countryController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // State
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'State',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: stateController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // City
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'City',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Mobile Number
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Mobile Number',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: mobileNumberController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Date of Birth
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          hintText: 'Select Date',
                          errorText: dobController.text.isEmpty
                              ? 'Please select a date'
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              selectedDate != null
                                  ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                                  : 'Select Date',
                            ),
                            Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Category
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: DropdownButtonFormField(
                      value: selectedCategory,
                      items: categories.map((String category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedCategory = value ?? 'Retail';
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Bio
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Bio',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: bioController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Services
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Services',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: servicesController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Business Name
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      'Business Name',
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    child: TextFormField(
                      controller: businessNameController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Done Button
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0245A3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Access the values with controllers.text
                        print("User Name: ${userNameController.text}");
                        print("First Name: ${firstNameController.text}");
                        print("Last Name: ${lastNameController.text}");

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdatePage()),
                        );
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontFamily: 'Mplus1p',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(UpdatePage());
}
