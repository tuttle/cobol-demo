*> Reads and displays all the transactions previously saved by seq_write.cbl.
IDENTIFICATION DIVISION.
    PROGRAM-ID. SeqRead.
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT InFile ASSIGN TO "transactions.dat"
                ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
    FILE SECTION.
        FD InFile.
        01 TransactionDetails.
            05 FromAccount  PIC 9(5).
            05 ToAccount    PIC 9(5).
            05 Amount       PIC 9999.99.

    WORKING-STORAGE SECTION.
        01 Eof PIC X VALUE "N".
        01 Counter PIC 999999 VALUE 0.


PROCEDURE DIVISION.
    OPEN INPUT InFile.

    PERFORM UNTIL Eof = "Y"
        READ InFile
            AT END
                MOVE "Y" TO Eof
            NOT AT END
                DISPLAY "From   >>> " FromAccount
                DISPLAY "To     >>> " ToAccount
                DISPLAY "Amount >>> " Amount
                DISPLAY " "
                ADD 1 TO Counter
    END-PERFORM

    DISPLAY "End of file. Number of records >>> " Counter

    CLOSE InFile.
