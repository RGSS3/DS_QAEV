# General Language Little Tour For DS_QAEV


### More resources
https://docs.scala-lang.org/cheatsheets/index.html


### immutable variables
using val to define immutable variable(readonly)

```scala
/// <variables1.scala>
object Hello {
    def main(args: Array[String]) = {
        val a = 3
        val b = 5
        println(a + b)
    }
}

```

```bash
scala variables1.scala
```

### mutable variables
using val to define mutable variable(can be reassigned)
```scala
/// <variables2.scala>
object Hello {
    def main(args: Array[String]) = {
        var a = 3
        val b = 5
        a = 6
        println(a + b)
    }
}
```

```bash
scala variables2.scala
```

### types
![Types](https://docs.scala-lang.org/resources/images/tour/unified-types-diagram.svg)
https://docs.scala-lang.org/tour/unified-types.html



```scala
/// <types.scala>
object Hello {
    def main(args: Array[String]) = {
        val a : Int = 3;
        val b : String = 5; // error
    }
}
```

```bash
scala types.scala
```

### functions

```scala
/// <functions.scala>
object Hello {
    def add(a : Int, b : Int) : Int = a + b
    def foo(a : Int) : Unit = {
    // def foo(a: Int) : Unit = { 
    // is also OK
        println(s"Hello $a")
    }
    def main(args: Array[String]) = {
        println(add(3, 5))
        foo(42)
    }
}
```

```bash
scala functions.scala
```

Note: if nothing is to be returned, the type is Unit and can be omitted like we do in main

### classes

```scala
/// <classes.scala>
class Person(name : String, var age : Int) {
    def getName = name
    def getNameAndAge = s"$name($age)"
    def getAge() = age
    def setAge(newAge : Int) = {
        age = newAge
    }
}
object Hello {
     def main(args: Array[String]) = {
        val p = new Person("Maya", 24)
        println(s"${p.getName} ${p.getAge()}")
        p.setAge(6)
        println(p.getNameAndAge)
    }
}
```

```bash
scala classes.scala
```

### control flows

```scala
/// <control.scala>
object Hello {
    def gcd(a : Int, b : Int) : Int = 
        if b == 0 then a else gcd(b, a % b)
        
    def gcdwhile(a : Int, b : Int) : Int = {
        var aa = a
        var bb = b
        while (bb != 0) {
            val c = aa
            aa = bb
            bb = c % aa
        }
        return aa
    }
    
    def main(args : Array[String]) = {
        println(gcd(192, 288))
        println(gcdwhile(192, 288))
    }
}
```



```bash
scala control.scala
```

