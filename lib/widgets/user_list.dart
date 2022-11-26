import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state){
        if(state is UserLoadedState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Users are loaded')));
        }
      }),
      builder: (context, state){
        if(state is UserEmptyState){
          return const Center(
            child: Text('No data received. Please button "Load"',
              style: TextStyle(fontSize: 20),),
          );
        }
        if(state is UserLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is UserLoadedState){
          return ListView.builder(
            itemCount: state.loadedUsers.length,
            itemBuilder: (BuildContext context, index) =>
                SizedBox(
                  height: 80,
                  child: ListTile(
                    leading: Text('ID: ${state.loadedUsers[index].id}', style: const TextStyle(fontWeight: FontWeight.bold),),
                    title: Column(
                      children: [
                        Text(state.loadedUsers[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                        Text("Email: ${state.loadedUsers[index].email}", style: const TextStyle(fontStyle: FontStyle.italic),),
                        Text("Phone: ${state.loadedUsers[index].phone}", style: const TextStyle(fontStyle: FontStyle.italic),),
                      ],
                    ),
                  ),
                ),
          );
        }
        if(state is UserErrorState){
          return const Center(
            child: Text(
              "Error fetching users",
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
