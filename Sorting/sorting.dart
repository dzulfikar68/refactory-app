//=> [dzulfikar68.github.io]
//=> Aplikasi "Print Sorting List" menggunakan "Dart Language"

void main() {
  print("Aplikasi \"Print Sorting List\" menggunakan \"Dart Language\": \n");
  var list = [4, 2, 7, 5, 8, 1, 6];
  if (list.length == 0) {
    print("Tolong masukan list!");
  } else {
    var goal = bubbleSort(list);
    print("\nJumlah swap: $goal.");
  }
  // ini belajar mengguanakan map di dart:
  // var list2 = list.map((e) => 'x: $e').toList();
  // print(list2[0]);
}

// sorting menggunakan BubbleSort
int bubbleSort(List<int> list) {
  // inisialisasi tempat menyimpanan
  int i, j, temp;
  bool swap;
  int goal = 0;
  int numb = 0;
  int sum = list.length;
  // melakukan foreach berjalan sesuai panjang list
  for (i = 0; i < (sum - 1); i++) {
    swap = false;
    // melakukan perulangan untuk mengecek perbandingan angka
    for (j = 0; j < (sum - i - 1); j++) {
      if (list[j] > list[j + 1]) {
        // melakukan swapping
        temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        swap = true;
        // melakukan printing
        var first = list[j + 1];
        var last = list[j];
        var result = printList(list);
        numb = numb + 1;
        goal = goal + 1;
        print("$numb. [$first,$last] -> $result");
      }
    }
    // jika tidak ada swap, tidak melanjutkan foreach
    if (swap == false) {
      break;
    }
  }
  // mengembalikan nilai jumlah swapping
  return goal;
}

// melakukan print list
String printList(List<int> list) {
  var string = list.toString();
  var removeFirstAndLast = string.substring(1, string.length - 1);
  var replaceComma = removeFirstAndLast.replaceAll(RegExp(r','), ' ');
  return replaceComma;
}
