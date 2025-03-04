cd "C:\Users\Spandan\Desktop\College and research\IETF\Value At risk Project"
use Yearwise.dta, clear
log using Summary_Statistics.smcl, replace

su rtn_gbpusd, detail



bysort year :su rtn_gbpusd, detail

log close
translate Summary_Statistics.smcl Summary_Statistics.pdf, replace

histogram rtn_gbpusd, normal
graph export rtn_gbpusd_AllYears.png, as(png) replace


forval i=2004(1)2023{
histogram rtn_gbpusd if year==`i' , normal
graph export rtn_gbpusd`i'.png, as(png) replace
}


