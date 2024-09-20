import 'package:get_storage/get_storage.dart';

class StorageHelper{

  StorageHelper._();
  static StorageHelper? storageHelper;

  static StorageHelper get instance{
    if(storageHelper==null)
      storageHelper=StorageHelper._();
    return storageHelper!;// ensure it is impossible be a null
  }

  GetStorage box =GetStorage();
  writeKey(String key,dynamic value){
    box.write(key, value);
  }

  readKey(String key){
    return box.read(key);
  }

  removeKey(String key){
    box.remove(key);
  }

  eraseStorage(){
    box.erase();
  }

}