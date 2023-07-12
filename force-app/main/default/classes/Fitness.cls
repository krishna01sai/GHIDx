public class Fitness {
    
    public static Decimal calculateBmi(Decimal bodyWeight, Decimal bodyHeight){
	
	Decimal c = (bodyWeight/(bodyHeight * bodyHeight));
        return c;
    }

}