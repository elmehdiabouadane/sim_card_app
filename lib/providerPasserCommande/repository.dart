

import 'dart:convert';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastRepo {

  Future saveData() async{
    // File path to a file in the current directory
    String dbPath = 'commande.db';
    DatabaseFactory dbFactory = databaseFactoryIo;

    // We use the database factory to open the database
    Database db = await dbFactory.openDatabase(dbPath);
    var store = StoreRef.main();
    // simple Values
    var key = await store.add(db, {'name': 'ugly'});
    var record = await store.record(key).getSnapshot(db);
    record =
        (await store.find(db, finder: Finder(filter: Filter.byKey(record.key))))
            .first;
    print(record);
    var records = (await store.find(db,
        finder: Finder(filter: Filter.matches('name', '^ugly'))));
    print(records);

    //Object

    var storeMap = intMapStoreFactory.store();
    var keyMap = await storeMap.add(db, {'path': {'sub': 'my_value', 'Test1':'Test'},});

    var recordMap = await storeMap.record(keyMap).getSnapshot(db);
    var valueMap = recordMap['path.sub'];
    print(valueMap);
  }
  }
