class Validator {
  static String? fullNameValidator(String? value) {
    return value!.isEmpty
        ? 'Full name cannot be empty'
        : value.split(' ').length < 2
            ? 'Not a valid Full Name'
            : null;
  }

  static String? dateValidator(String? value) {
    return value!.isEmpty
        ? 'Date cannot be empty'
        : (!RegExp(r'^([0-9]{4})-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-2])$')
                .hasMatch(
            value.trim(),
          ))
            ? 'Enter a valid date'
            : null;
  }

  static String? phoneNumberValidator(String? value) {
    return value!.isEmpty
        ? 'Phone number cannot be empty.'
        : value.trim().length < 10
            ? 'Enter a valid phone number'
            :
            //Smart-Cell check
            !RegExp(r'^96[0-9]{8}|988[0-9]{7}$').hasMatch(
                      value.trim(),
                    ) &&
                    //Ncell check
                    !RegExp(r'^(98[012])|(970)[0-9]{7}$').hasMatch(
                      value.trim(),
                    ) &&
                    //NT- Prepaid check
                    !RegExp(r'^9[78][46][0-9]{7}$').hasMatch(
                      value.trim(),
                    ) &&
                    //NT- PostPaid check
                    !RegExp(r'^985[0-9]{7}$').hasMatch(
                      value.trim(),
                    )
                ? 'Invalid phone number.'
                : null;
  }

  static String? emailValidator(String? value) {
    return value!.isEmpty
        ? 'Email cannot be empty.'
        : (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim()))
            ? 'Invalid Email'
            : null;
  }

  static String? textValidator(String? value) {
    return value!.isEmpty ? "This field can't be empty" : null;
  }
}
