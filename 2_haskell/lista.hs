lista ::[Integer] -> Integer
lista(x: xs) = x

lista2 ::[Integer] -> [Integer]
lista2(x: xs) = xs
lista3 ::[Integer] -> Integer ->[Integer]
lista3 a b = b:a

lista4 ::[String] -> String ->[String]
lista4 a b= b:a

lista5 ::Char -> String -> String 
lista5 a b=b:a

lista6 ::[Integer]
lista6 ::[1..1000]

fun1 ::[Integer ]-> Integer
fun1 [] = 0
fun1 (x:xs) = x + fun1  xs
fun2 ::[Integer ]-> Integer
fun2 [] = 0
fun2 (_:xs) = 1 + fun2  xs


main =print(fun1 [1,3,5] )
--main=print(lista4 ["Enchiladas","Tacos"] "Pozole" )
--main=print(lista3 [1,2,3,4,5] 100 )
--main=print(lista5 'h' "ola" )
--main=print(take 3 lista6 ) 
--main=print(dropt 3 lista6 )
--main=print(sum lista6 )
--main=print(cycle lista6 )
--main=print([10] )
--main=print(replicate 10 '*' )