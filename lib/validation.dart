//Clearly this will be imported into signin/signup page as well

class Validations {

  String validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) return 'Email is required';
    final RegExp emailExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!emailExp.hasMatch(value))
      return 'the email is invalid';
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return 'Password required';
    return null;
  }

  String validateUsername(String value) {
    if (value.isEmpty) return 'Username required';
    return null;
  }

}