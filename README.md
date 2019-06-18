# multicollinearity
Understand the impact of multicollinearity on linear regression


- Run this script multiple times and observe how the regression plane and the coefficients vary.
- The coefficients are conditional, but if you use the model for predictions, you will get the joint distribution.
- If X1 and X2 are strongly correlated, the X2 coefficient becomes non significant, even tough it is strongly correlated to Y as well.
- This means that even if the correlation between X1 and Y is clearly positive, the coefficient can become negative.
- If the correlation between dependent variables is too strong, we run into numerical instability issues for least squares.
