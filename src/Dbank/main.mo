import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300; // Persistence variable
  // currentValue := 400; // Replace current value

  let id = 01; // let is just as constant in js
  // Debug.print(debug_show(id)); // Priting hello in terminal

  stable var startTime = Time.now();
  Debug.print(debug_show (startTime));

  // Creating a private function
  // func topUp() {
  //   Debug.print(debug_show(currentValue))
  // };

  // Creating a public function
  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdrawl(amount : Float) {
    // Conditionals
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Deposited amount is less than withdrawl");
    };
  };

  // Query Calls
  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsed = currentTime - startTime;
    let timeElapsedS = timeElapsed / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
