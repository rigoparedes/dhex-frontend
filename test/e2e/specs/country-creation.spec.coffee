countryManagementPage = require '../pages/country-management.po.coffee'
countryCreationPage = require '../pages/country-creation.po.coffee'

describe 'Country Creation', ->

  Given ->
    countryManagementPage.go()

  When ->
    countryManagementPage.countryCreationLink.click()

  Then ->
    expect(countryCreationPage.labelForInput.getText()).toBe 'Insert here the name of the country.'

  describe 'create country', ->
    When ->
      countryCreationPage.save('Surinam')

    Then ->
      expect(countryCreationPage.openAlertDialog()).toBe(true)


  describe 'create country with empty name', ->
    When ->
      countryCreationPage.save('')

    Then ->
      expect(countryCreationPage.errorMessage.getText()).toBe 'The name is missing'


  describe 'create country already exists', ->
    When ->
      countryCreationPage.save('Surinam')

    Then ->
      expect(countryCreationPage.getAlertText()).toBe('The country name already exists')