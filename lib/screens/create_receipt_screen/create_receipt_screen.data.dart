part of 'create_receipt_screen.dart';

HashMap<String, dynamic> customerValueList = HashMap<String, dynamic>();
List<double> _thicknessModelList = [];
List<double> _treeClassModelList = [];
List<ReceiptValue> _receiptValueList = [];
List<CustomerValue> customerModelList = [];
var _formKey = GlobalKey<FormState>();
Validators _validator = Validators();

double totalDecimeter = 0;

late ReceiptModel _receiptModel = ReceiptModel(
    companyName: _newCompanyName.toString(),
    createdAt: DateTime.now().toString(),
    receiptValue: _receiptValueList,
    status: "true",
    receiptId: "idnoburaya",
    customerId: "id noyu ne yapacağız");

var _newCompanyName,
    _newThickness,
    _newTreeClass,
    _newWidth,
    _newHeight,
    _newPartyNumber,
    _newDecimeter,
    customerId;

TextFormField widthTextFormField() {
  return TextFormField(
    validator: _validator.requiredValidator,
    onChanged: (value) => _newWidth = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        label: Text(InStrings.EN), border: const OutlineInputBorder()),
  );
}

TextFormField heightTextFormField() {
  return TextFormField(
    validator: _validator.requiredValidator,
    onChanged: (value) => _newHeight = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        label: Text(InStrings.BOY), border: const OutlineInputBorder()),
  );
}

TextFormField partyNumberTextFormField() {
  return TextFormField(
    onChanged: (value) => _newPartyNumber = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        label: Text(InStrings.PARTI_NUMARASI),
        border: const OutlineInputBorder()),
  );
}

BottomNavigationBar buildBottomNavigationBar() {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.equalizer,
        ),
        label: "Toplam Kalem Sayısı :" + _receiptValueList.length.toString(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.equalizer),
        label: "Toplam Dm³ : $totalDecimeter",
      )
    ],
  );
}

double totalDecimeterMath() {
  var result;
  for (var item in _receiptValueList) {
    result = item.width! * item.height! * item.thickness!;
    totalDecimeter = totalDecimeter + result;
  }

  return totalDecimeter;
}

AppBar buildAppbar() {
  return AppBar(
    backgroundColor: Colors.brown,
    title: const Text("Fiş Oluşturma"),
    centerTitle: false,
    actions: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: ElevatedButton(
            style: InStyle.cancelRedElevatedButtonStyle,
            onPressed: () {
              Toastr.buildNotifyToast("Kaydetmek İçin Basılı Tutun");
            },
            onLongPress: () {
              // putReceitp();
              postReceitp();
              Toastr.buildSuccessToast("Uzun basıldı");
            },
            child: Text(InStrings.KAYDET_VE_YAZDIR)),
      )
    ],
  );
}

Future putReceitp() async {
  ReceiptService service = ReceiptService();
  var response = await service.addPut(_receiptModel);
  if (response.statusCode == 200) {
    Toastr.buildSuccessToast("İşlem başarılı");
  } else {
    Toastr.buildErrorToast("Bir sorun oluştu" + response.statusCode.toString());
  }
}

Future postReceitp() async {
  ReceiptService service = ReceiptService();
  var response = await service.addPost(_receiptModel);
  if (response.statusCode == 200) {
    Toastr.buildSuccessToast("İşlem başarılı");
    var jsonModel = jsonDecode(response.body);
  } else {
    Toastr.buildErrorToast("Bir sorun oluştu" + response.statusCode.toString());
  }
}
