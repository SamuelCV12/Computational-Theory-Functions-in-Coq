(*library import*)
Require Import Arith.
Require Import Coq.Init.Nat.
Require Import Coq.Program.Wf.

(* Multiplication Function *)
Fixpoint mult (n m : nat) : nat :=
  match m with
  | 0 => 0
  | S p => n + mult n p
  end.

(* Mult Test Cases *)
Compute mult 3 8.   (* 24 *)
Compute mult 0 7.   (* 0 *)
Compute mult 2 0.   (* 0 *)


(* Exponential Function*)
Fixpoint exp (b e : nat) : nat :=
  match e with
  | 0   => 1
  | S p => mult b (exp b p)
  end.

(* Exp Test Cases *)
Compute exp 2 4.   (* 16 *)
Compute exp 3 5.   (* 243 *)


(* Factorial Function*)
Fixpoint fact (n : nat) : nat :=
  match n with
  | 0   => 1
  | S p => mult n (fact p)
  end.

(* Fact Test Cases *)
Compute fact 5.   (* 120 *)
Compute fact 4.   (* 24 *)


(* Fibonacci Function *)
Fixpoint fib (n : nat) : nat :=
  match n with
  | 0   => 0
  | S p => match p with
    | 0   => 1
    | S q => fib p + fib q
    end
  end.

(* Fib Test Cases*)
Compute fib 7.   (* 13 *)
Compute fib 8.   (* 21 *)

(* Remainder Function of Division *)
Fixpoint rem (n m : nat) : nat :=
  match n with
  | 0 => 0
  | S p =>
    if m =? 0 then 0
    else
      let r := rem p m in
      if (S r) =? m then 0
      else S r
  end.

(* Rem Test Cases *)
Compute rem 15 5.   (* 0 *)
Compute rem 7 2.    (* 1 *)
Compute rem 11 4.   (* 3 *)

(* Division Function *)
Fixpoint div (n m : nat) : nat :=
  match n with
  | 0 => 0
  | S p =>
      if m =? 0 then 0
      else
        let q := div p m in
        if (rem p m + 1) =? m then S q
        else q
  end.

(* Div Test Cases *)
Compute div 50 2.   (* 25 *)
Compute div 0 6.    (* 0 *)
Compute div 8 0.    (* 0 *)

(* Maximum Function *)
Fixpoint max (n m : nat) : nat :=
  match n with
  | 0 => m
  | S p => match m with
      | 0 => S p
      | S q => S (max p q)
      end
  end.

(* Max Test Cases *)
Compute max 3 5.   (* 5 *)
Compute max 7 2.   (* 7 *)
Compute max 4 4.   (* 4 *)

(* Parity Function: 0 = pair, 1 = odd *)
Fixpoint is_even (n : nat) : nat :=
  match n with
  | 0 => 0
  | S p => match is_even p with
      | 0 => 1
      | _ => 0
      end
  end.

(* Is_Even Test Cases *)
Compute is_even 20.   (* 0 *)
Compute is_even 3.    (* 1 *)

(* Extra function for Is_Perfect *)
Fixpoint sum_divisors (n m : nat) : nat :=
  match m with
  | 0 => 0
  | S p =>
      if rem n (S p) =? 0 then
        S p + sum_divisors n p
      else
        sum_divisors n p
  end.

(* Function Perfect number: 0 = perfect, 1 = not *)
Definition is_perfect (n : nat) : nat :=
  match n with
  | 0 => 1
  | S p =>
      if sum_divisors (S p) p =? S p then 0
      else 1
  end.

(* Is_Perfect Test Cases *)
Compute is_perfect 28.   (* 0 *)
Compute is_perfect 33.   (* 1 *)

(* Function Greatest Common Divisor*)
Program Fixpoint gcd (n m : nat) {measure m} : nat :=
  match m with
  | 0 => n
  | S p => gcd m (rem n (S p))
  end.

(* Casos de prueba para gcd *)
Eval compute in gcd 48 18.   (* 6 *)
Eval compute in gcd 50 300.  (* 50 *)

(*Demonstrations Properties of Functions*)

(*prove that for every X ∈ N: mult x 0 = 0*)
Theorem mult_x_0: forall x, mult x 0 = 0.
Proof.
  intros x. simpl. reflexivity.
Qed.

(*prove that for any b ∈ N: exp b 0 = 1*)
Theorem exp_b_0: forall b, exp b 0 = 1.
Proof.
  intros b. simpl. reflexivity.
Qed.

(*prove that the factorial 0 = 1*)
Theorem fact_0: fact 0 = 1.
Proof.
  simpl. reflexivity.
Qed.

(*prove that for every n ∈ N, if you take the remainder of 
n when dividing by 0, the result is always 0*)

Theorem rem_div_0 : forall n : nat, rem n 0 = 0.
Proof.
  induction n as [| n' IH].
  - simpl. reflexivity.
  - simpl. 
    reflexivity.
Qed.

(*prove that the fibonacci number of 0 is 0*)
Theorem fib_0: fib 0 = 0.
Proof.
  simpl. reflexivity.
Qed.

(*prove that the fibonacci number of 1 is 1*)
Theorem fib_1: fib 1 = 1.
Proof.
  simpl. reflexivity.
Qed.
