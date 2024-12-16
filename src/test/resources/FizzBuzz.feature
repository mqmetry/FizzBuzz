Feature: Banking
  As a user
  I want to use a ATM Trasanction push
 
    @storykey=QRTS420-5
    @testcasekey=QRTS420-TC-2000
    Scenario: Withdraw less money
    Given I have $2000 on my accounts
    When I withdraw $500
    Then I get $500 from the ATM
 
    @storykey=QRTS420-5
    @testcasekey=QRTS420-TC-3000
    Scenario: Withdraw more money
	  Given I have $150 on my account
	  When I withdraw $100
	  Then I get $1001 from the ATM
    @storykey=QRTS420-5
    @testcasekey=QRTS420-TC-4000
	  Scenario Outline: Withdraw money from the account
	  Given I have $<balance> on my account
	  When I withdraw $<withdraw>
	  Then I get $<received> from the ATM
 
	Examples:
	| balance| withdraw | received |
	| 500 | 50 | 57 |
	| 1000 | 100 | 108 |
	| 300 | 40 | 49 |
