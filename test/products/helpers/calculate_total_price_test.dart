import 'dart:math';

import 'package:flutter_listin/products/helpers/calculate_total_price.dart';
import 'package:flutter_listin/products/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Uma lista de produtos vazia, retorna total zero', () {
    List<Product> products = [];

    double result = calculateTotalPriceFromListProduct(products);

    expect(result, 0);
  });

  test(
      'Se a lista tiver apenas um produto, retornar a multiplicação dos valores',
      () {
    List<Product> products = [
      Product(
        id: '1',
        name: 'Produto 1',
        price: 10.0,
        amount: 2,
        isPurchased: true,
        obs: 'abc',
        category: '123',
        isKilograms: false,
      ),
    ];

    expect(
      calculateTotalPriceFromListProduct(products),
      products.first.amount! * products.first.price!,
      reason:
          'Espera-se que a função leve em consideração não apenas o valor mas a quantidade do item',
    );
  });

  test(
    'A função não pode retornar valores negativos',
    () {
      List<Product> products = [
        Product(
          id: '1',
          name: 'Produto 1',
          price: Random().nextDouble() * 10,
          amount: Random().nextInt(10).toDouble(),
          isPurchased: true,
          obs: '',
          category: '',
          isKilograms: false,
        ),
      ];

      double result = calculateTotalPriceFromListProduct(products);

      expect(result, isNonNegative);
    },
    retry: 100000,
  );
}
