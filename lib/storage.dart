import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  //Instance of get storage
  final box = GetStorage();

  storeusers({
    required String userid,
    required String username,
    required String password,
    required String email,
    required String phone,
    required String firstname,
    required String lastname,
    required String birthday,
    required String age,
    required String gender,
    required String height,
    required String weight,
    required String address,
    required String career,
  }) {
    box.write('userid', userid);
    box.write('username', username);
    box.write('password', password);
    box.write('email', email);
    box.write('phone', phone);
    box.write('firstname', firstname);
    box.write('lastname', lastname);
    box.write('birthday', birthday);
    box.write('age', age);
    box.write('gender', gender);
    box.write('height', height);
    box.write('weight', weight);
    box.write('address', address);
    box.write('career', career);

    // imagess.value = box.read('userImage');
  }

  removeUsers() {
    box.remove('userid');
    box.remove('username');
    box.remove('password');
    box.remove('email');
    box.remove('phone');
    box.remove('firstname');
    box.remove('lastname');
    box.remove('birthday');
    box.remove('age');
    box.remove('gender');
    box.remove('height');
    box.remove('weight');
    box.remove('address');
    box.remove('career');

    // imagess = ''.obs;
  }
}
