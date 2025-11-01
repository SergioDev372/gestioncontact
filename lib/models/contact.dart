import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  final String? id;
  final String nom;
  final String prenom;
  final String telephone;
  final String email;
  final String? adresse;
  final DateTime createdAt;
  final String userId;

  Contact({
    this.id,
    required this.nom,
    required this.prenom,
    required this.telephone,
    required this.email,
    this.adresse,
    required this.createdAt,
    required this.userId,
  });

  // Convertir en Map pour Firestore
  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'telephone': telephone,
      'email': email,
      'adresse': adresse,
      'createdAt': Timestamp.fromDate(createdAt),
      'userId': userId,
    };
  }

  // Créer depuis Firestore
  factory Contact.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Contact(
      id: doc.id,
      nom: data['nom'] ?? '',
      prenom: data['prenom'] ?? '',
      telephone: data['telephone'] ?? '',
      email: data['email'] ?? '',
      adresse: data['adresse'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      userId: data['userId'] ?? '',
    );
  }

  // Copier avec modifications
  Contact copyWith({
    String? id,
    String? nom,
    String? prenom,
    String? telephone,
    String? email,
    String? adresse,
    DateTime? createdAt,
    String? userId,
  }) {
    return Contact(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      adresse: adresse ?? this.adresse,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
    );
  }
}