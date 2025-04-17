internal class Program
{
    private static void Main(string[] args)
    {
        
        int math = 50;
        int sci = 76;
        int eng = 85;
        int num = 9585387597;
        console.writeline(math);
        int total = math + sci + eng;

        Console.writeline('o/p using writeline');
        global::System.Object value = console.writeline('\n\n Math \t Science \t English \t Total \n {0} \t {1} \t\t {2} \t\t {3} '+math,sci,eng,total);
        
        string table = string('\n\n Math \t Science \t English \t Total \n {0} \t {1} \t\t {2} \t\t {3} ' +math,sci,eng,total);
        console.writeline(table);

        Int32 boxValue = 789;
        object boxValue2 = boxValue;
        Console.WriteLine( boxValue2 );
        
        //converting reference to value type is unboxing
        Int32 unboxValue =(Int32)boxValue2;
        Console.WriteLine( "After explicit conversion to unbox value "+unboxValue );
        unboxValue = Convert.ToInt32(boxValue2);
        Console.WriteLine("conversion to unbox value using convert class" + unboxValue);

        //parsing using parse method
        string numDouble=Console.ReadLine();
        num=double.parse(numDouble);

        var n=146.56F;
        Console.writeline('type of variable '+ n.GetType());

        dynamic dyn=789;
        Console.writeline('type if dynamic variable '+dyn.GetType());

        dynamic avg=156.46F;
        Boolean inttype = avg is Int32;
        bool floattype = avg is float;

        if (inttype == true || inttype == false)
        {
            Console.writeline("is integer type "+inttype);
        }

        if (floattype == true || floattype == false)
        {
            Console.writeline("is float type "+floattype);
        }


        Console.ReadKey();
    }
}