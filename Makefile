JAVA=java
JAVAC=javac
JFLEX=$(JAVA) -jar jflex-full-1.8.2.jar
CUPJAR=java-cup-11b.jar
CUP=$(JAVA) -jar $(CUPJAR)
CP=.:$(CUPJAR)

default: run

run: badDec

.SUFFIXES: $(SUFFIXES) .class .java

.java.class:
	$(JAVAC) -cp $(CP) $*.java

FILE=	Lexer.java parser.java sym.java \
	LexerRules.java ParserTest.java TypeChecking.java Interpreter.java \
	Program.java Memberdecls.java Methoddecl.java Fielddecl.java Expr.java Stmt.java \
	Argdecl.java Name.java BinaryOp.java BaseToken.java

all: Lexer.java parser.java $(FILE:java=class)

badDec: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/badDec.as > p3tests_output/badDec-output.txt
		cat -n p3tests_output/badDec-output.txt

badInc: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/badInc.as > p3tests_output/badInc-output.txt
		cat -n p3tests_output/badInc-output.txt

badNegation: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/badNegation.as > p3tests_output/badNegation-output.txt
		cat -n p3tests_output/badNegation-output.txt

badString: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/badString.as > p3tests_output/badString-output.txt
		cat -n p3tests_output/badString-output.txt

badTernaryCond: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/badTernaryCond.as > p3tests_output/badTernaryCond-output.txt
		cat -n p3tests_output/badTernaryCond-output.txt

badTernaryTypes: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/badTernaryTypes.as > p3tests_output/badTernaryTypes-output.txt
		cat -n p3tests_output/badTernaryTypes-output.txt

boolToFloat: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/boolToFloat.as > p3tests_output/boolToFloat-output.txt
		cat -n p3tests_output/boolToFloat-output.txt

boolToInt: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/boolToInt.as > p3tests_output/boolToInt-output.txt
		cat -n p3tests_output/boolToInt-output.txt

callNonExistFunc: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/callNonExistFunc.as > p3tests_output/callNonExistFunc-output.txt
		cat -n p3tests_output/callNonExistFunc-output.txt

charToFloat: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/charToFloat.as > p3tests_output/charToFloat-output.txt
		cat -n p3tests_output/charToFloat-output.txt

charToInt: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/charToInt.as > p3tests_output/charToInt-output.txt
		cat -n p3tests_output/charToInt-output.txt

floatToInt: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/floatToInt.as > p3tests_output/floatToInt-output.txt
		cat -n p3tests_output/floatToInt-output.txt

fullValidProgram: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/fullValidProgram.as > p3tests_output/fullValidProgram-output.txt
		cat -n p3tests_output/fullValidProgram-output.txt

incompatBinary: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/incompatBinary.as > p3tests_output/incompatBinary-output.txt
		cat -n p3tests_output/incompatBinary-output.txt

intArrayToBoolArray: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/intArrayToBoolArray.as > p3tests_output/intArrayToBoolArray-output.txt
		cat -n p3tests_output/intArrayToBoolArray-output.txt

noReturn: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/noReturn.as > p3tests_output/noReturn-output.txt
		cat -n p3tests_output/noReturn-output.txt

reassignFinal: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/reassignFinal.as > p3tests_output/reassignFinal-output.txt
		cat -n p3tests_output/reassignFinal-output.txt

redefMethod: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/redefMethod.as > p3tests_output/redefMethod-output.txt
		cat -n p3tests_output/redefMethod-output.txt

redefVar: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/redefVar.as > p3tests_output/redefVar-output.txt
		cat -n p3tests_output/redefVar-output.txt

redefVarAsMethod: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/redefVarAsMethod.as > p3tests_output/redefVarAsMethod-output.txt
		cat -n p3tests_output/redefVarAsMethod-output.txt

returnTypeBad: all
		$(JAVA) -cp $(CP) TypeChecking p3tests/returnTypeBad.as > p3tests_output/returnTypeBad-output.txt
		cat -n p3tests_output/returnTypeBad-output.txt

clean:
	rm -f *.class *.bak Lexer.java parser.java sym.java *.txt

Lexer.java: grammar.jflex
	$(JFLEX) grammar.jflex

parser.java: tokens.cup
	$(CUP) -interface < tokens.cup

parserD.java: tokens.cup
	$(CUP) -interface -dump < tokens.cup


