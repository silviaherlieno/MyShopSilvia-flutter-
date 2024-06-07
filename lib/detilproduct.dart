import 'package:flutter/material.dart';
import 'package:myshopsilvia/listalluser.dart';
import 'productitems.dart';

class DetilProduct extends StatefulWidget {
  const DetilProduct({super.key, this.productIndex});
  final productIndex;

  @override
  State<DetilProduct> createState() => _DetilProductState();
}

class _DetilProductState extends State<DetilProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              product[widget.productIndex][0],
              style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(195, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    product[widget.productIndex][1],
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text(
            product[widget.productIndex][2],
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(195, 0, 0, 0),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deskripsi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 206, 152, 105),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  product[widget.productIndex][4],
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w200),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Product Size",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 206, 152, 105),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: 5,
                      child: Text(
                        "S",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 206, 152, 105),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 10,
                      child: Text(
                        "M",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 206, 152, 105),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 15,
                      child: Text(
                        "L",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 206, 152, 105),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 20,
                      child: Text(
                        "XL",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 206, 152, 105),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 206, 152, 105)),
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
