# Question: Membership

Membership is to ask whether an element is belong to a set, either concrete or abstract.

## The trait
```scala
/// <ms.trait.scala>
trait Membership[T] {
    def contains(a : T) : Boolean
}
```

## Example 1
```scala
/// <ms.ex1.scala>
object MSEx1 {
    object SomeObject extends Membership[Int] {
        def value = Array(1,2,3,4,5)
        def contains(a : Int) : Boolean = 
            value contains a
    }
    
    object SomeObject2 extends Membership[Int] {
        def contains(a : Int) : Boolean = 
            a % 2 == 0
    }
    
    def main(args : Array[String]) = {
        println(SomeObject contains(5))
        println(SomeObject contains(10))
        
        println(SomeObject2 contains(5))
        println(SomeObject2 contains(10))
    }
}

```

Since membership is actually a predicate (returning bool):
we can combine two such object into one:

```scala
/// <ms.ex2.scala>
object MSEx2 {
    def inBoth[T](a : Membership[T], b : Membership[T]) : Membership[T] =
        new Membership[T] {
            def contains(c : T) : Boolean = 
                (a contains c) && (b contains c)
        }
        
    def inEither[T](a : Membership[T], b : Membership[T]) : Membership[T] =
        new Membership[T] {
            def contains(c : T) : Boolean = 
                (a contains c) || (b contains c)
        }
        
    def notIn[T](a : Membership[T]) : Membership[T] =
        new Membership[T] {
            def contains(c : T) : Boolean =
                !(a contains c) 
        }
        
    object SomeObject extends Membership[Int] {
        def value = Array(1,2,3,4,5)
        def contains(a : Int) : Boolean = 
            value contains a
    }
    
    object SomeObject2 extends Membership[Int] {
        def contains(a : Int) : Boolean = 
            a % 2 == 0
    }
    
    def main(args : Array[String]) = {
        val a = inBoth(SomeObject, SomeObject2)
        val b = inEither(SomeObject, SomeObject2)
        val c = notIn(SomeObject)
        for (i <- -5 until 10) {
            print(i)
            print(" In both " + (a contains i))
            print(", In either " + (b contains i))
            println(", No in a " + (c contains i))
        }
        
    }
}
```




```bash
scalac ms.*.scala
```

```bash
scala MSEx1
```

```bash
scala MSEx2
```
