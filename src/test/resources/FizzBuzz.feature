	Scenario Outline: myQ User Account Login Sending <errorData> to verify 400 Error Code

		* def credentials = { username: <username>, password: <password>}

		Given url identityHost
		And path uriPath.getmyQAccessToken
		And form field client_id = myQClientId
		And form field client_secret = myQClientSecret
		And form field grant_type = 'password'
		And form field scope = myQScope
		And form fields text = credentials
		When method post
		Then status <code>
		And match header Content-Type contains 'application/json'
		And match header MyQ-CorrelationId == '#notnull'
		And match response ==
			"""
			{
			"error": '#string',
			"error_description": '#string'
			}
			"""
		And match response.error == 'invalid_grant'
		And match response.error_description == 'Invalid username or password.'

		Examples:
			| errorData     | username                  | password        | code |
			| wrongUserName | 'user12@gmail.com'     | 'L0ginme@001'   | 400  |
			| wrongPassword | 'user56+dev@gmail.com' | 'wrongpassword' | 400  |
			| emptyPassword | 'user99+dev@gmail.com' | 'dksdfvknwd'              | 400  |

