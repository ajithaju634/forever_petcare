import 'package:flutter/material.dart';
import 'package:petapp/screens/Adopt/splashscreen.dart';
import 'package:petapp/screens/Grooming/grooming1.dart';
import 'package:petapp/screens/doctor/doctorappoinment.dart';
import 'package:petapp/screens/training.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      

      backgroundColor: const Color.fromARGB(255, 235, 229, 229),
    
      body:SingleChildScrollView(
        child: Column(
          children: [Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRULfjmLzq86ePpxgqXZiqq9XbZe7fchdrG8g&s"),
                ),
              )
            ],
          ),
          Container(
            width: 352,
            height: 121,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                  width:146 ,
                  height: 93,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
              child: Image(image: AssetImage("asset/image 1 (1).png")),
                )
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Training()));
                      },
                        child: Container(width: 155,height: 141,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black),
                        child:Image.network("asset/Rectangle 1.png"
                                        
                        ,fit: BoxFit.fill,) 
                        ),
                      ),
                      Text("Trainig",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),SizedBox(width: 30,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Adoptsplashscreen()));
                      },
                        child: Container(width: 155,height: 141,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                        child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC6Y9ge08pPNmKXDvO7nnhN27vN6TZY1M5qA&s" ,
                        fit: BoxFit.fill,) 
                        ),
                      ),
                      Text("Adopt",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],),SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  InkWell(onTap: () {
                    
                  },
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 155,height: 141,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black),
                        child:Image(image: AssetImage("asset/Rectangle 8.png"))
                        ),
                        Text("Medicine",style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),SizedBox(width: 30,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 155,height: 141,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                      child:Image.network("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAREBUQEhAVFRUXFRcYFxUVFRgYGBYXFxcXFxYVGBgYHSggGBonGxcVITEhJSkrLi4uGB8zODMsNygtLisBCgoKDg0OGhAQGyslIB8tLy0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0rLS0tLS0tLS0tLf/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAABAAIEBQYDBwj/xAA/EAABAwIEAwYEAwYFBAMAAAABAAIRAyEEBRIxQVFhBhMicYGRMqGx0UJSwQcUI2Jy8BWCkrLSM6Lh8SQ0c//EABkBAQADAQEAAAAAAAAAAAAAAAABAgMFBP/EAC4RAAICAQMCBAMJAQAAAAAAAAABAhEDBBIhMUETUWGRBSIyFTNxgaGxwfDxI//aAAwDAQACEQMRAD8A9lKBRQUAakiU1AJBFBABBFBABJFJCQJJJIBIhBJAFGU2UpQDpQlNLkJQD5SlMlGUA6UpTZSQDpQlBIoAyhKCCgBlApSmkoBySakgHylKaEUA6UkJSQCSQSQEtApxTVJA1JFAoAIJJIAJJJIAIIlAoSKUEkJQBlCUJQlAHUoj8wZMBwFyJJ5CTHOEceT3b4MHSb8rLLOZSGH1tkua4+Pi0gaQR0Ake6wy5Nro1x49ys4dqM7qYcEeF5iz9yL8WHgRNx8lmq+bVWU26KjjVMSQbCSSTbeLtjmCVRZ/mL6jwwm4dAPQ8I/uUM0xJBaxnA+J0XPGL7Cf/KJtrklxS6GwyXtTiqdQa6vfMjxNMQ224qEzPuPqt/lua0q7dVNwN4IkSD1C8L/xIGKYggC5mxdfjyE+8laDsrmbqVVpBES0G0EtnxO9LKqm4vklwTXB7CCjK5U3Sukr0mAZSQlJCBSgighIpQlJBQBSlKBSQDpRBTUUA6UpTUkA6Uk2UkBPKanFNKsQAoIoKABBFBABBEoIBIFFNKABQKKaUJAkUlGxuJ0NJDS48Gjj68FAI2fT3DoNxB84MlYLF5oKQ7okaXNO3Dn5GQT7q0zTPK9U0xTptaS4gFxMAbucbWGkE7Gw4qwy/JcLi8O5zmyJIB2II3josMuOV3JUejFONVF2eP4mu12IaQNnCeolNz2q8VHNNhqNr3vwW4xvYSiHTTqObB2N1GzHsu1ztQcQ7nA/sKqmkavFJmHpNDRJ3iw4+qtcpqOdUptbu5wb6uIH2RzLs6+kC6ZHzKvv2eZOHVm1XwQ0w1kiZNg+OXCeZ4KaUjNtx6nrWEHgHkpAXNgPFdF6UeViSSSQCQJRTHoAlwTZCg/vBdHhEF5HxiYAs63Enh1RYDxYeOzyTY2EeSEk2UlHl03iI9ZXdAGUZTUHvAEk8h7mAoA9JQMDmAqPeyILSY6tBLdX+oO+SnSidgKS5HXw0/NFLBaoFJBWIAU1OQQAQKJQQAQKKBQHNz+C5uJ/MfZAP6jzn5JveCCWkH148pUEh72LEmfJPa6RK4l323Rc/S0c9h5qUrdIhulbDVqgf36fUhU2c5s2jSc9zdQEDTzc4wAenEpZpj+7FYi5ZTB+Y+6xfabNDUotaIguBkcxB+pldHFhpHOy5d0qJ7s0YXOqVPh8Id0ZUIpu9g8qz7NY393w9RjxIp1Idp3AcSJA4iQbb39Fi8xrfwP69LT/AJXB36KzytrQxtSXaagLKgDz8bYkwZaQRpdcbkqNXi3rgtosuzlvizU1MVSqeKm8OHTgeRG4PQqHiIAkiOZNlXYXAYmkKgw9Oi4Bpl1UAEAzcPp9YtpPos07CVajpqgh4J8Q1OafIxELieGd/wASkXWY4xnduc0g6RJI2Hkdif1VJgXd23W2W92zhzLdDY5GSPYpmPrOhtEFpaD4/i1TFpJsTfZLMjoDaHEHVU/r4M/ygx5ucujpMO1c9zmazPulx2/c33Z7Pa/dudXeHAODbiL6RMOG953BWqwmKZVbqYZH0815Fjcd4WMaYa2XebnGSf09FbZVnJw7WRJeWkm9gHOloI42HzXtzaWMvp4ZzsOqlGt3KPTUlGy7GNrUm1W7OG3IgwR7gqSuY1TpnTTTVoSa/ZOQdsoJKehh2B3hwwA7wmfCIIH/AFI6+6lVGADwi/iMcCSkaYZquYmTufQTt5BcsNpLnDW52lxaZ2veOsShYWEE6XBhaCz8RuJuWkc5O8qaDZQ2tGtrjUcTpLYmGmLyRzUphshDG1yACSSAORI+iyWfVXk90yo6XEEDWZBkaXaTcR57StZXeACTwuq2rmVGnSFSAA5xAgQT8RB9Q2VSSshkLK82ojU9zxrEipx0ODzLABdxc8uIA3AHJS8BmlSrUcdDmM1hrRUEOPhJJDdxeDfgsliuzBFZz2YrQ/vNYBgEki1/UiVU5kalOs41ajyC14EOdBqSG+IzJaLnrpAVXLlIHolTHY5pgYak8D8Qr6Q7rpLSR5SUlnqOKyzSA/E09UXAYxgHQNLSQPMlJWsHpqBTkFoBqBTkCgGpFFBANQdsnJjzY8LICO1oFrWHAQN0zQ0TAAne2/3TgLTqB5mBw3TA64GoExPDjsfJRRI1zoO4+3h2UKviLF522aOQ4nzP2QxhqSGuc2IBdDdjxgzseXLzVVnOIiGz1917NPi7s8epy9l2K7O8RLsQ389AR1MD7LHGrroE8nM+jvsrnNMbs4/lI9Bx+aoMvb/Bq8tbCOktMhdFKlRzd1yvyJeLbNEdHT7AD9VYZIdQfS/MNTR/MyTbzaXj1C406M0B1B/v5KNgahaQZgtIvyISUbEJ0i6GeGlSc0kwBYtEw07gg7hUuY5k4MljnOcdibb7QAp+IEuf4RBMgDYNcJiOVyFVZazU7QdmE34Hkfa65Wp06lKM48KXX08zs6TVOMJY5O3Hp6+Q7LKHdUzXcJLTFOb6qpuXnmGzq8y0cSoGkl44mb9eZV7j6gqQAIYwaWN5cyepNyouGoAEuXQhjpHMnmu/7yRHgl8dY9lMwhL3ueeZA8hafkuFGwdU5An14KVgWQwDotkjzyZvewmJmlUpfkfI8nj7td7rTrA9jMRoxOmbPaW+o8Q+hHqt8uVqobcj9TraSe7EvTgSBRQK856SIWuDnEkQYgRcc78eCYS4EyBEi88IufdSXslca1DUCCAQeCgk4EvLm/CIJ1A3JHAtINrp7qwa0k8zYXJ8gj3EOLgBJAB8ht9SkGCIIlGDMZr2krs3w/gdYC5ceEiN9xYLAZ7m73PYzUH06ZdDdJpl08+I309F65jqNN0F4B07Tw8lj8XlmDfUeC9lM7NbEQ47vII3MW8lRRfcqZ05w5tPS6qaggNfwJDYLSOLd3gkHkm4qqbtZUbVZpc5wdIFOGiXaidREugTExsprOyLdRqHENDBq1Dw6pFwJ2IIv7Kpx2XvwwA0uNMhr3VGh0OBggHgACCRPNRSBucoyh4oM1ua50S4ua0mSSTJLZsTHoisIO0jfxtqvdxd31QT6A2SSibPoUoJyC1A1ApyCAagnFAoBqa8WKemlARajDBEAzIuOnFc20dMaWN4CBYCFMKi4/HUqDQ+q8MaSGgniTsBzKApcZV02JvJlZrOq/jN+AWhzfEUq7RVpPBBFnDYjr/dlh86rkTK6Wlz48nC6rsc3WYMmPlq0+5TZziZGkJZOwmk6xh1RsHmACLc7ghdclwFOvVL6xilTGpzR8VTcim3z0mTwAKtP34VHyQ1rRAa1ohrQJ0taOQEfNepO5HjcagT+7Hdaeiq6lDiFPOJkEDmVHJV0ZS9BtRhexsTIGl0bxqLgfLxR6Jj2hgj8Tom8wBtfzPyCkURd3/51P8AYVEpUSb8I4rHa3Jx7dfez0KaUFJ9Xx7UMde3uueJe8NIbTJsdo5cpldWuGrSF1pHitaMd1FTVe5tJrS0gucAZHC5/RWlIWVPm9eazGD8I1HzNh8gfdW9G4CRE+xKwlc03tqDdrg72Mr1dpBEjY3HkvI5XpPZrEd5haR4huk/5Tp+gC8WujwpHt+Hz5cfzLNBFBc46gCmFPKY4oBjiuTinuKjVqwaCSfhBcecD/0oAnrJ5jldWvVfVLmQ3UxoInT4ocbg6nFvExEq7zfG02Ui9xI8J0uHMi1+G43ssiztCCyoNQaQYfMOaHGz4E3mDHoqylRDKvGMo4fS4l7GuGhzI0kkgtkOuIcPxDkrjL87ZVpPLj4gxrGM0G9nBoA4zpN+iymd4/vHSKY7trYg/iJBAda0iBz+qi4TMXN1Pa7Rq2MyQWiInnBd7lU7EWPzHJwahdT8bXBrtXeNElzGudY7eIkRwhJcKGY4XSNWHcXcSDE9YJ4pK/JJ9LlBFBaAaUE4oIAJpTkEA1NKcU0oBpK88/aNjKeIdRwwu6niWvdeNqbzHsVuM2qllJzgYIBInmvF2vxFas+tVcH1GhxAsCNgN+nDy5qGSjQMoVNOmk4BmlznMIgjiHtix6je8qIcsfRaa2KcHNEaOIe6T4T0tF+YUXJM0c4BzSRpJBtMg8BHEXhvtstPSzTQdFRgY13wsqgGw4ln4Rfc8eKpGKbvuXlOUVt7GbrZ331QPw+Hog7DwgaZEWgibE22slVYWloNEtDt3NuAecDhPkrqrl+GrkmjTbRqsJcWtsH/AIjpA+LiY3810pZgTW7ssAYbahA1cJt1mxK9un3Xwzxajbt5Rne/DbEpzMSCmZ5lopYgEDwvkeThB+iiCkNg4g8l1b4OM406LejUEO/of/tKjY/HNa0Mby35rnhQ5skkRpd9I2VS2oXuVF94/wAF/Jo1/wA1+L/gscFxcVKDobKjUxACqe1eZCnR7sHxVJHk3if09VM5KCbZTHBzkooiYPE99WdV4E2/pFm/KFpcM5Zbsxg6pAJbDfn5LbUcG3gIXM+0oQVNNs7H2VPI7TSRKwOX1a3/AE6TnfzRDf8AUbLcdmsuq4ekWVC0y7UA0zEgAgmOilYP+Fh2NPBjQfOAulLEBwMFZavWvwnJrgabSwjkpO2SEiolHEcOVlI1LzYskckFOPRnslFxdMRXNxTyVyeVoVGuKos3xmHI/iOdScJDXEFpvuAYhwPLZXLnKoz7DMq09LmU3O/D3hjSfzAwbqH0IZ5ljs5rMqCnqc+k1vwhwILRfc8Ra3RdMwrU4LKbWXaw6iCRNnhwHP7ldsRlLdTg6jT8JOsNc4R5Aaj1khcTjaQp6KQLi5zYfAA8IA1AniBbgFSu5BFqU9RNV9TSL6tLQA0nZsWAsqythgGuqND9GoCY8N53J42Oy2PZMkue9x1NeAHyPxm2u9idpjmpebf/AF6n8ItLH0amobHXrlzIvLb25+aiTrktFWZfDdmjVY2o6p3RLR4O5eYAEB06byAHf5klCfgiSSH1HCTDizccD4jO0JK5B9LJIoK4AUCiUCgGoJyCkWNKaU8hCEIshY+mCwybRtMSvJc7p1KVWriGsZ4ANAEGOcE2BgwTH4hvK9Yzhg7o6iA3jP0jj5fVea5j2fq19dWXNafDTYfDbfUWjYEgG/JUkWRgaea6nlzJZqlxbbwvETtG/TiVIy2rTa497ULqj7yBq0sHykmwHFXGa9lqdBrGDcag5w31EA/ZR8TldZ1PTh9JqsALQ0CYB5k2P6qES3ZJxGZ0cHiWOcCXAAgh06TwkDaFos3qO71lQMhj294x3CX3c3z1T7rAYPs/jcRUc51NzSxsFzhHiENA69fLqvXey7DUw4oVmCo0WkzyBlp33tNtlrinsmmZZYb4OJnqlSnWLe8nwmR1IBEfP5KBjcNTbqcCIi88Fa9scjxNBpq4ZnesG7B/1GDnA+MeV+nFeb1sXXrGHEx+UWH/AJXUWaLXynLenkn8xZ08ZLajuEBo83GTHkB80sJSITKOG0tDTwJJ/q4+23opFNtV9qLJ/ndZg8vzenuFVZYwTyTfUs8MptY4K6OuJxrKLZc654c+gHEqFgcnfiq37xVbAsGtPABXGW9mGNd3lVxqP/M7YdAOAVvWxDKYgELk6rXPL8seh2dF8Pjh+afUWGwbWCAArfJcF3lUW8IILjwjl6rllGV1a/jdLGcz8Tv6QeHU/NTcZg6Lmd2GkBp12c6dQsCSDfbZYYNLKck2aazXwxQaRosY8lrgD5qDk28G8ap9UcI8vod8fxjbkRuueQv/AIrx0WnxFVp2vVI5ujlebd5qyS2xI6qe02Va4+I+imUjYLyfDZbtPH29mdDP9bOpcgKbnXCxvZ7PK1TGYik/a5b/AC6H6YHS/wAltsvfLfX9AvdFplc2OWJ7ZHF+DfwIWbzDs3j6usivTBJ8LSSWtHAmWmT0t58Fo83zelhg01NXikDSJ2j7ql7Odoho0VnPe81PCYmxgAE8LyolKKdM0x6TLkxvJFcL9f8ACBjOxmMINOliqYa9o7xxZpe54jxeEbQAI4heePyauap70w4mWgcYdDnQNmgX9QvoBeUdozpqOa8QHVHMa4jwyXu0tqEeKJi0wpkqPMjJYfGvw1YtaS9kmDq8Okm0gcrglbYYluIy9xJjZxAN4ZVE+kfVUNTJDQbqdQpvbB1uFRwJm03EADoq7D1RRNamaoc0Yeo2nBB8T3NJbbcy0LKfK4LxdM1VLKqrgHU6dNzDdrqtBj3lpuC53eCbdBaElVYfM3FoIx9KiItSAeQzpskrlT3JBFcMViqdMS94aOpWhKTbpCZWBHLgQdweRTpXnGdZ3VOKqAOYaTiwscAd6ZkAwRfe/ELcZdWe+m17gLibbfNSqatCUJRdSVMnpLEZd+0WhVxQwvcvGqoWNeC0g3IBI3At1W4bdCoITmMkpQu9MQEYRCzPDa2ETFt+PovNcwzOtRxDqbKJc0bOc4hpgW4Sf1XqzxKrMZl7HbhZuy6PLf3epUpgVnNZufiGr5+XJSssyk6u8bUdpDYDAQ1v9RIgn1W3r5TSO7QfNRqeVsYDcx9FCbDK7T3l2lpEQdLrmL6Z2i5UvAVXUzOkQYjoLAyZg+iq2dnMCyqa1Om5pJ1EsqPYCeJgGFYVcVTkjxiBuCDHulijHftMxGJFZgoOc4OE6Gk6tc+e1lGyLsriHt11aoY9wLpDNTgSby6YBvwv1EK2wuh7y9+vVrLJqOGohriNI0iACfrutLh8SAGtdAJs1rYgRwniQBw5LRSaKyimU+X9naWHEFgqk/ie0OjoGxDd9+NlGzY0acvgMcATp2a4AX0/lPTbyWhq16byaYIJA1RPDmvIO3uca6/dg2aCDfjtHXY+6pkW/qXxvZ9J3zDtQ57tLDpHMqZ2cqufXaW/xC0hxtIgG+9uaqOweWU8RWc+oJDAPD1PFeht7jC0iWM0yTsOvE8ArY1GHRe5XLKU+G3XoaClmUCCOkbERZVpf4nzsW2PqVHq4tjWte7Z8QbEX2lSmVGSHag4EebSt4Ztr6HhzaPxI0pGgoj+Cz+gf7VU5cHMrOJBAIEW3UuljnAgEM0xAEX9LqfTpB4kCn/pM/VeXUQWbG4eZ6sUNkk/JUV2LqBjhqOnVZuq2ojlO6l4Z9k/F4NtRzO8ZTe5pJYXNJ0yDJEmxXZmHcBA0D/KfusdNgWGCgmbzm5O2ecZLU05nWH8tYe1ULfdmqxe2oDwePYtH2KkfupmYpz/AEH7pUcJonSGNnfS0ifZy2itpfVZvGnuquF+hZimDuFX5RlP7uHjVq1vLtoieCPdP/MPZ3/JHun/AJh7O/5K7q7MoykouKfD6/kT4XlPbLvqmIqUWUmFrXh5LiRMPLoHW3zXpHdO/MPY/wDJV2c4Jgo1XaGatDnatEGRxmSVEnwVSPOP8ZNRpoV6PdnQSO8IcCYlrY2Mw70BVfk+Ia5jXvbdoLWWsWluqHcxMpuePc8DUGU4PxOMnkDpiZgHj9lWZWdEu1mGuaAL9Zj/ALfQLCfKJ7l7Sy1tUd4alMarw6Jjh8oSXXK8Rge5ZroBzou4uIm5SUJepU92Deay3bXLKtRodSa5/AtBAPQiSFqUHCQvQ1fBvgzSwzU49UeR0OzuOdLThiBH4nNE9JBMFXlPD5vp0tDWAAgB1Ta0CwBWwrvqNcRpGmJB68ioTsxePwD3KrsSXc9E9dkyStqPPoeVYbsHmNOu1+hpi+pj4IPrBWuwGQY1ml7qz9wSwOcdjYEzBWnbj6h2pz5T9lPwjHuEvboHATJP2RxjJ2yMery4sbhCkm76X+9kTD4qsTBou3Anw8eO6u+CjlzG8EGYsFXbR40dpTKoTpTXKAQqzVW4trj4eHHqrd7ZUPEU1SrJMrnOYCiIA4iegm5Wew+NL9BDjes5pjazXb8/hEeau+0tIU/G9stMBx8zAPTdUuXZZomJMO1Njr59CQpaJTomYfDf/IJM2cdLeZN5HvxVpXYGFxtqDQ2eU3LR/wBpJ4o5Vhnd6XlunULB0S1oa1omOZDjE/YXX+H07vLQXHcqUirZmqDtJcKYGt/gmLuI4k/lHy+ua7bdlQ2hFKkXO5t+ImLl3Tf1K3+TZWKb3uiSXG5uYPDy6KwxuGDuClA8t/Zrkr6bXOcCHGJB5TyXoL8EI2tySw9JjHF0Ac1MdVG/BEw0Y3NcG9ry/S94bENDWmL8iRPoq/N8TNE/wnguBjRTcI5yJseq3dcNfbY8Cqp9JxfE6QJkQpBkOyvaB1RulzwC2QQ4w4+krZ4LMHAAg+yrsdleGdepTDiD8RA1AeY3HVR6WHFO7D4OHik+xQG1ZX1ljuv6FTVlsszJoiXbFXNfN6TG6tYPQEfPkFALFJV1DNqbgIOon8oJFxO5+qntdKAVOq0kgEGDBg7HeDysQnpjaYGw336p6AKru0NcU8LWe4EgUnyAJO3AKxRaLj++CrOW2LfkSuTx/s12dOZtqDU8FjgXlzi0XLtENgyQG/JW4/ZFU1Ccbqp6mktNMtJAiQXB3neOK9Qpug7J768cDHO33WWnyRyw3UJRpmBqdhsaCRTxVBjPwt7s2HskvRklr4cSokk2SkrkhIRLR09kgnBCDhUJF+CY1xdcKSQkhJG/dQfiPoPuk7CU4hvhPMH681TZ7nzaBdJ2IBG0SDCpx2lAc24cypBaZuDMObHSyzcol1CVWbCi1zRDiLceabXrxwVazGzYFTBhqjhuB5q/BQ5VKzjxXEuU+nlvN8+QXUZezjJ9fsgMf2mo95Rczm0j3VRk1N5Y0aSYEE+S9GfltE2NMHzkrk/L6IaWNptaP5WgQjjZFmbo0zTuRE9QprMXbZTW5fJvBHCQu9PBAW0s9k2sWVIxQF/nwXd9bWw6TJj/ANKy/wAOpcaTP9I+yNPAUm3bTaPJoH0U0LMflFUw6pUdEkwDaALEn1VhUe0/CeC0NTCMcILGnzAK41MtpHemPQR9FVRLOdmLxdWCS52ggxvE/dPwwc7etPKQCR67lXuM7J4Wq4Oc18jaKjrekpjOydFohr6ovPxD9QrUVsq/3DXbvL+QUrLezVMS4uDuQ0xHncyu9XsoCZbiKrT00/ZdsPlWLpfDig8cqlMfVpH0ShZwrdl6bgAXENBB0tEei5VsgwNZxa9jgQBs57ZHDzEhaHFVIZdwa7z+UrEZX37qleoKb9ReIaXADe8aoAEKkpU6LqNpsv8AFZd3bQWEua3Zpi3qN0/CYsOuPl9lC7nGVdLDRdTafjLnMMAflDSZnqrNnZ+nMgvbebO4qU2yrRY0g0rsKTeS40MFpsHO9YUoU+qsDn+7hDuLruG9UdKiUVJNPuLOHcnmEH0HREj2P3UnSgQVTHhjjVREpNjWl0bD3P2STtSS1Is6QlCCSgCSlJJSASlKSSArsxyfD157xmqRB6jkVEb2WwUtPcyWCGyT4R0g2SSUUhufmWWEwFGkIp02sG9mgSTxPNSpSSUkClLUkkgASmEIJIBrQE8OSSUkClKQkkoJFISlJJAKQlISSQClKUkkAi0FMbRaNgPYJJIB4CKSSAKSKSAUpakkkANSWtJJADWikkpB/9k=",fit: BoxFit.fill,) 
                      ),
                      Text("Services",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  InkWell(onTap: () {
                    
                  },
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Grooming1()));
                        },
                          child: Container(width: 155,height: 141,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black),
                          child:Image(image: AssetImage("asset/Rectangle 5.png"))
                          ),
                        ),
                        Text("Grooming",style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),SizedBox(width: 30,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Doctorappoinment()));
                      },
                        child: Container(width: 155,height: 141,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                        child:Image.network("asset/Rectangle 6.png",fit: BoxFit.fill,) 
                        ),
                      ),
                      Text("Veterinarian",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],)
              ],
            ),
          )
          ],
        ),
      )
    );
  }
}