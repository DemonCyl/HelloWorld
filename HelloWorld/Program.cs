using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            String str =  Console.ReadLine();
            Console.WriteLine("Hello {0}", str);
            Console.WriteLine(typeof(String));
            Console.ReadLine();
        }
    }
}
