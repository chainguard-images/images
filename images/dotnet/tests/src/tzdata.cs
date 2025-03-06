using System;

class Program
{
    static void Main()
    {
        try
        {
            // Try to find the Eastern Standard Time time zone
            var timeZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            Console.WriteLine($"Time Zone found: {timeZone.DisplayName}");
        }
        catch (Exception ex)
        {
            Console.WriteLine("Timezone error: " + ex.Message);
            Environment.Exit(1);
        }
    }
}