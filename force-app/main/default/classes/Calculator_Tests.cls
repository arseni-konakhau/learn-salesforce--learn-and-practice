@isTest
public with sharing class Calculator_Tests {
    @isTest
    public static void testAddition() {
        Test.startTest();
        Integer i = Calculator.addition(3, 2);
        System.assertEquals(5, i, 'Expected result of "addition": 5');
        Test.stopTest();
    }

    @isTest
    public static void testSubtraction() {
        Test.startTest();
        Integer i = Calculator.subtraction(3, 2);
        System.assertEquals(1, i, 'Expected result of "subtraction": 1');
        Test.stopTest();
    }

    @isTest
    public static void testPositiveMultiply() {
        Test.startTest();
        Integer i = Calculator.multiply(3, 2);
        System.assertEquals(6, i, 'Expected result of "multiply": 6');
        Test.stopTest();
    }

    @isTest
    public static void testNegativeMultiply() {
        Test.startTest();
        Boolean excpt = false;
        try {
            Integer i = Calculator.multiply(0, 0);
        } catch (Calculator.CalculatorException e) {
            if (e.getMessage().equalsIgnoreCase('It doesn\'t make sense to multiply by zero')) {
                excpt = true;
            }
        }
        Test.stopTest();
        System.assert(excpt, 'expected at least one exception to have occured for "multiply"');
    }

    @isTest
    public static void testPositiveDivide() {
        Test.startTest();
        Decimal i = Calculator.divide(6, 2);
        System.assertEquals(3, i, 'Expected result of "divide": 3');
        Test.stopTest();
    }

    @isTest
    public static void testNegativeDivide() {
        Test.startTest();
        Boolean excpt = false;
        try {
            Calculator.divide(5, 0);
        } catch (Calculator.CalculatorException e) {
            if (e.getMessage().equalsIgnoreCase('you still can\'t divide by zero')) {
                excpt = true;
            }
        }
        Test.stopTest();
        System.assert(excpt, 'expected exception for "divide" 1');
    }

    @isTest
    public static void testNegativeDivideToNegative() {
        Test.startTest();
        Boolean excpt = false;
        try {
            Calculator.divide(5, -1);
        } catch (Calculator.CalculatorException e) {
            excpt = true;
            // if (e.getMessage().equalsIgnoreCase('Division returned a negative value.' + i)) {}
        }
        Test.stopTest();
        System.assert(excpt, 'expected exception for "divide" 2');
    }
}
