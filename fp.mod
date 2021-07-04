/*********************************************
 * OPL 12.10.0.0 Model
 * Author: dakas
 * Creation Date: Dec 23, 2020 at 12:18:48 AM
 *********************************************/

 //PARAMETERS
 
 int demand_points=...;
 int facilities=...;
 range I=1..demand_points;
 range J=1..facilities;
 
 int F[J]=...;
 int C[J][I]=...;
 int D[I]=...;
 int M[J]=...;
 
 // decision variable
 dvar boolean y[J];
 dvar float X[J][I];
 
 minimize sum(i in J) F[i]*y[i] + sum(i in J, j in I)C[i][j] * X[i][j];
 
 subject to{
   
   forall (i in J)
   c1:
   sum(j in I) X[i][j]<=M[i]* y[i];
   
   forall(j in I)
   c2:
   sum(i in J)X[i][j]==D[j];
   
   forall (j in I, i in J)
   c3:
   X[i][j]<=D[j]*y[i];
   
   forall (j in I, i in J)
   c4:
   X[i][j]>=0;
   
   
 }