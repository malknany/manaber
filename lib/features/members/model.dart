class Model{
  String ? title ;
  String? subtitle;
  String? image;

  Model(this.title,this.subtitle , this.image , );
}

List<Model> main_list = [
  Model("kinani",
      "software engineer",
      ('assets/images/ux.png')),
  Model("ebrahim", "software engineer",
      ('assets/images/ux.png')),
  Model("hossam", "php developer",
      ('assets/images/ux.png')),
  Model("yousef", "security",
      ('assets/images/ux.png')),
  Model(
      "da7om", "clinical", ('assets/images/ux.png'))
];