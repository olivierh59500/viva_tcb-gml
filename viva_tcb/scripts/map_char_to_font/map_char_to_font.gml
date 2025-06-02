function map_char_to_font(char_code) {
    // Index 0 : Espace
    // Index 1-32 : ! " # $ % & ' ( ) * + , - . / 0-9 : ; < = > ? @
    // Index 33-58 : A-Z
    var font_index = 0;
    
    if (char_code == 32) { // espace
        font_index = 0;
    }
    else if (char_code >= 33 && char_code <= 64) { // ! à @
        font_index = char_code - 32; // ! = index 1, @ = index 32
    }
    else if (char_code >= 65 && char_code <= 90) { // A-Z
        font_index = (char_code - 65) + 33; // A = index 33, Z = index 58
    }
    else if (char_code >= 97 && char_code <= 122) { // a-z -> A-Z
        font_index = (char_code - 97) + 33; // Convertir minuscules en majuscules
    }
    else {
        font_index = 0; // défaut = espace
    }
    
    // S'assurer que l'index est dans les limites (0-69)
    return clamp(font_index, 0, 69);
}