import 'dart:convert';

List<Pendingorders> pendingordersFromJson(String str) => List<Pendingorders>.from(json.decode(str).map((x) => Pendingorders.fromJson(x)));

String pendingordersToJson(List<Pendingorders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pendingorders {
    Pendingorders({
        this.id,
        this.orderdate,
        this.hotelsname,
        this.orderamount,
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
    String orderamount;
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

    factory Pendingorders.fromJson(Map<String, dynamic> json) => Pendingorders(
        id: json["_id"],
        orderdate: json["Orderdate"],
        hotelsname: json["Hotelsname"],
        orderamount: json["Orderamount"],
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
        "Orderamount": orderamount,
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