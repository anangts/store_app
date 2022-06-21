import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';

class MapUserBadge extends StatelessWidget {
  const MapUserBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset.zero),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: AssetImage('assets/imgs/dian.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: AppColor.mainColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dian Sastrowardoyo',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'My location',
                  style: TextStyle(
                    color: AppColor.mainColor,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.location_pin,
            color: AppColor.mainColor,
          ),
        ],
      ),
    );
  }
}
