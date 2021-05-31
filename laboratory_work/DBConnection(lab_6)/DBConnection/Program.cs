using System;
using MySql.Data.MySqlClient;

namespace DBConnection
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {

                Console.Write("Введите имена питомцев:");

                var name = Console.ReadLine();

                var connectionString = "Server=localhost;Database=sberbank;Uid=root;Pwd=1234";

                using var connection = new MySqlConnection(connectionString);

                connection.Open();

                using var command = connection.CreateCommand();

                command.CommandText = " SELECT * from cats WHERE name = @name ";

                command.Parameters.AddWithValue("name", name);

                using var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Console.WriteLine($"Питомец: {reader.GetInt32(1)} {reader.GetString(0)}");
                }

                reader.Close();

                connection.Close();
            }

            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
         
         
        }
    }
}
