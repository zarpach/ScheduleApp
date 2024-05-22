import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/auth_blocs.dart';

class SigninGoogle extends StatelessWidget {
  const SigninGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: brightness == Brightness.light ?
      Theme.of(context).colorScheme.primary
          :
      Theme.of(context).colorScheme.inversePrimary,
      body: Container(
        decoration: const BoxDecoration(

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
                    child: Text(
                      'My IUCA',
                      style: TextStyle(
                          color: brightness == Brightness.light ?
                          Theme.of(context).colorScheme.inversePrimary
                              :
                          Theme.of(context).colorScheme.primary,
                          fontSize: 68,
                          fontWeight: FontWeight.bold,
                      ),
                    )
                )
            ),
            Expanded(
                child: Center(
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(SignInWithGoogle());
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            filterQuality: FilterQuality.high,
                            image: AssetImage("assets/images/googleLogo.png"),
                            height: 36,
                            width: 36,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
