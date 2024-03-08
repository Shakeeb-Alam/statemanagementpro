class Validation{
  validationEmail(String value  ){

      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      } else if (!RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
          .hasMatch(value)) {
        return 'Please enter a valid email';
      }
      return null;

  }
  validationPassword
     (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      } else if (value.length < 6) {
        return 'Password must be at least 6 characters long';
      }
      return null;
    }
  }
