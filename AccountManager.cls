@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
       
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result = [SELECT  ID ,Name, (select Id, Name from contacts)
                           FROM account
                        WHERE Id =:accountId];
        return result;
    }
}