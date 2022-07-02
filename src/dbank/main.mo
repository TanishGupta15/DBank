import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;

  stable var startTime = Time.now();
  startTime := Time.now();

  public func topUP(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount too large, currentValue is less than zero!");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){

    var curTime = Time.now();
    var timeElapsedNS = curTime - startTime;
    startTime := curTime;
    var timeElapsedS = timeElapsedNS / 1000000000;

    currentValue := currentValue * (1.01) ** Float.fromInt(timeElapsedS);
  };

}