@wip
Feature:  Estado de toma de presion

		Scenario:  The blood pressure is fine
			given im on " the new record page"
			when i fill in "blood_pressure[min]" with "80"
			when i fill in "blood_pressure[max]" with "120"
			and i press the"saveButton"
			Then i should see a green light
				
		Scenario:  The blood pressure is not fine
			given im on " the new record page"
			when i fill in "blood_pressure[min]" with "60"
			when i fill in "blood_pressure[max]" with "100"
			and i press the"saveButton"
			Then i should see a red light 
