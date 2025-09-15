# ESG and Firm Overvaluation  

This repository contains the project **"Is ESG Overhyped in the U.S. Stock Market?"**, which investigates whether Environmental, Social, and Governance (ESG) ratings influence firm overvaluation and financial performance in U.S.-listed companies.  

**Authors**: Shu-Yen Lin, Esteban Calvo-Healy, Philip Mauch, Tobias Denkert  

---  

## Project Overview  

- **Objective**:  
  To examine whether firms with higher ESG ratings are systematically over- or undervalued, and how ESG affects financial outcomes such as Tobin’s Q (valuation measure) and Return on Assets (ROA).  

- **Research Questions**:  
  1. Do firms with higher ESG ratings exhibit higher overvaluation?  
  2. Are sectoral differences (e.g., Energy, Materials) significant in the ESG–valuation link?  
  3. Does overall market performance moderate the effect of ESG ratings on firm valuation?  

- **Key Findings**:  
  - Firms with higher ESG ratings are **undervalued** by the market and have **higher ROA**.  
  - However, higher **Social scores** are associated with overvaluation and lower ROA.  
  - Energy and Materials sectors are especially sensitive to ESG ratings, showing the largest undervaluation.  
  - Fixed-effects models reveal a weaker ESG–valuation relationship.  
  - In recent years (2022–2024), ESG leaders tend to be **more overvalued**.  

---  

## Repository Structure  

```
├── ESG and Firm overvaluation.pdf   # Project presentation slides
├── stata_script_ESG.do              # Stata script for regression analysis
├── README.md                        # Project documentation (this file)
```

---  

## Data Sources  

- **ESG Scores**: Refinitiv ESG Database (2013–2023, via WRDS)  
- **Firm Financial Data**: Compustat – Capital IQ (2014–2024, via WRDS)  
- **Market Returns**: S&P 500 historical returns (Macrotrends)  
- **ESG ETFs AUM Data**: ETFGI reports  

---  

## Methodology  

1. **Baseline Regression**  
   - Dependent variable: Tobin’s Q  
   - Key explanatory variable: ESG rating (lagged by 1 year)  
   - Controls: Equity, Market Value, Liabilities, CF-to-Assets ratio, CAPEX-to-Assets ratio  

2. **Sector Analysis**  
   - Dummy variables for Energy and Materials industries  
   - Test whether ESG impacts differ by industry  

3. **Market Condition Analysis**  
   - Fixed-effects model  
   - Quantile regressions for different levels of market returns  

---  

## Main Results  

- **ESG and Valuation**: Higher ESG ratings → undervaluation (negative impact on Tobin’s Q).  
- **ESG and Profitability**: Higher ESG ratings → higher ROA.  
- **Disaggregated ESG**:  
  - **Social (S)**: Higher scores = more overvalued, lower ROA.  
  - **Environmental (E) & Governance (G)**: More consistent positive contributions.  
- **Sectoral Effects**: Energy & Materials firms benefit most from ESG in terms of undervaluation reduction.  
- **Market Conditions**: ESG impact weakens under fixed effects; independent of short-term market performance.  

---  

## How to Run the Stata Script  

1. Open **Stata**.  
2. Load the script:  
   ```stata
   do "stata_script_ESG (1).do"
   ```  
3. Make sure your dataset (ESG scores + Compustat financials) is properly loaded into Stata.  
4. The script will run baseline regressions, sectoral models, and robustness checks.  

---  

## References  

- Deloitte Switzerland (2022). *The relationship between ESG ratings and company market valuation.*  
- Gregory, R. P. (2022). *A meta-analysis of third-party ESG ratings' impact on Tobin's Q, ROA, and ROE.*  
- Hogenmuller, E., Tuvache, L., & Schrapffer, A. (2024). *Exploring the link between ESG ratings and financial performance: A sector-by-sector analysis.*  
- Refinitiv, Compustat (WRDS), Macrotrends, ETFGI  

---  
