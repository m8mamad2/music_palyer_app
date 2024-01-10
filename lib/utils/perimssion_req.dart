
// import 'package:permission_handler/permission_handler.dart';

//   Future req(List<Permission> permissions)async{
    
//     Map<Permission,PermissionStatus> status =  await permissions.request();
//     for(var i in status.values){
//       if(i.isGranted){ print('IN Granted');}
//       else if(i.isDenied){
//         await permissions.request();
//         print('In Denied');
//       }
//       else if(i.isPermanentlyDenied){ 
//         print('In OpenSetting');
//         openAppSettings(); }
//       else{
//         print('In Else --> ${status.values} ,, $status');
//       }
//     }
//   }
  