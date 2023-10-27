# Compiler Project

Compiler project built for [CS 4386](https://catalog.utdallas.edu/2022/undergraduate/courses/cs4386).

## Resources Used

- [CS Princeton's CUP User Manual](https://www.cs.princeton.edu/~appel/modern/java/CUP/manual.html#spec)
- [JFlex Manual](https://jflex.de/manual.html#Example)
- [Java CUP Manual (no longer active website; need to use wayback machine)](https://web.archive.org/web/20220407005956/https://www2.cs.tum.edu/projects/cup/examples.php)
- [Random Google Group Post from 2001](https://groups.google.com/g/comp.compilers/c/fGHJWkTkZG8)

## What is inside


<details close>
<summary>p3tests</summary>

- badDec.as
- badInc.as
- badNegation.as
- badString.as
- badTernaryCond.as
- badTernaryTypes.as
- boolToFloat.as
- boolToInt.as
- callNonExistFunc.as
- charToFloat.as
- charToInt.as
- floatToInt.as
- fullValidProgram.as
- incompatBinary.as
- intArrayToBoolArray.as
- noReturn.as
- reassignFinal.as
- redefMethod.as
- redefVar.as
- redefVarAsMethod.as
- returnTypeBad.as

</details>

<details close>
<summary>p3tests_output</summary>

- badDec-output.txt
- badInc-output.txt
- badNegation-output.txt
- badString-output.txt
- badTernaryCond-output.txt
- badTernaryTypes-output.txt
- boolToFloat-output.txt
- boolToInt-output.txt
- callNonExistFunc-output.txt
- charToFloat-output.txt
- charToInt-output.txt
- floatToInt-output.txt
- fullValidProgram-output.txt
- incompatBinary-output.txt
- intArrayToBoolArray-output.txt
- noReturn-output.txt
- reassignFinal-output.txt
- redefMethod-output.txt
- redefVar-output.txt
- redefVarAsMethod-output.txt
- returnTypeBad-output.txt

</details>

<details close>
<summary>Java files</summary>

- JAR
  - jflex-full-1.8.2.jar
  - java-cup-11b-runtime.jar
  - java-cup-11b.jar
- JAVA
</details>

<details close>
<summary>JFLEX file</summary>

- tokens.jflex

</details>

<details close>
<summary>CUP file</summary>

- grammer.cup

</details>

<details close>
<summary>Makefile</summary>

- Makefile

</details>

<details close>
<summary>README</summary>

- README.md

</details>

  
<hr>

# Grammar Implemented

```
Program                     ➞  class id { MemberDeclerations }
MemberDeclerations          ➞  FieldDeclerations MethodDeclerations
FieldDeclerations           ➞  FieldDecleration FieldDeclerations | λ
MethodDeclerations          ➞  MethodDecleration MethodDeclerations | λ
FieldDecleration            ➞  OptionalFinal Type id OptionalExpression ;
                            |   Type id [ integerliteral ] ;
OptionalFinal               ➞  final | λ
OptionalExpression          ➞  = Expression | λ
MethodDecleration           ➞  ReturnType id ( ArgumentDeclerations ) { FieldStatements Statements } OptionalSemi
OptionalSemi                ➞  ; | λ
ReturnType                  ➞  Type | void
Type                        ➞  int | char | bool | float
ArgumentDeclerations        ➞  ArgumentDeclerationList | λ
ArgumentDeclerationList     ➞  ArgumentDecleration, ArgumentDeclerationList | ArgumentDecleration
ArgumentDecleration         ➞  Type id | Type id []
Statements                  ➞  Statements Statement | λ
Statement                   ➞  if ( Expression ) { FieldDeclerations Statements } IfEnd
                            |   while ( Expression ) { FieldDeclerations Statements }
                            |   Name = Expression ;
                            |   read ( ReadList ) ;
                            |   print ( PrintList ) ;
                            |   printline ( PrintLineList ) ;
                            |   id () ;
                            |   id ( Arguments ) ;
                            |   return ;
                            |   return Expression ;
                            |   Name ++ ;
                            |   Name -- ;
                            |   { FieldDecleration Statements } OptionalSemi
IfEnd                       ➞  else { FieldDeclerations Statements } | λ
Name                        ➞  id | id [ Expression ]
Arguments                   ➞  Expression, Arguments | Expression
ReadList                    ➞  Name, ReadList | Name
PrintList                   ➞  Expression, PrintList | Expression
PrintLineList               ➞  PrintList | λ  
Expression                  ➞  Name
                            |   id ()
                            |   id ( Arguments )
                            |   integerliteral
                            |   characterliteral
                            |   stringliteral
                            |   floatliteral
                            |   true
                            |   false
                            |   ( Expression )
                            |   ~ Expression
                            |   - Expression
                            |   + Expression
                            |   ( Type ) Expression
                            |   Expression BinaryOperator Expression
                            |   ( Expression ? Expression : Expression ) 
BinaryOperator              ➞  * | / | + | - | < | > | <= | >= | == | <> | \|\| | &&
```
  



## How to run
```  
$ make               // Input: badDec.as
$ make badDec
$ make badInc
$ make badNegation
$ make badString
$ make badTernaryCond
$ make badTernaryTypes
$ make boolToFloat
$ make boolToInt
$ make callNonExistFunc
$ make charToFloat
$ make charToInt
$ make floatToInt
$ make fullValidProgram
$ make incompatBinary
$ make intArrayToBoolArray
$ make noReturn
$ make reassignFinal
$ make redefMethod
$ make redefVar
$ make redefVarAsMethod
$ make returnTypeBad 
$ make clean         // clean-up root directory;
```

<br><hr>

