*> Asks the user for From and To account number (up to 5 digits long) and the amount
*> having value no larger than 9999.99 and appends such record to the file.
IDENTIFICATION DIVISION.
    PROGRAM-ID. SeqWrite.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT OPTIONAL OutFile ASSIGN TO "transactions.dat"
                ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
    FILE SECTION.
        FD OutFile.
        01 TransactionDetails.
            05 FromAccount  PIC 9(5).
            05 ToAccount    PIC 9(5).
            05 Amount       PIC 9999.99.

    WORKING-STORAGE SECTION.
        01 ShouldContinue   PIC X   VALUE "C".
            88 Done         VALUES "Q" "q".

PROCEDURE DIVISION.
    OPEN EXTEND OutFile.
    DISPLAY "Enter transaction, use Q command to quit.".
    PERFORM SaveTransaction UNTIL Done.
    CLOSE OutFile.
    STOP RUN.

SaveTransaction.
    DISPLAY "From   > " WITH NO ADVANCING.
    ACCEPT FromAccount.
    DISPLAY "To     > " WITH NO ADVANCING.
    accept ToAccount.
    DISPLAY "Amount > " WITH NO ADVANCING.
    ACCEPT Amount.

    WRITE TransactionDetails.
    DISPLAY "Enter to add new record, 'Q' to quit > ".
    ACCEPT ShouldContinue.
