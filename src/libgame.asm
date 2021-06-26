.8086
.model small
.stack 100h

.data

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþTEXTOSþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
 PRESENTACION db" ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
             db " บ   A partir de este momento el destino de este cuento esta en tus manos.    บ",0dh,0ah
             db " บ   Voy a pedirte que ingreses el nombre, edad, religion y origen del        บ",0dh,0ah
             db " บ   protagonista asi podemos personalizar su historia.                       บ",0dh,0ah
             db " บ   Basate en este contexto para completar los datos:                        บ",0dh,0ah
             db " บ                                                                            บ",0dh,0ah
             db " บ   >Esta situada en el  1200. En Asia Central.                              บ",0dh,0ah
             db " บ   >Invasion mongola al reino del Corasmio.                                 บ",0dh,0ah
             db " บ   >Sos un campesino persa viviendo en la ciudad de Samarcanda.             บ",0dh,0ah
             db " ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah,24h

       barra db "อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ",0dh,0ah,24h 


NOMBRE_ DB ("NOMBRE: "),24H
EDAD_ DB  ("EDAD: "),24H
RELIGION_ DB  ("RELIGION (ej: Musulmana): "),24H
ORIGEN_ DB  ("PAIS O REGION: "),24H


INTRODUCCION0 db    "  Agosto de 1220",0dh,0ah 
              DB"",0dh,0ah 
INTRODUCCION1 db    "  Eres un campesino que habita en el Reino del Corasmio.",0dh,0ah
              db    "  Tu nombre es "
NOMBRE DB 15 DUP ("$")
INTRODUCCION2 db    " y trabajas dia y noche para mantener a tu familia. ",0dh,0ah
              db    "  Vives con tu esposa y tus 2 hijos en una humilde casa con un huerto ",0dh,0ah
INTRODUCCION3 db    "  de maiz y cebada y un establo con dos caballos.",0dh,0ah
              db    "  ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ",0dh,0ah
              db    "  Tienes "    
EDAD DB 2 DUP ("0")
INTRODUCCION4 db    " y mas de la mitad de tu vida has trabajado",0dh,0ah
              db    "  cosechando la tierra, criando ganado y comerciando.",0dh,0ah
              db    "  Te consideras de religion "
RELIGION DB 15 DUP ("$")
INTRODUCCION5 db    " aunque no sos tan creyente. ",0dh,0ah
              db    "  Solo recurris a los dioses en situaciones muy extremas ",0dh,0ah           
INTRODUCCION6 db    "  Naciste en "
ORIGEN DB 15 DUP ("$")
INTRODUCCION7 db    ". Un lugar al cual planeas volver en algun momento.",0dh,0ah 
              db    "  A pesar de haber tenido una infancia dura pudiste forjar",0dh,0ah
              db    "  tu camino a base de esfuerzo y constancia.",0dh,0ah
              db    "  ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ",0dh,0ah
              db    "  Hace un tiempo vives en el reino de Samarcanda. La ciudad abunda",0dh,0ah 
              db    "  de riqueza. Has cosechado muchisimo esta temporada. ",0dh,0ah 
              db    "  Podras alimentar a tu familia durante todo el invierno. ",0dh,0ah
              db    "  Una noche unos bandidos atacan tu granja y los matas para defender tu familia.",0dh,0ah
              db    "  El Sha te juzga con la carcel de por vida ya que siendo campesino no tienes",0dh,0ah
              db    "  derecho a matar. Una condena injusta cae sobre tus espaldas...",0dh,0ah            
INTRODUCCION8 DB    "  ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ",0dh,0ah,24h 

             ENT db "                                          Presione enter para continuar...",24h
;VARIABLES FUNCION ELEGIR
 ;TITULO db "ELIGE UNA OPCION",24H
 ERROR DB "   OPCION INCORRECTA: ",24H
 salto db 0dh,0ah,24h

 opcion_menu db "0",24h


        


;VARIABLES FUNCION INTRODUCCION
;PRESENTACION
 DIALOGO1   DB "",0dh,0ah   
            db "  PRISION DE SAMARCANDA (Febrero de 1225) ",0dh,0ah           
            db 0dh,0ah
            db "  VIEJO RECLUSO:",0dh,0ah
            db "  -Es asi mi querido amigo... las cosas no siempre",0dh,0ah
            db "  son como las planeamos (tose moribundo)...",0dh,0ah
            db  0dh,0ah
            db "  YO:",0dh,0ah
            db "  -No digas tonterias viejo, aguanta un poco , ya se me ocurrira",0dh,0ah
            db "  algo para sacarnos de este lugar... por favor aguanta un poco mas.",0dh,0ah
            db  0dh,0ah
            db "  VIEJO RECLUSO:",0dh,0ah
            db "  ... Ten, guarda esto (cuadernillo manuscrito) espero te sea de ayuda...",0dh,0ah
            db  0dh,0ah
            db "  YO: ",0dh,0ah
            db "  -viejo? viejo?... QUE TE PASA?... RESPONDE!!!",0dh,0ah    
            db "",0dh,0ah,24h

 viejo_salvado  db 0dh,0ah
                db 0dh,0ah 
                db "  VIEJO RECLUSO: ",0dh,0ah
                DB "  Nunca antes me senti tan vivo...",0dh,0ah
                db 0dh,0ah
                DB "  YO:",0dh,0ah
                DB "  Gracias ... muchas gracias por ayudarnos....",0dh,0ah
                db 0dh,0ah
                db "  ENFERMERA:",0dh,0ah
                db "  Gracias a ti estoy sana y salva... y quizas ahora podamos escapar",0dh,0ah
                db 0dh,0ah
                db "  VIEJO RECLUSO:",0dh,0ah 
                db "  Ahora mi queridos amigos ... comenzaremos un ritual...",0dh,0ah
                db "  (el viejo picha velozmente a ambos jovenes y obtiene una gota de su sangre",0dh,0ah
                db 0dh,0ah
                DB "  YO:",0dh,0ah
                DB "  QUE HACES ANCIANO?? HAY QUE INTENTAR IRNOS DE AQUI!! ",0dh,0ah
                DB 0dh,0ah
                db "  VIEJO RECLUSO:",0dh,0ah
                DB "  Ba'adan mibinamet...Sobh be kheir...Ba'adan mibinamet...Sobh be kheir",0dh,0ah
                DB "  Ba'adan mibinamet...Sobh be kheir...Ba'adan mibinamet...Sobh be kheir",0dh,0ah
                DB "  Ba'adan mibinamet...Sobh be kheir...Ba'adan mibinamet...Sobh be kheir",0dh,0ah
                DB "  ",0dh,0ah
                db "  ",0dh,0ah,24h            


COMENTARIO_COCINA  db 0dh,0ah
                db 0dh,0ah 
                db "  JEFE DE GUARDIA: ",0dh,0ah
                DB "  zzzZZZZzzzZZZ... (ronca) zzzzzzZZZzz....",0dh,0ah
                DB 0dh,0ah
                DB "  (El jefe de guardia sigue completamente dormido)",0dh,0ah
                db "  (Mejor alejarse por si se despierta...)",0dh,0ah       
                db "  ",0dh,0ah,24h


BORRACHO_TEXTO  db 0dh,0ah
                db 0dh,0ah 
                db "  JEFE DE GUARDIA: ",0dh,0ah
                DB "  HEYY TUU.... SI TUU....",0dh,0ah
                DB "  ALCANZAME OTRA BOTELLA Y VEN A LA MESA!!!!!!!!!",0dh,0ah
                DB "  (El jefe te ha confundido con un guardia)",0dh,0ah
                db "  (Te acercas con una botella a la mesa)",0dh,0ah
                db 0dh,0ah 
                DB "  YO:",0dh,0ah
                db "  JEFE, ESTUVE PATRULLANDO LA ZONA",0dh,0ah
                db 0dh,0ah
                db "  JEFE DE GUARDIA:",0dh,0ah 
                db "  AYY YA CALLATE... SIRVEME UN POCO DE ESE VINO",0dh,0ah
                db "  (Con cuidado llenas el vaso del jefe)",0dh,0ah
                db 0dh,0ah
                DB "  JEFE DE GUARDIA:",0dh,0ah
                DB "  GRACIAS...",0dh,0ah
                DB "  (Se bebe el vino de un sorbo y cae dormido sobre la mesa...)",0dh,0ah
                db "  (El jefe dejo debajo de la mesa su cuchillo... Ahora es mio...",0dh,0ah
                db "  ",0dh,0ah,24h


TEXTO__7b db 0dh,0ah
                db 0dh,0ah 
                db "  SUSURRO DEL MAS ALLA: ",0dh,0ah
                DB "  TE LO VOY A REPETIR MUCHAS VECES....",0dh,0ah
                DB "   ....DEBES IR A LA COCINAAA!!!!!!!!!",0dh,0ah
                DB "  TUS DUDAS TE HACEN PERDER MUCHO TIEMPO",0dh,0ah
                db 0dh,0ah
                DB "  YO:",0dh,0ah
                db "  PERO POR FAVOOR... QUIEN ERES?...",0dh,0ah
                db "  QUIEN ERES?.....",0dh,0ah
                db 0dh,0ah 
                db "  (no hay respuesta.....)",0dh,0ah
                db 0dh,0ah
                DB "  YO:",0dh,0ah
                DB "  ESTA BIEEEN FANTASTA VOY A IR A LA COCINA",0dh,0ah
                DB "  (Ofuscado te retiras...)",0dh,0ah
                db "  ",0dh,0ah,24h

TEXTO_7 db 0dh,0ah
                db 0dh,0ah 
                db "  SUSURRO DEL MAS ALLA: ",0dh,0ah
                DB "  TE VOY A DAR UN CONSEJO... EL JEFE DE GUARDIA ESTA EN LA COCINA",0dh,0ah
                DB "   ....MUY BORRACHO  JAJAJAJAJAJAJAJA!!!!!!!!!",0dh,0ah
                DB "  (esa risa macabra te produce un escalofrio atroz)",0dh,0ah
                db 0dh,0ah
                DB "  YO:",0dh,0ah
                db "  QUIEN ERES?... CREO QUE ME ESTOY VOLVIENDO LOCO...",0dh,0ah
                db "  (te quedas petrificado esperando una respuesta)",0dh,0ah
                db 0dh,0ah 
                db "  SUSURRO DEL MAS ALLA: ",0dh,0ah
                DB "  SOY UNA VOZ QUE LO SABE TODO.... DEBES CONFIAR EN MI",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                DB "  (CONSEJO: Revisa en la libreta las pistas....)",0dh,0ah
                db "  ",0dh,0ah,24h


FINAL_202 db 0dh,0ah
                db 0dh,0ah 
                db "  SUSURRO DEL MAS ALLA: ",0dh,0ah
                DB "  ME HAS HECHO CASO Y LA RECOMPENSA NO HA SIDO EN VANO",0dh,0ah
                DB "  (la voz queda retumbando dentro de la celda y desaparece)",0dh,0ah
                db 0dh,0ah
                DB "  YO:",0dh,0ah
                db "  NECESITO SABER QUIEN ERES.... ESTOY MUY ASUSTADO",0dh,0ah
                db "  (te retiras rapidamente del lugar)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                db "  ",0dh,0ah,24h


COCINA_FINAL db 0dh,0ah
                db 0dh,0ah 
                db "  JEFE DE GUARDIA: ",0dh,0ah
                DB "  HEYY... QUIERO VOLVER A JUGAR CONTIGO!!!!",0dh,0ah
                DB "  ...QUIERO UNA REVANCHA!!!!",0dh,0ah
                db 0dh,0ah
                DB "  YO:",0dh,0ah
                db "  LO SIENTO JEFE... DEBO SEGUIR RECORRIENDO LOS CALABOZOS",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                db "  ",0dh,0ah,24h

MUERTE_DEPOSITOA db 0dh,0ah
                db 0dh,0ah 
                db "  (Piensas por dentro....) ",0dh,0ah
                DB "  (Menos mal que escondi el cadaver del guardia..)",0dh,0ah
                db 0dh,0ah     
                db "  (Debo seguir adelante... Donde esta la salida?)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                db "  ",0dh,0ah,24h

 ; MUERTE_DEPOSITOA DB "Menos mal que escondi el cuerpo del guardia sino ya me hubiesen descubierto",0dh,0ah,24H

  CONPOCION db 0dh,0ah
                db 0dh,0ah 
                db "  (Reviso el acaparador....) ",0dh,0ah
                DB "  (Que es esa botella rara???..)",0dh,0ah
                db 0dh,0ah     
                db "  (Estoy muy sediendo... me arriesgare a tomarla)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                db "  ",0dh,0ah,24h

  ;CONPOCION DB "REVISO EL ACAPARADOR Y ENCUENTRO UNA POCION... CREO QUE VOY A TOMARLA",0dh,0ah,24H
  ;SINPOCION DB "YA NO HAY NADA EN EL ACAPARADOR",0dh,0ah,24H


 SINPOCION db 0dh,0ah
                db 0dh,0ah 
                db "  (Reviso el acaparador....) ",0dh,0ah
                DB "  (Ya no hay nada aqui..)",0dh,0ah
                db 0dh,0ah     
                db "  (No deberia detenerme en buscar de nuevo)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                db "  ",0dh,0ah,24h                

 CONBREBAJE db 0dh,0ah
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                db "  YO:",0dh,0ah  
                db "  Exelente con esta medicina ayudaremos al viejo!!!) ",0dh,0ah
                db 0dh,0ah     
                db "  (Esperemos que no sea demasiado tarde....)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                db "  ",0dh,0ah,24h

      como_usar db 0dh,0ah
                db 0dh,0ah
                db 0dh,0ah 
                db 0dh,0ah
                db "  YO:",0dh,0ah  
                db "  mmmm... no entiendo para que pueden servir estas hierbas...) ",0dh,0ah
                db 0dh,0ah     
                db "  (Mejor dejo esto como esta...)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                db "  ",0dh,0ah,24h                

 SINBREBAJE db 0dh,0ah
                db 0dh,0ah
                DB "   YO:",0dh,0ah 
                db "  (Aqui ya no hay nada de utlidad...) ",0dh,0ah
                DB "  ",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h

  ;CONBREBAJE DB "REVISANDO LOS FRASCOS ENCONTRE UNA BOTELLA MUY EXTRAniA",0dh,0ah,24H
  ;SINBREBAJE DB "LOS OTROS FRASCOS ESTAN VACIOS.YA NO HAY NADA UTIL AQUI",0dh,0ah,24H 

   BAUL_CERRADO db 0dh,0ah
                db 0dh,0ah 
                db "  (Este baul es muy raro..) ",0dh,0ah
                DB "  (Necesito una clave para poder abrirlo...)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h

BAUL_VACIO1 db 0dh,0ah
                db 0dh,0ah 
                db "  (Este baul esta vacio..) ",0dh,0ah
                DB "  (Ya no hay mas nada por revisar...)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h

ABRI_BAUL db 0dh,0ah
                db 0dh,0ah 
                db "  (Esa clave que escuche en el cuarto.. ",0dh,0ah
                DB "  Me sirvio para poder abrirlo...)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h

;BAUL_CERRADO DB "(ESTE BAUL ES IMPOSIBLE DE ABRIR)",0dh,0ah,24H
;BAUL_VACIO1 DB  "(YA NO HAY NADA MAS POR REVISAR)",0dh,0ah,24H
;ABRI_BAUL   DB "(ESA CLAVE QUE ESCUCHE AL FINAL ME SIRVIO PARA ABRIR EL BAUL)",0dh,0ah,24H

PESADA_GET db 0dh,0ah
                db 0dh,0ah 
                db "  (Reviso cerca de la estatua y descubro un escondite. ",0dh,0ah
                DB "  Es una armadura hermosa...Me va a ayudar para poder defenderme...)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h

ESTATUA_COMENTARIO db 0dh,0ah
                db 0dh,0ah 
                db "  (Que hermosa es la estatua del Qwaresm Sha. ",0dh,0ah
                DB "  Tiene unos detalles increibles...Debo continuar con mi mision)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h

MENSAJE_FUENTE db 0dh,0ah
                db 0dh,0ah 
                db "  (Me acerco a la fuente... en busqueda de algo... ",0dh,0ah
                DB "  veo brotar el agua y me quedo unos segundos...",0dh,0ah
                DB "  contemplandola y pienso en mi familia...)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h


MENSAJE_ARBOL db 0dh,0ah
                db 0dh,0ah 
                db "  (Inspecciono el arbol... no hay nada interesante ",0dh,0ah
                DB "  Por sus frutos parece un arbol de duraznos...)",0dh,0ah
                DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                db "  ",0dh,0ah,24h


;PESADA_GET DB "reviso cerca de la estatua y descubro que en el piso hay un escondite.... es una armadura pesada",0dh,0ah,24H
;ESTATUA_COMENTARIO DB  "(Que hermosa estatua del sha de persia)",0dh,0ah,24H
           

DIALOGO2    db  0dh,0ah
            db "  VIEJO RECLUSO:",0dh,0ah
            DB "  Pensaste que me habia ido? (tose moribundo)...parece que esta herida",0dh,0ah 
            db "  me hace estar somnoliento...(tose nuevamente)",0dh,0ah
            db  0dh,0ah
            db "  YO:",0dh,0ah
            db "  Me diste un bueno susto... Como conseguiste esta informacion?",0dh,0ah
            db  0dh,0ah
            db "  VIEJO RECLUSO:",0dh,0ah
            db "  ... El diablo sabe mas por viejo que por diablo mi joven amigo...",0dh,0ah
            db 0dh,0ah
            db "  YO:",0dh,0ah
            db "  Me vendria bien un poco de esa sabiduria viejo cascarrabias...",0dh,0ah
            db  0dh,0ah
            db "  VIEJO RECLUSO:",0dh,0ah
            db "  ...Ve has algo util en tu vida, aprovecha esta noche ",0dh,0ah
            db"   puede ser la ultima... Buena suerte...(el viejo herido se duerme nuevamente)",0dh,0ah
            db  0dh,0ah
            db "  YO: ",0dh,0ah
            db "  No entiendo como derroto al guardia solo y casi en silencio",0dh,0ah
            db "  (pienso dentro de mi desconcertado)... volvere por ti anciado te debo una. ",0dh,0ah,24h 

;PELEA CON EL GUARDIA BASICO

MENSAJE_GUARDIA1 db 0dh,0ah
                 db 0dh,0ah 
                 db "  ENEMIGO: ",0dh,0ah
                 DB "  ALTO AHI INTRUSO. ES HORA DE MORIR!!!!",0dh,0ah
                 db 0dh,0ah
                 DB "  (Un guardia te embosca desde la oscuridad",0dh,0ah
                 db "  y te ataca sorpresivamente.",0dh,0ah
                 db "  Intentas defenderte....)",0dh,0ah
                 DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                 db "  ",0dh,0ah,24h

MENSAJE_GUARDIA2 db 0dh,0ah
                 db 0dh,0ah 
                 db "  ENEMIGO: ",0dh,0ah
                 DB "  MALDITO BASTARDO LOGRASTE ESCAPAAR!!!!",0dh,0ah
                 DB "  TE ESPERA LA MUERTE RECLUSO!!!!",0dh,0ah
                 db 0dh,0ah
                 DB "  (Un guardia escondido detras de una puerta",0dh,0ah
                 db "  te embosca y te ataca sorpresivamente.",0dh,0ah
                 db "  Intentas defenderte....)",0dh,0ah
                 DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                 db "  ",0dh,0ah,24h

MENSAJE_GUARDIA3 db 0dh,0ah
                 db 0dh,0ah 
                 db "  ENEMIGO: ",0dh,0ah
                 DB "  ...Y TU QUIEN ERES?... AAAA EL COMPANIERO DEL VIEJO!!!!",0dh,0ah
                 DB "  VOY A IMPARTIR JUSTICIA CONTIGO. TE MATAREEEE!!!!",0dh,0ah
                 db 0dh,0ah
                 DB "  (Un guardia te embosca desde un rincon oscuro",0dh,0ah
                 db "  y corriendo rapidamente hacia ti te intenta golpear.",0dh,0ah
                 db "  Intentas defenderte....)",0dh,0ah
                 DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah           
                 db "  ",0dh,0ah,24h

;CELDA 200                                              

texto1 db 0dh,0ah
       db 0dh,0ah 
       db "  PUAJJJ!!!.... QUE OLOR DESAGRADABLE",0dh,0ah
       db 0dh,0ah
       DB "  (En la celda ves un charco de agua estancada",0dh,0ah
       db "  y una montania de escombros de lo que fue esta celda,",0dh,0ah
       db "  retrocedes unos pasos por el olor nauseabundo)",0dh,0ah
       db 0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h 

texto2 db 0dh,0ah
       db 0dh,0ah
       db "   PTTTSSSS HEEY... NO TE ASUSTES",0dh,0ah
       db "   (una voz rasgada por el tiempo se hace presente)",0dh,0ah
       DB 0dh,0ah
       db "   VOZ MISTERIOSA:",0dh,0ah
       DB "   QUIERO ALERTARTE DE QUE ES PELIGROSO ESTE LUGAR",0dh,0ah
       DB "   A VECES NO SABES SI ESTAS FABULANDO O ESTAS EN LA REALIDAD....",0dh,0ah
       DB 0dh,0ah
       db  "  (muy confundido no sabes de donde proviene esa voz)",0dh,0ah
       DB 0dh,0ah
       db  "  QUIEN ANDA AHI? NO TE VEO ESTAS DETRAS DE LAS SOMBRAS",0dh,0ah
       db  "  (sentis una presencia escalofriante detras tuyo)",0dh,0ah
       DB 0dh,0ah
       db  "  VOZ MISTERIOSA:",0dh,0ah
       DB  "  PERO NO TE DAS CUENTA QUE ESTOY ATRAS TUYO?? MUAJAJAJAJA",0dh,0ah
       db  "  (del susto te desmayas sin entender lo que sucedio.)",0dh,0ah 
       db  "  (Estaba dormido?)",0dh,0ah
       db 0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h 
 


texto3 db 0dh,0ah
       db 0dh,0ah
       db "  JEFE DE GUARDIA: HEEEY QUIEN ANDA AHIII?",0dh,0ah
       db 0dh,0ah
       db "  (te escondes detras de unos escombros)",0dh,0ah       
       DB "  no soportas el olor del lugar...)",0dh,0ah
       db 0dh,0ah
       DB "  QUIEN ANDA AHI?... TE VOY ATRAPAR",0dh,0ah
       db 0dh,0ah
       DB "  (varias ratas salen corriendo hacia ",0dh,0ah
       DB "  las otras celdas )",0dh,0ah
       db 0dh,0ah
       DB "  MALDITAS ALIMAniAS... YA LES DARe CAZA",0dh,0ah
       DB "  HEEEY AMHED NO SE COMAN TODO BASTARDOS",0dh,0ah
       db 0dh,0ah
       db "  (el guardia se retira a la cocina)",0dh,0ah
       db 0dh,0ah
       db "  (esperas....)",0dh,0ah
       db 0dh,0ah
       DB "  (salis de tu escondite. ya la zona esta despejada)",0dh,0ah
       db 0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h 


;CELDA 200 
texto_1 db 0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO:",0dh,0ah  
       db "  AYUDAAA!!!.... SACAME DE AQUI!!!",0dh,0ah
       db 0dh,0ah
       DB "  (Te asustas y retrocedes...)",0dh,0ah
       db "  ",0dh,0ah
       db "  PRISIONERO:",0dh,0ah
       db "  NO TE VAYAS ESTOY SEDIENTOO....",0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h 

texto_2 db 0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO:",0dh,0ah  
       db "  POR FAVOOOOOORRR!!! ESTOY EXHAUSTO!!!",0dh,0ah
       db 0dh,0ah
       DB "  (se genera un silencio...)",0dh,0ah
       db "  ",0dh,0ah
       db "  PRISIONERO:",0dh,0ah
       db "  SE QUE ESTAS AHI TEN PIEDAD POR FAVOR....",0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h 
 


texto_3 db 0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO:",0dh,0ah  
       db "  AYUUUUDAAAAAAAAAAAAAAAAA!!!",0dh,0ah
       db 0dh,0ah
       DB "  (se colma el lugar de ruido...)",0dh,0ah
       db "",0dh,0ah
       db "  JEFE DE GUARDIAS:",0dh,0ah
       db "  MALDITO BASTARDO OTRA VEZ GRITANDO?",0dh,0ah
       db "  TE VOY A DAR TU MERECIDO",0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO:",0dh,0ah  
       db "  NOOOO POR FAVOR. ME VAS A MATAR",0dh,0ah
       db "  (se escuchan gritos por la feroz golpiza",0dh,0ah
       db "  (Pedis a los dioses que te ayuden a escapar)",0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h 

texto_4 db 0dh,0ah
        db 0dh,0ah
        db "  YO:", 0dh,0ah
        db "  (Que son esos gritos?... pienso dentro de mi)",0dh,0ah
        db  0dh,0ah
        db "  PRISIONERO:",0dh,0ah  
        db "  NO ME RENDIREEE NUNCAAAAA!!!",0dh,0ah
        db "  JAMAAAAAS!!!" ,0dh,0ah
        DB "  ... YO SOY INMORTAL... SOY ETERNO...JAJAJAJAJ!!!!",0dh,0ah
        db "  ",0dh,0ah
        db "  ....... JAJAJAJAJAJAJAJ......",0dh,0ah
        db "  VOY A LUCHAR TODO EL TIEMPOOOO...",0dh,0ah
        db "",0dh,0ah
        db "  JEFE DE GUARDIAS:",0dh,0ah  
        db "  YA CALLATE Y DEJAME COMER EN PAZ",0dh,0ah
        db "  ...HEEEYY TUU PASAME LA SAL...",0dh,0ah
        db "  (seguis escuchando gritos del prisionero)",0dh,0ah
        db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",,0dh,0ah
        db 0dh,0ah,24h

texto_5 db 0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO:",0dh,0ah  
       db "  NO ME RENDIREEE NUNCAAAAA!!!",0dh,0ah
       db "  JAMAAAAAS!!!" ,0dh,0ah
       DB "  ... YO SOY INMORTAL. SOY ETERNO",0dh,0ah
       db "  ",0dh,0ah
       db "  ....... JAJAJAJAJAJAJAJ......",0dh,0ah
       db "  VOY A LUCHAR TODO EL TIEMPOOOO...",0dh,0ah
       db "",0dh,0ah
       db "  JEFE DE GUARDIAS:",0dh,0ah  
       db "  YA CALLATE Y DEJAME COMER EN PAZ",0dh,0ah
       db "  ...HEEEYY TUU PASAME LA SAL...",0dh,0ah
       db "  (escuchas gritos y ruidos de platos provenientes de la cocina)",0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h

texto_6 db 0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO:",0dh,0ah  
       db "  MALDITO GLOTON TEN PIEDAD DE MI!!!",0dh,0ah
       db "  ESTO ES INUMANO...!!!" ,0dh,0ah
       DB "  ... YO SOY INMORTAL. SOY ETERNO",0dh,0ah
       db "  ",0dh,0ah
       db "  ....... JAJAJAJAJAJAJAJ......",0dh,0ah
       db "  VOY A LUCHAR TODO EL TIEMPOOOO...",0dh,0ah
       db "",0dh,0ah
       db "  JEFE DE GUARDIAS:",0dh,0ah  
       db "  YA CALLATE Y DEJAME COMER EN PAZ",0dh,0ah
       db "  ...HEEEYY TUU PASAME LA SAL...",0dh,0ah
       db "  (seguis escuchando gritos del prisionero)",0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h

;CELDA 203
texto_8 db 0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO MONGOL:",0dh,0ah  
       db "  ESCUCHA.. ACABO DE ESCUCHAR QUE EL GUARDIA DE LA TORRE SE HA IDO!!!",0dh,0ah
       db "  QUIZAS ALLI PODES VER ALGO MAS INTERESANTE....",0dh,0ah
       db 0dh,0ah
       DB "  YO:",0dh,0ah
       db "  QUIEN ERES TU?... DEBO SABERLO PARA CONFIAR EN TI",0dh,0ah
       db "  (Te acercas a el y te das cuenta que es un mongol)",0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO MONGOL:",0dh,0ah
       db "  SOY UN NOMADA MONGOL.. ME LLAMO OGODEI",0dh,0ah  
       db "  TOMA MI CONSEJO O NO... ESCUCHE QUE LA TORRE ESTA VACIA",0dh,0ah
       db 0dh,0ah
       db "  (Te quedas pensando en las palabras que te dijo... te alejas del prisionero)",0dh,0ah
       DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       dB "  (CONSEJO: Revisa en la libreta las pistas....)",0dh,0ah
       db   0dh,0ah,24h

texto_8B db 0dh,0ah
       db 0dh,0ah
       db "  OGODEI:",0dh,0ah  
       db "  NO ME INTERESA SABER NADA MAS...",0dh,0ah
       db "  YA MI DESTINO ESTA MARCADO....",0dh,0ah
       db 0dh,0ah
       DB "  YO:",0dh,0ah
       db "  QUE ES LO QUE DICES?",0dh,0ah
       db "  SOLO VINE PORQUE ME PERDI... ME CONUNDI DE CAMINO",0dh,0ah
       db 0dh,0ah
       db "  PRISIONERO MONGOL:",0dh,0ah
       db "  ESTA BIEN... SUERTE CON TU LIBERTAD...",0dh,0ah  
       db "  (Se acuesta en el suelo dandote la espalda y termina la conversacion)",0dh,0ah
       db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       db 0dh,0ah,24h

     
      ARMADURA_TEXTO db 0dh,0ah
       db 0dh,0ah
       db "  (Acabo de ver un soldado raso dejar su",0dh,0ah  
       db "  armadura en un banco frente a la armeria)",0dh,0ah        
       db "  ",0dh,0ah
       db "  (deberia aprovechar esta oportunidad...)",0dh,0ah
       DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
       dB "  (CONSEJO: Revisa en la libreta las pistas....)",0dh,0ah
       db   0dh,0ah,24h

      MENU_PELEA DB "",0dh, 0ah                     
              DB "",0dh, 0ah              
              DB "",0dh, 0ah
              DB "  Me detengo porque escucho ruido... UN SOLDADO RASO MALDICION!!,",0dh, 0ah
              DB "  (No se si estoy en condiciones de derrotarlo...)",0dh, 0ah
              DB "",0dh, 0ah
              DB "  1 <<< INTENTAR ATACARLO. ",0dh, 0ah             
              DB "  2 <<< IRME Y ESCONDERME",0dh, 0ah
              DB "  3 <<< VER LIBRETA.",0dh, 0ah
              DB "  (revisar la informacion sobre tus enemigos puede ser crucial)",0dh, 0ah
              DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh, 0ah,24h

    MENU_PELEA2 DB "",0dh, 0ah                     
              DB "",0dh, 0ah              
              DB "",0dh, 0ah
              DB "  (Me escondo porque hay un guardia delante...parece distraido",0dh, 0ah
              DB "  creo que puede ser mi oportunidad...)",0dh, 0ah
              DB "",0dh, 0ah
              DB "  1 <<< ATACARLO",0dh, 0ah             
              DB "  2 <<< RETROCEDER ",0dh, 0ah
              DB "  3 <<< MIRAR INFO LIBRETA.",0dh, 0ah
              DB "  (revisar la informacion sobre tus enemigos puede ser crucial)",0dh, 0ah
              DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh, 0ah,24h

    MENU_PELEA3 DB "",0dh, 0ah                     
              DB "",0dh, 0ah              
              DB "",0dh, 0ah
              DB "  Parece que llego el momento de enfrentar mi destino...",0dh, 0ah
              DB "  (desde aqui puedo ver al guardia imperial que cuida la salida)",0dh, 0ah
              DB "",0dh, 0ah
              DB "  1 <<< COMENZAR LA PELEA",0dh, 0ah             
              DB "  2 <<< SEGUIR BUSCANDO RECURSOS",0dh, 0ah
              DB "  3 <<< VER INFORMACION EN LIBRETA",0dh, 0ah
              DB "  (revisar la informacion sobre tus enemigos puede ser crucial)",0dh, 0ah
              DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh, 0ah,24h
              

  LiveAgain db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db "            YO:",0dh,0ah  
            db "            Que esta pasando??... yo no deberia estar muerto?",0dh,0ah
            db "            recuerdo cuando me mataron... Pero sin embargo",0dh,0ah        
            db "            siento como la sangre fluye por mis venas...",0dh,0ah
            db "            esto no es un sueคo!  ESTOY VIVO OTRA VEZ!!!",0dh,0ah
            db "                                (I LIVE AGAIN!!!!!!)",0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah            
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah       
            db "",0dh,0ah,24H

  LiveAgain2 db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db "           VOZ_OSCURA:",0dh,0ah  
             db "           VIVE... continua... Todavia no es tu hora de partir...",0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah      
             db "",0dh,0ah,24H

     PALADIN db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db 0dh,0ah
             db "              SOLDADO IMPERIAL:",0dh,0ah  
             db "              Salam... Khoda Hafez... (hola y adios...)",0dh,0ah
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
             db "",0dh,0ah,24H             







;ACA HAY UN PRISIONERO SEDIENTO. NECESITAS AGUA Y LA LLAVE PARA OBTENER RECOMPENSA (ARMA O ARMADURA)

        RANDOM DB "0",24H
        OPCION1 DB "0",24H
        ;CELDAS 204 Y 205

        
        Mensaje_ESQUELETOS db 0dh,0ah
                     db 0dh,0ah 
                     db"  (Que horror... hay un monton de huesos humanos)",0dh, 0ah
                     DB"  (esqueletos... calaveras.....) ",0dh, 0ah
                     db"  (Seguramente estos prosioneros murieron hace mucho tiempo.)",0dh,0ah
                     DB"  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh, 0ah,24h

        Mensaje_RATAS db 0dh,0ah
                     db 0dh,0ah 
                     db"  (Ni aunque estuviera loco me meto en esa celda...)",0dh, 0ah
                     DB"  (Esta plagada de ratas y encima esta muy oscura...) ",0dh, 0ah
                     db"  (Retroceces sin dudarlo...)",0dh,0ah
                     DB"  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh, 0ah,24h

ARMADURA_OBTENIDA db 0dh,0ah
       db 0dh,0ah
       db "  (Voy hacia el banco de la armeria rapidamente....",0dh,0ah  
       db "  ...efectivamente la armadura seguia alli)",0dh,0ah        
       db "  ",0dh,0ah
       db "  (ahora me siento mas seguro con esta armadura...)",0dh,0ah
       DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
       db   0dh,0ah,24h


BANCO_GUARDIA db 0dh,0ah
       db 0dh,0ah
       db "  (El banco ahora esta custodiado por guardias....",0dh,0ah  
       db "  ...no debo volver hacia aqui)",0dh,0ah        
       db "  ",0dh,0ah
       db "  (tengo que seguir avanzando para encontrar la salida...)",0dh,0ah
       DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
       db   0dh,0ah,24h


        ;Deposito
        ;ARMADURA_OBTENIDA DB "AHORA ESTOY MAS SEGURO CON ESTA BELLA ARMADURA",0dh, 0ah,24h
        ;SOGA_OBTENIDA DB "(Reviso el armario y encuentro una soga robusta... creo que me servira en el futuro)",0dh, 0ah,24h 
        ;ARMARIO_BLOQUEADO DB "(CREO QUE NECESITO UNA LLAVE PARA ABRIR EL ARMARIO)",0dh, 0ah,24h 

        SOGA_OBTENIDA db 0dh,0ah
                      db 0dh,0ah
                      db "  (Abro el armario...reviso y nada util....",0dh,0ah  
                      db "  ...me percato una vez mas... que es eso?... una soga?)",0dh,0ah        
                      db "  ",0dh,0ah
                      db "  (La guardare...Quizas me sirva para el futuro...)",0dh,0ah
                      DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
                      db   0dh,0ah,24h

        ARMARIO_BLOQUEADO db 0dh,0ah
                      db 0dh,0ah
                      db "  (Intento forzar la puerta pero es imposible....",0dh,0ah  
                      db "  ...no debo hacer mucho ruido... me escondo y retrocedo)",0dh,0ah        
                      db "  ",0dh,0ah
                      db "  (creo que necesito una llave para abrirlo...)",0dh,0ah
                      DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
                      db   0dh,0ah,24h


         Mensaje_CAJAS_VACIAS db 0dh,0ah
                      db 0dh,0ah
                      db "  (Reviso estas cajas....",0dh,0ah  
                      db "  ...creo que estan vacias...)",0dh,0ah        
                      db "  ",0dh,0ah
                      db "  (si definitivamente estan vacias...)",0dh,0ah
                      DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
                      db   0dh,0ah,24h

        ;Mensaje_CAJAS_VACIAS DB "(Reviso las cajas y no encuentro nada util)",0dh, 0ah,24h 


        SINSOGA db 0dh,0ah
                      db 0dh,0ah
                      db "  (Por aca veo el patio principal que da a la salida....",0dh,0ah  
                      db "  ...pero esta muy alto si salto morire...)",0dh,0ah        
                      db "  ",0dh,0ah
                      db "  (Necesito encontrar algo que me ayude a bajar...)",0dh,0ah
                      DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
                      db   0dh,0ah,24h


        CONSOGA db 0dh,0ah
                      db 0dh,0ah
                      db "  (Ato la soga al borde de la ventana ....",0dh,0ah  
                      db "  ...bajo lentamente teniendo cuidado de no hacer ruido...)",0dh,0ah        
                      db "  ",0dh,0ah
                      db "  (Pude lograrlo...Estoy en el patio de la prision...)",0dh,0ah
                      DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
                      db   0dh,0ah,24h

        ;SINSOGA DB "POR ACA VEO LA SALIDA PERO ESTA MUY ALTO.. SI SALTO MORIRE",0dh, 0ah,24h 
        ;CONSOGA DB "SABIA QUE ESTA SOGA ME SERVIRIA PARA ALGO (ATAS LA SOGA Y BAJAS A LAS BARRACAS)",0dh, 0ah,24h 
        ;EVENTO ENFERMERA

        CONPISTA4  db 0dh,0ah
                   db 0dh,0ah
                   db "  ENFERMERA:",0dh,0ah  
                   db "  VAMOS A SALVAR AL VIEJO NO PIERDAS TIEMPOO..",0dh,0ah         
                   db 0dh,0ah
                   DB "  YO:",0dh,0ah
                   db "  SI LO SE... NECESITO RESOLVER OTRAS COSAS",0dh,0ah
                   db "  AHORA VAMOS A SALVAR EL VIEJO",0dh,0ah
                   db 0dh,0ah            
                   db "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                   db 0dh,0ah,24h

  ENFERMERA_PRESA  db 0dh,0ah
                   db 0dh,0ah
                   db "  ENFERMERA:",0dh,0ah  
                   db "  AYUDAAAA PORFAVOOOR... NECESITO QUE ME LIBERES..",0dh,0ah         
                   db 0dh,0ah
                   db "  (Te acercas y desatas a la enfermera)" ,0dh,0ah
                   DB "  YO:",0dh,0ah
                   db "  MEJOR QUEDATE CONMIGO PORQUE ES MUY PELIGROSO",0dh,0ah                   
                   db 0dh,0ah  
                   db "  ENFERMERA:",0dh,0ah
                   db "  MUCHAS GRACIAS... VOY AYUDARTE EN LO QUE NECESITES",0dh,0ah
                   db "  (le comentas que el viejo esta herido y se ofrece a ayudarte",0dh,0ah
                   DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                   dB "  (CONSEJO: Revisa en la libreta las pistas....)",0dh,0ah
                   db   0dh,0ah,24h


      VOZ_OSCURA  db 0dh,0ah
                   db 0dh,0ah
                   db "  (Sentis un susurro en el oido)",0dh,0ah
                   db "  VOZ OSCURA:",0dh,0ah  
                   db "  LA CLAVE DEL BAUL ES ICKKY2P2...",0dh,0ah         
                   db 0dh,0ah             
                   DB "  YO:",0dh,0ah
                   db "  ... QUIEN ANDA AHII???",0dh,0ah                   
                   db 0dh,0ah  
                   db "  (Haces una pausa y volves a preguntar)",0dh,0ah
                   db "  QUIEN ANDA AHI???......",0dh,0ah
                   db "  (Te retiras recordando esa combinacion rara)",0dh,0ah
                   DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
                   dB "  (CONSEJO: Revisa en la libreta las pistas....)",0dh,0ah
                   db   0dh,0ah,24h

     MIEDO_CUARTO   db 0dh,0ah
                   db 0dh,0ah
                   db "  (Sentis un susurro en el oido)",0dh,0ah
                   db "  VOZ OSCURA:",0dh,0ah  
                   db "  VAMOOOOS... DEBES SALIR DE ESTA CARCEL",0dh,0ah         
                   db 0dh,0ah             
                   DB "  YO:",0dh,0ah
                   db "  QUIEN SOS?... QUIEN ANDA AHII???",0dh,0ah                   
                   db 0dh,0ah  
                   db "  (Porque vuelvo a entrar a este cuarto tan tenebroso??)",0dh,0ah  
                   DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah             
                   db   0dh,0ah,24h


        ;CONPISTA4   DB "ENFERMERA: VAMOS A SALVAR AL VIEJO NO PIERDAS EL TIEMPO",0dh, 0ah,24h 
        ;ENFERMERA_PRESA DB "AYUDAAAAAAAA (liberas a la enfermera y te da una pista)",0dh, 0ah,24h
        ;EVENTO_OSCURO
        ;VOZ_OSCURA  DB "(SENTIS UN SUSURRO EN TU OIDO). VOZ OSCURA: LA CLAVE DEL BAUL ES ICKKY2P2",0dh, 0ah,24h
        ;MIEDO_CUARTO DB "(PORQUE VUELVO A ENTRAR A ESTE CUARTO TAN TENEBROSO?)",0dh, 0ah,24h

        ;DORMITORIO VACIOS
        ;Mensaje_DORMITORIO DB "(esta habitacion esta completamente vacia...)",0dh, 0ah,24h

Mensaje_DORMITORIO db 0dh,0ah
            db 0dh,0ah
            db "  (Recorro el dormitorio en busqueda de algo ....",0dh,0ah  
            db "  ...Reviso debajo de los catres y en los rincones..)",0dh,0ah        
            db "  ",0dh,0ah
            db "  (No hay nada...)",0dh,0ah
            DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah   
            db   0dh,0ah,24h

;CAMPO DE EVENTO_ENTRENAMIENTO
VOZ_FANTASMAGORICA  db 0dh,0ah
            db 0dh,0ah
            db "  (Creo que hay una presencia aqui)",0dh,0ah
            db "  VOZ FANTASMAGORICA:",0dh,0ah  
            db "  HEEEY ESCUCHAAA... REVISA CON CUIDADO EN EL PATIO",0dh,0ah         
            db 0dh,0ah             
            DB "  YO:",0dh,0ah
            db "  COMO?.... REPITELO.... HOLAA??",0dh,0ah                   
            db 0dh,0ah  
            db "  (La presencia que sentias desaparece)",0dh,0ah
            DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
            dB "  (CONSEJO: Revisa en la libreta las pistas....)",0dh,0ah
            db   0dh,0ah,24h

VOZ_FANTASMAGORICA2  db 0dh,0ah
            db 0dh,0ah
            db "  YO:",0dh,0ah  
            db "  REPITEME LO QUE ME DIJISTE",0dh,0ah         
            db 0dh,0ah             
            DB "  VOZ FANTASMAGORICA:",0dh,0ah
            db "  JAJAJAJA.... TEN CUIDADOO EN EL PATIOO...",0dh,0ah                   
            db 0dh,0ah  
            db "  (Creo esa voz fantasmagorica desaparecio para siempre)",0dh,0ah
            DB "  þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
            db   0dh,0ah,24h

           completo db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah                                                                                
                    db "            YO:",0dh,0ah  
                    db "            Parece que no hay nada mas que hacer aqui...",0dh,0ah         
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah
                    db 0dh,0ah                                                             
                    db 0dh,0ah,24h            


;VOZ_FANTASMAGORICA DB "REVISA CON CUIDADO ANTES DE LA BATALLA FINAL....",0dh, 0ah,24h
;VOZ_FANTASMAGORICA2 DB "(esa voz fantasmagorica desaparecio....)",0dh, 0ah,24h
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþFINALþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
FINAL_JUEGO DB "LOGRAS ESCAPAR DE LA PRISION",0dh, 0ah,24h

VICTORIA1 DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB"         þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
DB"         \ \    / /_   _/ ____|__   __/ __ \|  __ \|_   _|   /\    ",0dh,0ah
DB"          \ \  / /  | || |       | | | |  | | |__) | | |    /  \   ",0dh,0ah
DB"           \ \/ /   | || |       | | | |  | |  _  /  | |   / /\ \  ",0dh,0ah
DB"            \  /   _| || |____   | | | |__| | | \ \ _| |_ / ____ \ ",0dh,0ah
DB"             \/   |_____\_____|  |_|  \____/|_|  \_\_____/_/    \_\",0dh,0ah
DB"          þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ",0dh,0ah
DB 0dh,0ah                                                           
DB 0dh,0ah,24h               


barra2 db "ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ",0dh,0ah,24h 

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

CONTINUARA DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB 0dh,0ah
DB"     _____ _____ _   _ _____ _____ _   _ _   _  ___  ______  ___         ",0DH,0AH
DB"    /  __ \  _  | \ | |_   _|_   _| \ | | | | |/ _ \ | ___ \/ _ \        ",0DH,0AH 
DB"    | /  \/ | | |  \| | | |   | | |  \| | | | / /_\ \| |_/ / /_\ \       ",0DH,0AH
DB"    | |   | | | | . ` | | |   | | | . ` | | | |  _  ||    /|  _  |       ",0DH,0AH
DB"    | \__/\ \_/ / |\  | | |  _| |_| |\  | |_| | | | || |\ \| | | |       ",0DH,0AH
DB"     \____/\___/\_| \_/ \_/  \___/\_| \_/\___/\_| |_/\_| \_\_| |_/ þ þ þ ",0DH,0AH
DB 0dh,0ah,24h  


;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþRECOMPENSASþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
;----------------------------------------------------------------------------------------------------------------------------------

RECOMPENSA0 db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "",0dh,0ah  
            db "",0dh,0ah  
            db "",0dh,0ah  
            db "",0dh,0ah  
            db "",0dh,0ah  
            db "",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

;---------------------------------------------------------------------------------------------------------------------------------- 11111111
RECOMPENSA1a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db "  RECLUSO    บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " EL VIEJO RECLUSO    บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db "  NOTAS DEL VIEJO RECLUSO    บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " STE: --> NOTAS DEL VIEJO RECLUSO    บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "   OBTUVISTE: --> NOTAS DEL VIEJO RECLUSO    บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ     OBTUVISTE: --> NOTAS DEL VIEJO RECLUSO    บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ     OBTUVISTE: --> NOTAS DEL VIEJO RECLUSO    บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9a db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ     OBTUVISTE: --> NOTAS DEL VIEJO RECLUSO    บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------





;---------------------------------------------------------------------------------------------------------------------------------- 22222222
RECOMPENSA1b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " GARROTE             บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db "  TE: --> GARROTE            บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " OBTUVISTE: --> GARROTE              บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "        OBTUVISTE: --> GARROTE               บ ฒฒ",0dh,0ah 
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ            OBTUVISTE: --> GARROTE             บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ            OBTUVISTE: --> GARROTE             บ ฒฒ",0dh,0ah 
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9b db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ            OBTUVISTE: --> GARROTE             บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------





;----------------------------------------------------------------------------------------------------------------------------------333333333333
RECOMPENSA1c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah 
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " UCHILLO             บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " TE: -->CUCHILLO             บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db "  OBTUVISTE: -->CUCHILLO             บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "          OBTUVISTE: -->CUCHILLO             บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ            OBTUVISTE: -->CUCHILLO             บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ            OBTUVISTE: -->CUCHILLO             บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9c db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ            OBTUVISTE: -->CUCHILLO             บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------



;----------------------------------------------------------------------------------------------------------------------------------44444444444
RECOMPENSA1d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah              
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ERA         บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " DURA LIGERA         บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db "  -->ARMADURA LIGERA         บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " TUVISTE: -->ARMADURA LIGERA         บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "       OBTUVISTE: -->ARMADURA LIGERA         บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ         OBTUVISTE: -->ARMADURA LIGERA         บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ         OBTUVISTE: -->ARMADURA LIGERA         บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9d db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ         OBTUVISTE: -->ARMADURA LIGERA         บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------------------------------------------------5555555555555
RECOMPENSA1e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ARIO        บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db "  DEL ARMARIO        บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db "  -->LLAVE DEL ARMARIO       บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db "  VISTE: -->LLAVE DEL ARMARIO        บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "      OBTUVISTE: -->LLAVE DEL ARMARIO        บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ        OBTUVISTE: -->LLAVE DEL ARMARIO        บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ        OBTUVISTE: -->LLAVE DEL ARMARIO        บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9e db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ       OBTUVISTE: -->LLAVE DEL ARMARIO         บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------------------------------------------------666666666666
RECOMPENSA1f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " TA          บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " GA ROBUSTA          บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " : --> SOGA ROBUSTA          บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " BTUVISTE: --> SOGA ROBUSTA          บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "        OBTUVISTE: --> SOGA ROBUSTA          บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ          OBTUVISTE: --> SOGA ROBUSTA          บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ          OBTUVISTE: --> SOGA ROBUSTA          บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9f db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ          OBTUVISTE: --> SOGA ROBUSTA          บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------------------------------------------------7777777777777
RECOMPENSA1g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " AXIMA       บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " U VIDA MAXIMA       บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " O EN 2 TU VIDA MAXIMA       บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " CREMENTO EN 2 TU VIDA MAXIMA        บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "     SE INCREMENTO EN 2 TU VIDA MAXIMA       บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ       SE INCREMENTO EN 2 TU VIDA MAXIMA       บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ       SE INCREMENTO EN 2 TU VIDA MAXIMA       บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9g db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ       SE INCREMENTO EN 2 TU VIDA MAXIMA       บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------------------------------------------------8888888888888888888
RECOMPENSA1h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " NALES       บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " AS MEDICINALES      บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " --> HIERBAS MEDICINALES     บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " VISTE: --> HIERBAS MEDICINALES      บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "   OBT UVISTE: --> HIERBAS MEDICINALES       บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ      OBTUVISTE: --> HIERBAS MEDICINALES       บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ      OBTUVISTE: --> HIERBAS MEDICINALES       บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9h db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ      OBTUVISTE: --> HIERBAS MEDICINALES       บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------



;----------------------------------------------------------------------------------------------------------------------------------99999999999999999999
RECOMPENSA1i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " GA          บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " PADA LARGA          บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " : --> ESPADA LARGA          บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " BTUVISTE: --> ESPADA LARGA          บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "        OBTUVISTE: --> ESPADA LARGA          บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ          OBTUVISTE: --> ESPADA LARGA          บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ          OBTUVISTE: --> ESPADA LARGA          บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9i db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ          OBTUVISTE: --> ESPADA LARGA          บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------



;---------------------------------------------------------------------------------------------------------------------------------- 10 10 10 10 10 10 10 10
RECOMPENSA1j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " DA          บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " URA PESADA          บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " -> ARMADURA PESADA          บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " TUVISTE:--> ARMADURA PESADA         บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "       OBTUVISTE:--> ARMADURA PESADA         บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ         OBTUVISTE:--> ARMADURA PESADA         บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ         OBTUVISTE:--> ARMADURA PESADA         บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9j db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ         OBTUVISTE:--> ARMADURA PESADA         บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------


;---------------------------------------------------------------------------------------------------------------------------------- 11 11 11 11 11 11 
RECOMPENSA1k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออป ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db "     บ ฒฒ",0dh,0ah  
            db " ออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
              
RECOMPENSA2k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออป ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " O +1        บ ฒฒ",0dh,0ah  
            db "             บ ฒฒ",0dh,0ah  
            db " ออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA3k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " A DE DADO +1        บ ฒฒ",0dh,0ah  
            db "                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA4k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " -> TIRADA DE DADO +1        บ ฒฒ",0dh,0ah  
            db "                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA5k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " UVISTE:--> TIRADA DE DADO +1        บ ฒฒ",0dh,0ah  
            db "                                     บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA6k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db "      OBTUVISTE:--> TIRADA DE DADO +1        บ ฒฒ",0dh,0ah  
            db "                                             บ ฒฒ",0dh,0ah  
            db " ออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA7k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "      ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "    ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    บ        OBTUVISTE:--> TIRADA DE DADO +1        บ ฒฒ",0dh,0ah  
            db "    บ                                               บ ฒฒ",0dh,0ah  
            db "    ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA8k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "           ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "         ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         บ        OBTUVISTE:--> TIRADA DE DADO +1        บ ฒฒ",0dh,0ah  
            db "         บ                                               บ ฒฒ",0dh,0ah  
            db "         ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H

RECOMPENSA9k db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db "                ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ",0dh,0ah  
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออป ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              บ        OBTUVISTE:--> TIRADA DE DADO +1        บ ฒฒ",0dh,0ah  
            db "              บ                                               บ ฒฒ",0dh,0ah  
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออผ   ",0dh,0ah           
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah
            db  0dh,0ah,24H
;----------------------------------------------------------------------------------------------------------------------------------------------




        
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþCOSAS LIBRETAþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
informacion db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "             ษออออออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db "             บ            (NOTAS DEL VIEJO) MENU:               บ",0dh,0ah
            db "             ฬออออออออออออออออออออออออออออออออออออออออออออออออออน",0dh,0ah
            db "             บ Informacion Guardia carceles         (Presione 1)บ",0dh,0ah    
            db "             บ Informacion Soldados rasos           (Presione 2)บ",0dh,0ah    
            db "             บ Informacion Soldados imperiales      (Presione 3)บ",0dh,0ah
            db "             ฬออออออออออออออออออออออออออออออออออออออออออออออออออน",0dh,0ah                
            db "             บ Informacion zonas de la prision      (Presione 4)บ",0dh,0ah
            db "             บ Informacion armas y armaduras        (Presione 5)บ",0dh,0ah
            db "             บ Informacion peleas                   (Presione 6)บ",0dh,0ah
            db "             ฬออออออออออออออออออออออออออออออออออออออออออออออออออน",0dh,0ah            
            db "             บ Tu estado actual y objetos           (Presione 7)บ",0dh,0ah
            db "             บ Pistas y recuerdos                   (Presione 8)บ",0dh,0ah
            db "             ฬออออออออออออออออออออออออออออออออออออออออออออออออออน",0dh,0ah
            db "             บ Salir                                (Presione 0)บ",0dh,0ah
            db "             ศออออออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah
            db "",0dh,0ah,24h

  guardias  db "",0dh,0ah
            db "",0dh,0ah
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db "              บ GUARDIA CARCELES                                บ",0dh,0ah
            db "              บ Dificultad para derrotalo: BAJA                 บ",0dh,0ah            
            db "              บ Vida de los guardias: 2                         บ",0dh,0ah
            db "              บ Armas: GARROTE                                  บ",0dh,0ah
            db "              บ Armadura: (no llevan)                           บ",0dh,0ah
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah
            db "",0dh,0ah
            db "              ษอออออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db "              บ JEFE DE GUARDIAS:                               บ",0dh,0ah
            db "              บ Dificultad para derrotalo:  (DESCONOCIDO)       บ",0dh,0ah            
            db "              บ Vida del jefe de guardias:  (DESCONOCIDO)       บ",0dh,0ah
            db "              บ Armas: (DESCONOCIDO)                            บ",0dh,0ah
            db "              บ Armadura: (DESCONOCIDO)                         บ",0dh,0ah
            db "              ศอออออออออออออออออออออออออออออออออออออออออออออออออผ ",0dh,0ah
            db "",0dh,0ah        
            db "",0dh,0ah,24h

Soldados_ras db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "             ษอออออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
             db "             บ SOLDADO RASO:                                   บ",0dh,0ah
             db "             บ Dificultad para derrotalo: MEDIA                บ",0dh,0ah                       
             db "             บ Vida del soldado raso: 3                        บ",0dh,0ah
             db "             บ Armas: ESPADA CORTA                             บ",0dh,0ah
             db "             บ Armadura: ARMADURA LIGERA                       บ",0dh,0ah
             db "             ศอออออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah        
             db "",0dh,0ah,24h
     
Soldados_imp db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah 
             db "               ษอออออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
             db "               บ SOLDADO IMPERIAL:                               บ",0dh,0ah
             db "               บ Dificultad para derrotalo: ALTA                 บ",0dh,0ah              
             db "               บ Vida del soldado raso: 8                        บ",0dh,0ah
             db "               บ Armas: ESPADA LARGA                             บ",0dh,0ah
             db "               บ Armadura: ARMADURA MEDIA                        บ",0dh,0ah
             db "               ศอออออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah 
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah
             db "",0dh,0ah          
             db "",0dh,0ah
             db "",0dh,0ah,24h                       

zonas_lugar db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah          
            db "",0dh,0ah
            db "                  ZONAS DE LA CARCEL:",0dh,0ah
            db "                  torre de vigilancia       þ PISO 3      ",0dh,0ah            
            db "                  Zona de celdas            þ PISO 2      ",0dh,0ah
            db "                  Cocina                    þ PISO 2      ",0dh,0ah 
            db "                  Deposito                  þ PISO 2      ",0dh,0ah
            db "                  Barracas                  þ PISO 2      ",0dh,0ah
            db "                  Enfermeria                þ PISO 2      ",0dh,0ah
            db "                  Desconocido               þ PISO 1      ",0dh,0ah
            db "                  Desconocido               þ PISO 1      ",0dh,0ah 
            db "                  PATIO PRINCIPAL (SALIDA)  þ PLANTA BAJA ",0dh,0ah
            db "",0dh,0ah          
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah,24h

      armas db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "                 þþþþþþþþþþþþþþ ARMAS DEL JUEGO þþþþþþþþþþþþþ",0dh,0ah            
            db "                 Garrote:             +1 por golpe acertado  ",0dh,0ah
            db "                 Cuchillo del jefe:   +2 por golpe acertado  ",0dh,0ah 
            db "                 Espada corta:        +3 por golpe acertado  ",0dh,0ah
            db "                 Espada larga:        +4 por golpe acertado  ",0dh,0ah
            db "",0dh,0ah
            db "                 þþþþþþþþþþþþ ARMADURAS DEL JUEGO þþþþþþþþþþþ",0dh,0ah            
            db "                 Armadura ligera:     -1 por golpe recibido  ",0dh,0ah
            db "                 Armadura media:      -2 por golpe recibido  ",0dh,0ah
            db "                 Armadura pesada:     -3 por golpe recibido  ",0dh,0ah
            db "",0dh,0ah 
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah,24h

      pelea db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "        ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db "        บ      INFORMACION SOBRE LA MODALIDAD DE LOS COMBATES:       บ",0dh,0aH
            DB "        ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน",0dh,0aH
            db "        บ >Las peleas en este juego estan definidas por el azar.     บ",0dh,0ah
            db "        บ                                                            บ",0dh,0ah
            db "        บ >Tendras la posibilidad de arrojar un dado cuando te       บ",0dh,0ah
            db "        บ ataquen para intentar evadir el golpe y  otro para atacar. บ",0dh,0ah
            db "        บ                                                            บ",0dh,0ah
            db "        บ >Podras mejorar tus posibilidades de ganar en la medida    บ",0dh,0ah
            db "        บ que avances en el juego obteniendo distintos recursos.     บ",0dh,0ah           
            db "        ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah                          
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah,24h

tu_equipo db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "      TUS PUNTOS DE VIDA ACTUALES SON:  "
         hp db 33h,0dh,0ah
            db "      EL ARMA QUE LLEVAS EQUIPADA ES:  "
       arma db "(vacio)               ",0dh,0ah  
            db "      LA ARMADURA QUE LLEVAS EQUIPADA ES:  "
   armadura db "(vacio)               ",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah       
    OBJETOS db "      OBJETOS:",0dh,0ah
            db "",0dh,0ah
            db "      objeto1:  "
       obj1 db "(vacio)               ",0dh,0ah
            db "      objeto2:  "
       obj2 db "(vacio)               ",0dh,0ah
            db "      objeto3:  "
       obj3 db "(vacio)               ",0dh,0ah
            db "      objeto4:  "
       obj4 db "(vacio)               ",0dh,0ah
            db "      objeto5:  "
       obj5 db "(vacio)               ",0dh,0ah
            db "      objeto6:  "
       obj6 db "(vacio)               ",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah,24h
            


     PISTAS db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah       
            db "      PISTAS Y RECUERDOS:",0dh,0ah
            db "",0dh,0ah
            db "      PISTA1:  "
       P1 db "(vacio)                                   "
            DB"                                         ",0dh,0ah
            db "      PISTA2:  "
       P2 db "(vacio)                                   "
          DB"                                           ",0dh,0ah
            db "      PISTA3:  "
       P3 db "(vacio)                                   "
            DB"                                         ",0dh,0ah
            db "      PISTA4:  "
       P4 db "(vacio)                                   "
          DB"                                           ",0dh,0ah
            db "      PISTA5:  "
       P5 db "(vacio)                                   "
          DB"                                           ",0dh,0ah
            db "      PISTA6:  "
       P6 db "(vacio)                                  "
          DB"                                          ",0dh,0ah
            db "",0dh,0ah
            db "",0dh,0ah,24h

   contador_HP_E db "0",0dh,0ah,24h
    arma_enemigo db  0,0dh,0ah,24h           
armadura_enemigo db  0,0dh,0ah,24h          

       arma_equi db 0
   armadura_equi db 0
       obj1_equi db 0
       obj2_equi db 0
       obj3_equi db 0
       obj4_equi db 0

       pista1 db 0 ,24h
       pista2 db 0 ,24h
       pista3 db 0 ,24h
       pista4 db 0 ,24h
       pista5 db 0 ,24h
       pista6 db 0 ,24h

       ;FLAG_PISTA4

  FLAG_RECOMPENSA3 db 0 ;CUCHILLO
  FLAG_RECOMPENSA4 db 0 ;ARMADURA LIGERA
  FLAG_RECOMPENSA5 DB 0 ;LLAVE1
  FLAG_RECOMPENSA6 DB 0 ;SOGA
  FLAG_RECOMPENSA7 DB 0 ;POCION (NO ES UN OBJETO)
  FLAG_RECOMPENSA8 DB 0 ;HIERBAS MEDIC
  FLAG_RECOMPENSA9 DB 0 ;ESPADA LARGA
  FLAG_RECOMPENSA10 DB 0;ARMADURA PESADA
  flag_barracas DB 0;sistema de flags para entrar a las barracas 
  flag_barracas2 db 0;sistema de flags para entrar a las barracas
  flag_SUERTE DB 0;TIRADA DE DADOS +1
  FLAG_FINAL DB 0
  flag_revivi db 0

        

        garrote db "GARROTE",0dh,0ah
           cod1 db 1,0dh,0ah,24h
cuchillo_cocina db "CUCHILLO",0dh,0ah
           cod2 db 2,0dh,0ah,24h
   espada_corta db "ESPADA CORTA",0dh,0ah
           cod3 db 3,0dh,0ah,24h
   espada_larga db "ESPADA LARGA",0dh,0ah
           cod4 db 4,0dh,0ah,24

armadura_ligera db "ARMADURA LIGERA",0dh,0ah
           cod5 db 1,0dh,0ah,24h
 armadura_media db "ARMADURA MEDIA",0dh,0ah
           cod6 db 2,0dh,0ah,24h
armadura_pesada db "ARMADURA PESADA",0dh,0ah
           cod7 db 3,0dh,0ah,24h

         llave1 db "LLAVE DEL ARMARIO",0dh,0ah
            ll1 db 1,0dh,0ah,24h
         llave2 db "SOGA ROBUSTA",0dh,0ah
            ll2 db 2,0dh,0ah,24h
         llave3 db "HIERBAS MEDICINALES",0dh,0ah
            ll3 db 3,0dh,0ah,24h
         llave4 db "MANOJO DE LLAVES 4",0dh,0ah
            ll4 db 4,0dh,0ah,24h

        pista_1 db "UN PRISIONERO ME DIJO QUE EL GUARDIA ESTA BORRACHO EN LA COCINA",0dh,0ah,24h               
            pi1 db 1,0dh,0ah,24h
        pista_2 db "LA TORRE DE VIGILANCIA ESTA VACIA",0dh,0ah,24h
            pi2 db 2,0dh,0ah,24h
        pista_3 db "HAY UNA ARMADURA FRENTE AL BANCO EN LA ARMERIA",0dh,0ah,24h
            pi3 db 3,0dh,0ah,24h
        pista_4 db "AGARRAR HIERBAS PARA SALBAR AL VIEJO",0dh,0ah,24h
            pi4 db 4,0dh,0ah,24h
        pista_5 db "LA CLAVE DEL BAUL ES ICKKY2P2",0dh,0ah,24h
            pi5 db 5,0dh,0ah,24h
        pista_6 db "REVISA BIEN ANTES DE LA BATALLA FINAL",0dh,0ah,24h
            pi6 db 6,0dh,0ah,24h

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ            


;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþCOSAS PELEAþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

 

     RAPIDO db 0dh,0ah 
            db 0dh,0ah 
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah            
            db 0dh,0ah   
            db"                ษออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db"                บ                                              บ",0dh,0ah
            db"                บ        Este enemigo es mas rapido            บ",0dh,0ah            
            db"                บ       y te esta atacando nuevamente          บ",0dh,0ah
            db"                บ                                              บ",0dh,0ah      
            db"                ศออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah            
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah,24H 

     atacan db 0dh,0ah 
            db 0dh,0ah 
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah            
            db 0dh,0ah
            db 0dh,0ah   
            db"                ษออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db"                บ                                              บ",0dh,0ah
            db"                บ      ES EL TURNO DE ATAQUE DEL ENEMIGO       บ",0dh,0ah            
            db"                บ                                              บ",0dh,0ah      
            db"                ศออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah            
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah,24H 

     ataco db 0dh,0ah 
            db 0dh,0ah 
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah               
            db"                ษออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db"                บ                                              บ",0dh,0ah
            db"                บ            ES TU TURNO DE ATAQUE             บ",0dh,0ah            
            db"                บ                                              บ",0dh,0ah      
            db"                ศออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah            
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah,24H

     EVADE1 db 0dh,0ah   
            db"                ษออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db"                บ         ARROJAR UN DADO PARA EVADIR:         บ",0dh,0ah
            db"                บ                                              บ",0dh,0ah
            db"                บ      >>> Presiona ENTER para arrojarlo       บ",0dh,0ah
            db"                บ    (Evades si sacas 4 o mas en la tirada)    บ",0dh,0ah   
            db"                ศออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah,24h                         

                             
               ;123456789a123456789b123456789c123456789d123456789e123456789f123456789g123456789h

     EVADE3 db"                        LO SIENTO RECIBISTE EL ATAQUE...",0dh,0ah,24H          
     EVADE4 db"                                 EVADISTE!!!",0dh,0ah,24h 

   ACIERTO1 db 0dh,0ah   
            db"                ษออออออออออออออออออออออออออออออออออออออออออออออป",0dh,0ah
            db"                บ         ARROJAR UN DADO PARA ATACAR:         บ",0dh,0ah
            db"                บ                                              บ",0dh,0ah
            db"                บ      >>> Presiona ENTER para arrojarlo       บ",0dh,0ah
            db"                บ   (Aciertas si sacas 4 o mas en la tirada)   บ",0dh,0ah    
            db"                ศออออออออออออออออออออออออออออออออออออออออออออออผ",0dh,0ah,24h  
               ;123456789a123456789b123456789c123456789d123456789e123456789f123456789g123456789h           
            
   ACIERTO3 db"                       LO SIENTO,PERO ERRASTE EL GOLPE...",0dh,0ah,24h             
   ACIERTO4 db"                            ACERTASTE EL GOLPE!!!",0dh,0ah,24h
            


   vidas_yo db 0dh,0ah
            db 0dh,0ah
            db 0dh,0ah
            db"                              TU TIENES ";VIDAS
      HP_yo db 33h
            db" VIDAS ",0dh,0ah,24H
            
    
vidas_enemigo db 0dh,0ah
              db 0dh,0ah
              db 0dh,0ah
              db"                           TU ENEMIGO TIENE ";VIDAS
 hp_enemigo   db"0"  
              db" VIDAS",0dh,0ah,24H
     

victoria    db"",0dh,0ah
            db"",0dh,0ah
            db"                         HAS DERROTADO A TU ENEMIGO",0dh,0ah
            db"",0dh,0ah
            db"",0dh,0aH
            db"",0dh,0ah
            db"",0dh,0aH
            db"",0dh,0ah,24h   

 GAMEOVER   db"",0dh,0ah
            db"",0dh,0ah
            db"                           HAS MUERTO EN BATALLA",0dh,0ah
            db"",0dh,0ah
            db"                          1 <<< SEGUIR JUGANDO",0dh,0aH
            db"                          2 <<< FINALIZAR PARTIDA",0dh,0ah,24h 

               ;123456789a123456789b123456789c123456789d123456789e123456789f123456789g123456789h
      dado1 db"",0dh,0ah
            db"                                  ฑฑฑฑฑฑฑฑฑฑฑ",0dh,0ah
            db"                                 ÜÜÜÜÜÜÜÜÜ ฑฑ",0dh,0ah
            db"                                 Û       Û ฑฑ",0dh,0ah
            db"                                 Û   þ   Û ฑฑ",0dh,0ah
            db"                                 Û       Û ฑฑ",0dh,0ah
            db"                                 ฿฿฿฿฿฿฿฿฿   ",0dh,0ah
            db"",0dh,0ah,24h

      dado2 db"",0dh,0ah
            db"                                  ฑฑฑฑฑฑฑฑฑฑฑ",0dh,0ah
            db"                                 ÜÜÜÜÜÜÜÜÜ ฑฑ",0dh,0ah
            db"                                 Û     þ Û ฑฑ",0dh,0ah
            db"                                 Û       Û ฑฑ",0dh,0ah
            db"                                 Û þ     Û ฑฑ",0dh,0ah
            db"                                 ฿฿฿฿฿฿฿฿฿   ",0dh,0ah
            db"",0dh,0ah,24h

      dado3 db"",0dh,0ah
            db"                                  ฑฑฑฑฑฑฑฑฑฑฑ",0dh,0ah
            db"                                 ÜÜÜÜÜÜÜÜÜ ฑฑ",0dh,0ah
            db"                                 Û     þ Û ฑฑ",0dh,0ah
            db"                                 Û   þ   Û ฑฑ",0dh,0ah
            db"                                 Û þ     Û ฑฑ",0dh,0ah
            db"                                 ฿฿฿฿฿฿฿฿฿   ",0dh,0ah
            db"",0dh,0ah,24h

      dado4 db"",0dh,0ah
            db"                                  ฑฑฑฑฑฑฑฑฑฑฑ",0dh,0ah
            db"                                 ÜÜÜÜÜÜÜÜÜ ฑฑ",0dh,0ah
            db"                                 Û þ   þ Û ฑฑ",0dh,0ah
            db"                                 Û       Û ฑฑ",0dh,0ah
            db"                                 Û þ   þ Û ฑฑ",0dh,0ah
            db"                                 ฿฿฿฿฿฿฿฿฿   ",0dh,0ah
            db"",0dh,0ah,24h

      dado5 db"",0dh,0ah
            db"                                  ฑฑฑฑฑฑฑฑฑฑฑ",0dh,0ah
            db"                                 ÜÜÜÜÜÜÜÜÜ ฑฑ",0dh,0ah
            db"                                 Û þ   þ Û ฑฑ",0dh,0ah
            db"                                 Û   þ   Û ฑฑ",0dh,0ah
            db"                                 Û þ   þ Û ฑฑ",0dh,0ah
            db"                                 ฿฿฿฿฿฿฿฿฿   ",0dh,0ah
            db"",0dh,0ah,24h

      dado6 db"",0dh,0ah
            db"                                  ฑฑฑฑฑฑฑฑฑฑฑ",0dh,0ah
            db"                                 ÜÜÜÜÜÜÜÜÜ ฑฑ",0dh,0ah
            db"                                 Û þ   þ Û ฑฑ",0dh,0ah
            db"                                 Û þ   þ Û ฑฑ",0dh,0ah
            db"                                 Û þ   þ Û ฑฑ",0dh,0ah
            db"                                 ฿฿฿฿฿฿฿฿฿   ",0dh,0ah 
            db"",0dh,0ah,24h


    numero1 db "0",0dh,0ah,24h;variable para la comparacion de tirada del dado      

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþcosas dadoþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

.code
PUBLIC FUN_RECOMPENSA_A
PUBLIC FUN_RECOMPENSA_B
PUBLIC FUN_RECOMPENSA_C
PUBLIC FUN_RECOMPENSA_D
PUBLIC FUN_RECOMPENSA_E
PUBLIC FUN_RECOMPENSA_F
PUBLIC FUN_RECOMPENSA_G
PUBLIC FUN_RECOMPENSA_H
PUBLIC FUN_RECOMPENSA_I
PUBLIC FUN_RECOMPENSA_J
PUBLIC FUN_RECOMPENSA_K

public LECTURA;þþþþþþþþþþþþþþþþþþþþ> SIMPLE CAJA DE LECTURA 
public IMPRIMIR;þþþþþþþþþþþþþþþþþ> LLAMADO AL SERVICIO 9 INT 21H (PARA IMPRESION)

public CLEARSCREEN ;þþþþþþþþþþþþþþþþþþþ> LIMPIAR LA PANTALLA
public CONTINUAR ; þþþþþþþþþþþþþþþþþþþþ> AL PRESIONAR ENTER CONTINUA LA EJECUCION DEL PROGRAMA
public ELEGIR;þþþþþþþþþþþþþþþþþþþþþþþþþ> COMPARA UN CARACTER CON "1" O "2"
public ELEGIR3
public ELEGIR2
public ESPACIO_CONTINUAR

public COMIENZO
public INTRODUCCION
public LIBRETA_VIEJO
public RANDOM6 


;BATALLA GUARDIA
PUBLIC EVADIR
PUBLIC func_dado_evadir_1
PUBLIC func_dado_evadir_2
PUBLIC func_dado_evadir_3
PUBLIC func_dado_evadir_4
PUBLIC func_dado_evadir_5
PUBLIC func_dado_evadir_6
PUBLIC FUNC_DADO_ataque_1
PUBLIC FUNC_DADO_ataque_2
PUBLIC FUNC_DADO_ataque_3
PUBLIC FUNC_DADO_ataque_4
PUBLIC FUNC_DADO_ataque_5
PUBLIC FUNC_DADO_ataque_6
PUBLIC fun_tempo
PUBLIC ATACAR
PUBLIC BAJAVIDA1
PUBLIC BAJAVIDA1_BOT
PUBLIC VIDA_PERSONAJE
PUBLIC VIDA_BOT
PUBLIC PELEA_GUARDIA

;FUNCIONES DE LOS DISTINTOS ESCENARIOS. CALABOZOS DESCONOCIDOS
PUBLIC CELDA200
PUBLIC CELDA201
PUBLIC CELDA202
PUBLIC CELDA203
PUBLIC CELDA204
PUBLIC CELDA205

PUBLIC FUNCION_COCINA
PUBLIC FUNCION_TORRE
PUBLIC BANCO
;FUNCIONES DEPOSITO
PUBLIC EVENTO_DEPOSITO_A  ;BATALLA CON EL GUARDIA
public ARMARIO_GIGANTE
PUBLIC CAJAS_VACIAS
PUBLIC fun_cambio_variable

;ENFERMERIA
PUBLIC EVENTO_POCION
PUBLIC EVENTO_VENTANA
PUBLIC EVENTO_FRASCOS
PUBLIC EVENTO_ENFERMERA
;BARRACAS
PUBLIC EVENTO_OSCURO
PUBLIC BAUL_ARMAS
PUBLIC DORMITORIO_VACIO
PUBLIC EVENTO_ENTRENAMIENTO
PUBLIC ATACA_RASO 

;PATIO (FINAL)
PUBLIC EVENTO_ESTATUA
PUBLIC EVENTO_IMPERIAL
PUBLIC EVENTO_FUENTE
PUBLIC EVENTO_ARBOL
PUBLIC FUN_VICTORIA
public salvar_viejo
PUBLIC CONTINUARA1

RANDOM6 proc
   ;RANDOM PARA LOS DADOS. GENERA NUMEROS DEL 1 AL 6 INCLUSIVE
    push bp
    mov bp, sp
    push bx
    push dx
    push ax
    push si
    pushf
    
    mov bx, ss:[bp+4]

    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    xor ax, ax
    mov ah, 2ch
    int 21h
    mov ax,dx
    add ax,1234
    xor dx,dx 
    xor cx,cx  
    mov cx, 6
    div cx
    add dl,30h;
    add dl,1      
    mov [bx],dx
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

    popf
    pop si
    pop ax
    pop dx
    pop bx
    pop bp
    ret 2
RANDOM6 ENDP


LECTURA PROC
    ; þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    ;บDESCRIPCION: SIMPLE CAJA DE LECTURA DONDE SE LE PASA UNA SOLA   บ
    ;บ              VARIABLE                                          บ
     
    ;บVARIABLES: TEXTO DB 255 DUP ("$")                               บ 
    ;บLLAMADA FUNCION lectura                                         บ 
    ;บ        mov bx, offset texto                                    บ
    ;บ        push bx; mando al stack el offset de texto              บ  
    ;บ        call lectura                                            บ  
    ;บþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ 
        

    push bp           
    mov bp, sp        
    
    push bx           
    push ax
    
    mov bx, ss:[bp+4]       
    
    textoin:
    mov ah, 1           
    int 21h
    cmp al, 0dh         
    je textoinend      
        
    mov [bx], al        
    inc bx
    jmp textoin           
        
    textoinend:
    
    pop ax          
    pop bx          
    pop bp          

    ret 2       
LECTURA ENDP

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

IMPRIMIR PROC

        ; þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        ;บDESCRIPCION: IMPRIME POR PANTALLA EL OFFSET PEDIDO              บ
        ;บVARIABLES: CUALQUIERA A IMPRIMIR                                บ
        ;บ                                                                บ 
        ;บLLAMADA FUNCION                                                 บ 
        ;บ        mov DX, offset VARIABLE                                 บ
        ;บ        CALL IMPRIMIR                                           บ
        ;บ                                                                บ
        ;บþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ     
     
        push ax
        
            mov ah, 9
            int 21h
            
        pop ax
        ret
IMPRIMIR ENDP

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

CONTINUAR PROC
    ; þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    ;บDESCRIPCION: FUNCION QUE FRENA EL PROGRAMA HASTA PRECSIONAR ENTERบ
    ;บ                                                                 บ
    ;บ                                                                 บ    
    ;บLLAMADA FUNCION                                                  บ 
    ;บ                                                                 บ
    ;บ        CALL CONTINUAR                                           บ
    ;บ                                                                 บ
    ;บþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

    
    push bx
    push dx
    push ax
    push si
    pushf

    ;ENT db "  PRESIONA ENTER PARA CONTINUAR:",24h

    up:
    ;call CLEARSCREEN
    ;þþþþþþþþþþþþþþþþþþþþþþþþþ
    mov ah, 8           
    int 21h
    ;call CLEARSCREEN
    cmp al, 0dh         
    jne up
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    popf
    pop si
    pop ax
    pop dx
    pop bx


    ret
CONTINUAR ENDP

ESPACIO_CONTINUAR proc
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf
    mov ah,9
    lea dx,continuar
    int 21h
    mov ah,8
    int 21h
    cmp al,20h
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret 
ESPACIO_CONTINUAR endp



;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

ELEGIR PROC
    ; þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    ;บDESCRIPCION:GUARDA EL CARACTER ELEGIDO DE NO SER CORRECTO NO AVANZA  บ
    ;บCOMPARA LA VARIABLE INGRESADA CON "1" O CON "2"                      บ
    ;บ                                                                     บ
    ;บ                                                                     บ    
    ;บLLAMADA FUNCION;                                                     บ 
    ;บ        MOV BX, OFFSET [VARIABLE]                                    บ
    ;บ        push bx                                                      บ
    ;บ        CALL ELEGIR                                                  บ
    ;บ                                                                     บ
    ;บþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    push bp           
    mov bp, sp  
    
    push bx
    push dx
    push ax
    push si
    pushf

    
    mov bx, ss:[bp+4]; GUARDO EL OFFSET DE LA VARIABLE OPCION (MAIN) QUE PASE POR EL STACK
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

    ;mov dx, offset TITULO;   "ELIGE UNA OPCION: "
    ;call IMPRIMIR
    DeNuevo:
    mov ah, 8           ;inicio el proceso de lectura de un ascii por teclado
    int 21h

    cmp al, "1"
    je GuardoOpcion

    cmp al, "2"
    je GuardoOpcion

    cmp al, "3"
    je GuardoOpcion

    cmp al, "4"
    je GuardoOpcion

    cmp al, "5"
    je GuardoOpcion

    cmp al, "6"
    je GuardoOpcion

    cmp al, "7"
    je GuardoOpcion
    cmp al, "8"
    je GuardoOpcion
    cmp al, "9"
    je GuardoOpcion

    cmp al, "0"
    je GuardoOpcion
    
    ;call colores
    ;mov dx, offset ERROR
    ;call IMPRIMIR


    jmp DeNuevo


    Guardoopcion: 
    mov [bx],al
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    popf
    pop si
    pop ax
    pop dx
    pop bx
    pop bp


    ret 2
ELEGIR ENDP

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
ELEGIR3 PROC
        ; þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        ;บDESCRIPCION:GUARDA EL CARACTER ELEGIDO DE NO SER CORRECTO NO AVANZA  บ
        ;บCOMPARA LA VARIABLE INGRESADA CON "1" O CON "2"                      บ
        ;บ                                                                     บ
        ;บ                                                                     บ    
        ;บLLAMADA FUNCION;                                                     บ 
        ;บ        MOV BX, OFFSET [VARIABLE]                                    บ
        ;บ        push bx                                                      บ
        ;บ        CALL ELEGIR                                                  บ
        ;บ                                                                     บ
        ;บþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        push bp           
        mov bp, sp  
    
        push bx
        push dx
        push ax
        push si
        pushf

    
        mov bx, ss:[bp+4]; GUARDO EL OFFSET DE LA VARIABLE OPCION (MAIN) QUE PASE POR EL STACK
        ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

        ;mov dx, offset TITULO;   "ELIGE UNA OPCION: "
        ;call IMPRIMIR
        DeNuevo1:
        mov ah, 8           ;inicio el proceso de lectura de un ascii por teclado
        int 21h

        cmp al, "1"
        je GuardoOpcion1

        cmp al, "2"
        je GuardoOpcion1

        cmp al, "3"
        je GuardoOpcion1    
    
   

        jmp DeNuevo1


        Guardoopcion1: 
        mov [bx],al
        ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        popf
        pop si
        pop ax
        pop dx
        pop bx
        pop bp


        ret 2
ELEGIR3 ENDP

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
ELEGIR2 PROC
        ; þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        ;บDESCRIPCION:GUARDA EL CARACTER ELEGIDO DE NO SER CORRECTO NO AVANZA  บ
        ;บCOMPARA LA VARIABLE INGRESADA CON "1" O CON "2"                      บ
        ;บ                                                                     บ
        ;บ                                                                     บ    
        ;บLLAMADA FUNCION;                                                     บ 
        ;บ        MOV BX, OFFSET [VARIABLE]                                    บ
        ;บ        push bx                                                      บ
        ;บ        CALL ELEGIR                                                  บ
        ;บ                                                                     บ
        ;บþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        push bp           
        mov bp, sp  
    
        push bx
        push dx
        push ax
        push si
        pushf

    
        mov bx, ss:[bp+4]; GUARDO EL OFFSET DE LA VARIABLE OPCION (MAIN) QUE PASE POR EL STACK
        ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

        ;mov dx, offset TITULO;   "ELIGE UNA OPCION: "
        ;call IMPRIMIR
        DeNuevo2:
        mov ah, 8           ;inicio el proceso de lectura de un ascii por teclado
        int 21h

        cmp al, "1"
        je GuardoOpcion2

        cmp al, "2"
        je GuardoOpcion2

    
    
        ;call colores
        ;mov dx, offset ERROR
        ;call IMPRIMIR


        jmp DeNuevo2


        Guardoopcion2: 
        mov [bx],al
        ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        popf
        pop si
        pop ax
        pop dx
        pop bx
        pop bp


        ret 2
ELEGIR2 ENDP

CLEARSCREEN proc 
        ; þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        ;บDESCRIPCION: fUNCION QUE LIMPIA LA PANTALLA                      บ
        ;บ                                                                 บ    
        ;บLLAMADA FUNCION                                                  บ 
        ;บ                                                                 บ
        ;บ        CALL CLEARSCREEN                                         บ
        ;บ                                                                 บ
        ;บþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
        push ax
        push es
        push cx
        push di
        mov ax,3
        int 10h
        mov ax,0b800h
        mov es,ax
        mov cx,1000
        mov ax,7
        mov di,ax
        cld
        rep stosw
        pop di
        pop cx
        pop es
        pop ax
        ret 
CLEARSCREEN endp



COMIENZO PROC
    
    ;LLAMA LA PRESENTACION DEL JUEGO. SE PONE EN CONTEXTO AL JUGADOR
    push bx
    push dx
    push ax
    push si
    push cx
    pushf

    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    CALL CLEARSCREEN



    CALL CLEARSCREEN

    
    mov dx, offset presentacion 
    call IMPRIMIR

    mov dx, offset salto 
    call IMPRIMIR


    mov dx, offset barra 
    call IMPRIMIR



    mov dx, offset NOMBRE_ 
    call IMPRIMIR

    mov bx, offset NOMBRE 
    PUSH BX
    call LECTURA

    mov dx, offset EDAD_ 
    call IMPRIMIR

    mov bx, offset EDAD 
    PUSH BX
    call LECTURA

    mov dx, offset RELIGION_ 
    call IMPRIMIR

    mov bx, offset RELIGION
    PUSH BX
    call LECTURA

    mov dx, offset ORIGEN_ 
    call IMPRIMIR

    mov bx, offset ORIGEN
    PUSH BX
    call LECTURA

    CALL CLEARSCREEN


    mov dx, offset salto
    call IMPRIMIR
    mov dx, offset INTRODUCCION0
    call IMPRIMIR
    mov dx, offset INTRODUCCION2
    call IMPRIMIR
    mov dx, offset INTRODUCCION5
    call IMPRIMIR
    
    mov dx, offset INTRODUCCION7
    call IMPRIMIR

    mov dx, offset ENT
    call IMPRIMIR

    call continuar

    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    popf
    pop cx
    pop si
    pop ax
    pop dx
    pop bx
    ret 
COMIENZO ENDP



INTRODUCCION PROC
    ;COMIENZA LA HISTORIA EN LA CARCEL
    push bx
    push dx
    push ax
    push si
    push cx
    pushf

    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    CALL CLEARSCREEN

    mov dx, offset DIALOGO1
    call imprimir

    mov dx, offset barra2
    call imprimir

    mov dx, offset ENT
    call imprimir

    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CONTINUAR


    CALL FUN_RECOMPENSA_A;LIBRETA 

   

    call LIBRETA_VIEJO

    mov dx, offset ENT
    call imprimir

    call Clearscreen

    mov dx, offset DIALOGO2
    call imprimir

    mov dx, offset barra2
    call imprimir

    mov dx, offset ENT
    call imprimir
    CALL CONTINUAR

    CALL FUN_RECOMPENSA_B;GRARROTE 

    ;þþþþþþþþþþþþþþþþþþþþþþþþþþllena los lugares de la libreta con los objetos (comienzo)þþþþþþþþþþþþþþþþþþþþþþþþþþþþ    
    lea bx,GARROTE; objeto
    lea si,arma;libreta
    call fun_cambio_variable     

    lea bx,cod1; codigo del objeto  
    lea si,arma_equi;lugar para la pelea
    call fun_cambio_variable



    ;lea bx,armadura_media; objeto
    ;lea si,armadura;libreta
    ;call fun_cambio_variable

    ;lea bx,cod6; codigo del objeto 
    ;lea si,armadura_equi;lugar para la pelea
    ;call fun_cambio_variable

    ;lea bx,llave1; objeto
    ;lea si,obj1;libreta
    ;call fun_cambio_variable

    ;lea bx,ll1; codigo del objeto 
    ;lea si,obj1_equi;lugar para la pele
    ;call fun_cambio_variable


    ;lea bx,PISTA_1; objeto
    ;lea si,p1;libreta
    ;call fun_cambio_variable

    ;lea bx,PI1; codigo del objeto 
    ;lea si,PISTA1;lugar para la pele
    ;call fun_cambio_variable

    ;þþþþþþþþþþþþþþþþþþþþþþþþþþllena los lugares de la libreta con los objetos (fin)þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ



   

    
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    popf
    pop cx
    pop si
    pop ax
    pop dx
    pop bx

    ret
INTRODUCCION ENDP

fun_cambio_variable proc
    ;recibe dos offset, el primero es el del obeto a colocar(bx) y el segundo es el de la variable a cambiar(si) 
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    push di 
    pushf
    entra10:
    mov al,byte ptr[bx]
    cmp al,0dh
    je sale10
    mov byte ptr[si],al
    inc bx
    inc si
    jmp entra10
    sale10:
    popf
    pop di
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret 
fun_cambio_variable endp

LIBRETA_VIEJO proc
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf      
    info:;block de notas con info del lugar
    call CLEARSCREEN
    mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,informacion
    int  21h

    mov  ah,8
    int  21h
    cmp  al,"1"
    je   g_car
    cmp  al,"2"
    je   s_ras
    cmp  al,"3"
    je   s_imp
    cmp  al,"4"
    je   intermedio_z_lug
    cmp  al,"5"
    je   intermedio_arm_y_arm
    cmp  al,"6"
    je   info_pel1
    cmp al, "7"
    je info_equipo1
    cmp al, "8"
    je info_pistas1
    cmp  al,"0"
    je   salir_11
    jmp info;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    intermedio_arm_y_arm:
    jmp arm_y_arm
    g_car:
    call CLEARSCREEN
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,guardias; informacion de los guardias
    int  21h
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp   info
    s_ras:
    call CLEARSCREEN
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,Soldados_ras; informacion de los Soldados rasos
    int  21h
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp   info
    intermedio_z_lug:
    jmp z_lug
    intermedio:; salto intermedio para info
    jmp  info 

    info_pel1:
    jmp info_pel

    info_equipo1:
    JMP info_equipo

    info_pistas1:
    jmp info_pistas

    salir_11:
    jmp salir_1

    s_imp:
    call CLEARSCREEN
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,Soldados_imp; informacion de los soldados imperiales
    int  21h
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp   info

    z_lug:
    call CLEARSCREEN
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,zonas_lugar; informacion del lugar
    int  21h
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp   intermedio

    arm_y_arm:
    call CLEARSCREEN
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,armas; informacion del lugar
    int  21h
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp   intermedio

    info_pel:
    call CLEARSCREEN
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,pelea; informacion del lugar
    int  21h
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp   intermedio


    info_equipo:
    call CLEARSCREEN
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,TU_EQUIPO; informacion del lugar
    int  21h
    
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp intermedio

    info_pistas:
    call CLEARSCREEN
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 17h   ;ELIJO EL COLOR
        mov cx, 3000    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    mov  ah,9
    lea  dx,PISTAS; informacion del lugar
    int  21h
    LEA DX, ENT
    CALL IMPRIMIR
    call CONTINUAR
    jmp intermedio

    salir_1:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
LIBRETA_VIEJO endp


;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ

EVENTO_IMPERIAL PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    VER_PELEA4:
    call Clearscreen
    mov  ah,9
    lea  dx,MENU_PELEA3; informacion del lugar
    int  21h

      
    MOV BX, OFFSET OPCION1
    PUSH BX
    CALL ELEGIR

    MOV BX,0
    CMP OPCION1[bx],"1"
    je ATACAR1_4 ; PELEA

    CMP OPCION1[bx],"2"
    JE SUBIR_DI4; evitar peliar 

    CMP OPCION1[bx],"3"
    JE MIRAR_LIBRETA_4 ; mirar libreta 

    jmp ver_pelea4; salta a opciones nuevamente 

    MIRAR_LIBRETA_4:
    call LIBRETA_VIEJO
    JMP VER_PELEA4

    SUBIR_DI4:
    MOV DI,4
    JMP __FIN____4
   
    ATACAR1_4:
    CALL CLEARSCREEN 
    ;GUARDIA IMPERIAL
     lea bx,contador_HP_E
     mov byte ptr[bx],38h
     lea bx,hp_enemigo
     mov byte ptr[bx],38h  
     lea bx,arma_enemigo
     mov byte ptr[bx],4
     lea bx,armadura_enemigo
     mov byte ptr[bx],2

    MOV FLAG_FINAL,1
    mov  ah,9
    lea  dx,PALADIN; informacion del lugar
    int  21h
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo

    CALL CLEARSCREEN 
    CALL PELEA_GUARDIA


    __FIN____4:
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret



EVENTO_IMPERIAL ENDP

PELEA_GUARDIA PROC
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþguardia
    ;lea bx,contador_HP_E
    ;mov byte ptr[bx],32h 
    ;lea bx,hp_enemigo
    ;mov byte ptr[bx],32h 
    ;lea bx,arma_enemigo
    ;mov byte ptr[bx],1
    ;lea bx,armadura_enemigo
    ;mov byte ptr[bx],0
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþsoldado rasos
    ;lea bx,contador_HP_E
    ;mov byte ptr[bx],33h
    ;lea bx,hp_enemigo
    ;mov byte ptr[bx],33h
    ;lea bx,arma_enemigo
    ;mov byte ptr[bx],3
    ;lea bx,armadura_enemigo
    ;mov byte ptr[bx],1
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ 
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþsoldado raso2
    ; lea bx,contador_HP_E
    ; mov byte ptr[bx],34h
    ; lea bx,hp_enemigo
    ; mov byte ptr[bx],34h 
    ; lea bx,arma_enemigo
    ; mov byte ptr[bx],3
    ; lea bx,armadura_enemigo
    ; mov byte ptr[bx],2
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ 
    ;þþþþþþþþþþþþþþþþþþþþþþþsoldado imperial 
    ; lea bx,contador_HP_E
    ; mov byte ptr[bx],36h
    ; lea bx,hp_enemigo
    ; mov byte ptr[bx],36h  
    ; lea bx,arma_enemigo
    ; mov byte ptr[bx],4
    ; lea bx,armadura_enemigo
    ; mov byte ptr[bx],2
    ;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    cmp contador_HP_E,32h
    je guardia
    cmp contador_HP_E,33h
    je COMIENZOO
    cmp contador_HP_E,34h
    je COMIENZOO
    cmp contador_HP_E,36h
    je COMIENZOO
    ;------------------si es guardia 
    guardia:
    CALL CLEARSCREEN
    MOV BX, OFFSET RANDOM
    PUSH BX
    CALL RANDOM6
    mov bx, 0
    CMP RANDOM[BX], "1"
    je  MSJ1
    CMP RANDOM[BX], "2"
    je  MSJ1
    CMP RANDOM[BX], "3"
    je MSJ2
    CMP RANDOM[BX], "4"
    je MSJ2
    CMP RANDOM[BX], "5"
    je MSJ3
    CMP RANDOM[BX], "6"
    je MSJ3
    MSJ1:
    mov dx, offset MENSAJE_GUARDIA1
    call IMPRIMIR
    JMP COMIENZOO
    MSJ2:
    mov dx, offset MENSAJE_GUARDIA2
    call IMPRIMIR
    JMP COMIENZOO
    MSJ3:
    mov dx, offset MENSAJE_GUARDIA3
    call IMPRIMIR
    ;-----------------hasta aca si es guardia

    COMIENZOO:
    CALL CLEARSCREEN

    ATAQUE:
    ;------------------- atacar
    MOV AH,9
    LEA DX,ataco
    INT 21H
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CLEARSCREEN 
    CALL VIDA_BOT
    call ATACAR

    mov bx,0
    CMP HP_ENEMIGO[BX],"0" ; comparo con cero asi sale del bucle y finaliza la pelea
    JBE intermedio15
    
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CLEARSCREEN
    ;------------------- EVADIR 
    MOV AH,9
    LEA DX,atacan
    INT 21H
    lea dx,ent
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CLEARSCREEN
    CALL VIDA_PERSONAJE
    CALL EVADIR

    mov bx,0
    CMP HP_YO[BX],"0"
    JBE GAME_OVER; si mi vida es 0 o menor salta a GAME_OVER
    
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CLEARSCREEN
    CMP FLAG_FINAL,1
    JE RANDOM_HIT
    JMP ATAQUE
    ;------------------- evadir
    RANDOM_HIT:;SE ACTIVA CON LA FINAL 
    MOV BX, OFFSET RANDOM
    PUSH BX
    CALL RANDOM6
    mov bx, 0
    CMP RANDOM[BX], "5"
    je TIRA_DENU
    CMP RANDOM[BX], "6"
    je TIRA_DENU
    JMP ATAQUE
    intermedio15:
    jmp ganaste
    TIRA_DENU:
    MOV AH,9
    LEA DX,RAPIDO
    INT 21H
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CLEARSCREEN
    CALL VIDA_PERSONAJE
    CALL EVADIR

    mov bx,0
    CMP HP_YO[BX],"0"
    JBE GAME_OVER; si mi vida es 0 o menor salta a GAME_OVER
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CLEARSCREEN
    JMP ATAQUE 

    GAME_OVER:
    mov dx, offset GAMEOVER
    call imprimir

    lea bx, OPCION1 ; me pregunta si quiero seguir jugando 
    push bx
    call elegir2

    mov bx,0
    cmp opcion1[bx],"1"
    je SEGUIR_JUGANDO

    CMP opcion1[bx],"2"
    je FINALIZAR_PARTIDA

    SEGUIR_JUGANDO:;si queres seguir se pasa di a 2 para hacer un salto al menu CALABOZOS del viejo 
    mov hp,33h
    mov hp_yo, 33h

    mov flag_barracas2,0;
    CALL CLEARSCREEN

    lea dx,LiveAgain
    call imprimir
    lea dx,ent
    call imprimir
    CALL CONTINUAR
    CALL CLEARSCREEN

    lea dx,LiveAgain2
    call imprimir
    lea dx,ent
    call imprimir
    CALL CONTINUAR
    xor di,di
    mov di,2
    JMP FIN__

    FINALIZAR_PARTIDA:; si queres salir di pasa a 1 entonces cuando vuelve al main te saca del juego 
    xor di, di
    mov di,1
    jmp fin__

    GANASTE:   
    mov dx, offset victoria
    call imprimir
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL fun_tempo
    CALL CLEARSCREEN


    
    fin__:
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
PELEA_GUARDIA ENDP





EVADIR proc

    push bp                                          
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    de_vuelta: 
    
    mov dx, offset EVADE1;dado evasivo
    CALL IMPRIMIR

    CALL CONTINUAR ; APRETO ENTER Y TIRO EL DADO    

    tirar:

    ;CALL CLEARSCREEN

    mov bx, offset numero1
    push bx
    call RANDOM6 
    mov bx,0    
    cmp numero1[bx],"1"
    je EsUNO
    jmp DOS

    EsUno:
    cmp flag_suerte,1
    je EsCuatro 
    
     CALL func_dado_evadir_1

    
    mov dx, offset EVADE3; lo siento recivido
    call IMPRIMIR

    CALL BAJAVIDA1 ; TE BAJA UN PUNTO DE VIDA


    jmp fin 
    DOS:
    cmp numero1[bx],"2"
    je EsDOS
    jmp TRES

    EsDoS:
     CALL func_dado_evadir_2

    
    mov dx, offset EVADE3; lo siento recivido
    call IMPRIMIR

    CALL BAJAVIDA1 ; TE BAJA UN PUNTO DE VIDA
    jmp fin 

    fin_inte:
    jmp fin

    TRES:
    cmp numero1[bx],"3"
    je EsTres
    jmp CUATRO

    EsTres:
    CALL func_dado_evadir_3

    
    mov dx, offset EVADE3; lo siento recivido
    call IMPRIMIR

    CALL BAJAVIDA1 ; TE BAJA UN PUNTO DE VIDA
    jmp fin 

    CUATRO:
    cmp numero1[bx],"4"
    je EsCuatro
    jmp CINCO

    EsCuatro:
    CALL func_dado_evadir_4

    
    mov dx, offset EVADE4
    call IMPRIMIR
    jmp fin 

    CINCO:
    cmp numero1[bx],"5"
    je EsCinco
    jmp SEIS

    EsCinco:
    CALL func_dado_evadir_5
    
    mov dx, offset EVADE4
    call IMPRIMIR
    jmp fin 

    SEIS:
    cmp numero1[bx],"6"
    je EsSeis
    jmp fin 

    EsSeis:

    CALL func_dado_evadir_6
     
    mov dx, offset EVADE4
    call IMPRIMIR

    fin:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 
EVADIR endp

ATACAR proc
    push bp                                          
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    xor cx,cx
    de_vuelta2:    
    mov dx, offset ACIERTO1;quiere tirar un dado?
    CALL IMPRIMIR

    CALL CONTINUAR

    ;mov ah,8; CAMBIE  ERA MOV AH,8
    ;int 21h
    ;cmp al,0dh
    ;je tirar_2

    ;jmp de_vuelta2

    tirar_2:
    mov bx, offset numero1
    push bx
    call RANDOM6 
    mov bx,0    
    cmp numero1[bx],"1"
    je EsUNO_2
    jmp DOS_2
    EsUno_2:
    cmp flag_suerte,1
    je Escuatro_2
    call func_dado_ataque_1
    
    mov dx, OFFSET ACIERTO3;pifiaste
    CALL IMPRIMIR                   
    jmp fin_2 

    DOS_2:
    cmp numero1[bx],"2"
    je EsDOS_2
    jmp TRES_2
    EsDoS_2:

    call func_dado_ataque_2

    mov dx, OFFSET ACIERTO3;pifiaste
    CALL IMPRIMIR 
    jmp fin_2 

    fin_inte_2:
    jmp fin_2

    TRES_2:
    cmp numero1[bx],"3"
    je EsTres_2
    jmp CUATRO_2

    EsTres_2:

    call func_dado_ataque_3

    mov dx, OFFSET ACIERTO3;pifiaste
    CALL IMPRIMIR  
    jmp fin_2 

    CUATRO_2:
    cmp numero1[bx],"4"
    je EsCuatro_2
    jmp CINCO_2
    EsCuatro_2:

    call func_dado_ataque_4

    mov dx, offset ACIERTO4
    CALL IMPRIMIR


    CALL BAJAVIDA1_BOT
    jmp fin_2 

    CINCO_2:
    cmp numero1[bx],"5"
    je EsCinco_2
    jmp SEIS_2
    EsCinco_2:
    call func_dado_ataque_5

    mov dx, offset ACIERTO4
    CALL IMPRIMIR


    CALL BAJAVIDA1_BOT
        
    jmp fin_2 

    SEIS_2:
    cmp numero1[bx],"6"
    je EsSeis_2
    jmp fin_2 
    EsSeis_2:
    call func_dado_ataque_6

    mov dx, offset ACIERTO4
    CALL IMPRIMIR


    CALL BAJAVIDA1_BOT

    
    fin_2:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 
ATACAR  endp


BAJAVIDA1 proc
    push bp                                          
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    xor cx,cx


    ;lea si,contador_HP
    ;mov cl,byte ptr[si]
    ;dec cl 
    ;mov byte ptr[si],cl

   lea si,hp;variable que contiene mis puntos de vida 
   lea di,armadura_equi;variable que contiene el blok de la armadura
   mov cl,byte ptr[si];muevo a cl la cantidad de vida que tengo
   mov ch,byte ptr[di];muevo a ch la cantidad de armadura que tengo

   xor dx,dx
   lea si,arma_enemigo;variable que contiene el daรยคo del enemigo 
   mov dl,byte ptr[si];muevo a dl la cantidad de daรยคo que hace el enemigo

   sub cl,dl;le resto a mi vida el daรยคo del enemigo
   add cl,ch;le sumo la armadura a mi vida 
   
   lea si,hp 
   mov byte ptr[si],cl; le cargo a la variable hp nuevamente la vida restante a la libreta
   
   lea si,hp_yo;
   mov byte ptr[si],cl; le cargo a la variable nuevamente la vida restante para el cartel de pelea 



    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 
BAJAVIDA1 ENDP

BAJAVIDA1_BOT proc
    push bp                                          
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    xor cx,cx


    ;lea si,contador_HP_G
    ;mov cl,byte ptr[si]
    ;dec cl 
    ;mov byte ptr[si],cl

    lea si,contador_HP_E;variable que contiene la vida del enemigo
    lea di,arma_equi;variable que contiene el daรยคo de mi arma 
    mov cl,byte ptr[si];muevo la vida del enemigo a cl
    mov ch,byte ptr[di];muevo el daรยคo de mi arma a ch
  
    xor dx,dx
    lea si,armadura_enemigo;variable que contiene la armadura del enemigo 
    mov dl,byte ptr[si];muevo a dl la cantidad de armadura del enemigo

    sub cl,ch; le resto a la vida del enemigo el daรยคo que hago con mi arma 
    add cl,dl; le sumo a lo que le quedo de vida su armadura 
  
    lea si,hp_enemigo;variable a la que le quiero mandar la vida que le quedo al enemigo 
    mov byte ptr[si],cl;muevo lo que quedo en cl de nuevo a la variable hp_enemigo

    lea si,contador_hp_e;variable a la que le quiero mandar la vida que le quedo al enemigo 
    mov byte ptr[si],cl;muevo lo que quedo en cl de nuevo a la variable hp_enemigo



    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 
BAJAVIDA1_BOT ENDP


VIDA_PERSONAJE proc
    push bp                                          
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    xor cx,cx

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 0ah   ;ELIJO EL COLOR
        mov cx, 300    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    MOV DX, OFFSET VIDAS_YO
    CALL IMPRIMIR



    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret
VIDA_PERSONAJE ENDP

VIDA_BOT proc
    push bp                                          
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    xor cx,cx



        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
        mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
        mov bl, 0dh   ;ELIJO EL COLOR
        mov cx, 300    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
        int 10h
    MOV DX, OFFSET VIDAS_ENEMIGO
    CALL IMPRIMIR



    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 
VIDA_BOT ENDP


;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_evadir_1 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 89h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado1
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_evadir_1 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_evadir_2 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 89h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado2
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_evadir_2 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_evadir_3 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 89h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado3
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_evadir_3 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_evadir_4 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 89h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado4
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_evadir_4 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_evadir_5 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 89h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado5
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_evadir_5 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_evadir_6 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 89h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado6
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_evadir_6 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ     
func_dado_ataque_1 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 84h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado1
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_ataque_1 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_ataque_2 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 84h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado2
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_ataque_2 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_ataque_3 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 84h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado3
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_ataque_3 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_ataque_4 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 84h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado4
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_ataque_4 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_ataque_5 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 84h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado5
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_ataque_5 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ  
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
func_dado_ataque_6 proc
     push bp                                          
     push ax
     push bx
     push cx
     push dx
     push si
     push di
      
     mov ah, 9     ;IMPRIMO UN CARACTER CON
     mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
     mov al, 20h
     mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
     mov bl, 84h   ;ELIJO EL COLOR
     mov cx, 550    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
     int 10h
     mov dx, offset dado6
     CALL IMPRIMIR 

     pop di
     pop si
     pop dx
     pop cx
     pop bx
     pop ax
     pop bp
     ret 
     func_dado_ataque_6 endp
;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ 

;þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ


CELDA200 PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call CLEARSCREEN

    MOV BX, OFFSET RANDOM
    PUSH BX
    CALL RANDOM6

    mov bx, 0
     

    CMP RANDOM[BX], "1"
    je PRINT1

    CMP RANDOM[BX], "2"
    je PRINT1

    CMP RANDOM[BX], "3"
    je PRINT2

    CMP RANDOM[BX], "4"
    je PRINT2

    CMP RANDOM[BX], "5"
    je PRINT3

    CMP RANDOM[BX], "6"
    je PRINT3


    PRINT1:

    mov dx, offset texto1
    call IMPRIMIR
    JMP FIN9

    PRINT2:

    mov dx, offset texto2
    call IMPRIMIR
    JMP FIN9

    PRINT3:

    mov dx, offset TEXTO3
    call IMPRIMIR
    JMP FIN9


    FIN9:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
CELDA200 ENDP

CELDA201 PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call CLEARSCREEN

    MOV BX, OFFSET RANDOM
    PUSH BX
    CALL RANDOM6

    mov bx, 0
     

    CMP RANDOM[BX], "1"
    je PRINT1_

    CMP RANDOM[BX], "2"
    je PRINT2_

    CMP RANDOM[BX], "3"
    je PRINT3_

    CMP RANDOM[BX], "4"
    je PRINT4_

    CMP RANDOM[BX], "5"
    je PRINT5_

    CMP RANDOM[BX], "6"
    je PRINT6_


    PRINT1_:

    mov dx, offset texto_1
    call IMPRIMIR
    JMP FIN8

    PRINT2_:

    mov dx, offset texto_2
    call IMPRIMIR
    JMP FIN8

    PRINT3_:
    ;mov dx, offset ENT
    ;call IMPRIMIR

    mov dx, offset TEXTO_3
    call IMPRIMIR
 
    JMP FIN8

    PRINT4_:
  ; mov dx, offset ENT
   ; call IMPRIMIR


    mov dx, offset TEXTO_4
    call IMPRIMIR
    JMP FIN8

    PRINT5_:

    mov dx, offset TEXTO_5
    call IMPRIMIR
    JMP FIN8

     PRINT6_:

    mov dx, offset TEXTO_6
    call IMPRIMIR
    JMP FIN8


     FIN8:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
CELDA201 ENDP


CELDA202 PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf


    cmp FLAG_RECOMPENSA3,1;CUCHILLO
    je MENSAJE_FINAL

    CMP PISTA1, 1
    JE texto_7b



    CALL CLEARSCREEN

    LEA DX, TEXTO_7
    CALL IMPRIMIR

    ;CALL CONTINUAR
    jmp despues

    texto_7b:
    call Clearscreen
    LEA DX, TEXTO__7b  ;ANDA A LA COCINA
    CALL IMPRIMIR

    despues:

    ;lea bx,GARROTE; objeto
    ;lea si,arma;libreta
    ;call fun_cambio_variable     

    ;lea bx,cod1; codigo del objeto  
    ;lea si,arma_equi;lugar para la pelea
    ;call fun_cambio_variable



    ;lea bx,armadura_media; objeto
    ;lea si,armadura;libreta
    ;call fun_cambio_variable

    ;lea bx,cod6; codigo del objeto 
    ;lea si,armadura_equi;lugar para la pelea
    ;call fun_cambio_variable

    ;lea bx,llave1; objeto
    ;lea si,obj1;libreta
    ;call fun_cambio_variable

    ;lea bx,ll1; codigo del objeto 
    ;lea si,obj1_equi;lugar para la pele
    ;call fun_cambio_variable

  

    lea bx,PISTA_1; objeto
    lea si,p1;libreta
    call fun_cambio_variable

    lea bx,PI1; codigo del objeto 
    lea si,PISTA1;lugar para la pele
    call fun_cambio_variable

    JMP FINAL11

    MENSAJE_FINAL:
    CALL CLEARSCREEN
    LEA DX, FINAL_202
    CALL IMPRIMIR


  

    FINAL11:



    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
CELDA202 ENDP


CELDA203 PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    CALL CLEARSCREEN

    ;  texto_8 DB "HEEY.... EL GUARDIA DE LA TORRE DE VIGILANCIA SE HA IDO..."0dh,0ah,24h
    ;  TEXTO_8B DB "NO PIERDAS EL TIEMPO Y VE A LA TORRE"0dh,0ah,24h

  

    CMP PISTA2, 2
    JE Texto_11

    lea dx, TEXTO_8
    call imprimir


    lea bx,PISTA_2; objeto
    lea si,p2;libreta
    call fun_cambio_variable

    lea bx,PI2; codigo del objeto 
    lea si,PISTA2;lugar para la pele
    call fun_cambio_variable


    jmp final2

  

    Texto_11:

    lea dx,  TEXTO_8B
    call imprimir


    final2:
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
CELDA203 ENDP

CELDA204 PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    lea dx, Mensaje_RATAS
    call imprimir


    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
CELDA204 ENDP

CELDA205 PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

     call Clearscreen

    lea dx, Mensaje_ESQUELETOS
    call imprimir



    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
CELDA205 ENDP


FUNCION_TORRE PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    CMP PISTA2, 2
    JE TEXTO_ARMADURA

    JMP VER_PELEA


    TEXTO_ARMADURA:

    mov  ah,9
    lea  dx,ARMADURA_TEXTO; informacion del lugar
    int  21h

    lea dx, ent
    call imprimir

    call continuar

    ;"ARMADURA_TEXTO DB "ACABO DE VER A UN SOLDADO RASO DEJAR SU ARMADURA EN UN BANCO FRENTE A LA ARMERIA"


    lea bx,PISTA_3; objeto
    lea si,p3;libreta
    call fun_cambio_variable

    lea bx,PI3; codigo del objeto 
    lea si,PISTA3;lugar para la pele
    call fun_cambio_variable

    JMP __FIN____1


    VER_PELEA:
    call Clearscreen

    mov  ah,9
    lea  dx,MENU_PELEA; informacion del lugar
    int  21h


    MOV BX, OFFSET OPCION1
    PUSH BX
    CALL ELEGIR3

    MOV BX,0
    CMP OPCION1[bx],"1"
    je ATACAR1

    CMP OPCION1[bx],"2"
    JE __FIN____1

    CMP OPCION1[bx],"3"
    JE MIRAR_LIBRETA
   

    ATACAR1:
    ;SOLDADO RASO
    lea bx,contador_HP_E
    mov byte ptr[bx],33h
    lea bx,hp_enemigo
    mov byte ptr[bx],33h
    lea bx,arma_enemigo
    mov byte ptr[bx],3
    lea bx,armadura_enemigo
    mov byte ptr[bx],1

    CALL PELEA_GUARDIA
    JMP __FIN____1

    MIRAR_LIBRETA:

    call LIBRETA_VIEJO
    JMP VER_PELEA



    __FIN____1:

    ;poner un texto 



    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
FUNCION_TORRE ENDP

BANCO PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    CMP PISTA3, 3
    JE TEXTO_ARMADURA_

    JMP VER_PELEA1


    TEXTO_ARMADURA_:
    cmp FLAG_RECOMPENSA4,1
    je __FIN____111

    mov  ah,9
    lea  dx,ARMADURA_OBTENIDA; informacion del lugar
    int  21h

    lea dx, ent
    call imprimir

    call continuar

    ;"ARMADURA_OBTENIDA DB "AHORA ESTOY MAS SEGURO CON ESTA BELLA ARMADURA"
    ;FLAG_RECOMPENSA4  þþþþþþ PARA EL CARTEL DE QUE OBTUVISTE LA ARMADURA LIGERA
    

    CALL FUN_RECOMPENSA_D;ARMADURA LIGERA 



    MOV FLAG_RECOMPENSA4,1

    lea bx,armadura_LIGERA; objeto
    lea si,armadura;libreta
    call fun_cambio_variable

    lea bx,cod5; codigo del objeto 
    lea si,armadura_equi;lugar para la pelea
    call fun_cambio_variable

    JMP __FIN____2

    __FIN____111:

    LEA dx, BANCO_GUARDIA
    CALL IMPRIMIR

    LEA dx, ENT
    CALL IMPRIMIR

    CALL CONTINUAR



    JMP __FIN____2

    VER_PELEA1:
    call Clearscreen

    mov  ah,9
    lea  dx,MENU_PELEA; informacion del lugar
    int  21h


    MOV BX, OFFSET OPCION1
    PUSH BX
    CALL ELEGIR3

    MOV BX,0
    CMP OPCION1[bx],"1"
    je ATACAR1_

    CMP OPCION1[bx],"2"
    JE __FIN____2

    CMP OPCION1[bx],"3"
    JE MIRAR_LIBRETA_
    jmp VER_PELEA1
   

    ATACAR1_:
    ;SOLDADO RASO
    lea bx,contador_HP_E
    mov byte ptr[bx],33h
    lea bx,hp_enemigo
    mov byte ptr[bx],33h
    lea bx,arma_enemigo
    mov byte ptr[bx],3
    lea bx,armadura_enemigo
    mov byte ptr[bx],1

    CALL PELEA_GUARDIA




    JMP __FIN____2

    MIRAR_LIBRETA_:

    call LIBRETA_VIEJO
    JMP VER_PELEA1



    __FIN____2:

    ;poner un texto 



    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
BANCO ENDP
 
EVENTO_DEPOSITO_A PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    CMP FLAG_RECOMPENSA5,1
    JE MUERTE_GUARDIA


    VER_PELEA3:
    call Clearscreen
    mov  ah,9
    lea  dx,MENU_PELEA2; informacion del lugar
    int  21h


      
    MOV BX, OFFSET OPCION1
    PUSH BX
    CALL ELEGIR

    MOV BX,0
    CMP OPCION1[bx],"1"
    je ATACAR1_3

    CMP OPCION1[bx],"2"
    JE __FIN____3

    CMP OPCION1[bx],"3"
    JE MIRAR_LIBRETA_3
    jmp ver_pelea3
   

    ATACAR1_3:
    ;GUARDIA
    lea bx,contador_HP_E
    mov byte ptr[bx],32h 
    lea bx,hp_enemigo
    mov byte ptr[bx],32h 
    lea bx,arma_enemigo
    mov byte ptr[bx],1
    lea bx,armadura_enemigo
    mov byte ptr[bx],0

    CALL PELEA_GUARDIA
    cmp di,2
    je __FIN____3
    cmp di,1
    je __FIN____3

    ;RECOMPENSA5þþþþþþþþþþLLAVE1

    lea bx,llave1; objeto
    lea si,obj1;libreta
    call fun_cambio_variable

    lea bx,ll1; codigo del objeto 
    lea si,obj1_equi;lugar para la pele
    call fun_cambio_variable

    CALL FUN_RECOMPENSA_E;LLAVE ARMARIO  
    MOV FLAG_RECOMPENSA5,1
    JMP __FIN____3

    MIRAR_LIBRETA_3:
    call LIBRETA_VIEJO
    JMP VER_PELEA3

    MUERTE_GUARDIA:
    LEA DX, MUERTE_DEPOSITOA
    CALL IMPRIMIR

    MOV DX, OFFSET ENT
    CALL IMPRIMIR 

    CALL CONTINUAR




    __FIN____3:
    mov flag_revivi, 0
    ;hay que restablecer ma vida del guardia




    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_DEPOSITO_A ENDP 


CAJAS_VACIAS PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    lea dx, Mensaje_CAJAS_VACIAS
    call imprimir

    ;lea dx, ENT
    ;call imprimir
    ;CALL CONTINUAR


    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
CAJAS_VACIAS ENDP

ARMARIO_GIGANTE PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen
    ;PONER CONDICION LOGICA SI NECESITAS UN ELEMENTO (PISTA,LLAVE QUE TE ACTIVA)
    CMP obj1_equi, 1      
    JE SALTO_TENGO
    jmp Puerta_CERRADA

   


    SALTO_TENGO:
    cmp FLAG_RECOMPENSA6,1
    je completado
  
    mov  ah,9
    lea  dx, SOGA_OBTENIDA; informacion del lugar
    int  21h

    lea dx, ent
    call imprimir

    call continuar

    ;"SOGA_OBTENIDA DB "(ABRO EL CAJON Y ENCUENTRO UNA SOGA FUERTE. CREO QUE ME SERVIRA EN EL FUTURO)"
    ;FLAG_RECOMPENSA6  þþþþþþ PARA EL CARTEL DE QUE OBTUVISTE UNA SOGA


    MOV FLAG_RECOMPENSA6,1


    lea bx,llave2; objeto
    lea si,obj2;libreta
    call fun_cambio_variable

    lea bx,ll2; codigo del objeto 
    lea si,obj2_equi;lugar para la pele
    call fun_cambio_variable

    

    CALL FUN_RECOMPENSA_F;SOGA 

  

    JMP FIN1

    completado:
    MOV DX, OFFSET completo 
    CALL IMPRIMIR
    LEA dx, ENT
    CALL IMPRIMIR
    CALL CONTINUAR
    jmp fin1 


    Puerta_CERRADA:
    lea dx, ARMARIO_BLOQUEADO
    CALL IMPRIMIR

    MOV DX, OFFSET ENT
    CALL IMPRIMIR 

    CALL CONTINUAR


    FIN1:

    ;poner un texto 



    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
ARMARIO_GIGANTE ENDP


FUNCION_COCINA PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    cmp FLAG_RECOMPENSA3,1;CUCHILLO
    je COCINA_FINALIZADO

    CMP PISTA1, 1
    JE BORRACHO

    JMP ARAFUE


    BORRACHO:
    

    mov  ah,9
    lea  dx,BORRACHO_TEXTO; informacion del lugar
    int  21h

    MOV DX, OFFSET ENT
    CALL IMPRIMIR

      

    CALL CONTINUAR

    ;ACA HABRIA UN EVENTO EN EL CUAL DESPUES TE DA EL CUCHILLO DE COCINA
    ;JUEGO DE DADOS, ADIVINANZA O UNA PELEA
  
    CALL FUN_RECOMPENSA_C;CUCHILLO 

    
    MOV FLAG_RECOMPENSA3,1
    

    

    lea bx,CUCHILLO_COCINA; objeto
    lea si,arma;libreta
    call fun_cambio_variable     

    lea bx,cod2; codigo del objeto  
    lea si,arma_equi;lugar para la pelea
    call fun_cambio_variable

    JMP __FIN____


    ARAFUE:
    ;CALL CLEARSCREEN

    mov  ah,9
    lea  dx,COMENTARIO_COCINA; informacion del lugar
    int  21h
    JMP __FIN____

    COCINA_FINALIZADO: ;AGOTE EL EVENTO DE LA COCINA 

    mov  ah,9
    lea  dx, COMENTARIO_COCINA; informacion del lugar
    int  21h

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR
    __FIN____:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
FUNCION_COCINA ENDP


EVENTO_POCION PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    CMP FLAG_RECOMPENSA7,1 ; ACA RECIBI LA POCION
    JE ACAPARADOR_VACIO

    lea dx, CONPOCION ; reviso el acaparador texto 
    CALL IMPRIMIR      
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR

    MOV FLAG_RECOMPENSA7,1

   

    CALL FUN_RECOMPENSA_G;INCREMENTA 2 DE VIDA 

  



    ADD HP_YO,2 ;SUBE 2 VIDA
    ADD HP, 2 ; SUBE 2 VIDA

    JMP FINAL3



    ACAPARADOR_VACIO:
    CALL CLEARSCREEN
    lea dx,SINPOCION    ; ya no hay nada en el acaparador
    call imprimir
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR

    FINAL3:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_POCION ENDP

EVENTO_VENTANA PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    CMP FLAG_RECOMPENSA6,1 ; FLAG DE LA SOGA
    JE BAJAR_BARRACAS

    CALL CLEARSCREEN
    lea dx, SINSOGA ; DESDE ACA PUEDO VER LA SALIDA PERO SI SALTO MORIRE
    CALL IMPRIMIR

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR   

    JMP FINAL4

    BAJAR_BARRACAS:
    CALL CLEARSCREEN
    lea dx, CONSOGA    ; ME SIRVIO LA ZOGA PUEDO BAJAR A LAS BARRACAS
    call imprimir

       MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR 

    XOR DI,DI
    MOV DI,1

    FINAL4:
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_VENTANA ENDP


EVENTO_FRASCOS PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf
    

    CMP FLAG_RECOMPENSA8,1; si no tengo a la enfermera no agarro las hierbas 
    JE ESTANTERIA_VACIA
    cmp pista4,4;tengo a la enfermera si es igual a 3
    je HIERBAS
    jmp nose_usar

    HIERBAS:
    CALL CLEARSCREEN
    lea dx, CONBREBAJE; exelente con esto salvaremos al viejo 
    CALL IMPRIMIR
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR

    MOV FLAG_RECOMPENSA8,1
    lea bx,llave3; objeto
    lea si,obj3;libreta
    call fun_cambio_variable
    lea bx,ll3; codigo del objeto 
    lea si,obj3_equi;lugar para la pele
    call fun_cambio_variable

    
    CALL FUN_RECOMPENSA_H;HIERVAS MEDIC 
  
    JMP FINAL5

    nose_usar:
    CALL CLEARSCREEN
    lea dx, como_usar; 
    CALL IMPRIMIR
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR
    jmp FINAL5


    ESTANTERIA_VACIA:
    CALL CLEARSCREEN
    lea dx, SINBREBAJE   ; ya no hay nada util en LA ESTANTERIA
    call imprimir

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR  

    FINAL5:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_FRASCOS ENDP

EVENTO_ENFERMERA PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    CMP PISTA4,4
    JE PISTA4_OBTENIDA

    ;CMP PISTA4,4 ; ACA RECIBI EL BREBAJE QUE CURA EL VIEJO
    ;JE PISTA4_OBTENIDA

    CALL CLEARSCREEN

    lea dx, ENFERMERA_PRESA ; AYUDAA POR FAVOR DESATAME (la desatas y la liberas) gracias... (te a un beso).. te da una pista 
    CALL IMPRIMIR    

    lea bx,PISTA_4; objeto
    lea si,p4;libreta
    call fun_cambio_variable

    lea bx,PI4; codigo del objeto 
    lea si,PISTA4; ACA MUEVE A 4 EL FLAG
    call fun_cambio_variable

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR      

    JMP FINAL6

    PISTA4_OBTENIDA:
    CALL CLEARSCREEN
    lea dx, CONPISTA4   ; ENFERMERA: VAMOS A SALVAR AL VIEJO NO PIERDAS TIEMPO
    call imprimir

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR  

    FINAL6:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_ENFERMERA ENDP

EVENTO_OSCURO PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    CMP PISTA5,5
    JE PISTA5_OBTENIDA

    ;CMP PISTA4,4 ; ACA RECIBI EL BREBAJE QUE CURA EL VIEJO
    ;JE PISTA4_OBTENIDA

    CALL CLEARSCREEN

    lea dx, VOZ_OSCURA ; (SENTIS UN SUSURRO EN TU OIDO) VOZ: LA CLAVE ES TRERTYFFD
    CALL IMPRIMIR


    

    lea bx,PISTA_5; objeto
    lea si,p5;libreta
    call fun_cambio_variable

    lea bx,PI5; codigo del objeto 
    lea si,PISTA5; ACA MUEVE A 4 EL FLAG
    call fun_cambio_variable

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR      

    JMP FINAL7

    PISTA5_OBTENIDA:
    CALL CLEARSCREEN
    lea dx, MIEDO_CUARTO   ;"PORQUE ENTRO DE NUEVO A ESTA CUARTO TAN TENEBROSO"
    call imprimir

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR  

    FINAL7:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_OSCURO  ENDP

BAUL_ARMAS PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    CMP PISTA5,5
    JE PISTA5_OBTENIDA1

   
    

    ;CMP PISTA4,4 ; ACA RECIBI EL BREBAJE QUE CURA EL VIEJO
    ;JE PISTA4_OBTENIDA

    CALL CLEARSCREEN

    lea dx, BAUL_CERRADO ; ES IMPOSIBLE ABRIR ESTE BAUL
    CALL IMPRIMIR

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR    

    JMP FINAL8

    PISTA5_OBTENIDA1:
     CMP FLAG_RECOMPENSA9,1
    JE BAUL_VACIO



    CALL CLEARSCREEN
    lea dx, ABRI_BAUL   ; ENFERMERA: VAMOS A SALVAR AL VIEJO NO PIERDAS TIEMPO
    call imprimir

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR  

    lea bx,ESPADA_LARGA; objeto
    lea si,arma;libreta
    call fun_cambio_variable     

    lea bx,cod4; codigo del objeto  
    lea si,arma_equi;lugar para la pelea
    call fun_cambio_variable


    CALL FUN_RECOMPENSA_I;ESPADA LARGA 

    MOV FLAG_RECOMPENSA9,1
    JMP FINAL8


    BAUL_VACIO:
    CALL CLEARSCREEN
    lea dx, BAUL_VACIO1   ; YA NO HAY NADA QUE BUSCAR AQUI
    call imprimir

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR

    FINAL8:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
BAUL_ARMAS ENDP

DORMITORIO_VACIO PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    lea dx, Mensaje_DORMITORIO
    call imprimir

    lea dx, ENT
    call imprimir
    CALL CONTINUAR

    
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
DORMITORIO_VACIO ENDP

EVENTO_ENTRENAMIENTO PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    CMP PISTA6,6
    JE PISTA6_OBTENIDA

    ;CMP PISTA4,4 ; ACA RECIBO PISTA DE LA BATALLA FINAL
    

    CALL CLEARSCREEN

    lea dx, VOZ_FANTASMAGORICA ; REVISA CON CUIDADO ANTES DE LA BATALLA FINAL 
    CALL IMPRIMIR    

    lea bx,PISTA_6; objeto
    lea si,p6;libreta
    call fun_cambio_variable

    lea bx,PI6; codigo del objeto 
    lea si,PISTA6; ACA MUEVE A 4 EL FLAG
    call fun_cambio_variable

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR      

    JMP FINAL9

    PISTA6_OBTENIDA:
    CALL CLEARSCREEN
    lea dx, VOZ_FANTASMAGORICA2   ; (esa voz fantasmagorica desaparecio...)
    call imprimir

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR 

  
    FINAL9:

    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_ENTRENAMIENTO ENDP


EVENTO_ESTATUA PROC

    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf



    cmp flag_recompensa10,1
    je BELLA_ESTATUA

    CMP PISTA6,6 ; LA VOZ QUE ME DIJO QUE INVESTIGUE
    JE CONSEGUI_ARMADURA

    lea dx, ESTATUA_COMENTARIO ; DESDE ACA PUEDO VER LA SALIDA PERO SI SALTO MORIRE
    CALL IMPRIMIR

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR   

    JMP FINAL4

    CONSEGUI_ARMADURA:
    CALL CLEARSCREEN
    lea dx, PESADA_GET    ; (REVISANDO LA ESTATUA DESCUBRO UN ESCONDITE EN EL PISO.... ES UNA ARMADURA PESADA)
    call imprimir
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR 
    CALL CLEARSCREEN

    lea bx,armadura_PESADA; objeto
    lea si,armadura;libreta
    call fun_cambio_variable

    lea bx,cod7; codigo del objeto 
    lea si,armadura_equi;lugar para la pelea
    call fun_cambio_variable

    mov flag_recompensa10,1

    CALL FUN_RECOMPENSA_J;ARMADURA PESADA 
   

    JMP FINAL10

    BELLA_ESTATUA:
    CALL CLEARSCREEN
    lea dx, ESTATUA_COMENTARIO ; (QUE HERMOSA ESTATUA DEL SHA DE PERSIA)
    call imprimir

    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR 



    FINAL10:
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_ESTATUA ENDP




EVENTO_FUENTE PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    lea dx, Mensaje_FUENTE
    call imprimir
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR 



    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_FUENTE ENDP


EVENTO_ARBOL PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen

    lea dx, Mensaje_ARBOL
    call imprimir
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR 



    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
EVENTO_ARBOL ENDP

fun_tempo proc
    push bp
    mov bp, sp
    push bx
    push dx
    push ax
    push si
    pushf
    
   
    xor ax, ax
    mov ah,2ch
    int 21h
    mov ax,dx
    xor dx,dx 
    xor cx,cx  
    mov cx,6
    div cx
    mov bl,dl

    contar:
    xor ax, ax
    mov ah, 2ch
    int 21h
    mov ax,dx
    add ax,1234
    xor dx,dx 
    xor cx,cx  
    mov cx,6
    div cx
    cmp bl,dl
    je listo1
    jmp contar
    
    listo1:
    popf
    pop si
    pop ax
    pop dx
    pop bx
    pop bp
    ret 
fun_tempo ENDP

fun_victoria proc
 push bp
    push bx
    push dx
    push ax
    push cx
    push si
    push di 
    pushf
    
            mov ax, 0003h
      int 10h
 
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ah   ;ELIJO EL COLOR
    mov cx, 200    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset VICTORIA1
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8bh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ch   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8dh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8eh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8fh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
                  
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ah   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset victoria1
    int 21h
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8bh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h     
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
        call fun_tempo
    call CLEARSCREEN
                      
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ch   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
        
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8dh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h     
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
        
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8eh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h     
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8fh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h   
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN

            mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ah   ;ELIJO EL COLOR
    mov cx, 200    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset VICTORIA1
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8bh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ch   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8dh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8eh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8fh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
                  
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ah   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset victoria1
    int 21h
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8bh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h     
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
        call fun_tempo
    call CLEARSCREEN
                      
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8ch   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
        
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8dh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h     
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN
        
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8eh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h     
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 8fh   ;ELIJO EL COLOR
    mov cx, 1600    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h   
    mov ah, 9
    mov dx, offset victoria1
    int 21h 
    call fun_tempo
    call CLEARSCREEN

   
    popf
    pop di
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret 
fun_victoria endp



ATACA_RASO PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

    call Clearscreen
    
    mov flag_barracas,1
    CMP flag_barracas2,1
    je fin6 
    
    ver_pelea6:
    call CLEARSCREEN
    mov  ah,9
    lea  dx,MENU_PELEA; informacion del lugar
    int  21h

    MOV BX, OFFSET OPCION1
    PUSH BX
    CALL ELEGIR3

    MOV BX,0
    CMP OPCION1[bx],"1"
    je ATACAR10

    CMP OPCION1[bx],"2"
    JE inc_di

    CMP OPCION1[bx],"3"
    JE MIRAR_LIBRETA10

    inc_di:
    mov di,3
    jmp fin6


    ATACAR10:
    ;SOLDADO RASO
    lea bx,contador_HP_E
    mov byte ptr[bx],33h
    lea bx,hp_enemigo
    mov byte ptr[bx],33h
    lea bx,arma_enemigo
    mov byte ptr[bx],3
    lea bx,armadura_enemigo
    mov byte ptr[bx],1

    CALL PELEA_GUARDIA
    cmp di,2
    je fin6
    cmp flag_barracas,1
    je gane_barracas
    
    jmp fin6

    gane_barracas:
    mov flag_barracas2,1;si le ganaste el flag de barracas pasa a 2 entonces la proxima ves que entres no pelias
    JMP fin6 

    MIRAR_LIBRETA10:

    call LIBRETA_VIEJO
    JMP VER_PELEA6


    fin6:


    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
ATACA_RASO ENDP

salvar_viejo proc
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf
    
    cmp flag_suerte,1
    je fin13
    cmp FLAG_RECOMPENSA8,1
    je salvar 
    jmp fin13

    salvar:
    call Clearscreen
    lea dx, viejo_salvado
    call imprimir
    MOV DX, OFFSET ENT
    CALL IMPRIMIR
    CALL CONTINUAR

    
    CALL FUN_RECOMPENSA_K;+1 EN TIRADA DEL DADO 
   
    
    mov flag_suerte,1


    fin13:
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret
salvar_viejo endp
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_A PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

 mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1A 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2A 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3A 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4A 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5A 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6A 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7A 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8A 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9A 
 int 21h
 call fun_tempo

 call fun_tempo
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    RET
FUN_RECOMPENSA_A ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_B PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1B 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2B 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3B 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4B 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5B 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6B 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7B 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8B 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9B 
 int 21h
 call fun_tempo
call fun_tempo

    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_B ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_C PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1C 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2C 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3C 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4C 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5C 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6C 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7C 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8C 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9C 
 int 21h
 call fun_tempo
call fun_tempo

    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_C ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_D PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1D 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2D 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3D 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4D 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5D 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6D 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7D 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8D 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9D 
 int 21h
 call fun_tempo
  call fun_tempo
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_D ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_E PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1E 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2E 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3E 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4E 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5E 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6E 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7E 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8E 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9E 
 int 21h
 call fun_tempo
call fun_tempo
 
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_E ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_F PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1F 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2F 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3F 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4F 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5F 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6F 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7F 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8F 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9F 
 int 21h
 call fun_tempo
  call fun_tempo
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_F ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_G PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1G 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2G 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3G 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4G 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5G 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6G 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7G 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8G 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9G 
 int 21h
 call fun_tempo
call fun_tempo

    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_G ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_H PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1H 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2H 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3H 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4H 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5H 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6H 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7H 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8H 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9H 
 int 21h
 call fun_tempo
call fun_tempo
  
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_H ENDP

;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_I PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1I 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2I 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3I 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4I 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5I 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6I 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7I 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8I 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9I 
 int 21h
 call fun_tempo
call fun_tempo
 
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_I ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_J PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1J 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2J 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3J 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4J 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5J 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6J 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7J 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8J 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9J 
 int 21h
 call fun_tempo

    
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_J ENDP
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
FUN_RECOMPENSA_K PROC
    push bp
    push bx
    push dx
    push ax
    push cx
    push si
    pushf

mov ax, 0003h
 int 10h
 
 call CLEARSCREEN
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa1K 
 int 21h
 call fun_tempo
 call CLEARSCREEN
 
 
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa2K 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ax, 0003h
 int 10h
 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa3K 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa4K 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa5K 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa6K 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa7K 
 int 21h
 call fun_tempo
 call CLEARSCREEN

 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 08h   ;ELIJO EL COLOR
 mov cx, 2000   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa8K 
 int 21h
 call fun_tempo
 call CLEARSCREEN


 mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
 mov al, 20h
 mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
 mov bl, 07h   ;ELIJO EL COLOR
 mov cx, 1500   ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
 INT 10H       
 mov ah,9
 lea dx,recompensa9K 
 int 21h
 call fun_tempo
 call fun_tempo

    
    call CLEARSCREEN
    popf
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
 RET
FUN_RECOMPENSA_K ENDP

CONTINUARA1 PROC
 push bp
    push bx
    push dx
    push ax
    push cx
    push si
    push di 
    pushf
    
      mov ax, 0003h
      int 10h
 
       mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
    ;-------------------------------------------------------------------------------------------------           
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN

            mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN

            mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN

            mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN

            mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN

            mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN

            mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0cch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h
        call fun_tempo
    call CLEARSCREEN

        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 08ch   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
        call fun_tempo
    call CLEARSCREEN
            
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 084h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h    
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN
               
        mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
        mov al, 20h
    mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
    mov bl, 0c8h   ;ELIJO EL COLOR
    mov cx, 2500    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
      int 10h      
    mov ah, 9
    mov dx, offset CONTINUARA
    int 21h 
    call fun_tempo
    call CLEARSCREEN

   
    popf
    pop di
    pop si
    pop cx
    pop ax
    pop dx
    pop bx
    pop bp
    ret 

CONTINUARA1 ENDP 


END