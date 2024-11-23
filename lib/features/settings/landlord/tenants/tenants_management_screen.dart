import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'tenants_application_screen.dart';

class TenantsManagementScreen extends StatefulWidget {
  const TenantsManagementScreen({super.key});

  @override
  State<TenantsManagementScreen> createState() =>
      _TenantsManagementScreenState();
}

class _TenantsManagementScreenState extends State<TenantsManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tenants Management',
          style: TextStyle(
            fontSize: 18,
          ),
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
              shape: BoxShape.rectangle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // Search Bar
            const SearchBar(),
            // Tenant Card
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TenantCard();
                },
              ),
            ),
          ],
        ),
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

class TenantCard extends StatelessWidget {
  const TenantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Do sth
        Get.to(() => const TenantsApplicationScreen());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                'https://i.postimg.cc/g25VYN7X/user-1.png',
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tenant Name',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Iconsax.call,
                          size: 15,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              // Regular text before the number
                              TextSpan(
                                text: 'Phone: ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              // Bold text for the number
                              TextSpan(
                                text: '097284712',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Iconsax.home,
                          size: 15,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              // Regular text before the number
                              TextSpan(
                                text: 'Room: ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              // Bold text for the number
                              TextSpan(
                                text: '01',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.home_1,
                          size: 15,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              // Regular text before the number
                              TextSpan(
                                text: 'Property: ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              // Bold text for the number
                              TextSpan(
                                text: '01',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
