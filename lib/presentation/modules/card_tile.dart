import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/data/blocs/auth/auth_blocs.dart';

class CardTile extends StatelessWidget {
  const CardTile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        context.read<AuthBloc>().add(SignOut());
      },
      child: Container(
        height: height / 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.05),
        ),
      ),
    );
  }
}
