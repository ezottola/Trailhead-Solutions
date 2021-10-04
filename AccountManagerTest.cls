@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
          'https://na1.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Id);
    }
    
    static Id createTestRecord(){
         Account testAcc = new Account(
          Name='Test record');
        insert testAcc;
        Contact testCont= new Contact(
        LastName='Test', 
        AccountId = testAcc.id);
        return testAcc.Id;
}
    
}