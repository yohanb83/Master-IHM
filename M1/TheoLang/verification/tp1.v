Require Import Lia.

Module INTEGERS.

(* Define the recursive function "pow x n", computing x to the power n *)
Fixpoint pow (x : nat) (n : nat) := 
  match n with
  | 0 => 1
  | S n' => x * (pow x n')
end.

(* We check the type and the result of the evaluation *)
Check pow.

Eval compute in (pow 2 3).

(* Prove that "pow 2 3 = 8" *)
Example pow_2_3 : pow 2 3 = 8.
Proof.
  simpl.
  reflexivity.
Qed.

(* Prove by induction on n the following property.
   We will use the "lia" tactic *)
Lemma pow_1 : forall n, pow 1 n = 1.
Proof.
  intros n.
  induction n.
  - simpl.
    reflexivity.
  - simpl.
    rewrite IHn.
    reflexivity.
Qed.

(* Prove by induction on n the following property.
   We will use the "lia" tactic *)

Lemma pow_add: forall x n m, pow x (n+m) = pow x n * pow x m.
Proof.
  intros x n m.
  induction n.
  - simpl.
    lia. 
  - simpl. 
    lia.
Qed.

(* Prove by induction on n the following property.
   We will use the "lia" tactic *)

Lemma mul_pow : forall x y n, pow (x*y) n = pow x n * pow y n.
Proof.
  intros.
  induction n.
  - simpl.
    lia.
  - simpl.
    lia.
Qed.

(* Prove by induction on n the following property.
   We will use the tactic "lia" as well as pow_1, mul_pow and pow_add *)

Lemma pow_mul : forall x n m, pow x (n*m) = pow (pow x n) m.
Proof.
  intros.
  induction n.
  - simpl.
    rewrite pow_1.
    reflexivity.
  - simpl.
    rewrite mul_pow.
    rewrite pow_add.
    lia.
Qed.

End INTEGERS.


Require Import List.
Import ListNotations.

Module LISTS.

(* Define the function merge taking as argument two lists l1 and l2 of elements of any type T and returning the list obtained by taking alternately an element of l1 then an element of l2. If one of the lists is empty, we take the elements of the other list. *)

Fixpoint merge {T} (l1 l2: list T): list T := 
  match l1, l2 with
  | [], _ => l2
  | _, [] => l1
  | h1::t1, h2::t2 => h1::h2::merge t1 t2
end.

(* Exemple *)
Example merge_example : merge [1;2;3] [4;5] = [1;4;2;5;3].
Proof.
  simpl.
  reflexivity.
Qed.


(* Prove by induction on l1 the following property.
   We will use "destruct l2" to examine the cases l2 empty or non-empty,
   and the tactic "lia" *)
Lemma merge_len : forall T (l1 l2: list T), length (merge l1 l2) = length l1 + length l2.
Proof.
  intros T l1.
  induction l1.
  - simpl.
    reflexivity.
  - destruct l2.
    simpl.
    lia.
    simpl.
    rewrite IHl1.
    lia.
Qed.

End LISTS.
