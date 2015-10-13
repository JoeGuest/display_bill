# Display Customers Sky Bill

A few steps are needed to run this app, perform the following steps:

1. `bundle`
2. Run the server, `ruby display_bill.rb`
3. Navigate your browser to localhost:4567
4. (Optional) You can run the unit tests by using `rspec`
5. (Optional) You can run the functional tests by using `cucumber`

As Sinatra was mentioned during the phone interview I thought it would be a good idea to try it for this code test.  Rspec was used for the unit tests, and Cucumber for the functional tests.

`API::Bill` consumes the JSON, before being decorated by the `BillDecorator` ready to be passed to the view.  Messages can be called on the objects in the view.

Applied basic styling using Bootstrap, implemented the SkyTextRegular font via static resource.
