/*
This do file replicates the analysis published in: 

Rambotti, Simone. “Is There a Relationship between Welfare-State Policies and Suicide Rates? Evidence from the U.S. States, 2000–2015.” Social Science & Medicine 246 (February 1, 2020): 112778.
https://doi.org/10.1016/j.socscimed.2019.112778.

If you use this do file, please cite the above paper. 

The analysis was performed with Stata 16. 

To run this do file properly, save the replication files (replication_code.do, replication_data.dta, predictive_margins.dta) in a folder on your computer, then replace the directory below with your new directory. 

*/

********************
********************
*** Descriptives ***
********************
********************

* n = 800

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

sum suicide males_suicide pfood stateeitcrate iapwpi gini povertyrate gdp unemploymentrate pw_educ perc_hh1_weight numprec_weight sexratio_mf_weight ibinge population pw_black pw_hispanic

* n = 757 (drop if female death is lower than 20)

drop if females_deaths < 20

sum females_suicide





*************************************
*************************************
******** outreg final models ********
********* without top 0.1 % *********
*************************************
*************************************

******************
*** both sexes ***
******************

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

xtset new_id year

rename new_id States

xtset States year

xtreg z_suicide z_pfood i.year, fe robust

outreg2 using suicide_both_sexes.doc, replace ctitle(" ") title("State & Year Fixed-Effects Models Predicting Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_suicide z_stateeitcrate i.year, fe robust

outreg2 using suicide_both_sexes.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_suicide z_iapwpi i.year, fe robust

outreg2 using suicide_both_sexes.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust

outreg2 using suicide_both_sexes.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

********************
*** male suicide ***
********************

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

xtset new_id year

rename new_id States

xtset States year

xtreg z_males_suicide z_pfood i.year, fe robust

outreg2 using male_suicide.doc, replace ctitle(" ") title("State & Year Fixed-Effects Models Predicting Male Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_males_suicide z_stateeitcrate i.year, fe robust

outreg2 using male_suicide.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Male Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_males_suicide z_iapwpi i.year, fe robust

outreg2 using male_suicide.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Male Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_males_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust

outreg2 using male_suicide.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Male Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

**********************
*** female suicide ***
**********************

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

xtset new_id year

drop if females_deaths < 20

rename new_id States

xtset States year

xtreg z_females_suicide z_pfood i.year, fe robust

outreg2 using female_suicide.doc, replace ctitle(" ") title("State & Year Fixed-Effects Models Predicting Female Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_females_suicide z_stateeitcrate i.year, fe robust

outreg2 using female_suicide.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Female Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_females_suicide z_iapwpi i.year, fe robust

outreg2 using female_suicide.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Female Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)

xtreg z_females_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust

outreg2 using female_suicide.doc, append ctitle(" ") title("State & Year Fixed-Effects Models Predicting Female Suicide Death Rate 2000-15") keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic) addtext(State FE, YES, Year FE, YES) label nocons asterisk(coef) alpha(0.001, 0.01, 0.05) symbol(***, **, *) dec(2)





****************************************
****************************************
*** robust hausman test (workaround) ***
****************************************
****************************************

* p < .05 (sig) = fixed-effects

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

xtset new_id year

xi: xtreg z_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, re robust
xtoverid

xi: xtreg z_males_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, re robust
xtoverid

xi: xtreg z_females_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, re robust
xtoverid





***************************************
***************************************
************** COEF PLOT **************
***************************************
***************************************

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

xtset new_id year

label variable z_pfood "SNAP Recipients"

label variable z_iapwpi "Public Welfare Spend."

* both sexes

* Multiple

quietly eststo Multiple: xtreg z_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust

* Simple 

foreach x in z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic { 
quietly eststo `x': xtreg z_suicide `x' i.year, fe robust
}

* only male

* Multiple

quietly eststo MultipleM: xtreg z_males_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust

* Simple 

foreach x in z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic { 
quietly eststo `x'M: xtreg z_males_suicide `x' i.year, fe robust
}

* only female

drop if females_deaths < 20

* Multiple

quietly eststo MultipleF: xtreg z_females_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust

* Simple 

foreach x in z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic { 
quietly eststo `x'F: xtreg z_females_suicide `x' i.year, fe robust
}

* coef plot 

coefplot (z_pfood \ z_stateeitcrate \ z_iapwpi \ z_gini \ z_povertyrate \ z_gdp \ z_unemploymentrate \ z_pw_educ \ z_perc_hh1_weight \ z_numprec_weight \ z_sexratio_mf_weight \ z_ibinge, label(Simple) pstyle(p2)) (Multiple, pstyle(p1)) || (z_pfood \ z_stateeitcrate \ z_iapwpi \ z_gini \ z_povertyrate \ z_gdp \ z_unemploymentrate \ z_pw_educ \ z_perc_hh1_weight \ z_numprec_weight \ z_sexratio_mf_weight \ z_ibinge, label(SimpleM) pstyle(p2)) (MultipleM, pstyle(p1) ) || (z_pfood \ z_stateeitcrate \ z_iapwpi \ z_gini \ z_povertyrate \ z_gdp \ z_unemploymentrate \ z_pw_educ \ z_perc_hh1_weight \ z_numprec_weight \ z_sexratio_mf_weight \ z_ibinge, label(SimpleF) pstyle(p2)) (MultipleF, pstyle(p1)), keep(z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge) xline(0, lcolor(gs10)) plotlabels("Simple" "Multiple") bylabels("Suicide" "Male Suicide" "Female Suicide") byopts(cols(3)) 

graph export coef_plot.pdf, as(pdf) replace




**********************************
**********************************
******* predictive margins *******
**********************************
**********************************

clear all

use "/Users/simonera/Google Drive/replication/predictive_margins.dta"

cd "/Users/simonera/Google Drive/replication"

twoway (connected overall_suicide snap), ytitle("Suicide Rate") xtitle("SNAP (Std)") xlabel(-1.5(.5)1.5) saving(overall, replace) 

twoway (connected male_suicide snap), ytitle("Male Suicide Rate") xtitle("SNAP (Std)") xlabel(-1.5(.5)1.5) saving(male, replace)

gr combine overall.gph male.gph, title("Predictive Margins") iscale(1) 

graph export predictive_margins.pdf, as(pdf) replace




*******************************************************************
*******************************************************************
*** PREDICTED EFFECT OF SNAP RECALCULATED ON WHOLE STUDY PERIOD ***
*******************************************************************
*******************************************************************

***********************
*** overall suicide ***
***********************

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

sum suicide males_suicide pfood
/*
    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
     suicide |        800    13.36375     3.80534        5.9       29.6
males_suic~e |        800    21.84797    5.911874   9.334943   48.24363
       pfood |        800    10.46051    4.502019   2.831821   22.35472
*/

xtset new_id year

xtreg z_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust
* z_pfood |  -.1721368

xtreg suicide pfood stateeitcrate iapwpi gini povertyrate gdp unemploymentrate pw_educ perc_hh1_weight numprec_weight sexratio_mf_weight ibinge logpop pw_black pw_hispanic i.year, fe robust
* pfood |  -.1454989

generate nsuicide = suicide*population/100000
total nsuicide
* 566,535.8

* effect of +1% in food stamps 
generate saved_lives1pct = -.1454989*population/100000
total saved_lives1pct
* -7021.779

* effect of +1 sd in snap (4.5%)
* multiply std effect of snap x sd of suicide
* and you get the reduction in suicide rate
display -.1721368*3.80534
* -.65503905
* convert the rate to the population number (reduction rate * pop / 100,000)
generate saved_lives1sd = -.65503905*population/100000
total saved_lives1sd
* -31612.2

display -31612.2/4.502019
* -7021.7829
* it checks!

*************************************************
*	in sum:                                     *
*	tot deaths	=	566,535.8                   *
*	+ 1% FS 	=	7,021.779 fewer suicides    *
* 	+ 1 sd FS	=	31,612.2 fewer suicides     *
*************************************************

********************
*** male suicide ***
********************

clear all

use "/Users/simonera/Google Drive/replication/replication_data.dta"

sum suicide males_suicide pfood
/*
    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
     suicide |        800    13.36375     3.80534        5.9       29.6
males_suic~e |        800    21.84797    5.911874   9.334943   48.24363
       pfood |        800    10.46051    4.502019   2.831821   22.35472
*/

xtset new_id year

xtreg z_males_suicide z_pfood z_stateeitcrate z_iapwpi z_gini z_povertyrate z_gdp z_unemploymentrate z_pw_educ z_perc_hh1_weight z_numprec_weight z_sexratio_mf_weight z_ibinge z_logpop z_pw_black z_pw_hispanic i.year, fe robust
* z_pfood |  -.17491

xtreg males_suicide pfood stateeitcrate iapwpi gini povertyrate gdp unemploymentrate pw_educ perc_hh1_weight numprec_weight sexratio_mf_weight ibinge logpop pw_black pw_hispanic i.year, fe robust
* pfood |  -.2296849

*** Note: use male population only
*** multiply population by perc men
*** 5,511.073 fewer deaths for +1% FS
*** 24,810.96 deaths for +1sd FS

generate malepop = population*perc_men

generate nsuicide = males_suicide*malepop/100000
total nsuicide
* 461,294.4

* effect of +1% in food stamps 
generate saved_lives1pct = -.2296849*malepop/100000
total saved_lives1pct
* -5511.073

* effect of +1 sd in snap (4.5%)
* multiply std effect of snap x sd of male suicide
* and you get the reduction in male suicide rate
display -.17491*5.911874
* -1.0340459
* convert the rate to the population number (reduction rate * male pop / 100,000)
generate saved_lives1sd = -1.0340459*malepop/100000
total saved_lives1sd
* -24810.96

display -24810.96/4.502019
* should be -5511.073
* -5511.074
* it checks!

***************************************************
*	in sum:                                       *
*	tot deaths	=	461,294.4                     *
*	+ 1% FS 	=	5,511.073 fewer male suicides *
* 	+ 1 sd FS	=	24,810.96 fewer male suicides *
***************************************************

clear all
