import UIKit

var str = "Hello, playground"
//let trie = Trie<String>()
//  trie.insert("cute")
////  if trie.contains("cute") {
////    print("cute is in the trie")
////  }
//trie.insert("cut")
//
//print("\n*** Before removing ***")
//  assert(trie.contains("cut"))
//  print("\"cut\" is in the trie")
//  assert(trie.contains("cute"))
//  print("\"cute\" is in the trie")
//
//  print("\n*** After removing cut ***")
//  trie.remove("cut")
//  assert(!trie.contains("cut"))
//  assert(trie.contains("cute"))
//  print("\"cute\" is still in the trie")

//  trie.insert("car")
//  trie.insert("card")
//  trie.insert("care")
//  trie.insert("cared")
//  trie.insert("cars")
//  trie.insert("carbs")
//  trie.insert("carapace")
//  trie.insert("cargo")
//
//  print("\nCollections starting with \"car\"")
//  let prefixedWithCar = trie.collections(startingWith: "car")
//  print(prefixedWithCar)
//
//  print("\nCollections starting with \"care\"")
//  let prefixedWithCare = trie.collections(startingWith: "care")
//  print(prefixedWithCare)

//prefix matching example:
  let trie = Trie<String>()
  trie.insert("car")
  trie.insert("card")
  trie.insert("care")
  trie.insert("cared")
  trie.insert("cars")
  trie.insert("carbs")
  trie.insert("carapace")
  trie.insert("cargo")

  print("\nCollections starting with \"car\"")
  let prefixedWithCar = trie.collections(startingWith: "car")
  print(prefixedWithCar)

  print("\nCollections starting with \"care\"")
  let prefixedWithCare = trie.collections(startingWith: "care")
  print(prefixedWithCare)
