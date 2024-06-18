*** Settings ***
Library     RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${url}      https://api.restful-api.dev/objects

*** Test Cases ***
Add Object
    Add Object For Laptop    HP    2023    11.89$    i10    1TB

*** Keywords ***
Add Object For Laptop
    [Arguments]     ${name}     ${year}     ${price}    ${CPU}      ${HDD}
    ${headers}=     Create Dictionary       Content-Type=application/json
    ${jsonfile}     Get File    Scripts/laptop.json
    ${datat}=        Evaluate    $jsonfile
    ${dataDict}=    Evaluate    json.loads('''${datat}''')
    Set To Dictionary    ${dataDict}      name=${name}
    Set To Dictionary    ${dataDict}      year=${year}
    Set To Dictionary    ${dataDict}      price=${price}
    Set To Dictionary    ${dataDict}      CPU=${CPU}
    Set To Dictionary    ${dataDict}      HDD=${HDD}
    ${json_str}=    Evaluate    json.dumps(${dataDict})     json
    Create Session    postAsn    ${url}
    ${resp}     POST On Session     postAsn     ${url}      headers=${headers}      data=${json_str}
    Log To Console    ${resp}
    ${status}       Run Keyword And Return Status
    ...     Should Be Equal As Strings    ${resp.status_code}    200
    