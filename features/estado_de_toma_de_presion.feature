Feature:  Estado de toma de presion
	As a User i want to see an imagen that represent the state of my 
	arterial pressure

	Background:
		Given i do not have any pressure records
		And I am logged in
		Given I am on "/the new record page"

	Scenario:  The blood pressure is fine
		When I fill in "blood_pressure[min]" with "8"
		When I fill in "blood_pressure[max]" with "12"
		When I press "Save"
		When I visit "/the history page"
		Then I should see the image "http://programacionyjuegos.files.wordpress.com/2012/02/cuadrado_verde.png"
			
	Scenario:  The blood pressure is not fine
		When I fill in "blood_pressure[min]" with "10"
		When I fill in "blood_pressure[max]" with "6"
		When I press "Save"
		When I visit "/the history page"
		Then I should see the image "http://www.cientec.or.cr/matematica/origami/rojo.gif"
