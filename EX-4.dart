enum Deliver {DELIVERED, PICKED_UP}
class Customer{
  final String name;
  int? age;
  String address;

  Customer({required this.name, this.age, required this.address});
}

class Product{
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class OrderItem{
  Product product;
  int quantity;

  OrderItem({required this.product, required this.quantity});
}

class Order{
  final Customer customer;
  double deliveryFee;
  List<OrderItem> orderedItems;
  Deliver deliveryType;

  Order.delivered({required this.customer, required this.orderedItems, required this.deliveryFee}) : deliveryType = Deliver.DELIVERED;
  Order.pickedUp({required this.customer, required this.orderedItems}) : deliveryType = Deliver.PICKED_UP, deliveryFee = 0;

  void totalPrice(){
    double total = 0;
    for(OrderItem item in orderedItems){
      total += item.product.price * item.quantity;
    }
    if(deliveryType == Deliver.DELIVERED) total += deliveryFee;
    print('Total price: \$${total}');
  }
}

void main(){
  var customer = Customer(name: 'Menghan', address: 'Phnom Penh', age: 20);
  var laptop = Product(name: 'Laptop', price: 500.0);
  var keyboard = Product(name: 'Keyboard', price: 20.0);
  var mouse = Product(name: 'Mouse', price: 5.0);
  var orderItems = [
    OrderItem(product: laptop, quantity: 1), 
    OrderItem(product: keyboard, quantity: 2),
    OrderItem(product: mouse, quantity: 1)
  ];
  print('Delivery order: ');
  var orderDelivered = Order.delivered(customer: customer, orderedItems: orderItems, deliveryFee: 2.0);
  orderDelivered.totalPrice();

  print('Pick up order: ');
  var orderPickedUp = Order.pickedUp(customer: customer, orderedItems: orderItems);
  orderPickedUp.totalPrice();
}

