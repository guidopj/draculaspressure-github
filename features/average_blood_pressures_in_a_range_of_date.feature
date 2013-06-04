Feature: Ver promedio de presion en un rango de fecha dado

	Background:
		Given iam logged in


	Scenario:  No recrods yet
		Given im on "the pagina que de promedio de tomas"
		When i press "averageButton"
		Then is should see "You have not recorded  yet"


	Scenario:  Average five records in a day
		Given i have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given i have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given i have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given i have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given i have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given im on "the pagina que de promedio de tomas"
		when i fill in "range_date[min]" with "2015-1-1"
		when i fill in "range_date[max]" with "2015-1-1"
		When i press "averageButton"
		Then is should see "Min average: 80"
		Then is should see "Max average: 120"

	Scenario:  Average five records in a range of dates
		Given i have a blood pressure record with min "70" and max "113" and date "2010-1-1"
		Given i have a blood pressure record with min "70" and max "113" and date "2011-2-3"
		Given i have a blood pressure record with min "70" and max "113" and date "2014-8-2"
		Given i have a blood pressure record with min "80" and max "120" and date "2020-3-10"
		Given i have a blood pressure record with min "80" and max "120" and date "2100-7-7"
		Given im on "the pagina que de promedio de tomas"
		when i fill in "range_date[min]" with "2010-1-1"
		when i fill in "range_date[max]" with "2020-1-1"
		When i press "averageButton"
		Then is should see "Min average: 70"
		Then is should see "Max average: 113"

	Scenario:  there is no records in a range of date
		Given i have a blood pressure record with min "70" and max "113" and date "2010-1-1"
		Given i have a blood pressure record with min "70" and max "113" and date "2011-2-3"
		Given i have a blood pressure record with min "70" and max "113" and date "2014-8-2"
		Given i have a blood pressure record with min "80" and max "120" and date "2020-3-10"
		Given i have a blood pressure record with min "80" and max "120" and date "2100-7-7"
		Given im on "the pagina que de promedio de tomas"
		when i fill in "range_date[min]" with "2005-1-1"
		when i fill in "range_date[max]" with "2009-1-1"
		When i press "averageButton"
		Then is should see "There is no records in the specified range of dates"


