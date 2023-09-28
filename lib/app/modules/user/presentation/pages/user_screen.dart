import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/user_base_entity.dart';
import '../provider/user_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserProvider>().initaialUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "U S E R",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: _buildUserWithFutureVoid(),
    );
  }

  Consumer<UserProvider> _buildUserWithFutureVoid() {
    return Consumer<UserProvider>(
      builder: (_, userProvider, child) {
        if (userProvider.isLoadingUser) {
          return const Center(child: CupertinoActivityIndicator());
        } else {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              userProvider.refreshUser();
            },
            child: ListView.builder(
              itemCount: userProvider.userList.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final user = userProvider.userList[index];
                return Card(
                  child: ListTile(
                    title: Text(user.name ?? ''),
                    subtitle: Text(user.email ?? ''),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget buildUserWithFutureBuilder() {
    return Consumer<UserProvider>(builder: (_, userProvider, child) {
      return FutureBuilder<List<UserBaseEntity>>(
        future: userProvider.handleUserFuture(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No users found.');
          } else {
            final users = snapshot.data;
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                await userProvider.handleUserFuture();
              },
              child: ListView.builder(
                itemCount: users?.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final user = users?[index];
                  return Card(
                    child: ListTile(
                      title: Text(user?.name ?? ''),
                      subtitle: Text(user?.email ?? ''),
                    ),
                  );
                },
              ),
            );
          }
        },
      );
    });
  }
}
