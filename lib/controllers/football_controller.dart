import 'package:get/get.dart';
import 'package:flutter_testing_1/models/football_models.dart';

class FootballController extends GetxController{
    var players = <Player>[
    Player(
  profileImage: 'https://fifpro.org/media/5chb3dva/lionel-messi_imago1019567000h.jpg?rxy=0.32986930611281567,0.18704579979466449&rnd=133378758718600000',
  name: 'Lionel Messi',
  position: 'Forward',
  number: 10,
),
Player(
  profileImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb-NGEQDekk2BwsllLjk4tcIM_BPIzXECdsg&s',
  name: 'Cristiano Ronaldo',
  position: 'Forward',
  number: 7,
),
Player(
  profileImage: 'https://static.independent.co.uk/2024/01/13/20/1930383623.jpg?width=1200&height=1200&fit=crop',
  name: 'Kevin De Bruyne',
  position: 'Midfielder',
  number: 17,
),
Player(
  profileImage: 'https://fifpro.org/media/ljynhbtc/imago1048759872.jpg?rxy=0.6490127416930614,0.17086775309119126&width=1600&height=1024&rnd=133774572369470000',
  name: 'Luka Modrić',
  position: 'Midfielder',
  number: 10,
),
Player(
  profileImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeyWNRy8KNyRYNuf71kk_uZmqf8NoaKgjwnw&s',
  name: 'Virgil van Dijk',
  position: 'Back',
  number: 4,
),
Player(
  profileImage: 'https://assets.goal.com/images/v3/blt95902a74b232ba08/b9325da9052fac4ae7ed47c98c68b529a4e701df.jpg?auto=webp&format=pjpg&width=3840&quality=60',
  name: 'Sergio Ramos',
  position: 'Back',
  number: 4,
),
Player(
  profileImage: 'https://akcdn.detik.net.id/community/media/visual/2025/03/16/thibaut-courtois-1742102620281.jpeg?w=600&q=90',
  name: 'Thibaut Courtois',
  position: 'Keeper',
  number: 1,
),
Player(
  profileImage: 'https://images.ctfassets.net/3mv54pzvptwz/5eTv6hTyA1pqkFClYRn0qt/be626a573cbf1ee7e421b73f87ed6851/20221205_foto_GETTY_neymar_jr_jogo_brasil_x_coreia_copa_do_mundo__209_.jpg',
  name: 'Neymar Jr',
  position: 'Forward',
  number: 11,
),
Player(
  profileImage: 'https://s.hs-data.com/bilder/spieler/gross/119750.jpg',
  name: 'Robert Lewandowski',
  position: 'Forward',
  number: 9,
),
Player(
  profileImage: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/03/23/09/MANUEL-NEUER.jpg',
  name: 'Manuel Neuer',
  position: 'Keeper',
  number: 1,
),
  ].obs;

  static var to;

  void updatePlayer(int index, Player newPlayer) {
    players[index] = newPlayer; 
  }
}