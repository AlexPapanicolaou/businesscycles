# Business Cycles
## Forecasting bubbles, recessions, and crashes - an imbalanced classification approach.

Historical stock market bubble dates were obtained via following Phillips and Shi's (2018) bootstrapping procedure on Shiller's S&P 500 data in R: https://cowles.yale.edu/sites/default/files/files/pub/d21/d2152.pdf
 
Recession dates were obtained via USREC (1960 - 2021) in FRED: https://fred.stlouisfed.org/series/USREC
 
The code on recession is completed. I think it has worked okay overall but I think I have incorrectly applied the models to the full dataset because the results are incredibly high (and outscored the test/train counterpart). Furthermore, when replicating the models onto bubble data, I have ran into huge issues despite bubbles only being marginally more imbalanced. The models are getting lots of false positives or no accurate forecasts at all and I have currently been unable to figure out why. It is most likely (and hopefully) a simple coding error.

**Potential improvements:**

- I wish to utilise the prediction of one business cycle phenomenon to aid in the prediction of another. Whilst not exactly transitive, stock market bubbles often cause recessions and crashes, and recessions also cause crashes. Is simply obtaining the predict_proba outcome of the best-performing model as a variable sufficient for including as an explanatory variable in other models, or is this problematic?

- I would like to forecast into different future periods (i.e., by 1 month, 6 months, and a year into the future).

- I wonder if there is a more efficient way to model for multiple targets which are not mutually exclusive. Currently, I have separated each phenomenon but would like to combine the code more effectively if possible.

- Include the prediction of stock market crashes as a binary classification problem. I have not yet been defined and tested as I wanted to complete the other sections to a high quality first as they were more important. However, the aim is to utilise some kind of monthly drawdown % requirement for it to be defined as a crash. This will be converted to dummy variable data and then tested as an imbalanced classification problem.
