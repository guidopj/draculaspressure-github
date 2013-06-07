
Feature:  Estado de toma de presion

		Scenario:  The blood pressure is fine
			given im on " the new record page"
			when i fill in "blood_pressure[min]" with "12"
			when i fill in "blood_pressure[max]" with "8"
			and i press the"saveButton"
			Then i should see a green light
				
		Scenario:  The blood pressure is not fine
			given im on " the new record page"
			when i fill in "blood_pressure[min]" with "10"
			when i fill in "blood_pressure[max]" with "6"
			and i press the"saveButton"
			Then i should see a red light 
