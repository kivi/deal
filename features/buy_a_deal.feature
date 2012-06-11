Feature: Buy a Deal
  In order to buy a deal
  As a visitor
  I want see the deal and go through the purchase flow


@celerity
Scenario: Buy a flash deal, land on the Paypal page
	Given a deal exists
	Given I go to the deal page
	And I wait for 15 second
	Then I should see "Jetzt kaufen!"
	And I press "Jetzt kaufen!"
	Then I should see "Zahlungsmethode"
	And I click on "Paypal"
	And I click on "bezahlen"
	Then I should see "Paypal payment" with amount "10"

	
	
