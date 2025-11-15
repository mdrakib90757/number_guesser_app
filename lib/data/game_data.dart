
class GameData {
  // every code binary man(1, 2, 4, 8, 16, 32, 64)
  static const List<int> cardValues = [1, 2, 4, 8, 16, 32, 64];

  // 7 list of numbers function
  static List<List<int>> generateNumberLists() {
    List<List<int>> allLists = [];

    for (int value in cardValues) {
      List<int> currentList = [];
      for (int i = 1; i <= 100; i++) {
        // check if i is a multiple of value
        if ((i & value) != 0) {
          currentList.add(i);
        }
      }
      allLists.add(currentList);
    }
    return allLists;
  }
}