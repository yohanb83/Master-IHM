// TP1 Frontend
//////////////////////////////////////////////////////////////////////
// fonction principale,
// qui dépend d'autres fonctions définies plus loin dans ce fichier...

function runFunction() {
    "use strict";

    exo1(10000);

    exo2_1();
    exo2_2();
    exo2_3();
    exo2_4();

    exo3();

    exo4();
}

//////////////////////////////////////////////////////////////////////

// Exercice 1
function exo1(limit) {
    "use strict";
    for (var i = 4; i < limit; i++) {
        var diviseurs = [];

        // Calcul des diviseurs du nombre i
        for (var a = 1; a < i; a++) {
            if (i % a === 0) {
                diviseurs.push(a);
            }
        }

        // Calcul de la somme des diviseurs
        var somme = 0;
        for (var i1 = 0; i1 < diviseurs.length; i1++){
            var n = diviseurs[i1];
            somme = somme + parseInt(n);
        }

        // Vérification du nombre parfait
        if (somme === i1) {
            window.console.log(i + " est un nombre parfait");
        }
    }

    window.console.log("Fin du calcul des nombres parfaits");
}

//////////////////////////////////////////////////////////////////////

// Exercice 2
function exo2_1() {
    "use strict";
    window.console.log("Exercice 2.1");

    window.console.log(Number("A"));
    window.console.log(2 + "12");
    window.console.log(2 + (+"12"));
    window.console.log((+"A"));
    window.console.log(2 * "12");
    window.console.log(2 * "A");
    window.console.log(1/0);
    window.console.log(1/-0);
}

function exo2_2() {
    "use strict";
    window.console.log("Exercice 2.2");

    // Il n'était pas demandé d'écrire du code dans cette question,
    // mais c'est un exemple de génération/évaluation d'expressions
    // (nécessite "jshint ignore:line" car eval() est dépréciée...)

    var i, expr, r;
    var exprs = ["NaN === NaN", "NaN !== NaN", "isNaN(NaN)"];
    for (i = 0; i < exprs.length; i++) {
        r = eval(expr); // jshint ignore:line
        window.console.log(expr + " -> " + r);
    }
}

function exo2_3() {
    "use strict";
    window.console.log("Exercice 2.3");

    var zzz;
    window.console.log(zzz);
}

function exo2_4() {
    "use strict";

    window.console.log("Exercice 2.4");

    var vals = [null, undefined];
    var binops = ["===", "=="];
    var op, i, j, expr;
    for (op = 0; op < binops.length; op++) {
        for (i = 0; i < vals.length; i++) {
            for (j = 0; j < vals.length; j++) {
                expr = vals[i] + " " + binops[op] + " " + vals[j];
                window.console.log(expr + " -> " + eval(expr)); // jshint ignore:line
            }
        }
    }
}

//////////////////////////////////////////////////////////////////////

// Exercice 3

function escapeText(s){ "use strict"; var p = document.createElement('p'); p.textContent = s; return p.innerHTML; }

function appendText(text) {
    "use strict";
    document.getElementById("text").innerHTML += escapeText(text) + "<br>";
}

function exo3() {
    "use strict";

    document.getElementById("text").innerHTML = "";

    appendText("Exercice 3");

    appendText("camlListOfArray([1, 2, 4]) => " + camlListOfArray([1, 2, 4]));
    var esope = "ESOPERESTEICIETSEREPOSE";
    var palindromes = ["", "a", "BB", "BOB", esope];
    var nonPalindromes = ["Bob", "BABA"];
    var i, str;
    for (i = 0; i < palindromes.length; i++) {
        str = palindromes[i];
        appendText("\"" + str + "\"" + (estPalindrome(str) ? " est " : " n'est pas ") + "un palindrome");
    }
    for (i = 0; i < nonPalindromes.length; i++) {
        str = nonPalindromes[i];
        appendText("\"" + str + "\"" + (estPalindrome(str) ? " est " : " n'est pas ") + "un palindrome");
    }
    appendText("Positions du E dans " + esope + " : " + listeOccurrences("E", esope).join(", "));
    var testsEmail = ["a@b.fr", "john.doe@firm.co.uk", "somebody@domain"];
    for (i = 0; i < testsEmail.length; i++) {
        str = testsEmail[i];
        appendText("\"" + str + "\"" + (estEmail(str) ? " est " : " n'est pas ") + "un e-mail valide");
    }
}

function camlListOfArray(tableau) {
    "use strict";
    return "[" + tableau.join("; ") + "]";
}

function estPalindrome(texte) {
    "use strict";
    var len = texte.length;
    for (var i = 0; i < len; i++) {
        if (texte.charAt(i) !== texte.charAt(len - 1 - i)) {
            return false;
        }
    }
    return true;
}

function listeOccurrences(search, texte) {
    "use strict";
    var tab = [];
    var start = 0;
    while (true) {
        var next = texte.indexOf(search, start);
        if (next === -1) {
            break;
        } else {
            tab.push(next);
            start = next + 1;
        }
    }
    return tab;
}

function estEmail(texte) {
    "use strict";
    var re = /(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$)/;
    return texte.match(re);
}

//////////////////////////////////////////////////////////////////////

// Exercice 4
function exo4() {
    "use strict";
    appendText("Exercice 4");

    // Questions 1 et 2
    var robotBeau1 = new Robot("beau");
    var robotBeau2 = new Robot("beau");
    appendText("robotBeau1 !== robotBeau2 => " + String(robotBeau1 !== robotBeau2));
    appendText("robotBeau1.equals(robotBeau2) => " + String(robotBeau1.equals(robotBeau2)));

    robotBeau1.parler("bonjour");

    // Question 3
    var robot1BeauLeger1 = new Robot1("beau et léger");
    var robot1BeauLeger2 = new Robot1("beau et léger");
    appendText("robot1BeauLeger1 !== robot1BeauLeger2 => " + String(robot1BeauLeger1 !== robot1BeauLeger2));
    appendText("robot1BeauLeger1.equals(robot1BeauLeger2) => " + String(robot1BeauLeger1.equals(robot1BeauLeger2)));

    robot1BeauLeger1.parler("bonsoir");

    // Question 4
    var robot2Bob1 = Robot2("Bob");
    var robot2Bob2 = Robot2("Bob");
    appendText("robot2Bob1 !== robot2Bob2 => " + String(robot2Bob1 !== robot2Bob2));
    appendText("robot2Bob1.equals(robot2Bob2) => " + String(robot2Bob1.equals(robot2Bob2)));
    appendText("robot2Bob1.nom => " + robot2Bob1.nom);
    appendText("robot2Bob1.getNom() => " + robot2Bob1.getNom());
}

function Robot(nom) { // Constructeur Capitalisé
    "use strict";
    this.nom = nom;
    this.equals = function (other) {
        return this.nom === other.nom;
    };
}

function Robot1(nom) { // Constructeur Capitalisé
    "use strict";
    this.nom = nom;
}

Robot1.prototype.parler = function (phrase) {
    "use strict";
    window.alert("Le robot1 " + this.nom + " dit '" + phrase + "'");
};
Robot1.prototype.equals = function (other) {
    "use strict";
    return this.nom === other.nom;
};

function Robot2(nom) { // version avec fermeture
    "use strict";
    // var _autre_variable_privee = "Robot2" + nom;
    var getNomToto = function () {
        return nom;
    };
    var equals = function (other) {
        return nom === other.getNom();
    };
    return {
        getNom: getNomToto,
        equals: equals
    };
}

