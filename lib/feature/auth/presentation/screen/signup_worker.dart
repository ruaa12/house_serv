// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class SignupWorker extends StatelessWidget {
  static String id = 'signupWorker';
   SignupWorker({super.key});
    final formKey = GlobalKey<FormState>();
    List<signupData> data = [
      signupData(
       field1: CustomTextField(validator:
                        (value){
                          if(value!.length >= 3 ){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid Name';
                          }
                        },
                        keybourdTybe: TextInputType.name,
                        label:'Full Name',
                        hintText:' Name' ,
                        controller: TextEditingController(),),
          

       field2: CustomTextField(validator:
                        (value){
                          if(value!.contains('@gmail.com')){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid E-mail';
                          }
                        },
                        keybourdTybe: TextInputType.emailAddress,
                          label: 'Email',
                      hintText:'user@gmail.com' ,
                        controller: TextEditingController(),),


       field3:  CustomTextField(validator:
                        (value){
                          if(value!.length == 10 ){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid Phone';
                          }
                        },
                        keybourdTybe: TextInputType.phone,
                         label: 'Phone',
                        hintText:'0911111111' ,
                        controller: TextEditingController(),),

          field4:CustomTextField(validator:
                        (value){
                          if(value!.length >= 8 ){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid Password';
                          }
                        },
                        keybourdTybe: TextInputType.visiblePassword,
                        label: 'pasword',
                      hintText:'xxxxxxxx' ,
                        controller: TextEditingController(),),
          ),
          signupData(
            field1: CustomTextField(validator:
                        (value){
                          if(value!.length >= 5 ){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid Service';
                          }
                        },
                        keybourdTybe: TextInputType.text,
                        label:'sevice',
                        hintText:'Enter type of service ' ,
                        controller: TextEditingController(),),  
            field2: CustomTextField(validator:
                        (value){
                          if(value!.length >= 10 ){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid Adress';
                          }
                        },
                        keybourdTybe: TextInputType.streetAddress,
                        label:'Adress',
                        hintText:'Syria_aleppo' ,
                        controller: TextEditingController(),),  
            field3: CustomTextField(validator:
                        (value){
                          if(value!.length >= 1 ){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid experience';
                          }
                        },
                        keybourdTybe: TextInputType.number,
                        label:'Experience',
                        hintText:'Enter number yer of experience' ,
                        controller: TextEditingController(),), 
            field4: CustomTextField(validator:
                        (value){
                          if(value!.length >= 10 ){
                            return null;
                          }
                          else {
                            return 'Please Add A Valid salary';
                          }
                        },
                        keybourdTybe: TextInputType.number,
                        label:'salary per hour',
                        hintText:'XXX' ,
                        controller: TextEditingController(),), )
          
    ];
     PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: PageView.builder(
        allowImplicitScrolling: false,
        reverse: false,

        controller: pageController,
          itemCount: data.length,
          itemBuilder: (context, index) =>  SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250,),
                Container(
                    padding: EdgeInsets.all(25),
                    decoration:
                     const BoxDecoration(
                      color: color4,
            
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        
                        )
                    ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                     const Text('Enter your information to sign up ',
                       style: TextStyle(
                      fontSize: 18,
                       fontWeight: FontWeight.bold),
                       ),
                      const SizedBox(height: 60,),
                      Form(
                        key: formKey,
            
                        child: Column(
                          children: [
                      data[index].field1,
            
                         const SizedBox(height: 20,),
            
                         
                        data[index].field2,
            
                         const SizedBox(height: 20,),
            
                       data[index].field3,
            
                            const SizedBox(height: 20,),
                  
                         data[index].field4,
            
                          const SizedBox(height: 70,),
                          
            
                          ],
                          
                         ),
                         ),
                         index == data.length-1?  Button(ontap: ()
                          {if(formKey.currentState!.validate()){
                         Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder:(context) => HomeScreen(),));
                          }else{
                    
                          }
                       
                      }, name: 'Sign up') 
            
                      :Button(ontap: ()
                          {if(formKey.currentState!.validate()){
                         pageController.nextPage(
                          duration: const Duration(seconds: 2), 
                          curve: Curves.ease );
                          }else{
                          }
                       
                      }, name: 'Next') ,
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             const Text('already have an account?',
                             style: TextStyle(
                              fontSize: 16,
                             ),),
                            TextButton(onPressed: () {
                              Navigator.push(context,
                               MaterialPageRoute(builder: (context) => 
                                LoginScreen(),
                              ));
                              
                            }, child: const Text('log in now',
                            style: TextStyle(
                              fontSize: 16,
                              color: color3
                            ),)),
                          ],
                        ),
                         
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    
  }
}
class signupData {
  final CustomTextField field1;
  final CustomTextField field2;
  final CustomTextField field3;
  final CustomTextField field4;


  
  signupData({
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
  });

}
