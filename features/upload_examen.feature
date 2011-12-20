@wip
Feature: Upload an evaluation file ExamenVivo

  In order to ease exam processing
  As Pamela
  I want to upload examen_vivos

  Scenario: file is password protected
    When    I upload examen_vivo_with_pass.xls
    Then    I should see message t('evaluation.errors.file_not_readable')

  Scenario: person doesn't exist
    Given   Laura Ciuffo doesn't exist
    When    I upload examen_vivo_no_pass.xls
    Then    Laura Ciuffo should be created
    And     evaluation should be embedded in Laura Ciuffo

  Scenario: person exists
    Given   Laura Ciuffo does exist
    When    I upload examen_vivo_with_pass.xls
    Then    I should be on the person page
    And     evaluation should be embedded in Laura Ciuffo
    And     new person should not be created
