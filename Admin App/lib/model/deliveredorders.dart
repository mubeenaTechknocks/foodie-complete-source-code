import 'dart:convert';

List<Deliveredorders> deliveredordersFromJson(String str) => List<Deliveredorders>.from(json.decode(str).map((x) => Deliveredorders.fromJson(x)));

String deliveredordersToJson(List<Deliveredorders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Deliveredorders {
    Deliveredorders({
        this.id,
        this.orderdate,
        this.hotelsname,
        this.payment,
        this.address,
        this.item,
        this.price,
        this.quantity,
        this.name,
        this.phonenumber,
        this.orderprice,
        this.deliverycharges,
        this.tax,
        this.total,
        this.v,
    });

    String id;
    String orderdate;
    String hotelsname;
    String payment;
    String address;
    String item;
    int price;
    String quantity;
    String name;
    int phonenumber;
    int orderprice;
    int deliverycharges;
    int tax;
    int total;
    int v;

    factory Deliveredorders.fromJson(Map<String, dynamic> json) => Deliveredorders(
        id: json["_id"],
        orderdate: json["Orderdate"],
        hotelsname: json["Hotelsname"],
        payment: json["Payment"],
        address: json["Address"],
        item: json["Item"],
        price: json["Price"],
        quantity: json["Quantity"],
        name: json["Name"],
        phonenumber: json["Phonenumber"],
        orderprice: json["Orderprice"],
        deliverycharges: json["Deliverycharges"],
        tax: json["Tax"],
        total: json["Total"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Orderdate": orderdate,
        "Hotelsname": hotelsname,
        "Payment": payment,
        "Address": address,
        "Item": item,
        "Price": price,
        "Quantity": quantity,
        "Name": name,
        "Phonenumber": phonenumber,
        "Orderprice": orderprice,
        "Deliverycharges": deliverycharges,
        "Tax": tax,
        "Total": total,
        "__v": v,
    };
}