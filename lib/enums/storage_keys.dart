enum StorageKeys {
  token,
}
extension StorageKeysextension  on StorageKeys{
  String get stringValue {
    if (this == StorageKeys.token){
      return 'token';
    }
    return '';

  }
}