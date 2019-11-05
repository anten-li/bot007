option expr32
option casemap:none

IFNDEF    language_inc
language_inc    EQU        1

; Begin of file language.h
; 
;  Language IDs.
;
;  The following two combinations of primary language ID and
;  sublanguage ID have special semantics:
;
;    Primary Language ID     Sublanguage ID          Result
;    -------------------     ---------------         ------------------------
;    LANG_NEUTRAL            SUBLANG_NEUTRAL         Language neutral
;    LANG_NEUTRAL            SUBLANG_DEFAULT         User default language
;    LANG_NEUTRAL            SUBLANG_SYS_DEFAULT     System default language
;  
; 
;  Primary language IDs.
;  
LANG_NEUTRAL                    EQU    000H
LANG_ARABIC                     EQU    001H
LANG_AFRIKAANS                  EQU    036H
LANG_ALBANIAN                   EQU    01CH
LANG_BASQUE                     EQU    02DH
LANG_BULGARIAN                  EQU    002H
LANG_BYELORUSSIAN               EQU    023H
LANG_CATALAN                    EQU    003H
LANG_CHINESE                    EQU    004H
LANG_CROATIAN                   EQU    01AH
LANG_CZECH                      EQU    005H
LANG_DANISH                     EQU    006H
LANG_DUTCH                      EQU    013H
LANG_ENGLISH                    EQU    009H
LANG_ESTONIAN                   EQU    025H
LANG_FINNISH                    EQU    00BH
LANG_FRENCH                     EQU    00CH
LANG_GERMAN                     EQU    007H
LANG_GREEK                      EQU    008H
LANG_HEBREW                     EQU    00DH
LANG_HUNGARIAN                  EQU    00EH
LANG_ICELANDIC                  EQU    00FH
LANG_INDONESIAN                 EQU    021H
LANG_ITALIAN                    EQU    010H
LANG_JAPANESE                   EQU    011H
LANG_KOREAN                     EQU    012H
LANG_LATVIAN                    EQU    026H
LANG_LITHUANIAN    	        EQU    027H
LANG_NORWEGIAN                  EQU    014H
LANG_POLISH                     EQU    015H
LANG_PORTUGUESE                 EQU    016H
LANG_ROMANIAN                   EQU    018H
LANG_RUSSIAN                    EQU    019H
LANG_SLOVAK                     EQU    01BH
LANG_SLOVENIAN                  EQU    024H
LANG_SORBIAN                    EQU    02EH
LANG_SPANISH                    EQU    00AH
LANG_SWEDISH                    EQU    01DH
LANG_THAI                       EQU    01EH
LANG_TURKISH                    EQU    01FH
LANG_UKRAINIAN                  EQU    022H


 ; LANG CONSTANTS IN NUMERICAL ORDER
 
 ; LANG_NEUTRAL                    EQU    000H
 ; LANG_ARABIC                     EQU    001H
 ; LANG_BULGARIAN                  EQU    002H
 ; LANG_CATALAN                    EQU    003H
 ; LANG_CHINESE                    EQU    004H
 ; LANG_CZECH                      EQU    005H
 ; LANG_DANISH                     EQU    006H
 ; LANG_GERMAN                     EQU    007H
 ; LANG_GREEK                      EQU    008H
 ; LANG_ENGLISH                    EQU    009H
 ; LANG_SPANISH                    EQU    00AH
 ; LANG_FINNISH                    EQU    00BH
 ; LANG_FRENCH                     EQU    00CH
 ; LANG_HEBREW                     EQU    00DH
 ; LANG_HUNGARIAN                  EQU    00EH
 ; LANG_ICELANDIC                  EQU    00FH
 ; LANG_ITALIAN                    EQU    010H
 ; LANG_JAPANESE                   EQU    011H
 ; LANG_KOREAN                     EQU    012H
 ; LANG_DUTCH                      EQU    013H
 ; LANG_NORWEGIAN                  EQU    014H
 ; LANG_POLISH                     EQU    015H
 ; LANG_PORTUGUESE                 EQU    016H
 ; LANG_ROMANIAN                   EQU    018H
 ; LANG_RUSSIAN                    EQU    019H
 ; LANG_CROATIAN                   EQU    01AH
 ; LANG_SLOVAK                     EQU    01BH
 ; LANG_ALBANIAN                   EQU    01CH
 ; LANG_SWEDISH                    EQU    01DH
 ; LANG_THAI                       EQU    01EH
 ; LANG_TURKISH                    EQU    01FH

 ; LANG_INDONESIAN                 EQU    021H
 ; LANG_UKRAINIAN                  EQU    022H
 ; LANG_BYELORUSSIAN               EQU    023H
 ; LANG_SLOVENIAN                  EQU    024H
 ; LANG_ESTONIAN                   EQU    025H
 ; LANG_LATVIAN                    EQU    026H
 ; LANG_LITHUANIAN    	           EQU    027H

 ; LANG_BASQUE                     EQU    02DH
 ; LANG_SORBIAN                    EQU    02EH

 ; LANG_AFRIKAANS                  EQU    036H


; 
;  Sublanguage IDs.
;
;  The name immediately following SUBLANG_ dictates which primary
;  language ID that sublanguage ID can be combined with to form a
;  valid language ID.
;  
SUBLANG_NEUTRAL                 EQU    000H  ;  language neutral 
SUBLANG_DEFAULT                 EQU    001H  ;  user default 
SUBLANG_SYS_DEFAULT             EQU    002H  ;  system default 
SUBLANG_CHINESE_TRADITIONAL     EQU    001H  ;  Chinese (Taiwan Region) 
SUBLANG_CHINESE_SIMPLIFIED      EQU    002H  ;  Chinese (PR China) 
SUBLANG_CHINESE_HONGKONG        EQU    003H  ;  Chinese (Hong Kong S.A.R., P.R.C) 
SUBLANG_CHINESE_SINGAPORE       EQU    004H  ;  Chinese (Singapore) 
SUBLANG_DUTCH                   EQU    001H  ;  Dutch 
SUBLANG_DUTCH_BELGIAN           EQU    002H  ;  Dutch (Belgian)  
SUBLANG_ENGLISH_US              EQU    001H  ;  English (USA)
SUBLANG_ENGLISH_UK              EQU    002H  ;  English (UK) 
SUBLANG_ENGLISH_AUS             EQU    003H  ;  English (Australian) 
SUBLANG_ENGLISH_CAN             EQU    004H  ;  English (Canadian) 
SUBLANG_ENGLISH_NZ              EQU    005H  ;  English (New Zealand)  
SUBLANG_ENGLISH_EIRE            EQU    006H  ;  English (Irish)
SUBLANG_FRENCH                  EQU    001H  ;  French 
SUBLANG_FRENCH_BELGIAN          EQU    002H  ;  French (Belgian) 
SUBLANG_FRENCH_CANADIAN         EQU    003H  ;  French (Canadian) 
SUBLANG_FRENCH_SWISS            EQU    004H  ;  French (Swiss) 
SUBLANG_GERMAN                  EQU    001H  ;  German 
SUBLANG_GERMAN_SWISS            EQU    002H  ;  German (Swiss) 
SUBLANG_GERMAN_AUSTRIAN         EQU    003H  ;  German (Austrian) 
SUBLANG_ITALIAN                 EQU    001H  ;  Italian 
SUBLANG_ITALIAN_SWISS           EQU    002H  ;  Italian (Swiss) 
SUBLANG_NORWEGIAN_BOKMAL        EQU    001H  ;  Norwegian (Bokmal) 
SUBLANG_NORWEGIAN_NYNORSK       EQU    002H  ;  Norwegian (Nynorsk) 
SUBLANG_PORTUGUESE              EQU    002H  ;  Portuguese 
SUBLANG_PORTUGUESE_BRAZILIAN    EQU    001H  ;  Portuguese (Brazilian) 
SUBLANG_SPANISH                 EQU    001H  ;  Spanish (Castilian)  
SUBLANG_SPANISH_MEXICAN         EQU    002H  ;  Spanish (Mexican)
SUBLANG_SPANISH_MODERN          EQU    003H  ;  Spanish (Modern)  

;  Sorting IDs.  
; 
;  

SORT_DEFAULT                    EQU    000H  ;  sorting default 
SORT_JAPANESE_XJIS              EQU    000H  ;  Japanese XJIS order 
SORT_JAPANESE_UNICODE           EQU    001H  ;  Japanese Unicode order 
SORT_CHINESE_BIG5               EQU    000H  ;  Chinese BIG5 order 
SORT_CHINESE_PRCP               EQU    000H  ;  PRC Chinese Phonetic order 
SORT_CHINESE_UNICODE            EQU    001H  ;  Chinese Unicode order 
SORT_CHINESE_PRC                EQU    002H  ;  PRC Chinese Stroke Count order 
SORT_KOREAN_KSC                 EQU    000H  ;  Korean KSC order 
SORT_KOREAN_UNICODE             EQU    001H  ;  Korean Unicode order 
SORT_GERMAN_PHONE_BOOK          EQU    001H  ;  German Phone Book order 
 
;  A language ID is a 16 bit value which is the combination of a
;  primary language ID and a secondary language ID.  The bits are
;  allocated as follows:
; 
;       +-----------------------+-------------------------+
;       |     Sublanguage ID    |   Primary Language ID   |
;       +-----------------------+-------------------------+
;        15                   10 9                       0   bit
;                6 bits                  10 bits

;  Language ID creation/extraction macros:
; 
;    MAKELANGID    - construct language id from a primary language id and
;                    a sublanguage id.
;    PRIMARYLANGID - extract primary language id from a language id.
;    SUBLANGID     - extract sublanguage id from a language id.
;  
; 
;  A locale ID is a 32 bit value which is the combination of a
;  language ID, a sort ID, and a reserved area.  The bits are
;  allocated as follows:
; 
;       +-------------+---------+-------------------------+
;       |   Reserved  | Sort ID |      Language ID        |
;       +-------------+---------+-------------------------+
;        31         20 19     16 15                      0   bit
;           12 bits     4 bits           16 bits
;  
;  Locale ID creation/extraction macros:
;  
;    MAKELCID       - construct locale id from a language id and a sort id.
;    LANGIDFROMLCID - extract language id from a locale id.
;    SORTIDFROMLCID - extract sort id from a locale id.
;
;       +-----------------------+-------------------------+
;       |     Sublanguage ID    |   Primary Language ID   |
;       +-----------------------+-------------------------+
;        15                   10 9                       0   bit
;                6 bits                   10 bits

NLS_VALID_LOCALE_MASK		  EQU	   0FFFFFH

MAKELANGID MACRO p:REQ, s:REQ
    LOCAL DefineAs
    DefineAs TEXTEQU %(s * 400H + p)
    EXITM DefineAs
    ENDM

PRIMARYLANGID MACRO lgid:REQ    
    LOCAL DefineAs
    DefineAs TEXTEQU %(lgid AND 3FFH)
    EXITM DefineAs
    ENDM

SUBLANGID MACRO lgid:REQ
    LOCAL DefineAs
    DefineAs TEXTEQU %(lgid / 400H)
    EXITM DefineAs
    ENDM

MAKELCID MACRO lgid:REQ, srtid:REQ
    LOCAL DefineAs
    DefineAs TEXTEQU %(srtid * 10000H + lgid)
    EXITM DefineAs
    ENDM

LANGIDFROMLCID  MACRO lcid:REQ
    LOCAL DefineAs
    DefineAs TEXTEQU %(lcid AND 0FFFFH)
    EXITM DefineAs
    ENDM

SORTIDFROMLCID  MACRO lcid:REQ
    LOCAL DefineAs
    DefineAs TEXTEQU %(lcid AND NLS_VALID_LOCALE_MASK) / 10000H
    EXITM DefineAs
    ENDM

;
; Default System and User IDs for language and locale.
;

LANG_SYSTEM_DEFAULT    EQU  MAKELANGID (LANG_NEUTRAL, SUBLANG_SYS_DEFAULT)
LANG_USER_DEFAULT      EQU  MAKELANGID (LANG_NEUTRAL, SUBLANG_DEFAULT)

LOCALE_SYSTEM_DEFAULT  EQU  MAKELCID (LANG_SYSTEM_DEFAULT, SORT_DEFAULT)
;LOCALE_USER_DEFAULT    EQU  MAKELCID (LANG_USER_DEFAULT, SORT_DEFAULT)
; (now correctly included in windows.inc v 1.19)

LOCALE_NEUTRAL         EQU  MAKELCID (MAKELANGID (LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT)

;------------------------------------------------------------------------------------
ENDIF   
