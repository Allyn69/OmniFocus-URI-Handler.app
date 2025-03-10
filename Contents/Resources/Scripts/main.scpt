FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� 
# OMNIFOCUS URI HANDLER

This applet enables you to create new tasks using an "x-omnifocus" URL. This is particularly designed to make it easy to add tasks from a web browser via a bookmarklet, without having to code a separate script for each browser. This also works in browsers that don't support AppleScript. (I'm looking at you, Firefox!!!)

It also supports more advanced URLs containing context and project assignments that you're likely to create from web page bookmarklets. This functionality can be utilized to make it easier to add OmniFocus tasks from other applications, shell scripts, etc., without having to hook into complicated AppleScript.

## HOW TO CREATE PROPER URLS

All URLs must use the "x-omnifocus:" URI. You can have "whack whacks" after the URI, or just a colon, your choice. You must then follow the URI with the following methods:

*x-omnifocus:newtask*

This creates a new task. You can pass variables, following the example below. The only required element is "name".

x-omnifocus://newtask?name=**task name**&project=**project name**&context=**context name**&note=**task note text**&quickentry=**1/0**

**Project Name** and **Context Name** will "fuzzy match" an existing project or context, so you don't need a full or exact name.

a **Quickentry** value of "1" will cause the task to go into the Quick Entry window, which will be activated, rather than straight into the inbox. 

*x-omnifocus:parsetasks*

This parses tasks either as a single task or as multiple tasks, per the usual parsing syntax. You can pass two variables, the text to parse and whether to parse it as a single task, as below. The only required element is the text to parse.

x-omnifocus://parsetasks?text=**Text to Parse**&single=**1/0**

A *single* value of "1" will make the tasks parse as single tasks. Otherwise, tasks will be parsed line-by-line, potentially as multiple tasks. 

All strings should be URL encoded to eliminate any ambiguity in URLs and whatnot.

*** BOOKMARKLETS TO GET YOU STARTED ***

Here's some sample bookmarklets you can put into your browser's toolbar to make this all go:

*Add the current page as a task with the page's URL and any selected text as the note:*

javascript:window.location='x-omnifocus://newtask?name='+encodeURIComponent(document.title)+'&note='+encodeURIComponent(window.location+'\n\n')+encodeURIComponent(getSelection())+'&quickentry=0';

*Same as above, but route to the Quick Entry window instead of directly into the inbox:*

javascript:window.location='x-omnifocus://newtask?name='+encodeURIComponent(document.title)+'&note='+encodeURIComponent(window.location+'\n\n')+encodeURIComponent(getSelection())+'&quickentry=1';

*Parse tasks in the selection:*

javascript:window.location='x-omnifocus://parsetasks?text='+encodeURIComponent(getSelection())+'&single=0';

## NOTES

The HTML entity decoding routine falls down on certain characters, particularly Unicode characters.

If you use the quick entry window with the "newtask" method, the project and context values will be ignored, as these are not scriptable in the quick entry window.

## VERSION HISTORY

� 1.0 - 06/20/2008: Initial release. Supports parsetasks, newtask
� 1.x - 09/03/2009: Modified iNik's script to support new AppleScript terminology used after OF 1.7 update. "activate" changed to "open" for QuickEntry. This version corrects an issue with the QuickEntry window failing to open when the bookmarklet is used in Firefox 3.5.2. Refer to http://forums.omnigroup.com/showthread.php?t=8251 for details.  - kaijin

     � 	 	�   
 #   O M N I F O C U S   U R I   H A N D L E R 
 
 T h i s   a p p l e t   e n a b l e s   y o u   t o   c r e a t e   n e w   t a s k s   u s i n g   a n   " x - o m n i f o c u s "   U R L .   T h i s   i s   p a r t i c u l a r l y   d e s i g n e d   t o   m a k e   i t   e a s y   t o   a d d   t a s k s   f r o m   a   w e b   b r o w s e r   v i a   a   b o o k m a r k l e t ,   w i t h o u t   h a v i n g   t o   c o d e   a   s e p a r a t e   s c r i p t   f o r   e a c h   b r o w s e r .   T h i s   a l s o   w o r k s   i n   b r o w s e r s   t h a t   d o n ' t   s u p p o r t   A p p l e S c r i p t .   ( I ' m   l o o k i n g   a t   y o u ,   F i r e f o x ! ! ! ) 
 
 I t   a l s o   s u p p o r t s   m o r e   a d v a n c e d   U R L s   c o n t a i n i n g   c o n t e x t   a n d   p r o j e c t   a s s i g n m e n t s   t h a t   y o u ' r e   l i k e l y   t o   c r e a t e   f r o m   w e b   p a g e   b o o k m a r k l e t s .   T h i s   f u n c t i o n a l i t y   c a n   b e   u t i l i z e d   t o   m a k e   i t   e a s i e r   t o   a d d   O m n i F o c u s   t a s k s   f r o m   o t h e r   a p p l i c a t i o n s ,   s h e l l   s c r i p t s ,   e t c . ,   w i t h o u t   h a v i n g   t o   h o o k   i n t o   c o m p l i c a t e d   A p p l e S c r i p t . 
 
 # #   H O W   T O   C R E A T E   P R O P E R   U R L S 
 
 A l l   U R L s   m u s t   u s e   t h e   " x - o m n i f o c u s : "   U R I .   Y o u   c a n   h a v e   " w h a c k   w h a c k s "   a f t e r   t h e   U R I ,   o r   j u s t   a   c o l o n ,   y o u r   c h o i c e .   Y o u   m u s t   t h e n   f o l l o w   t h e   U R I   w i t h   t h e   f o l l o w i n g   m e t h o d s : 
 
 * x - o m n i f o c u s : n e w t a s k * 
 
 T h i s   c r e a t e s   a   n e w   t a s k .   Y o u   c a n   p a s s   v a r i a b l e s ,   f o l l o w i n g   t h e   e x a m p l e   b e l o w .   T h e   o n l y   r e q u i r e d   e l e m e n t   i s   " n a m e " . 
 
 x - o m n i f o c u s : / / n e w t a s k ? n a m e = * * t a s k   n a m e * * & p r o j e c t = * * p r o j e c t   n a m e * * & c o n t e x t = * * c o n t e x t   n a m e * * & n o t e = * * t a s k   n o t e   t e x t * * & q u i c k e n t r y = * * 1 / 0 * * 
 
 * * P r o j e c t   N a m e * *   a n d   * * C o n t e x t   N a m e * *   w i l l   " f u z z y   m a t c h "   a n   e x i s t i n g   p r o j e c t   o r   c o n t e x t ,   s o   y o u   d o n ' t   n e e d   a   f u l l   o r   e x a c t   n a m e . 
 
 a   * * Q u i c k e n t r y * *   v a l u e   o f   " 1 "   w i l l   c a u s e   t h e   t a s k   t o   g o   i n t o   t h e   Q u i c k   E n t r y   w i n d o w ,   w h i c h   w i l l   b e   a c t i v a t e d ,   r a t h e r   t h a n   s t r a i g h t   i n t o   t h e   i n b o x .   
 
 * x - o m n i f o c u s : p a r s e t a s k s * 
 
 T h i s   p a r s e s   t a s k s   e i t h e r   a s   a   s i n g l e   t a s k   o r   a s   m u l t i p l e   t a s k s ,   p e r   t h e   u s u a l   p a r s i n g   s y n t a x .   Y o u   c a n   p a s s   t w o   v a r i a b l e s ,   t h e   t e x t   t o   p a r s e   a n d   w h e t h e r   t o   p a r s e   i t   a s   a   s i n g l e   t a s k ,   a s   b e l o w .   T h e   o n l y   r e q u i r e d   e l e m e n t   i s   t h e   t e x t   t o   p a r s e . 
 
 x - o m n i f o c u s : / / p a r s e t a s k s ? t e x t = * * T e x t   t o   P a r s e * * & s i n g l e = * * 1 / 0 * * 
 
 A   * s i n g l e *   v a l u e   o f   " 1 "   w i l l   m a k e   t h e   t a s k s   p a r s e   a s   s i n g l e   t a s k s .   O t h e r w i s e ,   t a s k s   w i l l   b e   p a r s e d   l i n e - b y - l i n e ,   p o t e n t i a l l y   a s   m u l t i p l e   t a s k s .   
 
 A l l   s t r i n g s   s h o u l d   b e   U R L   e n c o d e d   t o   e l i m i n a t e   a n y   a m b i g u i t y   i n   U R L s   a n d   w h a t n o t . 
 
 * * *   B O O K M A R K L E T S   T O   G E T   Y O U   S T A R T E D   * * * 
 
 H e r e ' s   s o m e   s a m p l e   b o o k m a r k l e t s   y o u   c a n   p u t   i n t o   y o u r   b r o w s e r ' s   t o o l b a r   t o   m a k e   t h i s   a l l   g o : 
 
 * A d d   t h e   c u r r e n t   p a g e   a s   a   t a s k   w i t h   t h e   p a g e ' s   U R L   a n d   a n y   s e l e c t e d   t e x t   a s   t h e   n o t e : * 
 
 j a v a s c r i p t : w i n d o w . l o c a t i o n = ' x - o m n i f o c u s : / / n e w t a s k ? n a m e = ' + e n c o d e U R I C o m p o n e n t ( d o c u m e n t . t i t l e ) + ' & n o t e = ' + e n c o d e U R I C o m p o n e n t ( w i n d o w . l o c a t i o n + ' \ n \ n ' ) + e n c o d e U R I C o m p o n e n t ( g e t S e l e c t i o n ( ) ) + ' & q u i c k e n t r y = 0 ' ; 
 
 * S a m e   a s   a b o v e ,   b u t   r o u t e   t o   t h e   Q u i c k   E n t r y   w i n d o w   i n s t e a d   o f   d i r e c t l y   i n t o   t h e   i n b o x : * 
 
 j a v a s c r i p t : w i n d o w . l o c a t i o n = ' x - o m n i f o c u s : / / n e w t a s k ? n a m e = ' + e n c o d e U R I C o m p o n e n t ( d o c u m e n t . t i t l e ) + ' & n o t e = ' + e n c o d e U R I C o m p o n e n t ( w i n d o w . l o c a t i o n + ' \ n \ n ' ) + e n c o d e U R I C o m p o n e n t ( g e t S e l e c t i o n ( ) ) + ' & q u i c k e n t r y = 1 ' ; 
 
 * P a r s e   t a s k s   i n   t h e   s e l e c t i o n : * 
 
 j a v a s c r i p t : w i n d o w . l o c a t i o n = ' x - o m n i f o c u s : / / p a r s e t a s k s ? t e x t = ' + e n c o d e U R I C o m p o n e n t ( g e t S e l e c t i o n ( ) ) + ' & s i n g l e = 0 ' ; 
 
 # #   N O T E S 
 
 T h e   H T M L   e n t i t y   d e c o d i n g   r o u t i n e   f a l l s   d o w n   o n   c e r t a i n   c h a r a c t e r s ,   p a r t i c u l a r l y   U n i c o d e   c h a r a c t e r s . 
 
 I f   y o u   u s e   t h e   q u i c k   e n t r y   w i n d o w   w i t h   t h e   " n e w t a s k "   m e t h o d ,   t h e   p r o j e c t   a n d   c o n t e x t   v a l u e s   w i l l   b e   i g n o r e d ,   a s   t h e s e   a r e   n o t   s c r i p t a b l e   i n   t h e   q u i c k   e n t r y   w i n d o w . 
 
 # #   V E R S I O N   H I S T O R Y 
 
 "   1 . 0   -   0 6 / 2 0 / 2 0 0 8 :   I n i t i a l   r e l e a s e .   S u p p o r t s   p a r s e t a s k s ,   n e w t a s k 
 "   1 . x   -   0 9 / 0 3 / 2 0 0 9 :   M o d i f i e d   i N i k ' s   s c r i p t   t o   s u p p o r t   n e w   A p p l e S c r i p t   t e r m i n o l o g y   u s e d   a f t e r   O F   1 . 7   u p d a t e .   " a c t i v a t e "   c h a n g e d   t o   " o p e n "   f o r   Q u i c k E n t r y .   T h i s   v e r s i o n   c o r r e c t s   a n   i s s u e   w i t h   t h e   Q u i c k E n t r y   w i n d o w   f a i l i n g   t o   o p e n   w h e n   t h e   b o o k m a r k l e t   i s   u s e d   i n   F i r e f o x   3 . 5 . 2 .   R e f e r   t o   h t t p : / / f o r u m s . o m n i g r o u p . c o m / s h o w t h r e a d . p h p ? t = 8 2 5 1   f o r   d e t a i l s .     -   k a i j i n 
 
   
  
 l     ��������  ��  ��        j     �� �� 0 theuri theURI  m        �    x - o m n i f o c u s      l          p       ������ 0 tid  ��       save text item delimiters     �   4   s a v e   t e x t   i t e m   d e l i m i t e r s      l     ��������  ��  ��        l     ��  ��      Test it here     �      T e s t   i t   h e r e       i     ! " ! I     ������
�� .aevtoappnull  �   � ****��  ��   " k      # #  $ % $ I    �� &��
�� .GURLGURLnull��� ��� TEXT & m      ' ' � ( (� x - o m n i f o c u s : / / n e w t a s k ? n a m e = J a v a S c r i p t % 2 0 e s c a p e % 2 8 % 2 9 % 2 0 F u n c t i o n & n o t e = T h e % 2 0 e s c a p e % 2 8 % 2 9 % 2 0 f u n c t i o n % 2 0 e n c o d e s % 2 0 a % 2 0 s t r i n g % 2 C % 2 0 s o % 2 0 i t % 2 0 c a n % 2 0 b e % 2 0 r e a d % 2 0 o n % 2 0 a l l % 2 0 c o m p u t e r s . & q u i c k e n t r y = 0 & c o n t e x t = P��   %  ) * ) l   ��������  ��  ��   *  + , + l   �� - .��   - 4 .open location "x-omnifocus:parsetasks?text=foo    . � / / \ o p e n   l o c a t i o n   " x - o m n i f o c u s : p a r s e t a s k s ? t e x t = f o o ,  0 1 0 l   �� 2 3��   2 	 bar    3 � 4 4  b a r 1  5 6 5 l   �� 7 8��   7  rawr&single=0"    8 � 9 9  r a w r & s i n g l e = 0 " 6  : ; : l   ��������  ��  ��   ;  < = < l   �� > ?��   > _ Y open location "ofinbox://?title=JavaScript%20escape%28%29%20Function&selection=kittykat"    ? � @ @ �   o p e n   l o c a t i o n   " o f i n b o x : / / ? t i t l e = J a v a S c r i p t % 2 0 e s c a p e % 2 8 % 2 9 % 2 0 F u n c t i o n & s e l e c t i o n = k i t t y k a t " =  A�� A l   ��������  ��  ��  ��      B C B l     ��������  ��  ��   C  D E D l      �� F G��   F   Open the URI: link     G � H H (   O p e n   t h e   U R I :   l i n k   E  I J I i    
 K L K I     �� M��
�� .GURLGURLnull��� ��� TEXT M o      ���� 0 surl sURL��   L k     � N N  O P O l     ��������  ��  ��   P  Q�� Q Q     � R S T R k    � U U  V W V Z    X Y���� X H     Z Z C     [ \ [ o    ���� 0 surl sURL \ l    ]���� ] b     ^ _ ^ o    	���� 0 theuri theURI _ m   	 
 ` ` � a a  :��  ��   Y R    �� b c
�� .ascrerr ****      � **** b b     d e d m     f f � g g  M a l f o r m e d   U R L :   e o    ���� 0 surl sURL c �� h��
�� 
errn h m    �������  ��  ��   W  i j i r    " k l k n     m n m 1     ��
�� 
txdl n 1    ��
�� 
ascr l o      ���� 0 tid   j  o p o l  # #��������  ��  ��   p  q r q r   # + s t s I   # )�� u���� 0 spliturl splitURL u  v�� v o   $ %���� 0 surl sURL��  ��   t o      ���� 0 thespliturl theSplitURL r  w x w l  , ,��������  ��  ��   x  y z y r   , 7 { | { l  , 5 }���� } I   , 5�� ~���� 0 decode_text   ~  ��  n   - 1 � � � 4   . 1�� �
�� 
cobj � m   / 0����  � o   - .���� 0 thespliturl theSplitURL��  ��  ��  ��   | o      ���� 0 	themethod 	theMethod z  � � � l  8 8��������  ��  ��   �  � � � Z   8 P � ����� � >  8 > � � � n   8 < � � � 4   9 <�� �
�� 
cobj � m   : ;����  � o   8 9���� 0 thespliturl theSplitURL � m   < =��
�� 
msng � r   A L � � � n  A J � � � I   B J�� ����� 0 	parseargs 	parseArgs �  ��� � n   B F � � � 4   C F�� �
�� 
cobj � m   D E����  � o   B C���� 0 thespliturl theSplitURL��  ��   �  f   A B � o      ���� 0 theargs theArgs��  ��   �  � � � l  Q Q��������  ��  ��   �  � � � Z   Q  � � � � � =  Q T � � � o   Q R���� 0 	themethod 	theMethod � m   R S � � � � �  n e w t a s k � n  W ] � � � I   X ]�� ����� 0 newtask newTask �  ��� � o   X Y���� 0 theargs theArgs��  ��   �  f   W X �  � � � =  ` c � � � o   ` a���� 0 	themethod 	theMethod � m   a b � � � � �  p a r s e t a s k s �  ��� � n  f l � � � I   g l�� ����� 0 
parsetasks 
parseTasks �  ��� � o   g h���� 0 theargs theArgs��  ��   �  f   f g��   � R   o �� � �
�� .ascrerr ****      � **** � b   u ~ � � � b   u z � � � m   u x � � � � �  M e t h o d   " � o   x y���� 0 	themethod 	theMethod � m   z } � � � � �  "   n o t   a l l o w e d . � �� ���
�� 
errn � m   q t�������   �  ��� � l  � ���������  ��  ��  ��   S R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 errmsg errMsg � �� ���
�� 
errn � o      ���� 0 errnum errNum��   T k   � � � �  � � � I  � ��� ���
�� .sysodisAaleR        TEXT � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 errmsg errMsg � m   � � � � � � �    ( � o   � ����� 0 errnum errNum � m   � � � � � � �  )��   �  ��� � R   � ����� �
�� .ascrerr ****      � ****��   � �� ��
�� 
errn � m   � ��~�~���  ��  ��   J  � � � l     �}�|�{�}  �|  �{   �  � � � i     � � � I      �z ��y�z 0 newtask newTask �  ��x � o      �w�w 0 theargs theArgs�x  �y   � k    � � �  � � � l     �v � ��v   � � � x-omnifocus://newtask?name=[task name, required]&project=[project name]&context=[context name]&note=[task note text]&quickentry=[1: Use quickentry]    � � � �(   x - o m n i f o c u s : / / n e w t a s k ? n a m e = [ t a s k   n a m e ,   r e q u i r e d ] & p r o j e c t = [ p r o j e c t   n a m e ] & c o n t e x t = [ c o n t e x t   n a m e ] & n o t e = [ t a s k   n o t e   t e x t ] & q u i c k e n t r y = [ 1 :   U s e   q u i c k e n t r y ] �  � � � l     �u�t�s�u  �t  �s   �  � � � I    �r ��q
�r .ascrcmnt****      � **** � m      � � � � �  n e w T a s k�q   �  � � � I   �p ��o
�p .ascrcmnt****      � **** � o    �n�n 0 theargs theArgs�o   �  � � � l    � � � � r     � � � m    �m
�m boovfals � o      �l�l 0 usequickentry useQuickEntry �    default to no quick entry    � � � � 4   d e f a u l t   t o   n o   q u i c k   e n t r y �  � � � l    � � � � r     � � � m    �k
�k boovfals � o      �j�j 0 hasname hasName � ; 5 Check to see if it has a name, otherwise it'll break    � � � � j   C h e c k   t o   s e e   i f   i t   h a s   a   n a m e ,   o t h e r w i s e   i t ' l l   b r e a k �  � � � r     � � � J    �i�i   � o      �h�h 0 theparameters theParameters �  � � � r       m    �g
�g 
msng o      �f�f 0 thenote theNote �  r      m    �e
�e 
msng o      �d�d 0 
thecontext 
theContext  r   ! $	 m   ! "�c
�c 
msng	 o      �b�b 0 
theproject 
theProject 

 r   % ( m   % &�a
�a 
msng o      �`�` 0 thename theName  l  ) )�_�^�]�_  �^  �]    l  )O X   )O�\ k   9J  r   9 > n   9 < 1   : <�[
�[ 
kMsg o   9 :�Z�Z 0 x   o      �Y�Y 0 xkey xKey  r   ? D !  n   ? B"#" o   @ B�X�X 	0 value  # o   ? @�W�W 0 x  ! o      �V�V 0 xval xVal $%$ l  E E�U�T�S�U  �T  �S  % &'& l  E E�R�Q�P�R  �Q  �P  ' ()( l  E E�O*+�O  *   Name   + �,, 
   N a m e) -.- Z   EH/01�N/ =  E H232 o   E F�M�M 0 xkey xKey3 m   F G44 �55  n a m e0 k   K P66 787 r   K N9:9 o   K L�L�L 0 xval xVal: o      �K�K 0 thename theName8 ;<; l  O O�J�I�H�J  �I  �H  < =�G= l  O O�F>?�F  >   Note   ? �@@ 
   N o t e�G  1 ABA =  S VCDC o   S T�E�E 0 xkey xKeyD m   T UEE �FF  n o t eB GHG k   Y ^II JKJ r   Y \LML o   Y Z�D�D 0 xval xValM o      �C�C 0 thenote theNoteK NON l  ] ]�B�A�@�B  �A  �@  O P�?P l  ] ]�>QR�>  Q   QuickEntry			   R �SS    Q u i c k E n t r y 	 	 	�?  H TUT F   a lVWV =  a dXYX o   a b�=�= 0 xkey xKeyY m   b cZZ �[[  q u i c k e n t r yW =  g j\]\ o   g h�<�< 0 xval xVal] m   h i^^ �__  1U `a` k   o tbb cdc r   o refe m   o p�;
�; boovtruef o      �:�: 0 usequickentry useQuickEntryd ghg l  s s�9�8�7�9  �8  �7  h iji l  s s�6kl�6  k   Project   l �mm    P r o j e c tj n�5n l  s s�4op�4  o _ Y Match the project to the closest match in the document, error if something doesn't match   p �qq �   M a t c h   t h e   p r o j e c t   t o   t h e   c l o s e s t   m a t c h   i n   t h e   d o c u m e n t ,   e r r o r   i f   s o m e t h i n g   d o e s n ' t   m a t c h�5  a rsr =  w ztut o   w x�3�3 0 xkey xKeyu m   x yvv �ww  p r o j e c ts xyx k   } �zz {|{ Q   } �}~} k   � ��� ��� O  � ���� O  � ���� e   � ��� n   � ���� 1   � ��2
�2 
pnam� n   � ���� 4  � ��1�
�1 
cobj� m   � ��0�0 � l  � ���/�.� I  � ��-��
�- .OFOCFCCmnull���     ctxt� o   � ��,�, 0 xval xVal� �+��
�+ 
kocl� m   � ��*
�* 
FCpr� �)��(
�) 
FCmm� m   � ��'�' �(  �/  �.  � 1   � ��&
�& 
FCDo� m   � ����                                                                                  OFOC  alis    X  Macintosh HD               ƫ�H+     rOmniFocus.app                                                   �i�3�        ����  	                Applications    ƫ{�      ��       r  'Macintosh HD:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  � ��%� r   � ���� l  � ���$�#� c   � ���� 1   � ��"
�" 
rslt� m   � ��!
�! 
ctxt�$  �#  � o      � �  0 
theproject 
theProject�%  ~ R      ���
� .ascrerr ****      � ****� o      �� 0 errmsg errMsg� ���
� 
errn� o      �� 0 errnum errNum�   Z   � ������ =  � ���� o   � ��� 0 errnum errNum� m   � ����@� R   � ����
� .ascrerr ****      � ****� b   � ���� b   � ���� m   � ��� ���  P r o j e c t   "� o   � ��� 0 xval xVal� m   � ��� ���  "   n o t   f o u n d .� ���
� 
errn� m   � �����  �  � R   � ����
� .ascrerr ****      � ****� o   � ��� 0 errmsg errMsg� ���
� 
errn� o   � ��� 0 errnum errNum�  | ��� l  � �����  �  �  � ��� l  � ��
���
  �   Context   � ���    C o n t e x t� ��	� l  � �����  � _ Y Match the context to the closest match in the document, error if something doesn't match   � ��� �   M a t c h   t h e   c o n t e x t   t o   t h e   c l o s e s t   m a t c h   i n   t h e   d o c u m e n t ,   e r r o r   i f   s o m e t h i n g   d o e s n ' t   m a t c h�	  y ��� =  � ���� o   � ��� 0 xkey xKey� m   � ��� ���  c o n t e x t� ��� Q   �D���� k   ��� ��� O  ���� O  ���� e   ��� n   ���� 1  
�
� 
pnam� n   ���� 4 ��
� 
cobj� m  �� � l  ����� I  �� ��
�  .OFOCFCCmnull���     ctxt� o   � ����� 0 xval xVal� ����
�� 
kocl� m   � ���
�� 
FCct� �����
�� 
FCmm� m   � ����� ��  �  �  � 1   � ���
�� 
FCDo� m   � ����                                                                                  OFOC  alis    X  Macintosh HD               ƫ�H+     rOmniFocus.app                                                   �i�3�        ����  	                Applications    ƫ{�      ��       r  'Macintosh HD:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  � ���� r  ��� l ������ c  ��� 1  ��
�� 
rslt� m  ��
�� 
ctxt��  ��  � o      ���� 0 
thecontext 
theContext��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errmsg errMsg� �����
�� 
errn� o      ���� 0 errnum errNum��  � Z  D������ = $��� o   ���� 0 errnum errNum� m   #�����@� R  '9����
�� .ascrerr ****      � ****� b  /8��� b  /4��� m  /2�� ���  C o n t e x t   "� o  23���� 0 xval xVal� m  47�� ���  "   n o t   f o u n d .� �����
�� 
errn� m  +.�������  ��  � R  <D����
�� .ascrerr ****      � ****� o  BC���� 0 errmsg errMsg� �����
�� 
errn� o  @A���� 0 errnum errNum��  �  �N  . ���� l II��������  ��  ��  ��  �\ 0 x   o   , -���� 0 theargs theArgs $  We have all the arguments now    ��� <   W e   h a v e   a l l   t h e   a r g u m e n t s   n o w ��� l PP��������  ��  ��  � ��� I PW�����
�� .ascrcmnt****      � ****� m  PS�� ��� 2 A r g u m e n t s   r e p e a t   f i n i s h e d��  � ��� l XX��������  ��  ��  �    Z  X� = X[ o  XY���� 0 thename theName m  YZ��
�� 
msng l ^j	
 R  ^j��
�� .ascrerr ****      � **** m  fi � \ N o   n a m e   s p e c i f i e d .   N e w   t a s k s   m u s t   h a v e   a   n a m e . ����
�� 
errn m  be�������  	   no name, no new task   
 � *   n o   n a m e ,   n o   n e w   t a s k  = mp o  mn���� 0 usequickentry useQuickEntry m  no��
�� boovtrue �� l sz n sz I  tz������ (0 makequickentrytask makeQuickEntryTask  o  tu���� 0 thename theName �� o  uv���� 0 thenote theNote��  ��    f  st 8 2 Context and Project are not scriptable in QE mode    � d   C o n t e x t   a n d   P r o j e c t   a r e   n o t   s c r i p t a b l e   i n   Q E   m o d e��   n }� !  I  ~���"���� 0 makeinboxtask makeInboxTask" #$# o  ~���� 0 thename theName$ %&% o  ����� 0 
theproject 
theProject& '(' o  ������ 0 
thecontext 
theContext( )��) o  ������ 0 thenote theNote��  ��  !  f  }~ *��* l ����������  ��  ��  ��   � +,+ l     ��������  ��  ��  , -.- i    /0/ I      ��1���� 0 
parsetasks 
parseTasks1 2��2 o      ���� 0 theargs theArgs��  ��  0 k     �33 454 l     ��67��  6 o i x-omnifocus://parsetasks?text=[Text to Parse, HTTP escaped, required]&single=[1: Parse as a single task]   7 �88 �   x - o m n i f o c u s : / / p a r s e t a s k s ? t e x t = [ T e x t   t o   P a r s e ,   H T T P   e s c a p e d ,   r e q u i r e d ] & s i n g l e = [ 1 :   P a r s e   a s   a   s i n g l e   t a s k ]5 9:9 r     ;<; m     ��
�� 
msng< o      ���� 0 thetext theText: =>= r    ?@? m    ��
�� boovfals@ o      ���� 
0 single  > ABA l   ��������  ��  ��  B CDC X    JE��FE k    EGG HIH r    JKJ n    LML 1    ��
�� 
kMsgM o    ���� 0 x  K o      ���� 0 xkey xKeyI NON r    #PQP n    !RSR o    !���� 	0 value  S o    ���� 0 x  Q o      ���� 0 xval xValO T��T Z   $ EUVW��U =  $ 'XYX o   $ %���� 0 xkey xKeyY m   % &ZZ �[[  t e x tV r   * -\]\ o   * +���� 0 xval xVal] o      ���� 0 thetext theTextW ^_^ F   0 ;`a` =  0 3bcb o   0 1���� 0 xkey xKeyc m   1 2dd �ee  s i n g l ea =  6 9fgf o   6 7���� 0 xval xValg m   7 8hh �ii  1_ j��j r   > Aklk m   > ?��
�� boovtruel o      ���� 
0 single  ��  ��  ��  �� 0 x  F o    ���� 0 theargs theArgsD mnm l  K K��������  ��  ��  n opo Z   K �qrstq =  K Nuvu o   K L���� 0 thetext theTextv m   L M��
�� 
msngr l  Q Wwxyw R   Q W��z{
�� .ascrerr ****      � ****z m   U V|| �}} p N o   t e x t   s p e c i f i e d .   N e w   t a s k s   m u s t   i n c l u d e   t e x t   t o   p a r s e .{ ��~��
�� 
errn~ m   S T�������  x $  error, we need transport text   y � <   e r r o r ,   w e   n e e d   t r a n s p o r t   t e x ts ��� =  Z ]��� o   Z [���� 
0 single  � m   [ \��
�� boovtrue� ���� O  ` y��� O  d x��� I  j w�����
�� .OFOCFCP?null��� ��� null��  � ����
�� 
FCFT� o   l m���� 0 thetext theText� �����
�� 
FC1T� m   p q��
�� boovtrue��  � 1   d g��
�� 
FCDo� m   ` a���                                                                                  OFOC  alis    X  Macintosh HD               ƫ�H+     rOmniFocus.app                                                   �i�3�        ����  	                Applications    ƫ{�      ��       r  'Macintosh HD:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  ��  t O  | ���� O  � ���� I  � ������
�� .OFOCFCP?null��� ��� null��  � ����
�� 
FCFT� o   � ����� 0 thetext theText� �����
�� 
FC1T� m   � ��
� boovfals��  � 1   � ��~
�~ 
FCDo� m   | }���                                                                                  OFOC  alis    X  Macintosh HD               ƫ�H+     rOmniFocus.app                                                   �i�3�        ����  	                Applications    ƫ{�      ��       r  'Macintosh HD:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  p ��}� l  � ��|�{�z�|  �{  �z  �}  . ��� l     �y�x�w�y  �x  �w  � ��� i    ��� I      �v��u�v (0 makequickentrytask makeQuickEntryTask� ��� o      �t�t 0 thename theName� ��s� o      �r�r 0 thenote theNote�s  �u  � O    ?��� O    >��� O   
 =��� k    <�� ��� r    ��� I   �q�p�
�q .corecrel****      � null�p  � �o��
�o 
kocl� m    �n
�n 
FCit� �m��l
�m 
prdt� K    �� �k��j
�k 
pnam� o    �i�i 0 thename theName�j  �l  � o      �h�h 0 thetask theTask� ��� Z   .���g�f� >   "��� o     �e�e 0 thenote theNote� m     !�d
�d 
msng� r   % *��� o   % &�c�c 0 thenote theNote� n      ��� 1   ' )�b
�b 
FCno� o   & '�a�a 0 thetask theTask�g  �f  � ��� I  / 6�`��_
�` .OTREisalnull���     ****� J   / 2�� ��^� o   / 0�]�] 0 thetask theTask�^  �_  � ��\� I  7 <�[�Z�Y
�[ .aevtodocnull  �    alis�Z  �Y  �\  � 1   
 �X
�X 
FCQE� 1    �W
�W 
FCDo� m     ���                                                                                  OFOC  alis    X  Macintosh HD               ƫ�H+     rOmniFocus.app                                                   �i�3�        ����  	                Applications    ƫ{�      ��       r  'Macintosh HD:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  � ��� l     �V�U�T�V  �U  �T  � ��� i    ��� I      �S��R�S 0 makeinboxtask makeInboxTask� ��� o      �Q�Q 0 thename theName� ��� o      �P�P 0 
theproject 
theProject� ��� o      �O�O 0 
thecontext 
theContext� ��N� o      �M�M 0 thenote theNote�N  �R  � O    *��� O    )��� k   
 (�� ��� r   
 ��� I  
 �L�K�
�L .corecrel****      � null�K  � �J��
�J 
kocl� m    �I
�I 
FCit� �H��G
�H 
prdt� K    �� �F��E
�F 
pnam� o    �D�D 0 thename theName�E  �G  � o      �C�C 0 thetask theTask� ��B� Z   (���A�@� >   ��� o    �?�? 0 thenote theNote� m    �>
�> 
msng� r    $��� o     �=�= 0 thenote theNote� n      ��� 1   ! #�<
�< 
FCno� o     !�;�; 0 thetask theTask�A  �@  �B  � 1    �:
�: 
FCDo� m     ���                                                                                  OFOC  alis    X  Macintosh HD               ƫ�H+     rOmniFocus.app                                                   �i�3�        ����  	                Applications    ƫ{�      ��       r  'Macintosh HD:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  � ��� l     �9�8�7�9  �8  �7  � ��� l      �6���6  � ' ! Convert a URL into a record set    � ��� B   C o n v e r t   a   U R L   i n t o   a   r e c o r d   s e t  � ��� i    ��� I      �5��4�5 0 spliturl splitURL� ��3� o      �2�2 0 theurl theURL�3  �4  � k     ��� ��� l     �1�0�/�1  �0  �/  � ��� l     �.�-�,�.  �-  �,  � ��� l    � � r      [      l    �+�* I    �)�(
�) .corecnte****       **** n     	 2   �'
�' 
cha 	 o     �&�& 0 theuri theURI�(  �+  �*   m    �%�%  o      �$�$ 0 urin uriN    account for the ":"    �

 (   a c c o u n t   f o r   t h e   " : "�  l   �#�#   ) # Get rid of the url protocol string    � F   G e t   r i d   o f   t h e   u r l   p r o t o c o l   s t r i n g  l   �"�!� �"  �!  �     l   ! r    ! I   ��
� .sysooffslong    ��� null�   �
� 
psof l   �� b     o    �� 0 theuri theURI m     �    : / /�  �   �!�
� 
psin! o    �� 0 theurl theURL�   o      �� 0 pn pN   is it a mailto:// style?    �"" 2   i s   i t   a   m a i l t o : / /   s t y l e ? #$# l  " "����  �  �  $ %&% Z   " U'(�)' ?   " %*+* o   " #�� 0 pn pN+ m   # $��  ( l  ( =,-., r   ( =/0/ n   ( ;121 7 ) ;�34
� 
ctxt3 l  - 15��5 [   - 1676 o   . /�� 0 urin uriN7 m   / 0�� �  �  4 l  2 :8�
�	8 I  2 :�9�
� .corecnte****       ****9 n   3 6:;: 2  4 6�
� 
cha ; o   3 4�� 0 theurl theURL�  �
  �	  2 o   ( )�� 0 theurl theURL0 o      �� 0 theurl theURL-   a URI:// url   . �<<    a   U R I : / /   u r l�  ) l  @ U=>?= r   @ U@A@ n   @ SBCB 7 A S�DE
� 
ctxtD l  E IF�� F [   E IGHG o   F G���� 0 urin uriNH m   G H���� �  �   E l  J RI����I I  J R��J��
�� .corecnte****       ****J n   K NKLK 2  L N��
�� 
cha L o   K L���� 0 theurl theURL��  ��  ��  C o   @ A���� 0 theurl theURLA o      ���� 0 theurl theURL>   or just a URI: url   ? �MM &   o r   j u s t   a   U R I :   u r l& NON l  V V��������  ��  ��  O PQP l  V V��RS��  R L F See if there's any arguments being passed, pass 'em back if there are   S �TT �   S e e   i f   t h e r e ' s   a n y   a r g u m e n t s   b e i n g   p a s s e d ,   p a s s   ' e m   b a c k   i f   t h e r e   a r eQ UVU r   V aWXW I  V _����Y
�� .sysooffslong    ��� null��  Y ��Z[
�� 
psofZ m   X Y\\ �]]  ?[ ��^��
�� 
psin^ o   Z [���� 0 theurl theURL��  X o      ���� 0 an aNV _`_ Z   b �abcda =   b eefe o   b c���� 0 an aNf m   c d���� b l  h �ghig L   h �jj J   h kk lml m   h i��
�� 
msngm n��n l  i }o����o n   i }pqp 7 j |��rs
�� 
ctxtr l  n rt����t [   n ruvu o   o p���� 0 an aNv m   p q���� ��  ��  s l  s {w����w I  s {��x��
�� .corecnte****       ****x n   t wyzy 2  u w��
�� 
cha z o   t u���� 0 theurl theURL��  ��  ��  q o   i j���� 0 theurl theURL��  ��  ��  h "  no base url, just arguments   i �{{ 8   n o   b a s e   u r l ,   j u s t   a r g u m e n t sc |}| ?   � �~~ o   � ����� 0 an aN m   � ����� } ���� L   � ��� J   � ��� ��� l  � ������� n   � ���� 7 � �����
�� 
ctxt� m   � ����� � l  � ������� \   � ���� o   � ����� 0 an aN� m   � ����� ��  ��  � o   � ����� 0 theurl theURL��  ��  � ���� l  � ������� n   � ���� 7 � �����
�� 
ctxt� l  � ������� [   � ���� o   � ����� 0 an aN� m   � ����� ��  ��  � l  � ������� I  � ������
�� .corecnte****       ****� n   � ���� 2  � ���
�� 
cha � o   � ����� 0 theurl theURL��  ��  ��  � o   � ����� 0 theurl theURL��  ��  ��  ��  d L   � ��� J   � ��� ��� o   � ����� 0 theurl theURL� ���� m   � ���
�� 
msng��  ` ���� l  � ���������  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i    "��� I      ������� 0 	parseargs 	parseArgs� ���� o      ���� 0 sargs sArgs��  ��  � k     ��� ��� r     ��� m     �� ���  &� 1    ��
�� 
txdl� ��� r    ��� n    	��� 2    	��
�� 
citm� o    ���� 0 sargs sArgs� o      ���� 0 theargs theArgs� ��� r    ��� o    ���� 0 tid  � 1    ��
�� 
txdl� ��� r    ��� J    ����  � o      ���� 0 rargs rArgs� ��� l   ��������  ��  ��  � ��� X    ������ k   ' ��� ��� r   ' ,��� l  ' *������ n   ' *��� m   ( *��
�� 
ctxt� o   ' (���� 0 xarg xArg��  ��  � o      ���� 0 yarg yArg� ��� r   - 8��� I  - 6�����
�� .sysooffslong    ��� null��  � ����
�� 
psof� m   / 0�� ���  =� �����
�� 
psin� o   1 2���� 0 yarg yArg��  � o      ���� 0 eqoff eqOff� ���� Z   9 ������� ?   9 <��� o   9 :���� 0 eqoff eqOff� m   : ;����  � k   ? |�� ��� r   ? N��� n   ? L��� 7 @ L����
�� 
ctxt� m   D F���� � l  G K������ \   G K��� o   H I���� 0 eqoff eqOff� m   I J���� ��  ��  � o   ? @���� 0 yarg yArg� o      ���� 0 argkey argKey� ��� r   O d��� n   O b��� 7 P b����
�� 
ctxt� l  T X������ [   T X��� o   U V���� 0 eqoff eqOff� m   V W���� ��  ��  � l  Y a������ I  Y a�����
�� .corecnte****       ****� n   Z ]��� 2  [ ]��
�� 
cha � o   Z [���� 0 yarg yArg��  ��  ��  � o   O P���� 0 yarg yArg� o      �� "0 argvalueencoded argValueEncoded� ��� r   e m��� n  e k��� I   f k�~��}�~ 0 decode_text  � ��|� o   f g�{�{ "0 argvalueencoded argValueEncoded�|  �}  �  f   e f� o      �z�z 0 argvalue argValue� ��y� r   n |� � b   n z o   n o�x�x 0 rargs rArgs J   o y �w K   o w �v
�v 
kMsg o   p q�u�u 0 argkey argKey �t�s�t 	0 value   o   t u�r�r 0 argvalue argValue�s  �w    o      �q�q 0 rargs rArgs�y  ��  � R    ��p	

�p .ascrerr ****      � ****	 b   � � b   � � m   � � �  P a r a m e t e r   " o   � ��o�o 0 yarg yArg m   � � �  "   h a s   n o   v a l u e .
 �n�m
�n 
errn m   � ��l�l��m  ��  �� 0 xarg xArg� o    �k�k 0 theargs theArgs�  l  � ��j�i�h�j  �i  �h   �g L   � � o   � ��f�f 0 rargs rArgs�g  �  l     �e�d�c�e  �d  �c    l      �b�b   &   From Apple's sub-routines page     � @   F r o m   A p p l e ' s   s u b - r o u t i n e s   p a g e     l     �a!"�a  ! G A this sub-routine is used to decode a three-character hex string    " �## �   t h i s   s u b - r o u t i n e   i s   u s e d   t o   d e c o d e   a   t h r e e - c h a r a c t e r   h e x   s t r i n g    $%$ i   # &&'& I      �`(�_�` 0 decode_chars  ( )�^) o      �]�] 0 these_chars  �^  �_  ' k     a** +,+ s     -.- o     �\�\ 0 these_chars  . J      // 010 o      �[�[ 0 indentifying_char  1 232 o      �Z�Z 0 multiplier_char  3 4�Y4 o      �X�X 0 remainder_char  �Y  , 565 r    787 m    99 �::  1 2 3 4 5 6 7 8 9 A B C D E F8 l     ;�W�V; o      �U�U 0 hex_list  �W  �V  6 <=< Z    8>?�T@> E   "ABA m     CC �DD  A B C D E FB l    !E�S�RE o     !�Q�Q 0 multiplier_char  �S  �R  ? r   % 0FGF l  % .H�P�OH I  % .�N�MI
�N .sysooffslong    ��� null�M  I �LJK
�L 
psofJ l  ' (L�K�JL o   ' (�I�I 0 multiplier_char  �K  �J  K �HM�G
�H 
psinM l  ) *N�F�EN o   ) *�D�D 0 hex_list  �F  �E  �G  �P  �O  G l     O�C�BO o      �A�A 0 multiplier_amt  �C  �B  �T  @ r   3 8PQP c   3 6RSR l  3 4T�@�?T o   3 4�>�> 0 multiplier_char  �@  �?  S m   4 5�=
�= 
longQ l     U�<�;U o      �:�: 0 multiplier_amt  �<  �;  = VWV Z   9 RXY�9ZX E  9 <[\[ m   9 :]] �^^  A B C D E F\ l  : ;_�8�7_ o   : ;�6�6 0 remainder_char  �8  �7  Y r   ? J`a` l  ? Hb�5�4b I  ? H�3�2c
�3 .sysooffslong    ��� null�2  c �1de
�1 
psofd l  A Bf�0�/f o   A B�.�. 0 remainder_char  �0  �/  e �-g�,
�- 
psing l  C Dh�+�*h o   C D�)�) 0 hex_list  �+  �*  �,  �5  �4  a l     i�(�'i o      �&�& 0 remainder_amt  �(  �'  �9  Z r   M Rjkj c   M Plml l  M Nn�%�$n o   M N�#�# 0 remainder_char  �%  �$  m m   N O�"
�" 
longk l     o�!� o o      �� 0 remainder_amt  �!  �   W pqp r   S Zrsr [   S Xtut l  S Vv��v ]   S Vwxw o   S T�� 0 multiplier_amt  x m   T U�� �  �  u o   V W�� 0 remainder_amt  s l     y��y o      �� 0 	ascii_num 	ASCII_num�  �  q z�z L   [ a{{ l  [ `|��| I  [ `�}�
� .sysontocTEXT       shor} o   [ \�� 0 	ascii_num 	ASCII_num�  �  �  �  % ~~ l     ����  �  �   ��� l     ����  � 7 1 this sub-routine is used to decode text strings    � ��� b   t h i s   s u b - r o u t i n e   i s   u s e d   t o   d e c o d e   t e x t   s t r i n g s  � ��� i   ' *��� I      ���
� 0 decode_text  � ��	� o      �� 0 	this_text  �	  �
  � k     y�� ��� r     ��� m     �
� boovfals� o      �� 0 flag_a flag_A� ��� r    ��� m    �
� boovfals� o      �� 0 flag_b flag_B� ��� r    ��� m    	�� ���  � o      �� 0 	temp_char  � ��� r    ��� J    ��  � l     ��� � o      ���� 0 character_list  �  �   � ��� X    t����� k   ! o�� ��� r   ! &��� l  ! $������ n   ! $��� 1   " $��
�� 
pcnt� o   ! "���� 0 	this_char  ��  ��  � o      ���� 0 	this_char  � ���� Z   ' o����� =  ' *��� o   ' (���� 0 	this_char  � m   ( )�� ���  %� r   - 0��� m   - .��
�� boovtrue� o      ���� 0 flag_a flag_A� ��� =  3 6��� o   3 4���� 0 flag_a flag_A� m   4 5��
�� boovtrue� ��� k   9 D�� ��� r   9 <��� o   9 :���� 0 	this_char  � l     ������ o      ���� 0 	temp_char  ��  ��  � ��� r   = @��� m   = >��
�� boovfals� o      ���� 0 flag_a flag_A� ���� r   A D��� m   A B��
�� boovtrue� o      ���� 0 flag_b flag_B��  � ��� =  G J��� o   G H���� 0 flag_b flag_B� m   H I��
�� boovtrue� ���� k   M h�� ��� r   M \��� n  M Y��� I   N Y������� 0 decode_chars  � ���� c   N U��� l  N S������ b   N S��� b   N Q��� m   N O�� ���  %� o   O P���� 0 	temp_char  � o   Q R���� 0 	this_char  ��  ��  � m   S T��
�� 
TEXT��  ��  �  f   M N� l     ������ n      ���  ;   Z [� l  Y Z������ o   Y Z���� 0 character_list  ��  ��  ��  ��  � ��� r   ] `��� m   ] ^�� ���  � l     ������ o      ���� 0 	temp_char  ��  ��  � ��� r   a d��� m   a b��
�� boovfals� o      ���� 0 flag_a flag_A� ���� r   e h��� m   e f��
�� boovfals� o      ���� 0 flag_b flag_B��  ��  � r   k o��� o   k l���� 0 	this_char  � l     ������ n      ���  ;   m n� l  l m������ o   l m���� 0 character_list  ��  ��  ��  ��  ��  �� 0 	this_char  � o    ���� 0 	this_text  � ���� L   u y�� c   u x��� l  u v������ o   u v���� 0 character_list  ��  ��  � m   v w��
�� 
TEXT��  �       ��� ��� ��  � ������������������������ 0 theuri theURI
�� .aevtoappnull  �   � ****
�� .GURLGURLnull��� ��� TEXT�� 0 newtask newTask�� 0 
parsetasks 
parseTasks�� (0 makequickentrytask makeQuickEntryTask�� 0 makeinboxtask makeInboxTask�� 0 spliturl splitURL�� 0 	parseargs 	parseArgs�� 0 decode_chars  �� 0 decode_text  � �� "������
�� .aevtoappnull  �   � ****��  ��      '��
�� .GURLGURLnull��� ��� TEXT�� �j OP� �� L����	
��
�� .GURLGURLnull��� ��� TEXT�� 0 surl sURL��  	 �������������� 0 surl sURL�� 0 thespliturl theSplitURL�� 0 	themethod 	theMethod�� 0 theargs theArgs�� 0 errmsg errMsg�� 0 errnum errNum
  `���� f���������������� ��� ����� � ��� � �����
�� 
errn���
�� 
ascr
�� 
txdl�� 0 tid  �� 0 spliturl splitURL
�� 
cobj�� 0 decode_text  
�� 
msng�� 0 	parseargs 	parseArgs�� 0 newtask newTask�� 0 
parsetasks 
parseTasks����� 0 errmsg errMsg ������
�� 
errn�� 0 errnum errNum��  
�� .sysodisAaleR        TEXT������ � ��b   �% )��l�%Y hO��,E�O*�k+ E�O*��k/k+ 	E�O��l/� )��l/k+ E�Y hO��  )�k+ Y !��  )�k+ Y )�a la �%a %OPW X  �a %�%a %j O)�a lh� �� ��������� 0 newtask newTask�� ����   ���� 0 theargs theArgs��   ���������������������������� 0 theargs theArgs�� 0 usequickentry useQuickEntry�� 0 hasname hasName�� 0 theparameters theParameters�� 0 thenote theNote�� 0 
thecontext 
theContext�� 0 
theproject 
theProject�� 0 thename theName�� 0 x  �� 0 xkey xKey�� 0 xval xVal�� 0 errmsg errMsg�� 0 errnum errNum ' �������������~4EZ^�}v��|�{�z�y�x�w�v�u�t�s�r�q����p����o�n�m
�� .ascrcmnt****      � ****
�� 
msng
�� 
kocl
�� 
cobj
�� .corecnte****       ****
� 
kMsg�~ 	0 value  
�} 
bool
�| 
FCDo
�{ 
FCpr
�z 
FCmm�y 
�x .OFOCFCCmnull���     ctxt
�w 
pnam
�v 
rslt
�u 
ctxt�t 0 errmsg errMsg �l�k�j
�l 
errn�k 0 errnum errNum�j  �s�@
�r 
errn�q�
�p 
FCct�o��n (0 makequickentrytask makeQuickEntryTask�m 0 makeinboxtask makeInboxTask����j O�j OfE�OfE�OjvE�O�E�O�E�O�E�O�E�O%�[��l kh ��,E�O��,E�O��  
�E�OPY ���  
�E�OPY �� 	 �� �& 
eE�OPY ө�  d 2�  *�, ��a a ka  �k/a ,EUUO_ a &E�W ,X  �a   )a a la �%a %Y 
)a �l�OPY k�a   b 2�  *�, ��a a ka  �k/a ,EUUO_ a &E�W ,X  �a   )a a la  �%a !%Y 
)a �l�Y hOP[OY��Oa "j O��  )a a #la $Y �e  )��l+ %Y )����a + &OP  �i0�h�g�f�i 0 
parsetasks 
parseTasks�h �e�e   �d�d 0 theargs theArgs�g   �c�b�a�`�_�^�c 0 theargs theArgs�b 0 thetext theText�a 
0 single  �` 0 x  �_ 0 xkey xKey�^ 0 xval xVal �]�\�[�Z�Y�XZdh�W�V�U|��T�S�R�Q�P
�] 
msng
�\ 
kocl
�[ 
cobj
�Z .corecnte****       ****
�Y 
kMsg�X 	0 value  
�W 
bool
�V 
errn�U�
�T 
FCDo
�S 
FCFT
�R 
FC1T�Q 
�P .OFOCFCP?null��� ��� null�f ��E�OfE�O A�[��l kh ��,E�O��,E�O��  �E�Y �� 	 �� �& eE�Y h[OY��O��  )��l�Y =�e  � *�, *�a ea  UUY � *�, *�a fa  UUOP �O��N�M�L�O (0 makequickentrytask makeQuickEntryTask�N �K�K   �J�I�J 0 thename theName�I 0 thenote theNote�M   �H�G�F�H 0 thename theName�G 0 thenote theNote�F 0 thetask theTask ��E�D�C�B�A�@�?�>�=�<�;�:
�E 
FCDo
�D 
FCQE
�C 
kocl
�B 
FCit
�A 
prdt
�@ 
pnam�? 
�> .corecrel****      � null
�= 
msng
�< 
FCno
�; .OTREisalnull���     ****
�: .aevtodocnull  �    alis�L @� <*�, 5*�, .*����l� E�O�� 
���,FY hO�kvj O*j UUU �9��8�7�6�9 0 makeinboxtask makeInboxTask�8 �5�5   �4�3�2�1�4 0 thename theName�3 0 
theproject 
theProject�2 0 
thecontext 
theContext�1 0 thenote theNote�7   �0�/�.�-�,�0 0 thename theName�/ 0 
theproject 
theProject�. 0 
thecontext 
theContext�- 0 thenote theNote�, 0 thetask theTask 
��+�*�)�(�'�&�%�$�#
�+ 
FCDo
�* 
kocl
�) 
FCit
�( 
prdt
�' 
pnam�& 
�% .corecrel****      � null
�$ 
msng
�# 
FCno�6 +� '*�,  *����l� E�O�� 
���,FY hUU �"��!� ��" 0 spliturl splitURL�! ��   �� 0 theurl theURL�    ����� 0 theurl theURL� 0 urin uriN� 0 pn pN� 0 an aN 
�������\�
� 
cha 
� .corecnte****       ****
� 
psof
� 
psin� 
� .sysooffslong    ��� null
� 
ctxt
� 
msng� �b   �-j kE�O*�b   �%�� E�O�j �[�\[Z�m\Z��-j 2E�Y �[�\[Z�k\Z��-j 2E�O*���� E�O�k  �[�\[Z�k\Z��-j 2ElvY 5�k *�[�\[Zk\Z�k2E�[�\[Z�k\Z��-j 2ElvY ��lvOP ������ 0 	parseargs 	parseArgs� ��   �� 0 sargs sArgs�   	�
�	��������
 0 sargs sArgs�	 0 theargs theArgs� 0 rargs rArgs� 0 xarg xArg� 0 yarg yArg� 0 eqoff eqOff� 0 argkey argKey� "0 argvalueencoded argValueEncoded� 0 argvalue argValue ��� �������������������������������
� 
txdl
�  
citm�� 0 tid  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
ctxt
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
cha �� 0 decode_text  
�� 
kMsg�� 	0 value  
�� 
errn���� ��*�,FO��-E�O�*�,FOjvE�O ~�[��l kh ��-E�O*���� E�O�j B�[�\[Zk\Z�k2E�O�[�\[Z�k\Z��-j 2E�O)�k+ E�O��a ��kv%E�Y )a a la �%a %[OY��O� ��'���� ���� 0 decode_chars  �� ��!�� !  ���� 0 these_chars  ��   ������������������ 0 these_chars  �� 0 indentifying_char  �� 0 multiplier_char  �� 0 remainder_char  �� 0 hex_list  �� 0 multiplier_amt  �� 0 remainder_amt  �� 0 	ascii_num 	ASCII_num  ��9C����������]����
�� 
cobj
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
long�� 
�� .sysontocTEXT       shor�� b�E[�k/EQ�Z[�l/EQ�Z[�m/EQ�ZO�E�O� *��� E�Y ��&E�O� *��� E�Y ��&E�O�� �E�O�j 
 �������"#���� 0 decode_text  �� ��$�� $  ���� 0 	this_text  ��  " �������������� 0 	this_text  �� 0 flag_a flag_A�� 0 flag_b flag_B�� 0 	temp_char  �� 0 character_list  �� 0 	this_char  # 
����������������
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
TEXT�� 0 decode_chars  �� zfE�OfE�O�E�OjvE�O b�[��l kh ��,E�O��  eE�Y >�e  �E�OfE�OeE�Y *�e   )�%�%�&k+ �6FO�E�OfE�OfE�Y ��6F[OY��O��&ascr  ��ޭ