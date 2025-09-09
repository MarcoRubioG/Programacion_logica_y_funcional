//Expresion 1
//Va a mostar 10 ya que primero musetra antes de incrementar 
//Si volvemos a impirimir x pero ahora solo ahora si mostrata el incremento en 1
class Expresion1 {
    public static void main(String[] args) {
        int x=10;
        int b=10;
        System.out.println(x++);
        System.out.println(x);
    }
}
//Expresion 2
//Ahora primero va ser esta parte ++ la cual seria lo mismo a 1 + y ya pone x dando como resultado 1+10 =11
class Expresion2 {
    public static void main(String[] args) {
        int x=10;
        int b=10;
        System.out.println(++x);
    }
}
//Expresion3 
//Ahora primer se expresa b++ que es 10 * -3 luego el otro es 10 % *- 3 dando -3 por lo tanto se evalua -33 == -3 dando resultado un false 
class Expresion3 {
      static int x=10;
     static int b=10;
    
    public static void main(String[] args) {
         boolean total = b++ * -3 == -3 % x++;
        System.out.println(total);
    }
}


//Expresion4 30 - 10 /= % ++b + 30 % 7 * 2
class Expresion4 {
      static int x=10;
     static int b=10;
    
    public static void main(String[] args) {
        double j= 30 - 10;
        j/= ++b + (30% 14);
        System.out.println(j);
    }
}