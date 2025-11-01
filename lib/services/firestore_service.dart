import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Activer la persistance hors ligne
  FirestoreService() {
    _db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  // Créer un contact
  Future<void> createContact(Contact contact) async {
    await _db.collection('contacts').add(contact.toMap());
  }

  // Lire les contacts de l'utilisateur
  Stream<List<Contact>> getContacts(String userId) {
    return _db
        .collection('contacts')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Contact.fromFirestore(doc))
        .toList());
  }

  // Mettre à jour un contact
  Future<void> updateContact(Contact contact) async {
    if (contact.id != null) {
      await _db.collection('contacts').doc(contact.id).update(contact.toMap());
    }
  }

  // Supprimer un contact
  Future<void> deleteContact(String contactId) async {
    await _db.collection('contacts').doc(contactId).delete();
  }

  // Rechercher des contacts
  Stream<List<Contact>> searchContacts(String userId, String query) {
    return _db
        .collection('contacts')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      final contacts = snapshot.docs
          .map((doc) => Contact.fromFirestore(doc))
          .toList();

      if (query.isEmpty) return contacts;

      return contacts.where((contact) {
        final searchLower = query.toLowerCase();
        return contact.nom.toLowerCase().contains(searchLower) ||
            contact.prenom.toLowerCase().contains(searchLower) ||
            contact.telephone.contains(query) ||
            contact.email.toLowerCase().contains(searchLower);
      }).toList();
    });
  }
}