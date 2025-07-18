class ReorderHelper {
  static Map<K, V> reorderMap<K, V>(
    Map<K, V> mapToReorder, {
    required int oldIndex,
    required int newIndex,
  }) {
    List<MapEntry<K, V>> entries = mapToReorder.entries.toList();
    rorderList(entries, oldIndex: oldIndex, newIndex: newIndex);

    return Map.fromEntries(entries);
  }

  static void rorderList<E>(
    List<E> listToReorder, {
    required int oldIndex,
    required int newIndex,
  }) {
    E tmpOld = listToReorder[oldIndex];
    listToReorder.insert(newIndex, tmpOld);
    if (newIndex < oldIndex) {
      listToReorder.removeAt(oldIndex + 1);
    } else {
      listToReorder.removeAt(oldIndex);
    }
  }
}
