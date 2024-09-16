// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  // Déclation des états
  bool _isLoading = false;
  String? _errorMessage;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;

  // Déclaration des champs de formulaire
  String? _email;
  String? _password;

  // Obligatoire d'avoir des getters ou variables calculées
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get emailError => _emailErrorMessage;
  String? get passwordError => _passwordErrorMessage;

  // Récupération des informations issues du formulaire
  void emailChanged(String newEmail) {
    _email = newEmail;
  }

  void passwordChanged(String newPassword) {
    _password = newPassword;
  }

  // Traitement de la soumission
  Future<void> sigInRequested() async {
    final email = _email;
    final password = _password;

    _isLoading = true;
    notifyListeners();

    if (email?.contains("@") == false) {
      _emailErrorMessage = "Email invalide";
    }

    if (password!.isEmpty) {
      _passwordErrorMessage = "Password required";
    }

    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;

    _errorMessage = password == 'Ok'
        ? "Bienvenu $email"
        : "Impossible de retrouver ce compte";
    notifyListeners();
  }
}
