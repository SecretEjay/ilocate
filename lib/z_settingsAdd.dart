import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// A new class to hold the data and controllers for a single member's form.
class AdminFormData {
  final TextEditingController fullnameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController acdvIdController;
  final TextEditingController addressController;
  String? selectedSex;
  DateTime? selectedDate;
  final GlobalKey<FormState> formKey;

  AdminFormData()
      : fullnameController = TextEditingController(),
        usernameController = TextEditingController(),
        emailController = TextEditingController(),
        phoneController = TextEditingController(),
        passwordController = TextEditingController(),
        acdvIdController = TextEditingController(),
        addressController = TextEditingController(),
        formKey = GlobalKey<FormState>();

  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    acdvIdController.dispose();
    addressController.dispose();
  }
}

// Placeholder for the z_Settings page to make the code runnable.
// You should replace this with your actual z_Settings.dart content.
class z_Settings extends StatelessWidget {
  const z_Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('This is the Settings Page'),
      ),
    );
  }
}

class z_settingsAdd extends StatefulWidget {
  const z_settingsAdd({super.key});

  @override
  State<z_settingsAdd> createState() => _z_settingsAddState();
}

class _z_settingsAddState extends State<z_settingsAdd> {
  final Color ilocateRed = const Color(0xFFC70000);

  // A single instance for the admin form.
  final AdminFormData _adminForm = AdminFormData();

  @override
  void dispose() {
    _adminForm.dispose();
    super.dispose();
  }

  /// A function to show the date picker for the form.
  void _showDatePicker(AdminFormData formData) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: formData.selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ilocateRed, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ilocateRed, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != formData.selectedDate) {
      setState(() {
        formData.selectedDate = picked;
      });
    }
  }

  /// Function to handle the "DONE" button press.
  void _onDone() {
    if (_adminForm.formKey.currentState!.validate() &&
        _adminForm.selectedDate != null &&
        _adminForm.selectedSex != null) {
      final Map<String, String> newAdminData = {
        'fullname': _adminForm.fullnameController.text,
        'username': _adminForm.usernameController.text,
        'email': _adminForm.emailController.text,
        'phone': _adminForm.phoneController.text,
        'password': _adminForm.passwordController.text,
        'sex': _adminForm.selectedSex!,
        'acdvId': _adminForm.acdvIdController.text,
        'dateOfBirth': DateFormat('yyyy-MM-dd').format(_adminForm.selectedDate!),
        'address': _adminForm.addressController.text,
      };

      print('New Admin Data: $newAdminData');

      // Navigate back to z_Settings.dart with the new data.
      Navigator.pop(context, newAdminData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all fields.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120.0,
        backgroundColor: ilocateRed,
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
              Text(
                'ADMIN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 30.0),
          // CORRECTED: Use pop() to go back to the previous route.
          onPressed: () => Navigator.pop(context),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildAdminForm(_adminForm),
                  const SizedBox(height: 24.0),
                  // DONE button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onDone,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ilocateRed,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: const Text(
                        'DONE',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to build the single admin form.
  Widget _buildAdminForm(AdminFormData formData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Admin Details:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12.0),
          Form(
            key: formData.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField('Fullname', formData.fullnameController, type: 'fullname'),
                _buildTextField('Username', formData.usernameController, type: 'username'),
                _buildTextField('Email', formData.emailController, type: 'email'),
                _buildTextField('Phone No.', formData.phoneController, type: 'phone'),
                _buildTextField('Password', formData.passwordController, obscureText: true, type: 'password'),
                _buildRadioButtons(formData),
                _buildTextField('Accredited Community Disaster Volunteer (ACDV) ID Number', formData.acdvIdController),
                _buildDatePickerField('Date of Birth', formData.selectedDate, formData),
                _buildAddressField('Address', formData.addressController),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for text fields with validation
  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false, String type = 'text'}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              if (type == 'username') {
                if (value.contains(' ') || value.length < 4) {
                  return 'Username must be at least 4 characters and contain no spaces';
                }
              }
              if (type == 'email') {
                final bool isValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                if (!isValid) {
                  return 'Please enter a valid email format';
                }
              }
              if (type == 'phone') {
                final bool isValid = RegExp(r"^(09|\+639)\d{9}$").hasMatch(value);
                if (!isValid) {
                  return 'Please enter a valid Philippine phone number (e.g., 09xxxxxxxxx)';
                }
              }
              if (type == 'password') {
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                if (!value.contains(RegExp(r'[A-Z]'))) {
                  return 'Password must contain at least one uppercase letter';
                }
                if (!value.contains(RegExp(r'[a-z]'))) {
                  return 'Password must contain at least one lowercase letter';
                }
                if (!value.contains(RegExp(r'[0-9]'))) {
                  return 'Password must contain at least one number';
                }
                if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  return 'Password must contain at least one special character';
                }
              }
              if (type == 'fullname') {
                if (!value.contains(' ') || value.trim().split(' ').length < 2) {
                  return 'Please enter your full name (at least two words)';
                }
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: ilocateRed, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: ilocateRed, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: ilocateRed, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for date picker field
  Widget _buildDatePickerField(String label, DateTime? date, AdminFormData formData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: () => _showDatePicker(formData),
            child: AbsorbPointer(
              child: TextFormField(
                validator: (value) {
                  if (formData.selectedDate == null) {
                    return 'Please select a date';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.red),
                  hintText: date == null ? '' : DateFormat('yyyy-MM-dd').format(date),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: ilocateRed, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: ilocateRed, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: ilocateRed, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for radio buttons
  Widget _buildRadioButtons(AdminFormData formData) {
    return FormField<String>(
      initialValue: formData.selectedSex,
      validator: (value) {
        if (formData.selectedSex == null) {
          return 'Please select a gender';
        }
        return null;
      },
      builder: (FormFieldState<String> state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sex :',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: formData.selectedSex,
                      onChanged: (String? value) {
                        setState(() {
                          formData.selectedSex = value;
                          state.didChange(value);
                        });
                      },
                      activeColor: ilocateRed,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: formData.selectedSex,
                      onChanged: (String? value) {
                        setState(() {
                          formData.selectedSex = value;
                          state.didChange(value);
                        });
                      },
                      activeColor: ilocateRed,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    state.errorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 12.0),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // Helper widget for address text field
  Widget _buildAddressField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: ilocateRed, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: ilocateRed, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: ilocateRed, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
