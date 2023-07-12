@isTest
private class TempConverterTest {
    static testMethod void testCelsiusToFahrenheit() {
        Decimal celsius = 100;
        Decimal expected = 212;
        Decimal result = TempConverter.celsiusToFahrenheit(celsius);
        System.assertEquals(expected, result);
    }
}