import 'dart:math';

import 'package:animal_biography/Model/animal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  String TABLE = "animal";
  List<String> animal = [
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Lion','The lion is a large felid of the genus Panthera native mainly to Africa. It has a muscular, deep-chested body, short, rounded head, round ears, and a hairy tuft at the end of its tail. It is sexually dimorphic; adult male lions are larger than females and have a prominent mane.','https://cdn.britannica.com/29/150929-050-547070A1/lion-Kenya-Masai-Mara-National-Reserve.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Dog',' Dog, domestic mammal of the family Canidae (order Carnivora). It is a subspecies of the gray wolf and is related to foxes and jackals.','https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Tiger','The tiger is the largest living cat species and a member of the genus Panthera. It is most recognisable for its dark vertical stripes on orange-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar.','https://i.guim.co.uk/img/media/c0e411f5b4c387cd8b275f0794a3618210c5b216/0_339_5081_3048/master/5081.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=d68639d367a3123d00c5f219b3622178')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Horse','The horse is a domesticated one-toed hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today.','https://media.istockphoto.com/photos/gray-stallion-galloping-picture-id117147973?k=6&m=117147973&s=612x612&w=0&h=sgz47t_1Iy4MCgu3FOOdRSH7v5eYyWEWPUUO3ZGdxBE=')",
    "INSERT INTO animal(type,name,detail,image)VALUES('MAMMALS','Gorilla','Gorillas are ground-dwelling, predominantly herbivorous great apes that inhabit the tropical forests of central Sub-Saharan Africa.','https://static01.nyt.com/images/2020/08/21/arts/21ivan-explainer4/21ivan-explainer4-mediumSquareAt3X-v2.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Parrot','Parrots, also known as psittacines, are birds of the roughly 398 species in 92 genera comprising the order Psittaciformes, found mostly in tropical and subtropical regions.','https://cdn.britannica.com/s:800x450,c:crop/87/196687-138-2D734164/facts-parrots.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Pigeon','Columbidae is a bird family consisting of pigeons and doves. It is the only family in the order Columbiformes.','https://cdn.mos.cms.futurecdn.net/cmUJzPLBEpdoinkrwJVLyk-1200-80.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Sparrow','Males have smart black bibs, bright rufous napes, and stunningly patterned wings with brilliant buffs and browns. Underparts are pale pearly-gray.','https://www.allaboutbirds.org/guide/assets/photo/63742431-480px.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Robin','The American robin is a migratory songbird of the true thrush genus and Turdidae, the wider thrush family.','https://www.allaboutbirds.org/guide/assets/photo/303441381-480px.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('BIRDS','Peacock','Peafowl is a common name for three bird species in the genera Pavo and Afropavo of the family Phasianidae, the pheasants and their allies.','https://petkeen.com/wp-content/uploads/2021/02/peacock.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Gold','The goldfish is a freshwater fish in the family Cyprinidae of order Cypriniformes. It is commonly kept as a pet in indoor aquariums, and is one of the most popular aquarium fish. Goldfish released into the wild have become an invasive pest in parts of North America.','https://images.unsplash.com/photo-1578507065211-1c4e99a5fd24?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z29sZGZpc2h8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Oscar','The oscar is a species of fish from the cichlid family known under a variety of common names, including tiger oscar, velvet cichlid, and marble cichlid. In tropical South America, where the species naturally resides, A. ocellatus specimens are often found for sale as a food fish in the local markets. ','https://i.pinimg.com/originals/98/13/7e/98137e3e2f284329c714b18ed45fe7ba.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Herring','Herring are forage fish, mostly belonging to the family Clupeidae','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGLpj1MSffVXn4ejfIpbdSDeDaGJCdvsK4NBf84ZhuYjJZelEnaPP5eIqlcQjres83P4o&usqp=CAU')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Haddock','The haddock is a saltwater ray-finned fish from the family Gadidae, the true cods. It is the only species in the monotypic genus Melanogrammus.','https://www.petworlds.net/wp-content/uploads/2017/09/haddock-fish-hd-pictures-850x550.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('FISH','Megrim','The megrim, megrim sole, whiff, or Cornish sole is a species of left-eyed flatfish in the family Scophthalmidae. ','https://i.guim.co.uk/img/media/e949e1dbef8165454a8976a7a18476d2f0da081c/0_220_3991_2396/master/3991.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=6aeadd5c57951e0c36fa53877eb53bf6')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Crocodile ','Crocodiles or true crocodiles are large semiaquatic reptiles that live throughout the tropics in Africa, Asia, the Americas and Australia. ','https://www.stockland.com.au/~/media/shopping-centre/common/everyday-ideas/kids/crocodile/0518_stocklandnational_crocodiles_900x6753.ashx')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Lizard ','Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica, as well as most oceanic island chains.','https://images.unsplash.com/photo-1504450874802-0ba2bcd9b5ae?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGl6YXJkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Turtle ','Turtles are reptiles of the order Testudines, also known as Chelonia.','https://imgs.mongabay.com/wp-content/uploads/sites/20/2018/12/21142908/adult_green-turtle2_1200px-cropped-768x460.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Snake ','Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes. Like all other squamates, snakes are ectothermic, amniote vertebrates covered in overlapping scales. ','https://a-z-animals.com/media/2020/01/Snake-Blue-viper.jpg')",
    "INSERT INTO animal(type,name,detail,image)VALUES('REPTILES','Snake ','Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes. Like all other squamates, snakes are ectothermic, amniote vertebrates covered in overlapping scales. ','https://nation.com.pk/print_images/extra-large/2019-02-11/police-use-snake-to-scare-papuan-man-1549905888-5842.jpg')",
  ];
  var database;
  initDB() async {
    if (database == null) {
      database = openDatabase(
        join(await getDatabasesPath(), "animal_1.db"),
        version: 1,
        onCreate: (db, version) {
          String sql =
              "CREATE TABLE IF NOT EXISTS $TABLE(id INTEGER, type TEXT, name TEXT, detail TEXT, image TEXT,PRIMARY KEY('id' AUTOINCREMENT))";
          db.execute(sql);
          insertData();
        },
      );
    }
    return database;
  }

  void insertData() async {
    var db = await initDB();
    animal.forEach((element) async {
      var res = await db.rawInsert(element);
      print(res);
    });
  }

  getAllAnimals({required String type}) async {
    var db = await initDB();
    String sql = "SELECT * FROM $TABLE WHERE type = '$type'";
    List<Map<String, dynamic>> res = await db.rawQuery(sql);
    List<Animal> response =
        res.map((record) => Animal.fromMap(record)).toList();
    response.forEach((element) {
      print(element.name);
    });
    return response;
  }

  getAnimalById({required int id}) async {
    var db = await initDB();
    String sql = "SELECT * FROM $TABLE WHERE id = $id";
    List<Map<String, dynamic>> res = await db.rawQuery(sql);
    List<Animal> response =
        res.map((record) => Animal.fromMap(record)).toList();
    return response;
  }
}

DBHelper dbh = DBHelper._();
