.8086
.model small
.stack 100h


;MAPA
; CALABOZO DESCONOCIDO ----> COCINA (CONSEGUIS EL CUCHILLO )  

;DEPOSITO --------> DEPOSITO A (PELEAS Y CONSEGUIS LA LLAVE QUE ABRE EL ARMARIO)

;ENFERMERIA ---------> CUARTO DE SUMINISTROS (ENFERMERA TE DA UNA PISTA)

;BARRACAS ---------> ZONA DE ENTRENAMIENTO 
		



.data 

flag_contencion db 0
filename db 'persiah.bmp',0

filehandle dw ?

Header db 54 dup (0)

Palette db 256*4 dup (0)

ScrLine db 320 dup (0)

ErrorMsg db 'Error', 13, 10,'$'


TIEMPO5 db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                DB "                              UN TIEMPO DESPUES...     ",0dh,0ah
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                DB 0dh,0ah           
                db 0dh,0ah,24h

               


	  MENU   DB "",0dh, 0ah											
           DB "   PRISION DE SAMARCANDA",0dh, 0ah
           DB "",0dh, 0ah
           DB "",0dh, 0ah
           DB "   Estas en el calabozo del viejo recluso... a donde quieres ir???",0dh, 0ah
           DB "",0dh, 0ah
           DB "   1 <<< A LA ZONA DE CALABOZOS DESCONOCIDA. ",0dh, 0ah             
           DB "",0dh, 0ah
           DB "   2 <<< AL DEPOSITO",0dh, 0ah
           DB "",0dh, 0ah
           DB "   3 <<< A LA ENFERMERIA",0dh, 0ah
           DB "",0dh, 0ah
           DB "   4 <<< A LAS BARRACAS",0dh, 0ah
           DB "",0dh, 0ah
           DB "   9 <<< MIRAR LIBRETA",0dh, 0ah        
           DB "",0dh, 0ah,24h

;CALABOZO DESCONOCIDO ----> COCINA  
MENU_CALABOZO DB "",0dh, 0ah											
              DB "   PRISION DE SAMARCANDA",0dh, 0ah
              DB "",0dh, 0ah
              DB "",0dh, 0ah
              DB "   Ahora estas en un calabozo desconocido... Hacia donde quieres ir?",0dh, 0ah
              DB "",0dh, 0ah
              DB "   1 <<< CELDA 200. ",0dh, 0ah
              DB "",0dh, 0ah
              DB "   2 <<< CELDA 201.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   3 <<< CELDA 202. ",0dh, 0ah
              DB "",0dh, 0ah            
              DB "   4 <<< CELDA 203.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   5 <<< CELDA 204.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   6 <<< CELDA 205.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   7 <<< TORRE DE VIGILANCIA.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   8 <<< AVANZAR HACIA LA COCINA.",0dh, 0ah ; EVENTO PRINCIPAL.
              DB "",0dh, 0ah
              DB "   9 <<< MIRAR LIBRETA.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   0 <<< VOLVER AL CALABOZO DEL VIEJO RECLUSO.",0dh, 0ah
              DB"",0dh, 0ah,24h

;//////////////////////////////////////////////////////////////////////////////////////////////////////

;DEPOSITO --------> DEPOSITO A
MENU_DEPOSITO DB "",0dh, 0ah											
              DB "   PRISION DE SAMARCANDA",0dh, 0ah
              DB "",0dh, 0ah
              DB "",0dh, 0ah
              DB "   Estas en el deposito... que deseas hacer?",0dh, 0ah
              DB "",0dh, 0ah
              DB "   1 <<< INTENTAR ABRIR ARMARIO GIGANTE ",0dh, 0ah  ;           
              DB "",0dh, 0ah
              DB "   2 <<< REVISAR LAS CAJAS",0dh, 0ah      ;
              DB "",0dh, 0ah
              DB "   3 <<< BANCO FRENTE A LA ARMERIA",0dh, 0ah;ACA TE DAN LA ARMADURA. PRIMERA ACCION DESPUES DE LOS CALABOZOS
              DB "",0dh, 0ah
              DB "   4 <<< IR AL DEPOSITO A",0dh, 0ah ;
              DB "",0dh, 0ah
              DB "   9 <<< MIRAR LIBRETA",0dh, 0ah
              DB "",0dh, 0ah
              DB "   0 <<< VOLVER AL CALABOZO DEL VIEJO RECLUSO.",0dh, 0ah
              DB "",0dh, 0ah,24h


;//////////////////////////////////////////////////////////////////////////////////////////////////////
;ENFERMERIA ---------> CUARTO DE SUMINISTROS

MENU_ENFERMERIA DB "",0dh, 0ah											
                DB "   PRISION DE SAMARCANDA",0dh, 0ah
                DB "",0dh, 0ah
                DB "",0dh, 0ah
                DB "   Estas en la enfermeria... que deseas hacer?",0dh, 0ah
                DB "",0dh, 0ah
                DB "   1 <<< MIRAR POR LA VENTANA. ",0dh, 0ah            
                DB "",0dh, 0ah
                DB "   2 <<< REVISAR EL ACAPARADOR",0dh, 0ah ; ENCONTRAS UNA MEDICINA QUE TE SUBE 2 DE VIDA
                DB "",0dh, 0ah
                DB "   3 <<< REVISAR RECIPIENTES DE ESTANTERIA.",0dh, 0ah
                DB "",0dh, 0ah
                DB "   4 <<< AVANZAR HACIA EL CUARTO DE SUMINISTROS.",0dh, 0ah
                DB "",0dh, 0ah
                DB "   9 <<< MIRAR LIBRETA.",0dh, 0ah
                DB "",0dh, 0ah
                DB "   0 <<< VOLVER AL CALABOZO DEL VIEJO RECLUSO.",0dh, 0ah
                DB "",0dh, 0ah,24h


;//////////////////////////////////////////////////////////////////////////////////////////////////////
;BARRACAS ---------> ZONA DE ENTRENAMIENTO------> 

MENU_BARRACAS DB "",0dh, 0ah											
              DB "   PRISION DE SAMARCANDA",0dh, 0ah
              DB "",0dh, 0ah              
              DB "",0dh, 0ah
              DB "   Estas en las barracas... que vas hacer ahora?",0dh, 0ah
              DB "",0dh, 0ah
              DB "   1 <<< REVISAR BAUL DE ARMAS. ",0dh, 0ah  ; ACA TE DAN ESPADA CORTA         
              DB "",0dh, 0ah              
              DB "   2 <<< REVISAR CUARTO SIN LUZ ",0dh, 0ah   ; ACA TE DAN PISTA 5
              DB "",0dh, 0ah              
              DB "   3 <<< DORMITORIO DE LOS GUARDIAS.",0dh, 0ah  ; PELEA CON EL SOLDADORASO2
              DB "",0dh, 0ah              
              DB "   4 <<< AVANZAR HACIA LA ZONA DE ENTRENAMIENTO.",0dh, 0ah ; PISTA6 : BUSCA BIEN EN LA ULTIMA BATALLA
              DB "",0dh, 0ah
              DB "   9 <<< MIRAR LIBRETA.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   0 <<< VOLVER AL CALABOZO DEL VIEJO RECLUSO.",0dh, 0ah
              DB "",0dh,0ah,24h

;//////////////////////////////////////////////////////////////////////////////////////////////////////
;ESCENARIO FINAL (SE ACCEDE CON LA SOGA)
   MENU_PATIO DB "",0dh, 0ah                      
              DB "   PRISION DE SAMARCANDA",0dh, 0ah
              DB "",0dh, 0ah              
              DB "",0dh, 0ah
              DB "   ESTAS EN EL PATIO PRINCIPAL!!! QUE PIENSAS HACER???",0dh, 0ah
              DB "",0dh, 0ah
              DB "   1 <<< VER ESTATUA DEL SHA DE PERSIA. ",0dh, 0ah            
              DB "",0dh, 0ah              
              DB "   2 <<< VER DETRAS DE LA FUENTE",0dh, 0ah ; ENCONTRAS UNA MEDICINA QUE TE SUBE 2 DE VIDA
              DB "",0dh, 0ah              
              DB "   3 <<< INSPECCIONAR DETRAS DEL ARBOL.",0dh, 0ah
              DB "",0dh, 0ah              
              DB "   4 <<< SALIDA DE LA CARCEL.",0dh, 0ah ; PELEAS CON EL JEFE FINAL
              DB "",0dh, 0ah
              DB "   9 <<< MIRAR LIBRETA.",0dh, 0ah
              DB "",0dh, 0ah
              DB "   0 <<< VUELVE A LA ENFERMERIA.",0dh, 0ah
              DB "",0dh,0ah,24h


    OPCION DB "$",24H

          ENT DB "",0dh, 0ah 
              DB "   Presione enter para continuar...",0dh,0ah,24h
    PROBABILIDAD DB "0",24H

TEXTO_FINAL  db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db "  Finalmente logras salir de la carcel. Esperas con ansias",0dh,0ah
             db "  poder encontrarte con tus hijas y esposa.",0dh,0ah
             DB "  De pronto notas mucha desolacion y destruccion en la ciudad.", 0dh,0ah
             db "  Estas muy desconcertado tratando de ubicarte para poder ir a tu casa.",0dh,0ah
             DB "  Te cruzas con un campesino que esta recolectando la poca cosecha de ",0dh,0ah
             DB "  su parcela totalmente saqueada",0dh,0ah
             db 0dh,0ah,24H 

TEXTO_FINALA db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db  "  YO:",0dh,0ah
             db  "  Que ha sucedido aqui...(Noto en su rostro que logra reconocerme)",0dh,0ah
             db 0dh,0ah,24H 
TEXTO_FINALB DB  "  CAMPESINO:",0dh,0ah
             DB  "  (con voz angustiada exclama) QUE HACES AQUI? CREI QUE HABIAS MUERTO... ",0dh,0ah
             DB  "  TUS HIJAS... tus hijas fueron raptadas (se quiebra al decirlo)",0dh,0ah
             db  "  EL GRAN KHAN SE LAS HA LLEVADO A SU CAMPAMENTO HACE UNAS SEMANAS...",0dh,0ah    
             DB 0dh,0ah,24H 
TEXTO_FINALC DB  "  YO:",0dh,0ah       
             db  "  NOOOOOOOOOOOOOO (Gritas y lloras)... ",0dh,0ah
             db  "  JURO QUE LAS ENCONTRARE..."
             db 0dh,0ah 
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah,24h 




.code
EXTRN FUN_RECOMPENSA_A:PROC
EXTRN FUN_RECOMPENSA_B:PROC
EXTRN FUN_RECOMPENSA_C:PROC
EXTRN FUN_RECOMPENSA_D:PROC
EXTRN FUN_RECOMPENSA_E:PROC
EXTRN FUN_RECOMPENSA_F:PROC
EXTRN FUN_RECOMPENSA_G:PROC
EXTRN FUN_RECOMPENSA_H:PROC
EXTRN FUN_RECOMPENSA_I:PROC
EXTRN FUN_RECOMPENSA_J:PROC
EXTRN FUN_RECOMPENSA_K:PROC

extrn LECTURA:proc 
extrn IMPRIMIR:proc 
extrn IMPRIMIRTXT:proc

extrn CLEARSCREEN:proc 
extrn CONTINUAR:proc
extrn ESPACIO_CONTINUAR:proc
extrn ELEGIR:proc
extrn ELEGIR3:proc
extrn ELEGIR2:proc

extrn COMIENZO:proc
extrn INTRODUCCION:proc
extrn LIBRETA_VIEJO:proc
extrn RANDOM6:proc


;BATALLA GUARDIA
EXTRN EVADIR:PROC
EXTRN FUNC_DADO_evadir_1:PROC
EXTRN FUNC_DADO_evadir_2:PROC
EXTRN FUNC_DADO_evadir_3:PROC
EXTRN FUNC_DADO_evadir_4:PROC
EXTRN FUNC_DADO_evadir_5:PROC
EXTRN FUNC_DADO_evadir_6:PROC
EXTRN FUNC_DADO_ataque_1:PROC
EXTRN FUNC_DADO_ataque_2:PROC
EXTRN FUNC_DADO_ataque_3:PROC
EXTRN FUNC_DADO_ataque_4:PROC
EXTRN FUNC_DADO_ataque_5:PROC
EXTRN FUNC_DADO_ataque_6:PROC
EXTRN FUN_TEMPO:PROC
EXTRN ATACAR:PROC
EXTRN BAJAVIDA1:PROC
EXTRN BAJAVIDA1_BOT:PROC
EXTRN VIDA_PERSONAJE:PROC
EXTRN VIDA_BOT:PROC
EXTRN PELEA_GUARDIA:PROC
EXTRN fun_cambio_variable:PROC

extrn CELDA200:proc
extrn CELDA201:proc
extrn CELDA202:proc
extrn CELDA203:proc
extrn CELDA204:proc
extrn CELDA205:proc

EXTRN FUNCION_COCINA:PROC ; si tenes la primer pista EVENTO CON JEFE BORRACHO. sino cocina linda y listo
EXTRN FUNCION_TORRE:PROC
EXTRN BANCO:PROC
EXTRN EVENTO_DEPOSITO_A:PROC  ;BATALLA CON EL GUARDIA
EXTRN ARMARIO_GIGANTE:PROC   ;CONSEGUIS UNA SOGA
EXTRN CAJAS_VACIAS:PROC ;nada

EXTRN EVENTO_POCION:PROC
EXTRN EVENTO_VENTANA:PROC
EXTRN EVENTO_FRASCOS:PROC
EXTRN EVENTO_ENFERMERA:PROC
;BARRACAS
EXTRN EVENTO_OSCURO:PROC
EXTRN BAUL_ARMAS:PROC
EXTRN DORMITORIO_VACIO:PROC
EXTRN EVENTO_ENTRENAMIENTO:PROC
EXTRN ATACA_RASO:PROC
;PATIO (FINAL)
EXTRN EVENTO_ESTATUA:PROC
EXTRN EVENTO_IMPERIAL:PROC
EXTRN EVENTO_FUENTE:PROC
EXTRN EVENTO_ARBOL:PROC
EXTRN fun_victoria:PROC
extrn salvar_viejo:proc
EXTRN CONTINUARA1:PROC

main proc;////////////////////////////////////////////////////////////////////////////////////////------------------> INICIO MAIN 
mov ax, @data
mov ds, ax

call fun_imagen; IMAGEN COMIENZO
mov ax, 0003h
int 10h
RESETEAR_JUEGO3:
;CALL RESETEAR_FLAG ??
call COMIENZO
call CLEARSCREEN

MOV AH,9
LEA DX,TIEMPO5
INT 21h

CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
call CLEARSCREEN

CALL INTRODUCCION ; ME DAN LIBRETA Y GARROTE
call CLEARSCREEN

MENU_:;//////////////////////////////////////////////////////////////////////////////////////////------------------->  MENU CALABOZO DEL VIEJO (opciones)
call salvar_viejo
call CLEARSCREEN
xor bx,bx
XOR DI,DI
mov dx, offset MENU
call IMPRIMIR
mov bx, OFFSET OPCION
push bx                                                      
CALL ELEGIR
mov bx,0
mov al, opcion[bx]
cmp al,"1"
je CALABOZOS
cmp al,"2"
je DEPOSITO__
cmp al,"3"
je ENFERMERIA__
cmp al,"4"
je BARRACAS__
cmp al,"9"
je Mirar
;cmp al,"0"
;je FIN_
jmp MENU_
Mirar:
call LIBRETA_VIEJO
jmp MENU_
ENFERMERIA__:
JMP ENFERMERIA

intermedio13:; salto intermedio al menu calabozo del viejo 
jmp menu_

CALABOZOS:;############################################-------> ZONA CALABOZOS DESCONOCIDOS
call CLEARSCREEN
mov dx, offset MENU_CALABOZO
call IMPRIMIR
mov bx, OFFSET OPCION
push bx                                                      
CALL ELEGIR
mov bx,0
mov al, opcion[bx]
cmp al,"1"
je CELDA_200
cmp al,"2"
je CELDA_201
cmp al,"3"
je CELDA_202
cmp al,"4"
je CELDA_203
cmp al,"5"
je CELDA_204
cmp al,"6"
je CELDA_205
cmp al,"7"
je TORRE_VIGILANCIA
cmp al,"9"
je Mirar_
cmp al,"8"
je COCINA
cmp al,"0"
je intermedio13
JMP CALABOZOS
FIN_:
JMP FIN
BARRACAS__:
JMP BARRACAS
DEPOSITO__:
JMP DEPOSITO
Mirar_:
call LIBRETA_VIEJO
jmp CALABOZOS

CELDA_200:;------------------>CELDA 200
CALL CELDA200
mov dx, offset ENT
call IMPRIMIR
CALL CONTINUAR
JMP CALABOZOS

CELDA_201:;------------------>CELDA 201
CALL CELDA201
mov dx, offset ENT
call IMPRIMIR
CALL CONTINUAR
JMP CALABOZOS

CELDA_202:;------------------->CELDA 202
CALL CELDA202
mov dx, offset ENT
call IMPRIMIR
CALL CONTINUAR
JMP CALABOZOS

CALABOZOS__:
JMP CALABOZOS

CELDA_203:;-------------------->CELDA 203
CALL CELDA203
mov dx, offset ENT
call IMPRIMIR
CALL CONTINUAR
jmp CALABOZOS

intermedio12:; salto intermedio al menu calabozo del viejo 
jmp intermedio13

CELDA_204:;-------------------->CELDA 204
CALL CELDA204
mov dx, offset ENT
call IMPRIMIR
CALL CONTINUAR
JMP CALABOZOS

CELDA_205:;-------------------->CELDA 205
CALL CELDA205
mov dx, offset ENT
call IMPRIMIR
CALL CONTINUAR
JMP CALABOZOS

TORRE_VIGILANCIA:;------------->TORRE VIGILANCIA
CALL FUNCION_TORRE
CMP DI, 1
JE TERMINA_JUEGO
JMP CALABOZOS

COCINA:;----------------------->COCINA
call CLEARSCREEN
call FUNCION_COCINA;EVENTO ESPECIAL
jmp CALABOZOS

MENU__:
JMP MENU_


TERMINA_JUEGO:
JMP FIN


DEPOSITO:;############################################-------> ZONA DEPOSITO
XOR DI,DI
call CLEARSCREEN
mov dx, offset MENU_DEPOSITO
call IMPRIMIR
mov bx, OFFSET OPCION
push bx                                                      
CALL ELEGIR
mov bx,0
mov al, opcion[bx]
cmp al, "1"
je ARMARIO
Cmp al, "2"
je CAJAS
cmp al, "3"
je BANCO_ARMERIA ;ACA CONSEGUIS LA ARMADURA
cmp al,"9"
je __Mirar__
cmp al,"4"
je DEPOSITO_A
cmp al,"0"
je MENU__
JMP DEPOSITO
intermedio11:; salto intermedio al menu calabozo del viejo 
jmp intermedio12
__Mirar__:
call LIBRETA_VIEJO
jmp DEPOSITO

CAJAS:
CALL CAJAS_VACIAS
mov dx, offset ENT
call IMPRIMIR
CALL CONTINUAR
jmp DEPOSITO

BANCO_ARMERIA:
CALL BANCO
cmp di,3; en la funcion si elegiste no peliar entonces saltas nuevamente al menu del CALABOZO del viejo 
je DEPOSITO
cmp di,2; en la funcion si moriste y pusiste seguir te vulve al menu del calabozo viejo recluso
je intermedio11
CMP DI,1; en la funcion si moriste y pusiste salir del juego el registro di cambio a 1
JE TERMINA_JUEGO2
jmp DEPOSITO

DEPOSITO_A:
CALL EVENTO_DEPOSITO_A
cmp di,3; en la funcion si elegiste no peliar entonces saltas nuevamente al menu del CALABOZO del viejo 
je DEPOSITO
cmp di,2; en la funcion si moriste y pusiste seguir te vulve al menu del calabozo viejo recluso
je intermedio11
CMP DI,1; en la funcion si moriste y pusiste salir del juego el registro di cambio a 1
JE TERMINA_JUEGO2

jmp DEPOSITO

ARMARIO:
CALL ARMARIO_GIGANTE
jmp DEPOSITO

TERMINA_JUEGO2:
;XOR DI,DI
jmp TERMINA_JUEGO

ENFERMERIA:;############################################-------> ZONA ENFERMERIA
call CLEARSCREEN
mov dx, offset MENU_ENFERMERIA
call IMPRIMIR
mov bx, OFFSET OPCION
push bx ;                                                     
CALL ELEGIR
mov bx,0
mov al, opcion[bx]
cmp al,"0"
je intermedio10
CMP al,"1"
je VENTANA
CMP al,"2"
je ACAPARADOR
CMP al,"3"
je FRASCOS
cmp al,"9"
je ___Mirar______
cmp al,"4"
je SUMINISTROS
JMP ENFERMERIA


___Mirar______:
call LIBRETA_VIEJO
jmp ENFERMERIA

RESETEAR_JUEGO2:
JMP RESETEAR_JUEGO3

ACAPARADOR:
CALL CLEARSCREEN
CALL EVENTO_POCION
jmp ENFERMERIA

intermedio10:; salto intermedio al menu calabozo del viejo 
jmp intermedio11

VENTANA:
CALL EVENTO_VENTANA
CMP DI, 1 ;(SE MODIFICA ACA DI)
JE PATIO
JMP ENFERMERIA

FRASCOS:
CALL EVENTO_FRASCOS
JMP ENFERMERIA

ENFERMERIA1:
jmp ENFERMERIA

SUMINISTROS:
CALL EVENTO_ENFERMERA
JMP ENFERMERIA


PATIO:;############################################-------> ZONA DEPOSITO (SALTO ACA Y DI SIGUE EN 1 POR ESO CUANDO VOLVIA AL DEPOSITO SALIA DEL JUEGO)
XOR DI,DI 
call CLEARSCREEN
lea dx, MENU_PATIO
call IMPRIMIR
mov bx, OFFSET OPCION
push bx                                                      
CALL ELEGIR
mov bx,0
mov al, opcion[bx]
cmp al, "1"
JE ESTATUA_SHA
cmp al, "2"
JE FUENTE
cmp al, "3"
JE ARBOL
CMP al, "4"
je SALIDA_CARCEL_
cmp al, "9"
JE MIRAR11
cmp al, "0"
JE ENFERMERIA1
JMP PATIO
MIRAR11:
call LIBRETA_VIEJO
JMP PATIO
ESTATUA_SHA:
CALL CLEARSCREEN
CALL EVENTO_ESTATUA
JMP PATIO
FUENTE:
CALL EVENTO_FUENTE
JMP PATIO

intermedio9:; salto intermedio al menu calabozo del viejo 
jmp intermedio10
intermedio22:
jmp PATIO

ARBOL:
CALL EVENTO_ARBOL
JMP PATIO
SALIDA_CARCEL_:
JMP SALIDA_CARCEL
RESETEAR_JUEGO:
JMP RESETEAR_JUEGO2

BARRACAS:;############################################-------> ZONA BARRACAS
;COMPARAR LOS CON LOS FLAGS DE LAS RECOMPENSAS DE LOS CALABOZOS
;SINO TENES LOS OBJETOS TE ATACA UN SOLDADO RASO (PUEDE SER)
call ATACA_RASO ; SI NO TENGO EL CUCHILLO ESTE SOLDADO ME BLOQUEA EL PASO
cmp di,3; en la funcion si elegiste no peliar entonces saltas nuevamente al menu del CALABOZO del viejo 
je intermedio10
cmp di,2; en la funcion si moriste y pusiste seguir te vulve al menu del calabozo viejo recluso
je intermedio10
CMP DI,1; en la funcion si moriste y pusiste salir del juego el registro di cambio a 1
JE intermedio25

call CLEARSCREEN
mov dx, offset MENU_BARRACAS
call IMPRIMIR
mov bx, OFFSET OPCION
push bx                                                      
CALL ELEGIR
mov bx,0
mov al, opcion[bx]
cmp al,"0"
je intermedio9
cmp al,"1"
je BAUL
cmp al,"2"
je CUARTO_OSCURO
CMP AL, "3"
JE DORMITORIO
cmp al,"4"
je ENTRENAMIENTO
cmp al,"9"
je ___Mirar_____
JMP BARRACAS

___Mirar_____:
call LIBRETA_VIEJO
jmp BARRACAS

PATIO1:
JMP PATIO

BAUL:
CALL  BAUL_ARMAS
;mov dx, offset ENT
;call IMPRIMIR
;CALL CONTINUAR
JMP BARRACAS
intermedio21:
jmp intermedio22
intermedio20:
jmp intermedio10

CUARTO_OSCURO:
CALL EVENTO_OSCURO
;mov dx, offset ENT
;call IMPRIMIR
;CALL CONTINUAR
JMP BARRACAS

DORMITORIO:
CALL CLEARSCREEN
CALL DORMITORIO_VACIO
JMP BARRACAS

ENTRENAMIENTO:
CALL EVENTO_ENTRENAMIENTO
;mov dx, offset ENT
;call IMPRIMIR
;CALL CONTINUAR
JMP BARRACAS
;____Mirar_____:
;call LIBRETA_VIEJO
;jmp ENTRENAMIENTO
intermedio25:
JMP FIN
SALIDA_CARCEL:

CALL EVENTO_IMPERIAL

cmp di,4; en la funcion si elegiste no peliar entonces saltas nuevamente al menu de PATIO 
je intermedio21
cmp di,2; en la funcion si moriste y pusiste seguir te vulve al menu del calabozo viejo recluso
je intermedio20
CMP DI,1; en la funcion si moriste y pusiste salir del juego el registro di cambio a 1
JE FIN

VICTORIA:
call fun_victoria    
LEA DX, TEXTO_FINAL
CALL IMPRIMIR
MOV DX, OFFSET ENT
CALL IMPRIMIR
CALL CONTINUAR
CALL CLEARSCREEN


LEA DX, TEXTO_FINALA
CALL IMPRIMIR
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
 

LEA DX, TEXTO_FINALB
CALL IMPRIMIR
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO
CALL FUN_TEMPO


LEA DX, TEXTO_FINALC
CALL IMPRIMIR
MOV DX, OFFSET ENT
CALL IMPRIMIR
CALL CONTINUAR
CALL CLEARSCREEN

CALL CONTINUARA1

FIN:
	mov ax, 4c00h
	int 21h
main endp;/////////////////////////////////////////////////////////////////////////////////////////-------> FIN MAIN 


fun_imagen proc
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    push di 
    pushf
    mov ax, 13h
    int 10h
    ; Process BMP file
    call OpenFile
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap
    ; Wait for key press
    mov ah,1
    int 21h
    ; Back to text mode
    mov ah, 0
    mov al, 2
    int 10h
    popf
    pop di
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret 
fun_imagen endp 



proc OpenFile

    ; Open file

    mov ah, 3Dh
    xor al, al
    mov dx, offset filename
    int 21h

    jc openerror
    mov [filehandle], ax
    ret

    openerror:
    mov dx, offset ErrorMsg
    mov ah, 9h
    int 21h
    ret
endp OpenFile





proc ReadHeader

    ; Read BMP file header, 54 bytes

    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,offset Header
    int 21h
    ret
endp ReadHeader





proc ReadPalette

    ; Read BMP file color palette, 256 colors * 4 bytes (400h)

    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret
endp ReadPalette




proc CopyPal

    ; Copy the colors palette to the video memory
    ; The number of the first color should be sent to port 3C8h
    ; The palette is sent to port 3C9h

    mov si,offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0

    ; Copy starting color to port 3C8h

    out dx,al

    ; Copy palette itself to port 3C9h

    inc dx
    PalLoop:

    ; Note: Colors in a BMP file are saved as BGR values rather than RGB.

    mov al,[si+2] ; Get red value.
    shr al,2 ; Max. is 255, but video palette maximal

    ; value is 63. Therefore dividing by 4.

    out dx,al ; Send it.
    mov al,[si+1] ; Get green value.
    shr al,2
    out dx,al ; Send it.
    mov al,[si] ; Get blue value.
    shr al,2
    out dx,al ; Send it.
    add si,4 ; Point to next color.

    ; (There is a null chr. after every color.)

    loop PalLoop
    ret
endp CopyPal




proc CopyBitmap

    ; BMP graphics are saved upside-down.
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.

    mov ax, 0A000h
    mov es, ax
    mov cx,200
    PrintBMPLoop:
    push cx

    ; di = cx*320, point to the correct screen line

    mov di,cx
    shl cx,6
    shl di,8
    add di,cx

    ; Read one line

    mov ah,3fh
    mov cx,320
    mov dx,offset ScrLine
    ;add dx,0
    int 21h

    ; Copy one line into video memory

    cld 

    ; Clear direction flag, for movsb

    mov cx,320
    mov si,offset ScrLine
    rep movsb 

    ; Copy line to the screen
    ;rep movsb is same as the following code:
    ;mov es:di, ds:si
    ;inc si
    ;inc di
    ;dec cx
    ;loop until cx=0

    pop cx
    loop PrintBMPLoop
    ret
endp CopyBitmap


;funciones
end main










