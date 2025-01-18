//Email Validation

String? emailVaildation(String? value) {
  //check whether the input string is empty or not
  if (value == '' || value!.isEmpty) {
    return 'Email field cannot be empty';
  }

  //check whether the email provided is valid or not
  var regexp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!regexp.hasMatch(value)) {
    return 'Enter valid email';
  }

  return null;
}

String? passwordValidation(String? value) {
  // Check whether the input string is empty or not
  if (value == '' || value!.isEmpty) {
    return 'Password field cannot be empty';
  }

  // Define the password validation criteria using a regular expression
  var regexp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

  // Check whether the password meets the criteria
  if (!regexp.hasMatch(value)) {
    return 'Password must be at least 8 characters long, include an\nuppercase letter, a lowercase letter, a number, and a special\ncharacter';
  }

  // If everything is valid, return null
  return null;
}
