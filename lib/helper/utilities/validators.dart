import 'package:form_field_validator/form_field_validator.dart';
import 'package:order_printer_management/helper/in_strings.dart';

class Validators {
  int minLength = 0;
  Validators();
  Validators.minLengt(this.minLength);

  EmailValidator emailValidator =
      EmailValidator(errorText: InStrings.E_POSTA_ADRESINIZ_HATALI);

  RequiredValidator requiredValidator =
      RequiredValidator(errorText: InStrings.ZORUNLU_ALAN);

  // MinLengthValidator minLengthValidator =
  //     MinLengthValidator(minLength, errorText: "errorText");
}
