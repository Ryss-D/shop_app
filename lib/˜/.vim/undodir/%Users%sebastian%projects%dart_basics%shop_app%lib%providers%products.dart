Vim�UnDo� �57���qƁ�nN@F�%�u��@z�B~f�c   @                                  b�F�    _�                     '        ����                                                                                                                                                                                                                                                                                                                                                             b�>
     �   '   )   7    5��    '                      �                     �    '                      �                     5�_�                    (        ����                                                                                                                                                                                                                                                                                                                                                             b�>
    �   (   *   9        �   (   *   8    5��    (                      �                     �    (                   
   �              
       �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    �    (                 	   �             	       �    (          	       
   �      	       
       �    (          
          �      
              �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    �    (                    �                    5�_�                    +       ����                                                                                                                                                                                                                                                                                                                                                             b�>     �   +   -   :            �   +   -   9    5��    +                      �                     �    +                  
   �             
       �    +   	                 �                    �    +   	                 �                    �    +   	                 �                    �    +   	                 �                    �    +   	                 �                    �    +                    �                    �    +                                         5�_�                    ,       ����                                                                                                                                                                                                                                                                                                                                                             b�>#     �   +   .   :            if(showFavoritesOnly){}5��    +                                         �    ,                                          �    ,                                          5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             b�>%     �   ,   .   <      
          �   ,   .   ;    5��    ,                                           �    ,                                         �    ,   
              
                
       �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                                        �    ,                    !                    �    ,                    !                    �    ,                    !                    �    ,                    !                    �    ,                    !                    �    ,                    !                    �    ,                    !                    �    ,                    !                    �    ,   *                 ,                    �    ,   *                 ,                    �    ,   *                 ,                    �    ,   *                 ,                    �    ,   *              
   ,             
       �    ,   3                 5                    �    ,   3                 5                    �    ,   3                 5                    �    ,   ?                 A                    �    ,   ?                 A                    �    ,   ?                 A                    �    ,   ?                 A                    �    ,   ?                 A                    �    ,   ?                 A                    �    ,   ?              	   A             	       5�_�                    -   G    ����                                                                                                                                                                                                                                                                                                                                                             b�>G    �   ;   =          }�   :   <            }�   9   ;              notifyListeners();�   8   :              // rebuild�   7   9          N    // this methos allowus to tell te Listeners when are new info avaliable to�   6   8              //_items.add(value);�   5   7            void addProduct() {�   4   6           �   3   5            }�   2   4          6    return _items.firstWhere((prod) => prod.id == id);�   1   3            Product findById(String id) {�   0   2           �   /   1            }�   .   0              return [..._items];�   -   /                }�   ,   .          H          return _items.where((prodItem)=>prodItem.isFavorite).toList();�   +   -                if(showFavoritesOnly){�   *   ,            List<Product> get items {�   )   +           �   (   *             var showFavoritesOnly = false;�   '   )           �   &   (            ];�   %   '              ),�   $   &          q          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',�   #   %                imageUrl:�   "   $                price: 49.99,�   !   #          0      description: 'Prepare any meal you want.',�       "                title: 'A Pan',�      !                id: 'p4',�                     Product(�                    ),�                K          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',�                      imageUrl:�                      price: 19.99,�                K      description: 'Warm and cozy - exactly what you need for the winter.',�                      title: 'Yellow Scarf',�                      id: 'p3',�                    Product(�                    ),�                �          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',�                      imageUrl:�                      price: 59.99,�                .      description: 'A nice pair of trousers.',�                      title: 'Trousers',�                      id: 'p2',�                    Product(�                    ),�                X          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',�                      imageUrl:�   
                   price: 29.99,�   	             5      description: 'A red shirt - it is pretty red!',�      
                title: 'Red Shirt',�      	                id: 'p1',�                    Product(�                  List<Product> _items = [�                $class Products with ChangeNotifier {�                 �                import 'product.dart';�                 �                 'import 'package:flutter/material.dart';5��                '       '           '       '       �                           (                       �                         )                     �                           @                       �               $       $   A       $       $       �                         f                     �                         �                     �                         �                     �                         �                     �    	           5       5   �       5       5       �    
                     �                     �                                             �               X       X         X       X       �                         k                    �                         r                    �                                             �                         �                    �               .       .   �      .       .       �                         �                    �                         �                    �               �       �   �      �       �       �                         �                    �                         �                    �                         �                    �                         �                    �               K       K   �      K       K       �                         )                    �                         =                    �               K       K   M      K       K       �                         �                    �                         �                    �                         �                    �                          �                    �    !           0       0   �      0       0       �    "                                         �    #                                         �    $           q       q   (      q       q       �    %                     �                    �    &                     �                    �    '                       �                      �    (                       �                      �    )                       �                      �    *                     �                    �    +                     �                    �    ,           H       F         H       F       �    -                     I                    �    .                     O                    �    /                     g                    �    0                       k                      �    1                     l                    �    2           6       6   �      6       6       �    3                     �                    �    4                       �                      �    5                     �                    �    6                     �                    �    7           N       N   �      N       N       �    8                     F                    �    9                     U                    �    :                     l                    �    ;                     p                    5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                             b�>�     �   (   *   <         var showFavoritesOnly = false;5��    (                     �                     5�_�      	              ,       ����                                                                                                                                                                                                                                                                                                                                                             b�>�    �   +   -   <          if (showFavoritesOnly) {5��    +                     �                     5�_�      
           	   5        ����                                                                                                                                                                                                                                                                                                                                                             b�>�     �   5   7   <    5��    5                      �                     �    5                      �                     �    5                      �                     5�_�   	              
   6        ����                                                                                                                                                                                                                                                                                                                                                             b�>�     �   5   7   >        �   5   7   =    5��    5                      �                     �    5                      �                     �    5                    �                    5�_�   
                 6       ����                                                                                                                                                                                                                                                                                                                                                             b�>�     �   5   8   >        void showFavoritesOnly(){}5��    5                    �                     5�_�                    7       ����                                                                                                                                                                                                                                                                                                                                                             b�>�     �   6   8   @            �   6   8   ?    5��    6                      �                     �    6                  
   �             
       �    6                    �                    �    6                    �                    �    6                    �                    �    6                                        5�_�                    7       ����                                                                                                                                                                                                                                                                                                                                                             b�?     �   ?   A          }�   >   @            }�   =   ?              notifyListeners();�   <   >              // rebuild�   ;   =          N    // this methos allowus to tell te Listeners when are new info avaliable to�   :   <              //_items.add(value);�   9   ;            void addProduct() {�   8   :           �   7   9            }�   6   8                 _showFavoritesOnly = true;�   5   7            void showFavoritesOnly(){�   4   6           �   3   5            }�   2   4          6    return _items.firstWhere((prod) => prod.id == id);�   1   3            Product findById(String id) {�   0   2           �   /   1            }�   .   0              return [..._items];�   -   /              }�   ,   .          F      return _items.where((prodItem) => prodItem.isFavorite).toList();�   +   -              if (_showFavoritesOnly) {�   *   ,            List<Product> get items {�   )   +           �   (   *          !  var _showFavoritesOnly = false;�   '   )           �   &   (            ];�   %   '              ),�   $   &          q          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',�   #   %                imageUrl:�   "   $                price: 49.99,�   !   #          0      description: 'Prepare any meal you want.',�       "                title: 'A Pan',�      !                id: 'p4',�                     Product(�                    ),�                K          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',�                      imageUrl:�                      price: 19.99,�                K      description: 'Warm and cozy - exactly what you need for the winter.',�                      title: 'Yellow Scarf',�                      id: 'p3',�                    Product(�                    ),�                �          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',�                      imageUrl:�                      price: 59.99,�                .      description: 'A nice pair of trousers.',�                      title: 'Trousers',�                      id: 'p2',�                    Product(�                    ),�                X          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',�                      imageUrl:�   
                   price: 29.99,�   	             5      description: 'A red shirt - it is pretty red!',�      
                title: 'Red Shirt',�      	                id: 'p1',�                    Product(�                  List<Product> _items = [�                $class Products with ChangeNotifier {�                 �                import 'product.dart';�                 �                 'import 'package:flutter/material.dart';5��                '       '           '       '       �                           (                       �                         )                     �                           @                       �               $       $   A       $       $       �                         f                     �                         �                     �                         �                     �                         �                     �    	           5       5   �       5       5       �    
                     �                     �                                             �               X       X         X       X       �                         k                    �                         r                    �                                             �                         �                    �               .       .   �      .       .       �                         �                    �                         �                    �               �       �   �      �       �       �                         �                    �                         �                    �                         �                    �                         �                    �               K       K   �      K       K       �                         )                    �                         =                    �               K       K   M      K       K       �                         �                    �                         �                    �                         �                    �                          �                    �    !           0       0   �      0       0       �    "                                         �    #                                         �    $           q       q   (      q       q       �    %                     �                    �    &                     �                    �    '                       �                      �    (           !       !   �      !       !       �    )                       �                      �    *                     �                    �    +                     �                    �    ,           F       F         F       F       �    -                     K                    �    .                     Q                    �    /                     i                    �    0                       m                      �    1                     n                    �    2           6       6   �      6       6       �    3                     �                    �    4                       �                      �    5                     �                    �    6                      �                     �    7                                         �    8                       
                      �    9                                         �    :                     !                    �    ;           N       N   :      N       N       �    <                     �                    �    =                     �                    �    >                     �                    �    ?                     �                    5�_�                    8        ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?     �   8   <   @    �   8   9   @    5��    8                      
              @       5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?     �   8   :   C    5��    8                      
                     �    8                      
                     5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?	     �   9   ;   D        void showFavoritesOnly() {5��    9                                          5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?	     �   9   ;   D        void show() {5��    9                                          5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?     �   9   ;   D        void showall() {5��    9                                          5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?    �   9   ;   D        void showll() {5��    9                                          5�_�                    ;       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?     �   :   <   D          _showFavoritesOnly = true;5��    :                     6                     5�_�                    ;       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?     �   :   <   D          _showFavoritesOnly =true;5��    :                     6                     5�_�                    ;       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?    �   :   <   D          _showFavoritesOnly =;5��    :                     6                     �    :                    6                    �    :                    9                    5�_�                    ;       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?�     �   ;   =   E          �   ;   =   D    5��    ;                      >                     �    ;                     B                     �    ;                    B                    �    ;                    B                    �    ;                    B                    �    ;                    B                    5�_�                    <       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?�     �   ;   =   E          notifyListeners5��    ;                     Q                     5�_�                    8       ����                                                                                                                                                                                                                                                                                                                            6          8          V       b�?�    �   7   9   E    �   8   9   E    5��    7                                           5�_�                     2        ����                                                                                                                                                                                                                                                                                                                            6          9          V       b�F�     �               F   'import 'package:flutter/material.dart';       import 'product.dart';       $class Products with ChangeNotifier {     List<Product> _items = [       Product(         id: 'p1',         title: 'Red Shirt',   5      description: 'A red shirt - it is pretty red!',         price: 29.99,         imageUrl:   X          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',       ),       Product(         id: 'p2',         title: 'Trousers',   .      description: 'A nice pair of trousers.',         price: 59.99,         imageUrl:   �          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',       ),       Product(         id: 'p3',         title: 'Yellow Scarf',   K      description: 'Warm and cozy - exactly what you need for the winter.',         price: 19.99,         imageUrl:   K          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',       ),       Product(         id: 'p4',         title: 'A Pan',   0      description: 'Prepare any meal you want.',         price: 49.99,         imageUrl:   q          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',       ),     ];       !  var _showFavoritesOnly = false;         List<Product> get items {       if (_showFavoritesOnly) {   F      return _items.where((prodItem) => prodItem.isFavorite).toList();       }       return [..._items];     }         Product findById(String id) {   6    return _items.firstWhere((prod) => prod.id == id);     }         void showFavoritesOnly() {       _showFavoritesOnly = true;       notifyListeners();     }         void showAll() {       _showFavoritesOnly = false;       notifyListeners();     }         void addProduct() {       //_items.add(value);   N    // this methos allowus to tell te Listeners when are new info avaliable to       // rebuild       notifyListeners();     }   }5�5��