import 'package:e_gouter_za/cart_page/cart_food_screen.dart';
import 'package:e_gouter_za/model/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vos commandes'),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: <Widget>[
                    // buildSearch(),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: state.cart.foods.length,
                        itemBuilder: (BuildContext context, index) {
                          final food = state.cart.foods[index];
                          return CartFoodScreen(
                            food: food,
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TOTAL'),
                                  Text('${state.cart.totalString} Ar'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          margin: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    final snackbar =
                                      SnackBar(content: Text("Produit livré"));
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                  },
                                  child: Text("Se faire livrer"))
                            ],
                          ),
                        )
                      ],
                    )
                    // SizedBox(width: 10,),
                  ],
                ),
              );
            } else {
              return const Text("Something went wrong");
            }
          },
        ));
  }
}
