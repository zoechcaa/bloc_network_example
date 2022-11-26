import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
      return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: (){
            userBloc.add(UserLoadEvent());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)
          ),
          child: const Text('Load'),
        ),
        const SizedBox(width: 8,),
        ElevatedButton(
          onPressed: (){
            userBloc.add(UserClearEvent());
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
