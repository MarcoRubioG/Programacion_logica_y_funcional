--Sacar Promedio de Numeros--
promedio :: [Double] -> Double
promedio xs = sum xs / fromIntegral (length xs)

--SumarMonedas--
monedas :: Double -> Double -> Double -> Double -> Double  
monedas a b c d = a + b * 5 + c * 10 + d * 50

--Sacar volumen de esfera--
volumen :: Double -> Double
volumen radio = (4/3) * pi * (radio ** 3)

--Verificar si a  b y c son iguales---
sonIguales :: Double -> Double -> Double -> Bool
sonIguales a b c = a == b && b == c

--Verificar si a  b y c son diferentes---
sonDiferentes :: Double -> Double -> Double -> Bool
sonDiferentes a b c = a /= b && b /= c && a /= c

--Calcular precio final con descuentos incluidos si aPlican--
precioFinal :: Double -> Double
precioFinal precio
    | precio > 1000 = precio * 0.6  
    | precio > 500  = precio * 0.7  
    | precio > 100  = precio * 0.9  
    | otherwise     = precio        

--Obtener ultima cifra De un numero--
ultimaCifra :: Integer -> Integral
ultimaCifra numero = read [last (show numero)] :: Int

menu :: IO()
menu = do
    putStrLn "=== MENU ==="
    putStrLn "Que deseas hacer?"
    putStrLn "1)Sacar Promedio de 4 numeros"
    putStrLn "2)Calcular Monedas "
    putStrLn "2)Sacar Volumen de esfera "
    putStrLn "4) Verificar si tres numeros son iguales"
    putStrLn "5) Verificar si tres numeros son diferentes"
    putStrLn "6) Calcular precio final con descuento"
    putStrLn "7) Obtener ultima cifra de un numero"



    opcion <- getLine
    case opcion of
        "1" ->do
             putStrLn "Introduce el Primer Numero"
             n1 <- getLine
             let x = read n1 :: Double

             putStrLn "Introduce el SegundO Numero"
             n2 <- getLine
             let y = read n2 :: Double

             putStrLn "Introduce el Tercer Numero"
             n3 <- getLine
             let z = read n3 :: Double

             putStrLn "Introduce el Cuarto Numero"
             n4 <- getLine
             let i = read n4 :: Double

             let numeros = [x, y, z, i]
             let resultado = promedio numeros
             putStrLn ("El promedio es  : " ++ show resultado)
             menu 
        "2" -> do
             putStrLn "Introduce las monedas de 1 que tiene "
             n1 <- getLine
             let x = read n1 :: Double

             putStrLn "Introduce las monedas de 5 que tiene "
             n2 <- getLine
             let y = read n2 :: Double

             putStrLn "Introduce las monedas de 10 que tiene "
             n3 <- getLine
             let z = read n3 :: Double

             putStrLn "Introduce las monedas de 50 que tiene "
             n4 <- getLine
             let i = read n4 :: Double

             let resultado = monedas x y z i
             putStrLn ("Tienes un total de : " ++ show resultado)
             menu 
        "3" -> do
            putStrLn "Introduce el radio de la esfera:"
            n1 <- getLine
            let radio = read n1 :: Double
    
            let resultado = volumen radio
            putStrLn ("El volumen de la esfera es: " ++ show resultado ++ " metros cubicos ")
            menu
        "4" -> do
            putStrLn "Introduce el primer numero:"
            n1 <- getLine
            let a = read n1 :: Double

            putStrLn "Introduce el segundo numero:"
            n2 <- getLine
            let b = read n2 :: Double

            putStrLn "Introduce el tercer numero:"
            n3 <- getLine
            let c = read n3 :: Double

            let resultado = sonIguales a b c
            putStrLn ("Los numeros son iguales?:  " ++ show resultado)
            menu

        "5" -> do
            putStrLn "Introduce el primer numero:"
            n1 <- getLine
            let a = read n1 :: Double

            putStrLn "Introduce el segundo numero:"
            n2 <- getLine
            let b = read n2 :: Double

            putStrLn "Introduce el tercer numero:"
            n3 <- getLine
            let c = read n3 :: Double

            let resultado = sonDiferentes a b c
            putStrLn ("Los numeros son diferentes?: " ++ show resultado)
            menu

        "6" -> do
            putStrLn "Introduce el precio de compra:"
            n1 <- getLine
            let precio = read n1 :: Double

            let resultado = precioFinal precio
            let descuento = precio - resultado
            putStrLn ("Precio original: $" ++ show precio)
            putStrLn ("Descuento aplicado: $" ++ show descuento)
            putStrLn ("Precio final: $" ++ show resultado)
            menu

        "7" -> do
            putStrLn "Introduce un numero:"
            n1 <- getLine
            let numero = read n1 :: Integral

            let resultado = ultimaCifra numero
            putStrLn ("La ultima cifra de " ++ show numero ++ " es: " ++ show resultado)
            menu

        _ -> do
            putStrLn "Opcion no valida"
            menu
    


main :: IO()
main = menu