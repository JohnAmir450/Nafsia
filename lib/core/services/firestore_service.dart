// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:nafsia/core/errors/custom_exceptions.dart';
// import 'package:nafsia/core/services/database_service.dart';


// class FireStoreService implements DatabaseService {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   @override
//   Future<void> addData(
//       {required String path,
//       String? uId,
//       required Map<String, dynamic> data}) async {
//     if (uId != null) {
//       await firestore.collection(path).doc(uId).set(data);
//     } else {
//       await firestore.collection(path).add(data);
//     }
//   }

//   @override
// Future<dynamic> getData({
//   required String path,
//   String? documentId,
//   Map<String, dynamic>? query,
//   String? filterValueEqualTo,
//   String? filterValue, // Add this optional parameter for user-specific queries
// }) async {
//   try {
//     // If documentId is provided, fetch the document by its ID
//     if (documentId != null) {
//       var data = await firestore.collection(path).doc(documentId).get();
//       return data.data();
//     } else {
//       // Query the collection
//       Query<Map<String, dynamic>> data = firestore.collection(path);

//       // If userId is provided, filter the query by userId (only for orders)
//       if (filterValueEqualTo != null &&filterValue != null) {
//         data = data.where(filterValue, isEqualTo: filterValueEqualTo);
//       }

//       // Apply additional query filters if provided
//       if (query != null) {
//         if (query['orderBy'] != null) {
//           var orderByField = query['orderBy'];
//           var descending = query['descending']??false;
//            log('Ordering by $orderByField, descending: $descending');
//           data = data.orderBy(orderByField, descending: descending);
//         }
//         if (query['limit'] != null) {
//           var limit = query['limit'];
//           data = data.limit(limit);
//         }
//         if (query['where'] != null && query['isEqualTo'] != null) {
//           data = data.where(query['where'], isEqualTo: query['isEqualTo']);
//         }
      
//       }

//       // Fetch the data from Firestore
//       var result = await data.get();

//       // Return the fetched data
//       return result.docs.map((e) => e.data()).toList();
//     }
//   } catch (e) {
//     throw ServerException(message: 'Failed to fetch data: ${e.toString()}');
//   }
// }

//    @override
//    Stream<List<Map<String, dynamic>>> getDataStream({
//   required String path,
//   String? documentId,
//   String? field, // Add this parameter to specify a field to extract (e.g., "cartList")
//   Map<String, dynamic>? query,
// }) {
//   Query<Map<String, dynamic>> data = firestore.collection(path);

//   if (documentId != null) {
//     // Fetch specific document and check if field is specified
//     return firestore.collection(path).doc(documentId).snapshots().map((snapshot) {
//       if (snapshot.exists && snapshot.data() != null) {
//         if (field != null && snapshot.data()![field] != null) {
//           // Extract the specified field (e.g., "cartList")
//           List<dynamic> fieldData = snapshot.data()![field];
//           return fieldData.map((item) => item as Map<String, dynamic>).toList();
//         }
//         // If the field is not specified or doesn't exist, return the entire document
//         return [snapshot.data() as Map<String, dynamic>];
//       } else {
//         return [];
//       }
//     });
//   } else {
//     if (query != null) {
//       if (query['orderBy'] != null) {
//         var orderByField = query['orderBy'];
//         var descending = query['descending'];
//         data = data.orderBy(orderByField, descending: descending);
//       }
//       if (query['where'] != null) {
//         var whereField = query['where'];
//         var isEqualTo = query['isEqualTo'];
//         data = data.where(whereField, isEqualTo: isEqualTo);
//       }
//       if (query['limit'] != null) {
//         var limit = query['limit'];
//         data = data.limit(limit);
//       }
//     }

//     return data.snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) => doc.data()).toList();
//     });
//   }
// }


//   @override
//   Future<bool> checkIfDataExist(
//       {required String path, required String uId}) async {
//     var data = await firestore.collection(path).doc(uId).get();
//     return data.exists;
//   }
// @override
//   Future<void> updateData({
//     required String path,
//     required String documentId,
//     required Map<String, dynamic> data,
//     })
//   async {
//     await firestore.collection(path).doc(documentId).update(data);
//   }
//    @override
//   Future<List<String>> getDocumentIdsByField({
//   required String path,
//   required String field,
//   required dynamic value,
// }) async {
//   try {
//     final snapshot = await firestore.collection(path).where(field, isEqualTo: value).get();
//     return snapshot.docs.map((doc) => doc.id).toList();
//   } catch (e) {
//     throw ServerException(message: 'Failed to retrieve document ID by field: ${e.toString()}');
//   }
// }
// @override
// Future<void> removeItemFromCart({
//   required String userId,
//   required String productCode, // The product code to identify the item
// }) async {
//   try {
//     // Reference to the user document
//     final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

//     // Fetch the user's cartList
//     final snapshot = await userRef.get();
//     if (!snapshot.exists) {
//       throw ServerException(message: "User document not found");
//     }

//     // Get the cartList as a List of Maps
//     final cartList = List<Map<String, dynamic>>.from(snapshot.data()?['cartList'] ?? []);

//     // Remove the item with the specified productCode
//     cartList.removeWhere((cartItem) {
//       final productModel = cartItem['productModel'];
//       return productModel != null && productModel['code'] == productCode;
//     });

//     // Update the user's cartList with the new list
//     await userRef.update({'cartList': cartList});
//   } catch (e) {
//     throw ServerException(message: 'Failed to remove item from cart: ${e.toString()}');
//   }
// }


// @override
// Future<List<Map<String, dynamic>>> searchProducts(String searchText) async {
//   try {
//     final snapshot = await firestore
//         .collection('products')
//         .orderBy('name')
//         .startAt([searchText])
//         .endAt([searchText + '\uf8ff'])
//         .get();

//     return snapshot.docs.map((doc) => doc.data()).toList();
//   } catch (e) {
//     throw Exception('Failed to search products: ${e.toString()}');
//   }
// }

// @override
// Stream<double> getProductPriceStream({
//   required String productCode, // Unique product code to fetch price
// }) {
//   try {
//     // Query the products collection to get the product based on its productCode (UID)
//     final productPriceStream = firestore
//         .collection('products')
//         .where('code', isEqualTo: productCode)
//         .snapshots()
//         .map((querySnapshot) {
//       // Check if the query returned any documents
//       if (querySnapshot.docs.isNotEmpty) {
//         // Get the first document (assuming productCode is unique)
//         final doc = querySnapshot.docs.first;
//         final data = doc.data();

//         // Fetch the price field and ensure it's a double, defaulting to 0 if not available
//         final price = (data['discountPrice'] > 0) ? (data['discountPrice'] as num).toDouble():(data['price'] as num).toDouble() ;
//         return price;
//       } else {
//         return 0.0; // Return 0 if no product was found
//       }
//     });
      
//     return productPriceStream;
//   } catch (e) {
//     throw Exception('Error fetching product price stream: $e');
//   }
// }
// @override
// Future<void> emptyCart({required String userId}) async {
//   try {
//     // Reference to the user document
//     final userRef = firestore.collection('users').doc(userId);

//     // Update the cartList field to an empty list
//     await userRef.update({'cartList': []});

   
//   } catch (e) {
//     throw ServerException(message: 'Failed to empty the cart: ${e.toString()}');
//   }
// }
// @override
//  Future<void> deleteData({required String path, required String uId}) async {
//     try {
//       // Construct the document reference
//       final documentReference = firestore.collection(path).doc(uId);

//       // Delete the document
//       await documentReference.delete();

     
//     } catch (e) {
     
//       throw ServerException(message: 'Failed to delete data. Please try again.');
//     }
//   }

// // @override
// // Stream<double> getProductPrice(String productCode) {
// //     return firesotre
// //         .collection('products')
// //         .doc(productCode)
// //         .snapshots()
// //         .map((snapshot) {
// //       if (snapshot.exists && snapshot.data() != null) {
// //         return snapshot.data()!['price'] as double; // Get updated price
// //       } else {
// //         throw Exception('Product not found');
// //       }
// //     });
// //   }

// }
