import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding:const EdgeInsets.all(8),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            

            children: [
              MaterialButton(
                color: Colors.black,
                onPressed: () => viewModel.navigatehomeView(),
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.black,
                onPressed: () => viewModel.getUserFromService(),
                child: const Text(
                  "Display Users",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: viewModel.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  Text(viewModel.users[index].id.toString()),
                                 const SizedBox(width: 10,),
                                  Text(viewModel.users[index].name),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 
                                  Flexible(
                                    child: Text(viewModel.addressFromUser(viewModel.users[index]),
                                      overflow: TextOverflow
                                          .visible,
                                    ),
                                  ),
                              
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      viewModel.users[index].email,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      viewModel.users[index].phone,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  UsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UsersViewModel();
}
