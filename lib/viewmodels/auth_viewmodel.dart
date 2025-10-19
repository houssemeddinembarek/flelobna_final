import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flelobna/data/repositories/auth_repository.dart';
import 'package:flelobna/models/user.dart';
import 'package:flelobna/screens/auth/login_screen.dart';
import 'package:flelobna/screens/navigation_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// ViewModel for Authentication
/// Manages auth state and user operations
class AuthViewModel extends GetxController {
  final AuthRepository _repository = AuthRepository();
  final GetStorage _storage = GetStorage();

  // Observable state
  final Rx<firebase_auth.User?> firebaseUser = Rx<firebase_auth.User?>(null);
  final Rx<User> userDetail = User().obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadingSettings = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to auth state changes
    firebaseUser.bindStream(_repository.authStateChanges);
    
    // Auto-load user details if logged in
    ever(firebaseUser, _handleAuthChanged);
  }

  /// Handle auth state changes
  void _handleAuthChanged(firebase_auth.User? user) {
    if (user != null && user.email != null) {
      loadUserDetails(user.email!);
    }
  }

  /// Sign in with email and password
  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _repository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save email to local storage
      await _storage.write("email", email);

      // Navigate to home
      Get.offAll(() => NavigationScreen());
      
      Get.snackbar(
        'Succès',
        'Connexion réussie',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      _handleAuthError(e);
    } catch (e) {
      errorMessage.value = 'Erreur: $e';
      Get.snackbar(
        'Erreur',
        'Une erreur est survenue',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Sign up with email and password
  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _repository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user in Firestore
      User user = User(
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
      await _repository.createUser(user);

      Get.snackbar(
        'Succès',
        'Compte créé avec succès',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to login
      Get.to(() => LoginPage());
    } on firebase_auth.FirebaseAuthException catch (e) {
      _handleAuthError(e);
    } catch (e) {
      errorMessage.value = 'Erreur: $e';
      Get.snackbar(
        'Erreur',
        'Échec de la création du compte',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _repository.signOut();
      
      // Clear local storage
      await _storage.remove('email');
      await _storage.remove('familyName');
      await _storage.remove('givenName');

      userDetail.value = User();

      Get.offAll(() => LoginPage());
      
      Get.snackbar(
        'Déconnexion',
        'Vous avez été déconnecté',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      errorMessage.value = 'Error signing out: $e';
    }
  }

  /// Load user details
  Future<void> loadUserDetails(String email) async {
    try {
      isLoadingSettings.value = true;
      
      User? user = await _repository.getUserByEmail(email);
      
      if (user != null) {
        userDetail.value = user;
      }
    } catch (e) {
      errorMessage.value = 'Error loading user details: $e';
    } finally {
      isLoadingSettings.value = false;
    }
  }

  /// Update user information
  Future<void> updateUserInfo({
    required String email,
    String? firstName,
    String? lastName,
  }) async {
    try {
      isLoading.value = true;
      
      Map<String, dynamic> updates = {};
      if (firstName != null) updates['firstName'] = firstName;
      if (lastName != null) updates['lastName'] = lastName;

      await _repository.updateUser(email, updates);
      
      // Reload user details
      await loadUserDetails(email);

      Get.snackbar(
        'Succès',
        'Profil mis à jour avec succès',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      errorMessage.value = 'Error updating user: $e';
      Get.snackbar(
        'Erreur',
        'Échec de la mise à jour du profil',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete user account
  Future<void> deleteAccount() async {
    try {
      isLoading.value = true;
      
      await _repository.deleteUserAccount();
      
      // Clear local storage
      await _storage.remove('email');
      
      Get.offAll(() => LoginPage());
      
      Get.snackbar(
        'Succès',
        'Compte supprimé avec succès',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      errorMessage.value = 'Error deleting account: $e';
      Get.snackbar(
        'Erreur',
        'Échec de la suppression du compte',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Handle Firebase Auth errors
  void _handleAuthError(firebase_auth.FirebaseAuthException e) {
    String message = 'Erreur d\'authentification';
    
    switch (e.code) {
      case 'user-not-found':
        message = 'Aucun utilisateur trouvé avec cet email';
        break;
      case 'wrong-password':
        message = 'Mot de passe incorrect';
        break;
      case 'invalid-email':
        message = 'Email invalide';
        break;
      case 'email-already-in-use':
        message = 'Cet email est déjà utilisé';
        break;
      case 'weak-password':
        message = 'Le mot de passe est trop faible';
        break;
      default:
        message = e.message ?? 'Erreur d\'authentification';
    }
    
    errorMessage.value = message;
    Get.snackbar(
      'Erreur',
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Check if user is logged in
  bool get isLoggedIn => firebaseUser.value != null;

  /// Get current user email
  String? get userEmail => firebaseUser.value?.email ?? _storage.read('email');
}

