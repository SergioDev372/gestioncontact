# 📱 Application de Gestion de Contacts

Une application mobile moderne de gestion de contacts développée avec Flutter et Firebase, offrant une synchronisation en temps réel et un mode hors ligne.



##  Fonctionnalités

## Authentification
- Inscription avec email et mot de passe
- Connexion sécurisée via Firebase Authentication
- Déconnexion en un clic
- Validation des données en temps réel
- Messages d'erreur en français

### Gestion des Contacts
-  Ajouter des contacts avec prénom, nom, téléphone, email et adresse
-  Modifier les informations des contacts existants
-  Supprimer avec confirmation
-  Rechercher rapidement parmi vos contacts
-  Affichage élégant avec avatars personnalisés

### Synchronisation et Hors Ligne
-  Synchronisation automatique avec Firebase Firestore
-  Mode hors ligne- Travaillez sans connexion internet
-  Mise à jour en temps réel - Les changements apparaissent instantanément
-  Cache persistant - Vos données restent accessibles

### 🎨 Interface Utilisateur
- Design moderne et intuitif
- Interface responsive adaptée à tous les écrans
- Thème Material 3 avec animations fluides
- Avatars colorés avec initiales
- Validation des formulaires en temps réel

## 🛠️ Technologies Utilisées

### Framework & Langage
- Flutter - Framework UI multiplateforme
- Dart- Langage de programmation

### Backend & Services
- Firebase Authentication - Gestion des utilisateurs
- Cloud Firestore - Base de données NoSQL en temps réel
- Firebase Core - Configuration Firebase

### Architecture
- MVVM Pattern - Séparation des préoccupations
- Services Layer - Logique métier isolée
- Repository Pattern - Abstraction des données

## Structure du Projet

```
lib/
├── main.dart                      # Point d'entrée de l'application
├── models/
│   └── contact.dart              # Modèle de données Contact
├── services/
│   ├── auth_service.dart         # Service d'authentification
│   └── firestore_service.dart    # Service de base de données
├── screens/
│   ├── login_screen.dart         # Écran de connexion
│   ├── register_screen.dart      # Écran d'inscription
│   ├── home_screen.dart          # Écran principal (liste)
│   └── contact_form_screen.dart  # Formulaire d'ajout/modification
└── widgets/
    └── contact_card.dart         # Widget carte de contact
```

## 🚀 Installation

### Prérequis

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0 ou supérieur)
- [Dart SDK](https://dart.dev/get-dart) (3.0 ou supérieur)
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/)
- Un compte [Firebase](https://console.firebase.google.com/)

### Étapes d'installation

1. **Cloner le repository**
   ```bash
   git clone https://github.com/SergioDev372/gestioncontact.git
   cd contacts-rapide
   ```

2. **Installer les dépendances**
   ```bash
   flutter pub get
   ```

3. **Configurer Firebase**

   a. Créez un projet sur [Firebase Console](https://console.firebase.google.com/)

   b. Installez FlutterFire CLI :
   ```bash
   dart pub global activate flutterfire_cli
   ```

   c. Configurez Firebase pour votre projet :
   ```bash
   flutterfire configure
   ```

   d. Activez les services Firebase :
    - Authentication: Allez dans Authentication > Sign-in method > Activez "Email/Password"
    - Firestore : Créez une base de données Firestore en mode test

4. Lancer l'application
   ```bash
   flutter run
   ```

## 📱 Captures d'écran

### Écran de Connexion
Interface de connexion avec validation des champs et gestion des erreurs.

### Écran d'Inscription
Formulaire d'inscription avec confirmation du mot de passe.

### Liste des Contacts
Affichage des contacts avec recherche en temps réel et avatars personnalisés.

### Formulaire de Contact
Ajout et modification de contacts avec tous les champs nécessaires.

## Configuration

### Règles de Sécurité Firestore

Pour protéger vos données, configurez ces règles dans Firebase Console :

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Les utilisateurs peuvent seulement lire/écrire leurs propres contacts
    match /contacts/{contactId} {
      allow read, write: if request.auth != null && 
                          request.auth.uid == resource.data.userId;
      allow create: if request.auth != null && 
                     request.auth.uid == request.resource.data.userId;
    }
  }
}
```

### Variables d'Environnement

Les configurations Firebase sont automatiquement générées dans `lib/firebase_options.dart` par FlutterFire CLI.

## Dépendances Principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Firebase
  firebase_core: ^3.3.0
  firebase_auth: ^5.1.4
  cloud_firestore: ^5.2.1
  
  # UI
  flutter_spinkit: ^5.2.0
```

## Tests

### Lancer les tests unitaires
```bash
flutter test
```

### Lancer les tests d'intégration
```bash
flutter test integration_test
```

## Contribution

Les contributions sont les bienvenues ! Pour contribuer :

1. Fork le projet
2. Créez votre branche (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 🐛 Signaler un Bug

Si vous trouvez un bug, veuillez ouvrir une [issue](https://github.com/SergioDev372/gestioncontact.git) avec :
- Une description claire du problème
- Les étapes pour reproduire
- Le comportement attendu
- Des captures d'écran si possible
- Votre environnement (OS, version Flutter, etc.)

## 👨‍💻 Auteur

AHOSSAN Sergio Boris
- GitHub: [@votre-username](https://github.com/SergioDev372)
- Email: sergioahossan8@gmail.com


## 📚 Ressources Utiles

- [Documentation Flutter](https://flutter.dev/docs)
- [Documentation Firebase](https://firebase.google.com/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)
