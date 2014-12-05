TDD practice - write an algorithm, which synchronizes two lists of friends. 
First list is stored locally as a JSON/ActiveRecord/Array of OpenStructs/Something else (your choice). 
The other list is a result of a remote API call (stubbed/mocked in specs as JSON).

The algorithm should:
1) Add friends not present locally (based on `id`)
2) Update names of friends existing locally (based on `id`)
3) Delete local friends that are not present in the remote response (based on `id`)

Exemplary API response:
{ "friends" : [ {"id":"1", "name":"jack"}, {"id":"2", "name":"john"} ] }
