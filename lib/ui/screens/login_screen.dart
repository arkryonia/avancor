import 'package:flutter/material.dart';

import 'package:avancor/ui/screens/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _viewModel;

  const LoginScreen(LoginViewModel viewModel, {super.key})
      : _viewModel = viewModel;

  _signInButtonPressed() {
    _viewModel.sigInRequested();
  }

  @override
  Widget build(BuildContext context) {
    double vspace = 10;
    const padding = 16.0;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: AnimatedBuilder(
              animation: _viewModel,
              builder: (context, child) {
                final errorMessage = _viewModel.errorMessage;

                return Column(
                  children: [
                    TextFormField(
                      onChanged: _viewModel.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.username,
                        AutofillHints.email,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: _viewModel.emailError,
                      ),
                    ),
                    SizedBox(height: vspace),
                    TextFormField(
                      obscureText: true,
                      onChanged: _viewModel.passwordChanged,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: _viewModel.passwordError,
                      ),
                    ),
                    SizedBox(height: vspace),
                    if (_viewModel.isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _signInButtonPressed,
                              child: const Text('Sign In'),
                            ),
                          ),
                        ],
                      ),
                    if (errorMessage != null) Center(child: Text(errorMessage))
                  ],
                );
              }),
        ),
      ),
    );
  }
}
