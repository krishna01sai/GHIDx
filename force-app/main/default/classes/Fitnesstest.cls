@isTest
public class Fitnesstest {
    
    @isTest
    public static void sai(){
       Decimal bodyWeight = 2.5;
       Decimal bodyHeight = 10.2;
      Decimal  d = Fitness.calculateBmi(bodyWeight,bodyHeight);
        system.assertNotEquals(20.5, d,'A not equals to b');
    }

}