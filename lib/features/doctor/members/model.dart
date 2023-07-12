import '../../../shared/styles/images.dart';

class Model {
  String? title;
  String? image;

  Model(
    this.title,
    this.image,
  );
}

List<Model> mainList = [
  Model("kinani", (AppImages.user)),
  Model("ebrahim", (AppImages.user)),
  Model("hossam", ( AppImages.user)),
  Model("yousef", ( AppImages.user)),
  Model("da7om", ( AppImages.user)),
  Model("محمد الكناني", ( AppImages.user)),
];
