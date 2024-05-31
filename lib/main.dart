import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.blue),
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        home:HomeActivity()

    );
  }



}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});


  MySnackBar(message,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message)));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("Inventory App"),
        titleSpacing: 15,
        //centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: (){MySnackBar("Comments", context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackBar("Seaech", context);}, icon: Icon(Icons.search))
        ],

      ),

      floatingActionButton: FloatingActionButton(

        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        onPressed: (){
          MySnackBar("I am floting action button",context);

        },


      ),


      bottomNavigationBar: BottomNavigationBar(

        //currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile" )

        ],

        onTap: (int index){
          if(index==0) {

            MySnackBar("I am home Menu", context);

          }if(index==1){
            MySnackBar("I am contacts Menu", context);
          }if(index==2){
            MySnackBar("I am Profile Menu", context);
          }

        },


      ),

      drawer: Drawer(

        child: ListView(

          children: [
            DrawerHeader(

                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName:
                  Text("Nahid Hasan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      //fontWeight:FontWeight.w600,
                      backgroundColor: Colors.redAccent,



                    ),),
                  accountEmail: Text("Info@Nahid.com"),
                  currentAccountPicture: Image.network("https://www.google.com/search?client=firefox-b-d&sca_esv=ea05bd65b2dab007&sca_upv=1&q=%40mdnahidhasan999&uds=AMwkrPu_SJTRB4ZX2y7zhHd8IFRv9oTxj2rfp0oLvt4zevAjgIzxBynz_33SKEsIl7HH5kqIYOKmnXsZYSmLg8x7gYv9pD48ivVruhoEimNrUIAI9j-U9Q-K8ASJqVZkq0pvElww8FwdIvNFUwdTEXKac3OfHv7HslraEU5M-10YxGYNfhsmsF1scUU7vUnJkKuasSVR2EQ_I3WSGWKBfiM76oc5LTwGIIkAjanEDLGZURG3GklOb9n6PAm_Yl50yUAiwTaERN5InnATsSFzAo6dBOK2uJbXBfa5YBNr45_cfGJq3wsxycc&udm=2&prmd=ivsnmbz&sa=X&ved=2ahUKEwiX6dfkp8OFAxUmzzgGHcd1AqcQtKgLegQIDRAB&biw=1366&bih=635&dpr=1#vhid=yqiRq-Xho_McEM&vssid=mosaic"),

                )

            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap:(){
                  MySnackBar("Home", context);
                }),
            ListTile(
                title: Text("Contact"),
                leading: Icon(Icons.contacts),
                onTap:(){
                  MySnackBar("Contact", context);
                }),
            ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person),
                onTap:(){
                  MySnackBar("Profile", context);
                }),
            ListTile(
                title: Text("Email"),
                leading: Icon(Icons.email),
                onTap:(){
                  MySnackBar("Email", context);
                }),
            ListTile(
                title: Text("Phone"),
                leading: Icon(Icons.phone),
                onTap:(){
                  MySnackBar("Phone", context);
                })//nahidhasan

          ],
        ),

      ),

    );

  }

}

