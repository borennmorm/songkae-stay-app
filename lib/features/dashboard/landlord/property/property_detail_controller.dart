import 'package:get/get.dart';

class PropertyDetailController extends GetxController {
  var images = <String>[].obs;

  // Function to add a new image
  void addImage() {
    if (images.length < 5) {
      images.add('assets/images/image_1.jpg');
    }
  }

  // Function to remove an image
  void removeImage(int index) {
    images.removeAt(index);
  }
}
