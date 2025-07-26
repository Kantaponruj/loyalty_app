import 'package:loyalty_app/models/reward.dart';

class RewardService {
  Future<List<Reward>> fetchRewards() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      Reward(
        id: 1,
        name: "Adidas Ultraboost Core Black",
        imageUrl: "https://picsum.photos/id/10/400/400",
        rewardPoints: 300,
        rewardDescription: "รองเท้าวิ่งยอดนิยม สวมใส่สบายสำหรับการออกกำลังกาย",
      ),
      Reward(
        id: 2,
        name: "Nike Air Max 270",
        imageUrl: "https://picsum.photos/id/20/400/400",
        rewardPoints: 280,
        rewardDescription: "ดีไซน์ล้ำสมัย พร้อมเทคโนโลยีรองรับแรงกระแทก",
      ),
      Reward(
        id: 3,
        name: "Apple AirPods Pro",
        imageUrl: "https://picsum.photos/id/30/400/400",
        rewardPoints: 4500,
        rewardDescription: "หูฟังไร้สายตัดเสียงรบกวน พร้อมเคสชาร์จ",
      ),
      Reward(
        id: 4,
        name: "Starbucks Gift Card - ฿200",
        imageUrl: "https://picsum.photos/id/40/400/400",
        rewardPoints: 150,
        rewardDescription:
            "บัตรของขวัญ Starbucks มูลค่า 200 บาท คือไอเท็มสุดพิเศษที่ให้คุณหรือคนที่คุณรักได้ดื่มด่ำกับประสบการณ์แห่งความสุขในทุกแก้ว ไม่ว่าจะเป็นคาเฟ่ลาเต้ร้อนๆ ในเช้าวันจันทร์ ชาเขียวมัทฉะแฟรปปูชิโน่เย็นสดชื่นในช่วงบ่าย หรือขนมอบอบใหม่กลิ่นหอมในยามพักผ่อน บัตรนี้สามารถใช้ได้ที่ร้าน Starbucks ทุกสาขาทั่วประเทศไทย โดยไม่มีวันหมดอายุและไม่จำกัดประเภทของสินค้าที่สามารถใช้ได้ ไม่ว่าคุณจะนั่งทำงาน จัดประชุม นัดเพื่อน หรือพักผ่อนสบายๆ ในบรรยากาศอันแสนอบอุ่นของร้าน Starbucks บัตรนี้ก็ตอบโจทย์ทุกไลฟ์สไตล์ของคุณอย่างลงตัว นอกจากนี้ยังสามารถใช้ร่วมกับแอป Starbucks Rewards เพื่อสะสมดาว แลกรับเครื่องดื่มฟรี และเข้าร่วมโปรโมชันพิเศษต่างๆ ได้อีกด้วย บัตรนี้เหมาะสำหรับการมอบเป็นของขวัญในทุกเทศกาล เช่น วันเกิด วันครบรอบ วันแม่ หรือแม้แต่การให้กำลังใจตัวเองในวันที่เหนื่อยล้า ด้วยมูลค่า 200 บาทที่แฝงไว้ด้วยคุณค่าแห่งรอยยิ้มและความประทับใจในทุกการใช้จ่าย มอบความรู้สึกดีๆ ให้ทุกวันของคุณมีความหมายมากยิ่งขึ้นด้วย Starbucks Gift Card ใบนี้",
      ),
      Reward(
        id: 5,
        name: "Xiaomi Mi Smart Band 7",
        imageUrl: "https://picsum.photos/id/50/400/400",
        rewardPoints: 12350,
        rewardDescription: "สมาร์ทแบนด์วัดการนอน ออกกำลังกาย และวัดชีพจร",
      ),
      Reward(
        id: 6,
        name: "Amazon Echo Dot (4th Gen)",
        imageUrl: "https://picsum.photos/id/60/400/400",
        rewardPoints: 10000,
        rewardDescription:
            "ลำโพงอัจฉริยะพร้อม Alexa ผู้ช่วยส่วนตัวสั่งงานด้วยเสียง",
      ),
    ];
  }
}
