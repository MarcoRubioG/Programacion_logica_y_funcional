sumar:: Integer -> Integer -> Integer
sumar x y= x+y

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial(n-1)

menu :: IO()
menu = do
    putStrln("=== MENU ===")
    putStrln("Que deseas hacer?")
    putStrln("1)Factorial")
    putStrln("2)Salir")

    opcion <- getLine

    case opcion of
        "1" -> do
             putStrln("Introduce el Numero")
             n1 <- getLine
             let x = read n1 :: Integer
             putStrln("El resultado es: "++ show (factorial x))
        "2"-> do
            putStrln("ADIOS")
        _ -> do
            putStrln("Opcion no valida")
            menu


main :: IO()
main = print(factorial 5 )
main :: IO()
main = print(sumar 10 20 )
 