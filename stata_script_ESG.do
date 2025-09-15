ssc install parmest
ssc install outreg2
ssc install estout
ssc install coefplot
use "C:\Users\User\Documents\Uni\Auslandsemester 2425\Quantitative Analysis\Presentation\Data\combined_compustat_esg_data.dta", clear
gen quarterdate = yq(fyearq, fqtr )
gen roa = niq/atq
gen roe = niq/seqq
gen op_margin = oiadpq/saleq
gen cfassets = oancfy/atq
gen capxassets = capxy/atq
gen equity_mv = cshoq*prccq
gen liabilities = lctq + dlcq
gen assetsliabilities =atq/liabilities
gen tobinsq = (equity_mv + liabilities)/atq
format quarterdate %tq
order quarterdate, after(fqtr)
destring roe, replace
drop if missing(ESGCombinedScore,EnvironmentPillarScore,SocialPillarScore ,GovernancePillarScore)
drop if equity_mv <1000

// 2 basic regression models


reg tobinsq ESGCombinedScore 

reg roa ESGCombinedScore

reg roe ESGCombinedScore
   
reg tobinsq EnvironmentPillarScore SocialPillarScore GovernancePillarScore

reg roa EnvironmentPillarScore SocialPillarScore GovernancePillarScore

reg roe EnvironmentPillarScore SocialPillarScore GovernancePillarScore


// 2 basic regression models


reg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets

reg roa ESGCombinedScore equity_mv liabilities cfassets capxassets

reg roe ESGCombinedScore equity_mv liabilities cfassets capxassets
   
reg tobinsq EnvironmentPillarScore SocialPillarScore GovernancePillarScore equity_mv liabilities cfassets capxassets

reg roa EnvironmentPillarScore SocialPillarScore GovernancePillarScore equity_mv liabilities cfassets capxassets

reg roe EnvironmentPillarScore SocialPillarScore GovernancePillarScore equity_mv liabilities cfassets capxassets



//do regression of tobinsq per sector and export to excel
reg tobinsq ESGCombinedScore c.ESGCombinedScore#i.gsector equity_mv liabilities cfassets capxassets

//do regression of tobinsq per sector desagregated ESG and export to excel

reg tobinsq SocialPillarScore c.SocialPillarScore#i.gsector equity_mv liabilities cfassets capxassets

reg tobinsq EnvironmentPillarScore c.EnvironmentPillarScore#i.gsector equity_mv liabilities cfassets capxassets

reg tobinsq GovernancePillarScore c.GovernancePillarScore#i.gsector equity_mv liabilities cfassets capxassets



//do regression of roa per sector and export to excel
reg roa ESGCombinedScore c.ESGCombinedScore#i.gsector equity_mv liabilities cfassets capxassets
//do regression of roa per sector desagregated ESG and export to excel

reg roa SocialPillarScore c.SocialPillarScore#i.gsector equity_mv liabilities cfassets capxassets

reg roa EnvironmentPillarScore c.EnvironmentPillarScore#i.gsector equity_mv liabilities cfassets capxassets

reg roa GovernancePillarScore c.GovernancePillarScore#i.gsector equity_mv liabilities cfassets capxassets


//do regression of roe per sector and export to excel

reg roe ESGCombinedScore c.ESGCombinedScore#i.gsector equity_mv liabilities cfassets capxassets

//do regression of roe per sector desagregated ESG and export to excel

reg roe SocialPillarScore c.SocialPillarScore#i.gsector equity_mv liabilities cfassets capxassets

reg roe EnvironmentPillarScore c.EnvironmentPillarScore#i.gsector equity_mv liabilities cfassets capxassets

reg roe GovernancePillarScore c.GovernancePillarScore#i.gsector equity_mv liabilities cfassets capxassets





// fixed effects for tobinsq quarters
xtset gvkey quarterdate, quarterly

xtreg tobinsq c.ESGCombinedScore##i.quarterdate cfassets capxassets, fe cluster (gvkey)


coefplot, keep(*quarterdate#c.ESGCombinedScore |) drop(_cons) vertical ciopts(recast(rcap)) xline(0)


// fixed effects for roa quarters

xtreg roa c.ESGCombinedScore##i.quarterdate equity_mv liabilities cfassets capxassets, fe robust

// fixed effects for roe quarters

xtreg roe c.ESGCombinedScore##i.quarterdate equity_mv liabilities cfassets capxassets, fe robust



//fixed effects tobinsq with market return
gen ESG_market = ESGCombinedScore* SP500return

xtreg tobinsq ESGCombinedScore SP500return ESG_market equity_mv liabilities cfassets capxassets, fe cluster (gvkey)

xtreg roa ESGCombinedScore SP500return ESG_market equity_mv liabilities cfassets capxassets, fe cluster (gvkey)

xtreg roe ESGCombinedScore SP500return ESG_market equity_mv liabilities cfassets capxassets, fe cluster (gvkey)




xtile Market_Quantile = SP500return, nq(4) 

xtreg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 1, fe cluster(gvkey)

xtreg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 2, fe cluster(gvkey)

xtreg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 3, fe cluster(gvkey)

xtreg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 4, fe cluster(gvkey)

reg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 1

reg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 2

reg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 3

reg tobinsq ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 4




xtreg roa ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 1, fe cluster(gvkey)

xtreg roa ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 2, fe cluster(gvkey)

xtreg roa ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 3, fe cluster(gvkey)

xtreg roa ESGCombinedScore equity_mv liabilities cfassets capxassets if Market_Quantile == 4, fe cluster(gvkey)










