import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'add_invoice_screen.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoices',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFFF5F6F8),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF002352).withOpacity(0.3),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddInvoiceScreen());
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 3,
        child: const Icon(
          Iconsax.add,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          // Search bar
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SearchBar(),
          ),
          const SizedBox(
            height: 10,
          ),
          // Invoice Card
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: InvoiceCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String dropdownValue = 'Name';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (String? newValue) {
              print('Selected Value: $newValue');
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Name', 'Room', 'Phone']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class InvoiceCard extends StatefulWidget {
  const InvoiceCard({
    super.key,
  });

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Invoice ID',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            // For Download, Share and Delete
            ThreeDotIcon()
          ],
        ),
        const Row(
          children: [
            Text(
              '#1223',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Text('')
          ],
        ),
        const DashedLine(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.user,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Tenant Name',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Text(
                '19 Aug 2024',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  PopupMenuButton<String> ThreeDotIcon() {
    return PopupMenuButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.more_vert,
      ),
      onSelected: (value) {
        switch (value) {
          case 'download':
            // Handle Download action
            break;
          case 'share':
            // Handle Share action
            break;
          case 'delete':
            // Handle Delete action
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'download',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(CupertinoIcons.cloud_download),
            title: Text('Download'),
          ),
        ),
        const PopupMenuItem(
          value: 'share',
          child: ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Iconsax.trash,
              color: Colors.red,
            ),
            title: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomPaint(
        size: const Size(double.infinity, 1),
        painter: DashPainter(),
      ),
    );
  }
}

class DashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFF002352).withOpacity(0.5)
      ..strokeWidth = 1;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 3;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
