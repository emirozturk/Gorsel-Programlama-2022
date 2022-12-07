/*
void main() {
  var sesliler = ['a', 'e', 'ı', 'i', 'o', 'ö', 'u', 'ü'];
  var cumle = "Ayağını yorganına göre uzat";
  var sayac = 0;
  //Cümlenin her karakteri için
  cumle = cumle.toLowerCase();
  for (int i = 0; i < cumle.length; i++) {
    //Eğer sıradaki karakter sesliyse
    if (sesliler.contains(cumle[i])) {
      sayac++; //bir sayaç arttır
    }
  }
  print("Sesli harf sayısı:" + sayac.toString()); //Ekrana sayacı yazdır.
}
void main() {
  var string1 = "abcde";
  var string2 = "ecdab";
  for (int i = 0; i < string1.length; i++) {
    var siradaki = string1[i];
    string2 = string2.replaceFirst(siradaki, "");
    print("Sıradaki karakter ${siradaki} ve string2'nin son hali ${string2}");
  }
  if (string2.length == 0) {
    print("Anagramdır.");
  } else {
    print("Anagram Değildir.");
  }
}
void main() {
  var string1 = "zabcdet";
  var string2 = "ectdabz";
  var liste1 = []; //string1.split("");
  var liste2 = [];
  for (int i = 0; i < string1.length; i++) {
    liste1.add(string1[i]);
  }
  for (int i = 0; i < string2.length; i++) {
    liste2.add(string2[i]);
  }
  liste1.sort();
  liste2.sort();
  var anagramMi = true;
  if (liste1.length != liste2.length) {
    print("Değil");
  } else {
    for (int i = 0; i < liste1.length; i++) {
      if (liste1[i] != liste2[i]) {
        print("Değil");
        anagramMi = false;
        break;
      }
    }
    if (anagramMi) {
      print("Anagram");
    }
  }
}
void main() {
  var string1 = "zabcdetaa";
  var string2 = "ectdabzaa";
  var map1 = Map<String, int>();
  var map2 = Map<String, int>();
  var anagramMi = true;
  if (string1.length != string2.length) {
    print("Değil");
  } else {
    for (int i = 0; i < string1.length; i++) {
      if (map1.containsKey(string1[i])) {
        map1[string1[i]] = map1[string1[i]]! + 1;
      } else {
        map1[string1[i]] = 1;
      }
      if (map2.containsKey(string2[i])) {
        map2[string2[i]] = map2[string2[i]]! + 1;
      } else {
        map2[string2[i]] = 1;
      }
    }
    for (var key in map1.keys) {
      if (map1[key] != map2[key]) {
        print("Değil");
        anagramMi = false;
      }
    }
    if (anagramMi) {
      print("Anagram");
    }
  }
}
*/
bool tekHarfMi(var cumle, var harf) {
  var sayac = 0;
  for (int i = 0; i < cumle.length; i++) {
    if (cumle[i] == harf) {
      sayac++;
    }
  }
  return sayac==1;
}

void main() {
  var cumle = "Kartal kalkar dal sarkar".toLowerCase();
  for (int i = 0; i < cumle.length; i++) {
    if (tekHarfMi(cumle, cumle[i])) {
      print("Tekrar etmeyen ilk karakter ${cumle[i]}");
      break;
    }
  }
}
