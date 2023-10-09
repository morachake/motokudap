import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentBalance : Float = 300;
  currentBalance := 300 ;

   stable var startTime = Time.now();
   Debug.print(debug_show(startTime));

    Debug.print(debug_show(currentBalance));

   public func  topUp (amount : Float){
      currentBalance += amount;
      Debug.print(debug_show(currentBalance))
   };

   public func withDraw (amount : Float) {
      let tempValue : Float = currentBalance - amount ;
      if (tempValue >= 0){
          currentBalance -= amount ;
      Debug.print(debug_show(currentBalance))
      } else{
         Debug.print("Number mora than amount")
      }
     
   };

   public func checkBalance () : async Float {
      return currentBalance
   };

   public func compound (){
      let currentTime = Time.now();
      let TimeElapsedNS = currentTime - startTime ;
      let TimeElapsedS = TimeElapsedNS / 1000000000 ;
      currentBalance := currentBalance * (1.01  ** Float.fromInt(TimeElapsedS));
      startTime := currentTime
   }
};
