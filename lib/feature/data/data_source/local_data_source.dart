import 'package:delivery/core/app_business_logic/cach_item_model.dart';
import 'package:delivery/core/data/network/error_handler.dart';
import 'package:injectable/injectable.dart';

const cachKey = "cachKey";
const cachInterval = 0 * 1000; // 1 minute cache in millis

abstract class FavoriteItemsLocalDataSource {
  Future<String> getItems();
  Future<void> saveCartToCache(String items);
  void clearCache();

  void removeFromCache(String key);
}

@Singleton(as: FavoriteItemsLocalDataSource)
class FavoriteLocalDataSourceImpl implements FavoriteItemsLocalDataSource {
  Map<String, CachedItem> cacheMap = {};

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<void> saveCartToCache(String items) async {
    cacheMap[cachKey] = CachedItem(items);
  }

  @override
  Future<String> getItems() async {
    CachedItem? cachedItem = cacheMap[cachKey];
    if (cachedItem != null && cachedItem.isValid(cachInterval)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }
}
