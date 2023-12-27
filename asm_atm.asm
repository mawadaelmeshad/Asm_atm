.MODEL SMALL
.STACK 100H

.DATA
    id DW 1
    password DW 7
    balance DB '20000 $'
    added_deposit_one DB '21000 $'
    added_deposit_two DB '22000 $'
    added_deposit_three DB '24000 $'
    withdraw_balance_one DB '19000 $'
    withdraw_balance_two DB '18000 $'
    withdraw_balance_three DB '16000 $'
    user_id DB ?
    user_password DB ?
    operation DB ?
    added DB ?
    amount DW ?
    cont DB ?
    ans DB ?

    WELCOME_MSG DB '                     *** Welcome to our ATM System ***                          $'
    ALAA_MAWADA DB '                        developed by Alaa & Mawadah      $'
    ENTER_ID_MSG DB ' Enter your ID: $'
    ENTER_PASS_MSG DB ' Enter your password: $'
    INVALID_INFO_MSG DB ' Incorrect information, please try again!$'
    MENU_MSG DB ' Choose the operation you want!$'
   
    OPERATIONS_MSG1 DB ' 1- Show your balance $ '
    OPERATIONS_MSG2 DB ' 2- Deposit $'
    OPERATIONS_MSG3 DB ' 3- Withdraw $'
    
    OPERATIONS_MONEY DB '1. 1000 EGP   $'
    OPERATIONS_MONEY2 DB '2. 2000 EGP  $'
    OPERATIONS_MONEY3 DB '3. 4000 EGP $'
    
   
    SHOW_BALANCE_MSG DB ' Your current balance is: $'
    DEPOSIT_MSG DB ' Choose the amount you want to deposit: $'
    WITHDRAW_MSG DB ' Choose the amount you want to withdraw: $'
    
    INVALID_OP_MSG DB 'Invalid operation!$'
    CONTINUE_MSG DB 'Press 1 if you want to continue $'
    THANK_YOU_MSG DB '                    *** Thank you for using our ATM ***       $'
    NEWLINE DB 0DH,0AH,'$'
    balance_str DB 6 DUP(?) ; Buffer to convert balance to string

.CODE
MAIN PROC
    .STARTUP
WELCOME:
    MOV AH, 09H
    LEA DX, WELCOME_MSG
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    MOV AH, 09H
    LEA DX, ALAA_MAWADA
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H

ATM_LOOP:
    MOV AH, 09H
    LEA DX, ENTER_ID_MSG
    INT 21H
    MOV AH, 01H
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    SUB AL, '0'
    MOV user_id, AL

    MOV AH, 09H
    LEA DX, ENTER_PASS_MSG
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    SUB AL, '0'
    MOV user_password, AL

    MOV AX, id
    CMP AL, user_id
    MOV AX, password
    CMP AL, user_password

    MOV AH, 09H
    LEA DX, MENU_MSG
    INT 21H
 
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    MOV AH, 09H
    LEA DX, OPERATIONS_MSG1
    INT 21H
    
    MOV AH, 09H
    LEA DX, OPERATIONS_MSG2
    INT 21H
    
    MOV AH, 09H
    LEA DX, OPERATIONS_MSG3
    INT 21H
    
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    MOV AH, 01H
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    SUB AL, '0'
    MOV operation, AL
    CMP operation, 1
    JE SHOW_BALANCE
    CMP operation, 2
    JE DEPOSIT
    CMP operation, 3
    MOV AH, 09H
    LEA DX, WITHDRAW_MSG
    INT 21H
    MOV AH, 09H
    LEA DX, OPERATIONS_MONEY
    INT 21H
    
    MOV AH, 09H
    LEA DX, OPERATIONS_MONEY2
    INT 21H
    
    MOV AH, 09H
    LEA DX, OPERATIONS_MONEY3
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    
    MOV AH, 01H
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    JMP WITHDRAW
    
    
    
SHOW_BALANCE: 
    MOV AH, 09H
    LEA DX, SHOW_BALANCE_MSG
    INT 21H

    MOV AH, 09H
    LEA DX, balance
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    JMP EXIT_ATM

DEPOSIT:
    ; Prompt the user to enter the deposit amount
    MOV AH, 09H
    LEA DX, DEPOSIT_MSG
    INT 21H
    
    MOV AH, 09H
    LEA DX, OPERATIONS_MONEY
    INT 21H
    
    MOV AH, 09H
    LEA DX, OPERATIONS_MONEY2
    INT 21H
    
    MOV AH, 09H
    LEA DX, OPERATIONS_MONEY3
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    MOV AH, 01H
    INT 21H
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    MOV AH, 09H
     LEA DX, SHOW_BALANCE_MSG
     INT 21H
    SUB AL, '0'
    MOV added, AL
    CMP added, 1
    JE ONE
    CMP added, 2
    JE TWO
    CMP added, 3
    JE THREE
ONE:
     MOV AH, 09H
     LEA DX, added_deposit_one 
    INT 21H
    JMP EXIT_ATM
    
TWO:
    MOV AH, 09H
    LEA DX,added_deposit_two
    INT 21H
    JMP EXIT_ATM
THREE:
     MOV AH, 09H
     LEA DX, added_deposit_three
     INT 21H
     JMP EXIT_ATM
 WITHDRAW:
    MOV AH, 09H
    LEA DX, SHOW_BALANCE_MSG
    INT 21H
    SUB AL, '0'
    MOV added, AL
    CMP added, 1
    JE ONESUB
    CMP added, 2
    JE TWOSUB
    CMP added, 3
    JE THREESUB
    
ONESUB:
     MOV AH, 09H
    LEA DX, withdraw_balance_one
    INT 21H
    JMP EXIT_ATM
    
TWOSUB:
    MOV AH, 09H
    LEA DX, withdraw_balance_two
    INT 21H
    JMP EXIT_ATM
THREESUB:
     MOV AH, 09H
     LEA DX, withdraw_balance_three
     INT 21H
    JMP EXIT_ATM
EXIT_ATM:
    MOV AH, 09H
    LEA DX, NEWLINE 
    INT 21H
    MOV AH, 09H
    LEA DX, THANK_YOU_MSG
    INT 21H
    MOV AH, 4CH
    INT 21H


MAIN ENDP
END MAIN
